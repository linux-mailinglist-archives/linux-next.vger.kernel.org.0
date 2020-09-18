Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C0426F755
	for <lists+linux-next@lfdr.de>; Fri, 18 Sep 2020 09:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgIRHsn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Sep 2020 03:48:43 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:46945 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726741AbgIRHsm (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 18 Sep 2020 03:48:42 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 837DB5C044A;
        Fri, 18 Sep 2020 03:48:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 18 Sep 2020 03:48:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=5ZeXJmgc05HVGsHWpRIIzeQSsYY
        8SOSpkesu/MTdFXI=; b=jrK/LdpG1bcaTqeukrrRUKvcZ2o6pmz2T+PE5cf0e8c
        pP25XKbe9Kai7KDJQpIpgy5HxWG3ZNv+2Y6WpdfR36Qxz/Hu9W/3fOigqDIHBAeg
        Tt/JdZDMAffkAt05/yLDanfLF3f0sloHznb2q29ILEWoBCXrEjK4qFF5R+OqtNPE
        5RFANb54JFhfE/Q8fjNN9gV6WAoqHOupvAUa710JuR37zvx/tp2OvHnYLTjwX/Y5
        lLi5d2XRIyvRzuRIizy6Bp5S4vZKmMIq6SChBFU8evnW84BNY4Geg8G926xAR4aJ
        JQVTHKzN8g+m1JK9WHFo40qydvgBOn5pb0nk4XBJyPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5ZeXJm
        gc05HVGsHWpRIIzeQSsYY8SOSpkesu/MTdFXI=; b=btJ733k8PkrZEVjFBB6J+9
        1j9LeipzuZSFBjL1IVsyzTj84RbYehjmzFIzHEMI1Zyqs7GNPTI+4Ob9S/nAfdTW
        6xryh5Dtgni2+VoquRVeAl+JO7i/YJMKqfjxNohEk6y7qD1EEMaZv7JLeIS8vZMV
        Ssg+Wf2Gq3WD3JUzAfyP1ZWOsuiLV2sMN8ka9TgY2Lf+gh4GCDdROCUurAJt+AF7
        mNJ3ahUA56HB1Ka5Nk7wKlWiddilGZ1UrlmBPAmgqkkB4W/aCkvKkYvMWJww7y30
        W+VPfdFBed6YCEGv+tHbhw/JYbcVPgoY4D8UFQVODCP4KJiHIGKvsR59yY2dAe1A
        ==
X-ME-Sender: <xms:WGZkX0lP-JqFTrdiAGU4TiK-XnvX8fy87fGhelwEsNZAbOfCLcrk_A>
    <xme:WGZkXz10N8BUpF-7LEd5zLff1_4BOUgNvRw8gBYe_GB1hYu-9HSDZqPCJKgW_zQbt
    RkNnWmSmzGPQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdehgdduvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:WGZkXyqkp696o1O5BVqqVrFGkPkk5h-d4oLk5PhaiAvndIlS5TQPYw>
    <xmx:WGZkXwkOem9OzwoRZhJP3mJlh-4HruptSl1QRTrBAaGx32xQnYPslg>
    <xmx:WGZkXy3UIxoeWTwFnwTdBoYTNmscGZPgErLT5dOXxlyb4NCLS-SKQw>
    <xmx:WWZkX1T7qsWAEG6Ebel466U8B7O1wodEIdTD_ugDq32M3RBP6Kj25Q>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 18540328005A;
        Fri, 18 Sep 2020 03:48:40 -0400 (EDT)
Date:   Fri, 18 Sep 2020 09:49:11 +0200
From:   Greg KH <greg@kroah.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Crypto List <linux-crypto@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the staging tree with the crypto tree
Message-ID: <20200918074911.GA987884@kroah.com>
References: <20200918152127.4414b524@canb.auug.org.au>
 <20200918054134.GA9252@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200918054134.GA9252@gondor.apana.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 18, 2020 at 03:41:34PM +1000, Herbert Xu wrote:
> On Fri, Sep 18, 2020 at 03:21:27PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the staging tree got a conflict in:
> > 
> >   drivers/staging/rtl8192e/Kconfig
> > 
> > between commit:
> > 
> >   054694a46d64 ("staging/rtl8192e: switch to RC4 library interface")
> > 
> > from the crypto tree and commits:
> > 
> >   243d040a6e4a ("staging: rtl8192e: fix kconfig dependency warning for RTLLIB_CRYPTO_TKIP")
> >   02c4260713d6 ("staging: rtl8192e: fix kconfig dependency warning for RTLLIB_CRYPTO_WEP")
> > 
> > from the staging tree.
> 
> Those two commits should just be dropped.

Ok, I'll go revert these.

>  
> > diff --cc drivers/staging/rtl8192e/Kconfig
> > index 4c440bdaaf6e,31e076cc6f16..000000000000
> > --- a/drivers/staging/rtl8192e/Kconfig
> > +++ b/drivers/staging/rtl8192e/Kconfig
> > @@@ -25,7 -26,8 +26,8 @@@ config RTLLIB_CRYPTO_CCM
> >   config RTLLIB_CRYPTO_TKIP
> >   	tristate "Support for rtllib TKIP crypto"
> >   	depends on RTLLIB
> > + 	select CRYPTO
> >  -	select CRYPTO_ARC4
> >  +	select CRYPTO_LIB_ARC4
> 
> As the driver has been converted over to the lib arc4 API, it
> does not need to select CRYPTO at all.

Is it converted in your tree?  If so, have a branch/tag I can pull in to
prevent merge issues in the future?

thanks,

greg k-h
