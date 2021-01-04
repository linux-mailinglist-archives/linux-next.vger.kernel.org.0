Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4062E97C6
	for <lists+linux-next@lfdr.de>; Mon,  4 Jan 2021 15:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727438AbhADO4L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 Jan 2021 09:56:11 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:53477 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727219AbhADO4K (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 Jan 2021 09:56:10 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 12659172D;
        Mon,  4 Jan 2021 09:55:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 04 Jan 2021 09:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=AxARTzbgs463HULr+SRfRHOKnXs
        /WKBB5ueaan5NvR4=; b=XA6SsbxWwBtGc9ezdlorudN4v4Tz6P6MCFaSgUe22Rm
        73x2EV3Tij8sK5XAEs3tysrZbS1ynZTNsHS62qQTLA31E9uw9X7jkakukMNIhB/f
        PxJacjJe/iG1R1mDrAWbaXE5PW8cruge7veKD5doUr8d4a5pV0DcT8HIZ0O5B5Ch
        8mHycl86Rr0uuVcS99GpQwp6h+/N9WI+vCVVRL3JeeEMZRcX1xL0cRNdxJ30em10
        xysHg7WNMQBK2VGkftFMjO/nx21U7mBTfWdNqY3sxzoisrb+YC3Ps8H/zCeX4hTZ
        cgLvAat4h/dkOzDONVakVQR8sUuUQZVG5FhZpXvIX5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=AxARTz
        bgs463HULr+SRfRHOKnXs/WKBB5ueaan5NvR4=; b=ax9jWUPPSU17namfX3GEYR
        rkCMMxawETTmd1Ql8Ln+Mu59jO1AYZy1Q1/ZBoGbTj3Kb/+eu1xFYj0grsQVYJj6
        Z7TRZ75P2uEVrfr+mlIjLxXSqAguu4kkxczvUPtcRWCODhKvjdgpMGFHLlfGf/b2
        zElvFdcfQ9OqjM0gqaPMpl6BlmCwasLCQswYU4/9vwlAFCxU4jq80Fw5KwV8pP5y
        1C+MTjFjB9oGZGBvFGwR3cXf5gQshk32jouyxPN9c1OeyXO0/chOFpX1mYCl6Tod
        nnYdXPF4Ce7GoSMOfg9uqA+7XYx6q3rKFiLSQnu2i77yBEQtAZUR/d/VDFwzoq4A
        ==
X-ME-Sender: <xms:WCzzXwY0RbuI9AwxDH5J-hJ02OdLhiFeQ3C-qj4cLcuiqZCgjN_06g>
    <xme:WCzzX7amslpOfUWixOJXtJ29O1kvK1BKUcFVCx5XVdJXPRJ4SQtuHRMectS-gWmp2
    cI7-AcuX0NIrQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdeffedgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeeuleeltd
    ehkeeltefhleduuddvhfffuedvffduveegheekgeeiffevheegfeetgfenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghh
    rdgtohhm
X-ME-Proxy: <xmx:WCzzX6_XAJusIT21SRFkpwY8-Ne3p-TG7OIKdAR-3OY6pEBXvHkrTA>
    <xmx:WCzzX6p7Wp2vXJZHAX9KyXQmiLtZk4qCpxufRRZAG3JNwJpBdUvkSw>
    <xmx:WCzzX7onnfNZq-ZfaSuBhzeMflCIemDMxEGJQCyStoIwl9Mpa3PeTw>
    <xmx:WizzXy2ymwPnU-ruRpRSG4_qUBO-sCqtSOwFVSvNQgSsGfwbMXx_yg>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id A35C924005C;
        Mon,  4 Jan 2021 09:55:20 -0500 (EST)
Date:   Mon, 4 Jan 2021 15:56:47 +0100
From:   Greg KH <greg@kroah.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Song Chen <chensong_2000@189.cn>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failures after merge of the staging tree
Message-ID: <X/Msr8Dqbxk3YO0v@kroah.com>
References: <20210104122653.6f35b9bb@canb.auug.org.au>
 <CAMuHMdXWqO2WPKSxsfbr=-_rrXenEwJRW3rYko7VJCPwCnyeLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXWqO2WPKSxsfbr=-_rrXenEwJRW3rYko7VJCPwCnyeLA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 04, 2021 at 09:27:01AM +0100, Geert Uytterhoeven wrote:
> On Mon, Jan 4, 2021 at 6:12 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > After merging the staging tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >
> > In file included from include/linux/printk.h:6,
> >                  from include/linux/kernel.h:16,
> >                  from drivers/staging/board/kzm9d.c:4:
> > drivers/staging/board/kzm9d.c:28:17: error: initialization of 'initcall_t' {aka 'int (*)(void)'} from incompatible pointer type 'void (*)(void)' [-Werror=incompatible-pointer-types]
> >    28 | device_initcall(kzm9d_init);
> >       |                 ^~~~~~~~~~
> > include/linux/init.h:197:50: note: in definition of macro '___define_initcall'
> >   197 |   __attribute__((__section__(#__sec ".init"))) = fn;
> >       |                                                  ^~
> > include/linux/init.h:229:30: note: in expansion of macro '__define_initcall'
> >   229 | #define device_initcall(fn)  __define_initcall(fn, 6)
> >       |                              ^~~~~~~~~~~~~~~~~
> > drivers/staging/board/kzm9d.c:28:1: note: in expansion of macro 'device_initcall'
> >    28 | device_initcall(kzm9d_init);
> >       | ^~~~~~~~~~~~~~~
> > cc1: some warnings being treated as errors
> > In file included from include/linux/printk.h:6,
> >                  from include/linux/kernel.h:16,
> >                  from include/asm-generic/bug.h:20,
> >                  from arch/arm/include/asm/bug.h:60,
> >                  from include/linux/bug.h:5,
> >                  from include/linux/thread_info.h:12,
> >                  from include/asm-generic/current.h:5,
> >                  from ./arch/arm/include/generated/asm/current.h:1,
> >                  from include/linux/sched.h:12,
> >                  from include/linux/ratelimit.h:6,
> >                  from include/linux/dev_printk.h:16,
> >                  from include/linux/device.h:15,
> >                  from include/linux/dma-mapping.h:7,
> >                  from drivers/staging/board/armadillo800eva.c:12:
> > drivers/staging/board/armadillo800eva.c:90:17: error: initialization of 'initcall_t' {aka 'int (*)(void)'} from incompatible pointer type 'void (*)(void)' [-Werror=incompatible-pointer-types]
> >    90 | device_initcall(armadillo800eva_init);
> >       |                 ^~~~~~~~~~~~~~~~~~~~
> > include/linux/init.h:197:50: note: in definition of macro '___define_initcall'
> >   197 |   __attribute__((__section__(#__sec ".init"))) = fn;
> >       |                                                  ^~
> > include/linux/init.h:229:30: note: in expansion of macro '__define_initcall'
> >   229 | #define device_initcall(fn)  __define_initcall(fn, 6)
> >       |                              ^~~~~~~~~~~~~~~~~
> > drivers/staging/board/armadillo800eva.c:90:1: note: in expansion of macro 'device_initcall'
> >    90 | device_initcall(armadillo800eva_init);
> >       | ^~~~~~~~~~~~~~~
> >
> > Caused by commit
> >
> >   850c35bb28ec ("staging: board: Remove macro board_staging")
> >
> > I have used the staging tree from next-20201223 for today.
> 
> Note that a similar patch was (IMHO rightfully) rejected 3 years ago:
> https://lore.kernel.org/lkml/20170220175506.GA30142@kroah.com/
> 
> So please drop it. Thanks!

Now reverted, thanks.

greg k-h
