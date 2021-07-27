Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D63D63D7709
	for <lists+linux-next@lfdr.de>; Tue, 27 Jul 2021 15:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbhG0NpE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 27 Jul 2021 09:45:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:45272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232313AbhG0NpD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 27 Jul 2021 09:45:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23A6661A80;
        Tue, 27 Jul 2021 13:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627393503;
        bh=mf+a4Nu+jAXRXT3KocZz+h6nUtXniWynBqu6P4Tby84=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kVWMuSIlCa4fGugpekVeNDr98N3uGuKjISm8KRO5G04tf2gJa/BMEMSdzU/PI5YLP
         aRJ/qELvPX164nGOGDN9cHW5TrPiCYC+wJK8WPSNtZLu6wr+XUTr3WEQKjJc5PV1Rp
         XjGxVeh5DQiFCqyXSv8ewa7VpBewaMgfwMiQqvNKnCh0B2CxeXR5T3pOBWv6baLvbx
         hDO5FVOn/zubbadnNj1Ue1HtiFf3nAkSSei5OKdzd26ClT9Y9tEcGl6r22tgwXQDn3
         +Xsg6B9G/J5iwBIUBWDBlfuVGX4vjuzmF0jAtxEFGMrw2QTFFbhSiwP4sNXKGapNHi
         YpSqSPIGL/lAw==
Date:   Tue, 27 Jul 2021 19:14:58 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the dmaengine tree with the
 driver-core tree
Message-ID: <YQAN2o+msGGpYWLG@matsya>
References: <20210723155354.082a62d8@canb.auug.org.au>
 <20210723091641.zse42sotjt2pqiif@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210723091641.zse42sotjt2pqiif@pengutronix.de>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 23-07-21, 11:16, Uwe Kleine-König wrote:
> Hello,
> 
> On Fri, Jul 23, 2021 at 03:53:54PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the dmaengine tree got a conflict in:
> > 
> >   drivers/dma/idxd/sysfs.c
> > 
> > between commit:
> > 
> >   fc7a6209d571 ("bus: Make remove callback return void")
> > 
> > from the driver-core tree and commit:
> > 
> >   d9e5481fca74 ("dmaengine: dsa: move dsa_bus_type out of idxd driver to standalone")
> > 
> > from the dmaengine tree.
> 
> Greg provided a tag for this case at
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/bus_remove_return_void-5.15
> 
> . Vinod might want to rebase on top of this or merge it into his tree
> with Stephen's conflict resolution.

Thanks I have merged the tag and resolved conflict as above.

Dave pls test

-- 
~Vinod
