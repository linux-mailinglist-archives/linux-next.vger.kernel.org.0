Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCAC2FCC8B
	for <lists+linux-next@lfdr.de>; Wed, 20 Jan 2021 09:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728907AbhATIRW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Jan 2021 03:17:22 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47841 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729334AbhATIDd (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 20 Jan 2021 03:03:33 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 618B85C00DB;
        Wed, 20 Jan 2021 03:02:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 20 Jan 2021 03:02:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=00bEHf4nDE8luMA3E9YoN9NPdJX
        lfz5FcFiQrb7BVlg=; b=jJ+B40uv4zTBPxSsrpxIZlnURmXyNm666B+YSHKWPbh
        BC4l39bSj6TxopZoDzSREpnR2oBKnTwl8EP6sYwKLb2Kz5hQB8aYHnmEEW9WiyB+
        ExBt/XeV3IM26H+Vkp00vh6Hvo0KdqLVafpiACbdG0XFPMLojRY2dVVCJrdTZYQ3
        7elPkATgqsGxg0JbfeVesL+jjBzTXJRDVlqB4C2VA2ME1h/VDkIQNkU3y/xM7wcg
        Eeztz9Z5aQW6GfdTgJcp6aofSJuIuZxlbVnfVvM47k475cw/BWxewUqd7pfaFuoG
        iNsAwtQwBKW44gnyM3XTAH3+Tm+kTpoaHIgozm1gmvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=00bEHf
        4nDE8luMA3E9YoN9NPdJXlfz5FcFiQrb7BVlg=; b=euPDvMTvb5c+d9Xsrzs5PL
        Tj3/YDF0SQjPF+2m/UNlQI9gL1j/UWDoX4MyaQvnDL64a2fwhxGnkuat+gieinQQ
        4iITH4kZnBuPumj9zf3bb65e3jkK5Vt4lbq6MzMkIxSkOi/gA5Y6CRg6NDAy1epK
        vCXk4YEpLvYWKPWseYZNTjapaGxOOwKTWjpZBgknJhrFj/pAOUGvcVR4iMc+uP0B
        UItndtqSu6OP6WvtNwUHFCIEn2V5eQctxfuZuhp2kIXshtzD0XEOPeumpVxR5CeM
        SYI5PGIRJM2LHodvRnrsxlxiLkAhrgZF0iVxGtGO4DJd7BCkjj+4DqiV7QdpfjOg
        ==
X-ME-Sender: <xms:keMHYLZyZ7OMLQ3ISd5iMd6wZo7aaTcTUh1f8XMroH4oZFv-1kykAg>
    <xme:keMHYKZ32S_N8s5NTcCj8z_CvuSJWY8BhtaJ1GSN_LLU8ZQXBOprs5CcpO9RG3e4c
    DirX66ZHaRi9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddugdduudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:keMHYN9tf_mQlG8op7SjYtCCtj0psTlEO0OqEAWjzxkl1K_Tpk_6YA>
    <xmx:keMHYBqOb6iFXLIvTx9abCOq_7lECImFIS6v_bwKF2SUN5zjcF5sQA>
    <xmx:keMHYGqhZrnPfOty4RF03tcZh8XkUTXIlTaY0ox1NrYuNqk4CDOa9w>
    <xmx:kuMHYN2xmIuH3DXWrPmni68_Rvq2lDusAEoDKdJcDULanWMoHEOlBA>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id AA7E5240065;
        Wed, 20 Jan 2021 03:02:25 -0500 (EST)
Date:   Wed, 20 Jan 2021 09:02:24 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Al Cooper <alcooperx@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: Re: linux-next: manual merge of the usb tree with the usb.current
 tree
Message-ID: <YAfjkLGh9Q+sBPGA@kroah.com>
References: <20210120130603.1eccd490@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120130603.1eccd490@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jan 20, 2021 at 01:06:03PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the usb tree got a conflict in:
> 
>   drivers/usb/gadget/udc/bdc/Kconfig
> 
> between commit:
> 
>   ef02684c4e67 ("usb: bdc: Make bdc pci driver depend on BROKEN")
> 
> from the usb.current tree and commit:
> 
>   7766cafea0ec ("usb: bdc: Remove the BDC PCI driver")
> 
> from the usb tree.
> 
> I fixed it up (the latter removed the text updated by the former) and
> can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Thanks, I knew this would happen and will resolve it when the
usb.current patch is merged in Linus's tree.

greg k-h
