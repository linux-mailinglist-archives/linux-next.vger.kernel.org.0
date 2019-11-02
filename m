Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F852ECF03
	for <lists+linux-next@lfdr.de>; Sat,  2 Nov 2019 14:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfKBNp5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 2 Nov 2019 09:45:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:56522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726437AbfKBNp5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 2 Nov 2019 09:45:57 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 393BF20862;
        Sat,  2 Nov 2019 13:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572702356;
        bh=hcOz3DA5xjMU9j5XProL3u0GfNlbBE5x1vS4cV+kHb8=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=yofBJ2PLq58TcckStqdsMQHzfgkV64SLL6zf8c8twab9U3uQWIlQCNByU6IFB/4wB
         VCV44Y9DHcvF4pgyIuHxZqTuxK5b3pFuPx3gbWfF1XZkfEdJ7+WxY/9K+LrwzTBEeJ
         8Ux/YgfdqL1Cm1JzKEMeDr5CbGL8xrkuMevwEb5A=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 033F735200D6; Sat,  2 Nov 2019 06:45:56 -0700 (PDT)
Date:   Sat, 2 Nov 2019 06:45:55 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Ryan Attard <ryanattard@ryanattard.info>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: manual merge of the scsi tree with the rcu tree
Message-ID: <20191102134555.GP20975@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20191029150826.38c26ef8@canb.auug.org.au>
 <CAEXS_ixkUAPTz4=ta+=+YLrsnmrAcuG43bLNX11Dzffi4L-Upg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEXS_ixkUAPTz4=ta+=+YLrsnmrAcuG43bLNX11Dzffi4L-Upg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Nov 01, 2019 at 07:28:22PM -0500, Ryan Attard wrote:
> I can't quite tell if it's just the diff, but it looks like the paired
> kfree_rcu(vpd_pg89, rcu) from the original patch got lopped off. Is there
> somewhere I can see the full resultant file?

I see all four instances of kfree() in origin/master in -next:

git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

But please do double-check.

							Thanx, Paul

> Thanks,
> Ryan
> 
> On Mon, Oct 28, 2019, 11:08 PM Stephen Rothwell <sfr@canb.auug.org.au>
> wrote:
> 
> > Hi all,
> >
> > Today's linux-next merge of the scsi tree got a conflict in:
> >
> >   drivers/scsi/scsi_sysfs.c
> >
> > between commit:
> >
> >   81db81f82993 ("drivers/scsi: Replace rcu_swap_protected() with
> > rcu_replace()")
> >
> > from the rcu tree and commit:
> >
> >   d188b0675b21 ("scsi: core: Add sysfs attributes for VPD pages 0h and
> > 89h")
> >
> > from the scsi tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
> > --
> > Cheers,
> > Stephen Rothwell
> >
> > diff --cc drivers/scsi/scsi_sysfs.c
> > index cc51f4756077,0fa2ed343c7f..000000000000
> > --- a/drivers/scsi/scsi_sysfs.c
> > +++ b/drivers/scsi/scsi_sysfs.c
> > @@@ -466,12 -467,18 +467,18 @@@ static void scsi_device_dev_release_use
> >         sdev->request_queue = NULL;
> >
> >         mutex_lock(&sdev->inquiry_mutex);
> >  -      rcu_swap_protected(sdev->vpd_pg0, vpd_pg0,
> >  -                         lockdep_is_held(&sdev->inquiry_mutex));
> >  -      rcu_swap_protected(sdev->vpd_pg80, vpd_pg80,
> >  -                         lockdep_is_held(&sdev->inquiry_mutex));
> >  -      rcu_swap_protected(sdev->vpd_pg83, vpd_pg83,
> >  -                         lockdep_is_held(&sdev->inquiry_mutex));
> >  -      rcu_swap_protected(sdev->vpd_pg89, vpd_pg89,
> >  -                         lockdep_is_held(&sdev->inquiry_mutex));
> > ++      vpd_pg0 = rcu_replace_pointer(sdev->vpd_pg0, vpd_pg0,
> > ++
> > lockdep_is_held(&sdev->inquiry_mutex));
> >  +      vpd_pg80 = rcu_replace_pointer(sdev->vpd_pg80, vpd_pg80,
> >  +
> >  lockdep_is_held(&sdev->inquiry_mutex));
> >  +      vpd_pg83 = rcu_replace_pointer(sdev->vpd_pg83, vpd_pg83,
> >  +
> >  lockdep_is_held(&sdev->inquiry_mutex));
> > ++      vpd_pg89 = rcu_replace_pointer(sdev->vpd_pg89, vpd_pg89,
> > ++
> >  lockdep_is_held(&sdev->inquiry_mutex));
> >         mutex_unlock(&sdev->inquiry_mutex);
> >
> > +       if (vpd_pg0)
> > +               kfree_rcu(vpd_pg0, rcu);
> >         if (vpd_pg83)
> >                 kfree_rcu(vpd_pg83, rcu);
> >         if (vpd_pg80)
> >
