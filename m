Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5005A316E6D
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 19:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233977AbhBJSVz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 13:21:55 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:50859 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233509AbhBJSTo (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Feb 2021 13:19:44 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 421235C00A2;
        Wed, 10 Feb 2021 13:18:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 10 Feb 2021 13:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=jFkuPjXb9tgZPkj2glbapzNWaGE
        NKbSiHogi5lZNxcI=; b=hd1L1IwBVz6hNJxz6F98phrMddFFdNRL4Xu1H/PKPYV
        tsFDtw94tYBLgeEP0ZQzbvK6/rjtgjFxRif9MFE5G1HVK3DKSie2MlCfcNoGMtja
        7lSM7P1rxFY/biQMc0Ns5IqZ93LS51UJnD9a4UJH1QeFGmZIjwzB9gc00i2ixPaj
        QiHaltqMsy50e1yAKl+Mfp9kBwYGXYO5acWl7nCQe3Xik39plvMEPCjWQmcIfTo6
        fH42AfDTFDCBmtSiJyFQAl7WCrx0/rTFR61600lNPzdgw9qVEHCjFznUMU1Ml/xW
        Y2YJwWPdJ7C6MY4YAAun2wyYNuWBM/vzTwchkL22woQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jFkuPj
        Xb9tgZPkj2glbapzNWaGENKbSiHogi5lZNxcI=; b=oQ6SuSunxNOrFlBcnRp2ul
        eEMdhl7hgyjAKf5i3L/v+q8Ar75HBdTBb1fsGYky2+VGugSUe1raOTsf85iiRjvv
        JAuckCCbGRotJqlvWdpIRcktqAXt8pRFeFjVYL5RCX5wTtf7gb8ECm0XlnwcfrIy
        WbGGzObIF+rYvxXdA+MjGG8ohtnK8/Xfu40Qrb4Q0pO6UyrqCI/S5zQWZxMczH3w
        Qs+ltgiIKWuRfDkumpLKJTcnR8Tk0KNci3FC/RK5CRyKaNpwCBAPAgYYdoGvCYg4
        wPc0GLYZSmK3qoOnsUJEvc+wuqhsgoIGLkl3tXu9TM21PhKSjEqQDkoY3GhL263Q
        ==
X-ME-Sender: <xms:gSMkYPsgLEyJjkq8KPhL8MwogDGbvxWZYogY7W2N79WFKjVY56OzVg>
    <xme:gSMkYAepxW3UcI7cMDAm4e8MzAZKd-L364nrczLuLgyL4FNG-5HAHgJPVRrWGuPph
    sKfqm-VJzllkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheejgddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:gSMkYCya2S6l6ungISr21oMbDRuJJeRaJ8M65N3Ve6RvhTEv1nF2tg>
    <xmx:gSMkYOOYnQDWH8sMg2ynPbhnGo_bdME9eW0c_JuOm6wuimF2-U2fwQ>
    <xmx:gSMkYP_O_eEtjxjIw2ox5ErDHnrwIPfp5wtd9zyERUSUuMk8a-GaEA>
    <xmx:giMkYJm9ayd6GBJE3R4ngyAs2WPZm1FZxB4EgGPC475sAEvDNr8txw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2DFA2108005B;
        Wed, 10 Feb 2021 13:18:41 -0500 (EST)
Date:   Wed, 10 Feb 2021 19:18:38 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Saravana Kannan <saravanak@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Message-ID: <YCQjfqH415zIhhyz@kroah.com>
References: <20210210214720.02e6a6be@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210214720.02e6a6be@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 10, 2021 at 09:47:20PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the driver-core tree, today's linux-next build (sparc64
> defconfig) failed like this:
> 
> drivers/of/property.o: In function `parse_interrupts':
> property.c:(.text+0x14e0): undefined reference to `of_irq_parse_one'
> 
> Caused by commit
> 
>   f265f06af194 ("of: property: Fix fw_devlink handling of interrupts/interrupts-extended")
> 
> CONFIG_OF_IRQ depends on !SPARC so of_irq_parse_one() needs a stub.
> I have added the following patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 10 Feb 2021 21:27:56 +1100
> Subject: [PATCH] of: irq: make a stub for of_irq_parse_one()
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/of_irq.h | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Thanks for this, I'll go queue it up now.

greg k-h
