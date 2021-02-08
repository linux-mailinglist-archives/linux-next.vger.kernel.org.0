Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 302B8312C45
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 09:52:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhBHIvx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 03:51:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:41862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230328AbhBHIts (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Feb 2021 03:49:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94FA360232;
        Mon,  8 Feb 2021 08:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612774146;
        bh=X5abW4YXcgR/cJ5kVqBOscV0jSor3pRePsy0mqCzwNA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=V0FWVUILDGpw8ktMFYTeA59JNKjykYWV3A+3n3ROWjH8iQfpB85II1IpAfD+CzYTQ
         uMsLQUN1ahX/NHUAlBDDZyG4PY3FjZM74w1YXfYaUYlat4zuCpSaJ9D8cWushwBizP
         oX0kUMxsNk62U13kIQlb91IWubOL1roHXzllft9Ca/o7MOYFqFD+U0tHqeVt70r6fh
         ONRLtyVNhXQW4UrYSSlOX30LZ36YBTJGF9ZPdtuLi02wrooJNzeb+KYIqKEJikp8+o
         4bZZENOPUABSzU92Ghz54sPxJi/AkNJZHnvxSsOtiDkTZ3WjpqQAt9h7ePGHLiyGil
         90dg3xRg7XzFw==
Date:   Mon, 8 Feb 2021 09:49:01 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20210208094901.087762b8@coco.lan>
In-Reply-To: <CAMuHMdVTSCtwbTqBOag_sYHfDnVevZHxZyYOgHMVx936x=e1ZA@mail.gmail.com>
References: <20210208113208.35449879@canb.auug.org.au>
        <20210208073037.0b9fe4b9@coco.lan>
        <CAMuHMdVTSCtwbTqBOag_sYHfDnVevZHxZyYOgHMVx936x=e1ZA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Mon, 8 Feb 2021 09:33:14 +0100
Geert Uytterhoeven <geert@linux-m68k.org> escreveu:

> On Mon, Feb 8, 2021 at 7:35 AM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> > Em Mon, 8 Feb 2021 11:32:08 +1100
> > Stephen Rothwell <sfr@canb.auug.org.au> escreveu:
> >  
> > > After merging the v4l-dvb tree, today's linux-next build (x86_64
> > > allmodconfig) produced this warning:
> > >
> > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_serial_link' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_configure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_high_threshold' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_configure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_clear_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_enable_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_disable_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_verify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_deserializer_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_translation' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > >
> > > Introduced by commit
> > >
> > >   a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> > >  
> >
> > It sounds to be due to a Makefile mess:
> >
> >         drivers/media/i2c/Makefile:rdacm20-camera_module-objs   := rdacm20.o max9271.o
> >         drivers/media/i2c/Makefile:rdacm21-camera_module-objs   := rdacm21.o max9271.o
> >
> > Neither drivers should be including max9271.o as their objects, but, instead,
> > be addressing max9271 dependency via Kconfig.  
> 
> Wouldn't
> 
>     obj-$(CONFIG_VIDEO_RDACM20)     += rdacm20.o max9271.o
>     obj-$(CONFIG_VIDEO_RDACM21)     += rdacm21.o max9271.o
> 
> work, too?

Not 100% sure, but I guess this would cause problems with allyesconfig.

Thanks,
Mauro
