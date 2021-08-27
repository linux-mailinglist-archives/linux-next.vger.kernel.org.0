Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 928CA3F9FFE
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 21:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbhH0T32 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Aug 2021 15:29:28 -0400
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:58753 "EHLO
        wnew3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230005AbhH0T32 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 27 Aug 2021 15:29:28 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 910B02B011B1;
        Fri, 27 Aug 2021 15:28:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 27 Aug 2021 15:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=vemiIggeRwXcQQHV1mjV5Smqyw7
        hVT8XQPrsu0dbOaE=; b=tbwnNqqXREaSAieocbtKKL0bbwwvfwadwuY+PCYUqMY
        cIB8CbkCfCQMxRakgaDfnPZpw68vjqOqxT0BD55hMgrCEao/rjQcTVs2Jfn2/slz
        mStOcE7UYdj7nMg3PX8uK8tHLYqXOcI+GlxTNyWu2GGU/fLjiCSjW5iCpT3dThCZ
        s2OLEqcj6jhv+EeIs8OcsCAmyOwQE2+2gGXxG6onlU/cE5zdZCunrH7+a7bL6s27
        XIXo5n8L7vEwnNRDhMr5xd0oKUB1psXFulJg28lX9foEkSjt/SWTf6zuxN3+0bSO
        ra+S8OVoSWhKLSXqdRkIFqdropn5Y0dh4plTv6sfcOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vemiIg
        geRwXcQQHV1mjV5Smqyw7hVT8XQPrsu0dbOaE=; b=riJpSnCoVe2nfWGWRDnVt3
        LxQJqQtlS31hO82zzyoI6yrz1rFJxhZME+ZgYxyMpw8Do8ldTt77TO9NZsZgpgTh
        vvTnfegtqHPK94gE2gAplTt+IlVMXYHZjyPIhc0Ax4RJ2gPYB4w1MDE2TMDZ+aYO
        GnKh6ZfyNzEuTIYE+lr8wUUKe9G9/lmtgNfGuls5hpZVQCYSyIZEVH6Zmgbbwneu
        xUZquXxZO7W3+ilflYTH2++T7VrI1gtMEHU637v6icAmN04TTpfFE65Ns7r8VdcV
        O+N7tQp6/bgdWl6QCjXNrSzc7iYWyhE1cbM4fNDc1Z/BHFMVa6s0AIqZmzqGoVcA
        ==
X-ME-Sender: <xms:4jwpYa6lyu5R3iIcwNr9EHdSKV-Ge4GcUoBzJs3mNiVq23ruN8XRjw>
    <xme:4jwpYT77gKVVX6egRIT3Zq30UMg3MyL5Xw3V1yslgOeIKjVTQ5sKc1Nn6_hNyUksC
    MLEaxqAl9S3lQ>
X-ME-Received: <xmr:4jwpYZcFLbI2MJjtN3KRqnv_Kl6sPDrc53kyMuQfOOuT69sYo5l5i46ClAV->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddufedgudefjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuhe
    ejgfffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorg
    hhrdgtohhm
X-ME-Proxy: <xmx:4jwpYXJ3SK5Nlx-Cq77lIpdZN4K67t096VZjfp8fxc6fv6Wm7j3xuw>
    <xmx:4jwpYeILh4U8PekWScUWJt32PM_Xb8yr1lltXBDMw8Fm3bFC8IOeIg>
    <xmx:4jwpYYy3a6BFtahzJt7AX4s-mN24BJ0Aahq1QeqSwA44rRvo0R_EKA>
    <xmx:5DwpYQj5T11fRwro7U53N5T3gaLd0m_ZxxGpLuLQLmFiz_J5RGkb9FuXb70>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Aug 2021 15:28:33 -0400 (EDT)
Date:   Fri, 27 Aug 2021 21:28:27 +0200
From:   Greg KH <greg@kroah.com>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Jakub Kicinski <kuba@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: linux-next: manual merge of the char-misc tree with Linus' tree
Message-ID: <YSk82+XbcRoBf37v@kroah.com>
References: <20210827164904.6b1d1f0e@canb.auug.org.au>
 <YSjkosA6yMrMmaNk@kroah.com>
 <20210827175852.GB15018@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827175852.GB15018@thinkpad>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 27, 2021 at 11:28:52PM +0530, Manivannan Sadhasivam wrote:
> Hi Greg,
> 
> On Fri, Aug 27, 2021 at 03:12:02PM +0200, Greg KH wrote:
> > On Fri, Aug 27, 2021 at 04:49:04PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Today's linux-next merge of the char-misc tree got conflicts in:
> > > 
> > >   drivers/bus/mhi/core/main.c
> > >   net/qrtr/mhi.c
> > > 
> > > between commit:
> > > 
> > >   9ebc2758d0bb ("Revert "net: really fix the build..."")
> > > 
> > > from the origin tree and commit:
> > > 
> > >   0092a1e3f763 ("bus: mhi: Add inbound buffers allocation flag")
> > > 
> > > from the char-misc tree.
> > > 
> > > I fixed it up (the commit in Linus' tree is basically a revert of the
> > > char-misc tree, so I effectively reverted the latter) and can carry the
> > > fix as necessary. This is now fixed as far as linux-next is concerned,
> > > but any non trivial conflicts should be mentioned to your upstream
> > > maintainer when your tree is submitted for merging.  You may also want
> > > to consider cooperating with the maintainer of the conflicting tree to
> > > minimise any particularly complex conflicts.
> > 
> > Hm, what should I do in my tree here?
> > 
> > Kalle, what commit should I make in the char-misc tree now to handle
> > this issue, and make the merge with Linus's tree "simple"?  Or any other
> > ideas?
> > 
> 
> For making the merge simpler, I'd suggest we revert below commit in char-misc:
> 
> 0092a1e3f763 ("bus: mhi: Add inbound buffers allocation flag")

Reverting that works for me, I've done that in my tree and that allows
it to be merged cleanly with Linus's tree.

thanks,

greg k-h
