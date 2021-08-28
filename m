Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C573FA466
	for <lists+linux-next@lfdr.de>; Sat, 28 Aug 2021 09:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbhH1HvJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 28 Aug 2021 03:51:09 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:44795 "EHLO
        wnew1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230208AbhH1HvJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sat, 28 Aug 2021 03:51:09 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 68BA62B0130A;
        Sat, 28 Aug 2021 03:50:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sat, 28 Aug 2021 03:50:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=nNwwrYLTnwkLwnABFzmrkgR/6wZ
        7+LaCLTeap7iEK6I=; b=jL/+4CJwtd41glYKJE2C1OYFb/dnXRFWrB23SeMtx9E
        CxwBHt72K6XklatZ+5yzjLXt2n2uA0xBMJqairuetyfPrSPMxYJwNB+bRwfA+oU6
        8IkEGUEK+TaeWjNHUYvFsS6QpbeZzHzUw6jgqCjxFDEgbSUWiAcFBJ55qM2jxWuL
        aC3zkflBgMb9MoWQzEm0t0gnTxccoR+wOy8MSYYRcmS75D5huMnROLPjss1TzEbl
        0gFulgoJzRZgUb4MDRva93vtIrjDYZtn89z5gDonnnwMsf0ZEbXb+NA6gmmWuHFL
        UaCHzzGZ9AiRAXfwQbv9bNMSFXDINOY5u+G+B8yPSqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nNwwrY
        LTnwkLwnABFzmrkgR/6wZ7+LaCLTeap7iEK6I=; b=TYPVm/IDuNaLSGSd7RdIji
        xQYklaEphGIFrR8zsISFkKoxo/McTIddAUunSqM2Rae1fT2rJCPG34S/G78ecjuQ
        nU2AAjlqSpEG5jSgL/mB8218CjTEjYZKXffayGylTFfYtvFQSAtUbrlUb7ETdyJQ
        XwDSpS/dwHiQNbyucMmd9/D999TTIaAB/f8EDEt9Wgfbv5SlO5KpEY+EegC0ntcX
        32qyiC0cOXyZnwgwcuh2HqCfPSvPZYZfVwWxMsA5b0d1eDJqtJDyncoOdFs4qWIw
        +qnUjo2QyuKBaAdm84Vx085V8q0miH3K8RPdOnm5T1SPXNLgfVxtdCCk3Gk8z4LA
        ==
X-ME-Sender: <xms:tuopYc02cjQ1OFdEheYBCDzv2CzQLi3SohZEX9PTnL1IBwlySV4Q-g>
    <xme:tuopYXGfz4RWTlFhfO-ONI-Fupd6e1bkmreLXYZ1l_2CSzpK9rk1TYtL5ReJRr62M
    v6v6C16TQlmBA>
X-ME-Received: <xmr:tuopYU7BMgdDZ2jdTlimSKCkFniiwvAMYUzqhKph1FTRUWYwcfLBjf8v>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddugedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtrodttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveehgf
    ejiedtffefhfdvgeelieegjeegieffkeeiffejfeelhfeigeethfdujeeunecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:tuopYV3OE8cc3xZwiiPgGmwrDoZ_1dfZ3wdpt_cgPLh2PPloEHGQjw>
    <xmx:tuopYfEv1q48hvtS-HydWwUCxe-xekcdP37vfcdFM4Vdqry9mygP2Q>
    <xmx:tuopYe-LV5H5JcDKsW0eaeaGnhjwTZavyeA_BujBBACCmHG8roon2Q>
    <xmx:uOopYcdsvDj6HmJVJvuFNnbAN5Ujsd5kDYgRX7tiuGwxZb0o0bqpptecM_0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 28 Aug 2021 03:50:12 -0400 (EDT)
Date:   Sat, 28 Aug 2021 09:50:09 +0200
From:   Greg KH <greg@kroah.com>
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Jakub Kicinski <kuba@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: linux-next: manual merge of the char-misc tree with Linus' tree
Message-ID: <YSnqsSqPeyeyCdDt@kroah.com>
References: <20210827164904.6b1d1f0e@canb.auug.org.au>
 <YSjkosA6yMrMmaNk@kroah.com>
 <20210827175852.GB15018@thinkpad>
 <YSk82+XbcRoBf37v@kroah.com>
 <877dg658rk.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877dg658rk.fsf@codeaurora.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, Aug 28, 2021 at 10:27:27AM +0300, Kalle Valo wrote:
> Greg KH <greg@kroah.com> writes:
> 
> > On Fri, Aug 27, 2021 at 11:28:52PM +0530, Manivannan Sadhasivam wrote:
> >> Hi Greg,
> >> 
> >> On Fri, Aug 27, 2021 at 03:12:02PM +0200, Greg KH wrote:
> >> > On Fri, Aug 27, 2021 at 04:49:04PM +1000, Stephen Rothwell wrote:
> >> > > Hi all,
> >> > > 
> >> > > Today's linux-next merge of the char-misc tree got conflicts in:
> >> > > 
> >> > >   drivers/bus/mhi/core/main.c
> >> > >   net/qrtr/mhi.c
> >> > > 
> >> > > between commit:
> >> > > 
> >> > >   9ebc2758d0bb ("Revert "net: really fix the build..."")
> >> > > 
> >> > > from the origin tree and commit:
> >> > > 
> >> > >   0092a1e3f763 ("bus: mhi: Add inbound buffers allocation flag")
> >> > > 
> >> > > from the char-misc tree.
> >> > > 
> >> > > I fixed it up (the commit in Linus' tree is basically a revert of the
> >> > > char-misc tree, so I effectively reverted the latter) and can carry the
> >> > > fix as necessary. This is now fixed as far as linux-next is concerned,
> >> > > but any non trivial conflicts should be mentioned to your upstream
> >> > > maintainer when your tree is submitted for merging.  You may also want
> >> > > to consider cooperating with the maintainer of the conflicting tree to
> >> > > minimise any particularly complex conflicts.
> >> > 
> >> > Hm, what should I do in my tree here?
> >> > 
> >> > Kalle, what commit should I make in the char-misc tree now to handle
> >> > this issue, and make the merge with Linus's tree "simple"?  Or any other
> >> > ideas?
> >> > 
> >> 
> >> For making the merge simpler, I'd suggest we revert below commit in char-misc:
> >> 
> >> 0092a1e3f763 ("bus: mhi: Add inbound buffers allocation flag")
> >
> > Reverting that works for me, I've done that in my tree and that allows
> > it to be merged cleanly with Linus's tree.
> 
> Unfortunately this now breaks the build in char-misc-next (commit
> 0dc3ad3f859d):
> 
> net/qrtr/mhi.c: In function 'qcom_mhi_qrtr_probe':
> net/qrtr/mhi.c:105:48: error: 'MHI_CH_INBOUND_ALLOC_BUFS' undeclared (first use in this function)
>   105 |         rc = mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);
>       |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~
> net/qrtr/mhi.c:105:48: note: each undeclared identifier is reported only once for each function it appears in
> net/qrtr/mhi.c:105:14: error: too many arguments to function 'mhi_prepare_for_transfer'
>   105 |         rc = mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);
>       |              ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from net/qrtr/mhi.c:6:
> ./include/linux/mhi.h:725:5: note: declared here
>   725 | int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~
> 
> To see this error make sure CONFIG_QRTR and CONFIG_QRTR_MHI are enabled.

Ugh.  Ok, I think I need to now just revert all of the mhi changes in my
tree to get to a "clean state".  Then you all can work this out after
5.15-rc1 is released.

thanks,

greg k-h
