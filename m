Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCCA42F5CA4
	for <lists+linux-next@lfdr.de>; Thu, 14 Jan 2021 09:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727155AbhANIvc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Jan 2021 03:51:32 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:54211 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726806AbhANIvb (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Jan 2021 03:51:31 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 1BA7814E7;
        Thu, 14 Jan 2021 03:50:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 14 Jan 2021 03:50:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=U6J0VRSmms1Ij2wRW2cmTEVE8Sg
        xqMuKnUXsUzEDc9Q=; b=WVJ483CLD6m3omPUsXSTn8pLpTH1PpQXCsrwiLADdKZ
        dGD/tfKxTlQp5xff/mGS/GZ6GrB3XHi0lRJtmpO2IQzT1H3dE5GnT6JjVdtl2MmT
        qjMPCQdeYGekoc6dhEI7t9Sv0gA0gNq6zzqQRfNQtsmzyuwDfsSEcnxBJEpESbld
        QFjk4mnmMSDkBT5pW4wL88+q3vRn7EZtKoUvkm3PsaYi9w1L0YZwd+dnZsD0OOd8
        kl7CMwdwGnF46h1x/2eGkswx9Mhnbss52RDxSTk60SlezLC/ibl5LSaBZ8NLFsYf
        BcOurV2Y7khbiIJh+IJQXSyEeRE/MK143ect3SPDNpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=U6J0VR
        Smms1Ij2wRW2cmTEVE8SgxqMuKnUXsUzEDc9Q=; b=PiVnzD7ooO8ElNEZAjlC7Y
        dY/4VcppAwZW8qwZN2sbb1ydD1QOIYAT9kfnkEco46X/jXkaDJKFHmXVMJ/6Medf
        uOhggEbGk9CGdOUT9o34s/k3ZQlmLzKQ7E8bTZllYhbI0CjyESb2+FEMQs/XRrzv
        bWkv1TvL82lr2NSxpnHeIVYAuHJrAQoA1cmhR72UKITB/K/t4N0HVYKEyYZ8ollx
        VxS3Qces1a30BEyYkO+fGUpYW7YXuiU2Hg55hkBzg6T0dk6w/3S1CPRFldYtPj/W
        VkqGHHghT7XOgCmdGo2QATPG7KtUwg4s1FtGV/3rHM8PEmnxOowGSyOODWMlMfjw
        ==
X-ME-Sender: <xms:0QUAYPUIwjG3Wi6u88PwejJugHDSgZSBhVaBChXJjvYH0nrFJlN5Lw>
    <xme:0QUAYHkKfIOfOkHVxWbn_9suXJz-ljsWx4lkuiLyTspfbVYGrWUFc1uXc-ITCDpD_
    gAH2ye6Vsdg8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdeggdduvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:0QUAYLaDJfqzad_RPxOgV0gsEOcfKrdiRcE7vcJpD5b_CgRB1Gpl-w>
    <xmx:0QUAYKUE-roXKWvY10glN_TLBQDYxXUtdJEL9VXPeC3n_0Yuwz4A3g>
    <xmx:0QUAYJn8_9Z39RaqXY_SWpT706gHu6UmCC7MKIJztrgwDxW6xmsTTw>
    <xmx:0QUAYJsfTaUN1T9UFFjGqzqqGUn_3CQdP6MrgWS-4Nsd1EYzMgqEig>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 04F341080059;
        Thu, 14 Jan 2021 03:50:24 -0500 (EST)
Date:   Thu, 14 Jan 2021 09:51:30 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Wesley Cheng <wcheng@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the usb tree
Message-ID: <YAAGEjChLvM/UmLE@kroah.com>
References: <20210106131225.66e82b5c@canb.auug.org.au>
 <20210114094856.0ca5c6e9@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210114094856.0ca5c6e9@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jan 14, 2021 at 09:48:56AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 6 Jan 2021 13:12:25 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the usb tree, today's linux-next build (htmldocs) produced
> > this warning:
> > 
> > drivers/usb/dwc3/core.h:1259: warning: Function parameter or member 'gadget_max_speed' not described in 'dwc3'
> > 
> > Introduced by commit
> > 
> >   7c9a2598463a ("usb: dwc3: gadget: Preserve UDC max speed setting")
> 
> I am still getting this warning.

Looks like Mauro just sent me a patch for this, will queue it up now,
thanks.

greg k-h
