Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC1A2DA725
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 05:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgLOEea (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 23:34:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:56762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725440AbgLOEea (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 14 Dec 2020 23:34:30 -0500
Date:   Tue, 15 Dec 2020 10:03:45 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608006829;
        bh=eEJsukmkKH5PSHjtsIS1jSqNdoPtKNuOwLj6lBIzGU0=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=IETwZ/f5TXEfYQRKyhUPSPe7WVhZjoIka0xvkDnp+rsuKawZnP+1sOk/zMWjqlVFC
         v5MzRPfgo1T728zyABN/UkV8fJUrK47n4YUumQ5Tt+xe0APCOcJSTDdm4wEsOpnjPn
         Qo5WCy56wfeai/aZ3NdG/3Wayd373tBxWPlz50MVlx69at5Cjxj3iy35NPJ7P76eT3
         o4fKEircdMyh0VjbI7P1CH3QCDYEuqBoX1bEBi4TgHgvsYXURahTGlgoUVF5YzJ1wG
         T78/ZOhLuDPWvwYwpEk6qvKR4W+KPC5vARSBRI60dgL257O5FwzppiiUWfOQbte6/i
         Zd0sDJdxPpZ9A==
From:   Vinod Koul <vkoul@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Dave Jiang <dave.jiang@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the dmaengine tree with the
 dmaengine-fixes tree
Message-ID: <20201215043345.GF8403@vkoul-mobl>
References: <20201119142915.22217138@canb.auug.org.au>
 <20201215065831.552ffeb4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201215065831.552ffeb4@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 15-12-20, 06:58, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 19 Nov 2020 14:29:15 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the dmaengine tree got a conflict in:
> > 
> >   drivers/dma/idxd/submit.c
> > 
> > between commit:
> > 
> >   8326be9f1c0b ("dmaengine: idxd: fix mapping of portal size")
> > 
> > from the dmaengine-fixes tree and commit:
> > 
> >   8e50d392652f ("dmaengine: idxd: Add shared workqueue support")
> > 
> > from the dmaengine tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > diff --cc drivers/dma/idxd/submit.c
> > index 417048e3c42a,efca5d8468a6..000000000000
> > --- a/drivers/dma/idxd/submit.c
> > +++ b/drivers/dma/idxd/submit.c
> > @@@ -74,14 -86,27 +86,27 @@@ int idxd_submit_desc(struct idxd_wq *wq
> >   	if (idxd->state != IDXD_DEV_ENABLED)
> >   		return -EIO;
> >   
> > - 	portal = wq->dportal;
> >  -	portal = wq->portal + idxd_get_wq_portal_offset(IDXD_PORTAL_LIMITED);
> > ++	portal = wq->portal;
> > + 
> >   	/*
> > - 	 * The wmb() flushes writes to coherent DMA data before possibly
> > - 	 * triggering a DMA read. The wmb() is necessary even on UP because
> > - 	 * the recipient is a device.
> > + 	 * The wmb() flushes writes to coherent DMA data before
> > + 	 * possibly triggering a DMA read. The wmb() is necessary
> > + 	 * even on UP because the recipient is a device.
> >   	 */
> >   	wmb();
> > - 	iosubmit_cmds512(portal, desc->hw, 1);
> > + 	if (wq_dedicated(wq)) {
> > + 		iosubmit_cmds512(portal, desc->hw, 1);
> > + 	} else {
> > + 		/*
> > + 		 * It's not likely that we would receive queue full rejection
> > + 		 * since the descriptor allocation gates at wq size. If we
> > + 		 * receive a -EAGAIN, that means something went wrong such as the
> > + 		 * device is not accepting descriptor at all.
> > + 		 */
> > + 		rc = enqcmds(portal, desc->hw);
> > + 		if (rc < 0)
> > + 			return rc;
> > + 	}
> >   
> >   	/*
> >   	 * Pending the descriptor to the lockless list for the irq_entry
> 
> Just a reminder that this conflict still exists.  Commit 8326be9f1c0b
> is now in Linus' tree.

Thanks for the reminder. Since Linus like to see the conflicts, I am
going to send this as is and let him resolve it :)

-- 
~Vinod
