Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77FD93E40ED
	for <lists+linux-next@lfdr.de>; Mon,  9 Aug 2021 09:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233485AbhHIHmB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 03:42:01 -0400
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:54933 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232094AbhHIHmB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Aug 2021 03:42:01 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 2A8762B006D0;
        Mon,  9 Aug 2021 03:41:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 09 Aug 2021 03:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=RjIBzrlZGQfh73r05Ozevdc3Gz9
        BndFcrU4vim+1dgI=; b=LIJQnGLwWIwpczK+/wppS6Z6DhvaxLuWenVOO4WkDSk
        WBqweY+kB8uhlDUWXRfS6LkDiJJxwHLn3QViBzpze9dWsO6uCrRBO9EgpHJeBzrw
        /sH6Z4rvUjJkxebbutdYMbuhzbRLJsJMKe/VAJ9y8BfHEWNenyUt/F5KOXKaERr5
        IFM5Vlxi4y4M5+Y0bYkEH5xZGWTJ5/T06XTrzd7Pf4qQSlnJka4EvNAOzWQgVnCG
        awoeWTuM+ldN2rOiG4xcCRT27FNBazBkJKBoQotpK+7sDu4BBnvVyg1k4pPDhyrI
        SHNQlgmoFM/N46FOF+QAw6u9SiOKDRu4/lPpJsCdaxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RjIBzr
        lZGQfh73r05Ozevdc3Gz9BndFcrU4vim+1dgI=; b=m3o5OyDvRmElTGpvF1PD2a
        SHt9xnNx37kBFVR1sj6s9Ek/QOV8NM7vWiAwK9Ce57OwRB+X9/SOeHIw16Lr5fYf
        Calf73y+/+KZ+P6t5GdlN0JmYmHzstHNYY6UZCrYoRYPFI2/jJNAkx7yLyQajcHd
        N3Tx4YD3wMhbpE0Xaffm6ZDT0L6JCbyN13hyu134VD/Sn0kWm9K2Z5t/geR66Mhw
        t69hBKB6v46sGM0Cs5610g5aTusw65Nwp1h66BF7B42EEjkaLpMWIGUol8IzUPfw
        JgjeyvyOOrBzDjxu1kQxmr2GWMY1nkdRePzS0FdxFIVXgzN2/myf3C8VWIGG3i/w
        ==
X-ME-Sender: <xms:MtwQYdVjRp-e4X9XJNWKFY9fmyJwhyuLpIe9hKNHnphk2Nd_mZHJVg>
    <xme:MtwQYdn7-xSNCvtqJf_esMNrEtbY6ZPDdjvfD4ZOsn0xFfvxjjjU4eUbqn3HKhYKI
    mocgVx7OAmAjw>
X-ME-Received: <xmr:MtwQYZaJ-6S7rX_2Tg2G8IRp_8AWAu8o1Kl3EcF-o1I3tEWDZ8NzTtw9v0OqRu7TojEohCfZwNaHxZLGPB5AGHB52UkhmNKo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeeigdduudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:MtwQYQXF4Wsf3kXa68Go4mvBWAKVNogxaiSPKTPpjqMTI_U9eFrOaA>
    <xmx:MtwQYXklA_l8rnDHcvE81twcvQUTNODtjR76jU3GpUj7LH7_QxIOZw>
    <xmx:MtwQYddGdNQ_AjcD-FuSJiV5V8iY6FaF1g637Hv85bBcd_GGIO9krw>
    <xmx:M9wQYQcIUit4FrZNJb4rVr65i_CJszaCfo6znoUgpCO5SHLBY4hHAllT8co>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Aug 2021 03:41:38 -0400 (EDT)
Date:   Mon, 9 Aug 2021 09:41:36 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: linux-next: manual merge of the staging tree with the char-misc
 tree
Message-ID: <YRDcMERBir/y4RwL@kroah.com>
References: <20210809173503.07581f5c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809173503.07581f5c@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 09, 2021 at 05:35:03PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/misc/Kconfig
> 
> between commit:
> 
>   0f920277dc22 ("misc: gehc-achc: new driver")
> 
> from the char-misc tree and commit:
> 
>   bb3b6552a5b0 ("staging: hikey9xx: split hi6421v600 irq into a separate driver")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/misc/Kconfig
> index a420b59917db,29294c52d5af..000000000000
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@@ -208,18 -208,16 +208,28 @@@ config CS5535_CLOCK_EVENT_SR
>   	  MFGPTs have a better resolution and max interval than the
>   	  generic PIT, and are suitable for use as high-res timers.
>   
>  +config GEHC_ACHC
>  +	tristate "GEHC ACHC support"
>  +	depends on SPI && SYSFS
>  +	depends on SOC_IMX53 || COMPILE_TEST
>  +	select FW_LOADER
>  +	help
>  +	  Support for GE ACHC microcontroller, that is part of the GE
>  +	  PPD device.
>  +
>  +	  To compile this driver as a module, choose M here: the
>  +	  module will be called gehc-achc.
>  +
> + config HI6421V600_IRQ
> + 	tristate "HiSilicon Hi6421v600 IRQ and powerkey"
> + 	depends on OF
> + 	depends on SPMI
> + 	select MFD_CORE
> + 	select REGMAP_SPMI
> + 	help
> + 	  This driver provides IRQ handling for Hi6421v600, used on
> + 	  some Kirin chipsets, like the one at Hikey 970.
> + 
>   config HP_ILO
>   	tristate "Channel interface driver for the HP iLO processor"
>   	depends on PCI



Looks good, thanks!
