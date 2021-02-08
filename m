Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA319312BEA
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 09:38:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbhBHIfW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 03:35:22 -0500
Received: from mail-oi1-f173.google.com ([209.85.167.173]:37895 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbhBHIeH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2021 03:34:07 -0500
Received: by mail-oi1-f173.google.com with SMTP id h6so14823626oie.5;
        Mon, 08 Feb 2021 00:33:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=co1TXlQdWofol0Al5pkdhkz1Nbg1ElaHw2eyB47/d/o=;
        b=htpZyeDnu8DANExKS+va1WTTyGTVUPWbBYxKsEy/tAHaizWknOmOXN9R9MKJRCo4ye
         kXNmNWT8e6Qfk4Xo9SbGyPuf19Kg0+X/bJtPWRJ3tKmzYFVkzpiZgqNbh7/46zlgvpHO
         cCEPl9tcdgPE/iIDMeY9JM08b40w+PBAZ2Orx20hR5v3WdtiK442qlWH+a+u52OHIFuo
         ijK0Qlfrg3ygQ6u5skqGn70xcHj6KDdYn6cH5CH4ZIP7cIewe1Bu4WU9g0aMpMm5oMej
         aBI2eISeaxPEtkqQwT6F/3TDzYOKGAZthvD8MXjPnY9idV3csLjqxZKUhBBul7VnAGnl
         6aiw==
X-Gm-Message-State: AOAM531Tv+CL5aTidcqlIs8G5IAlDF5wYZyupliruDgHz/At6pp2iJCA
        q4PfzsRosUjv2g52yivIsZx9WQDZzoDoJlUvvsc=
X-Google-Smtp-Source: ABdhPJzrJhg3V70QHiCMy0A3z+jDlcKmGUwHq096PPBBB6+v2cXNs2X/Ur2Zo8rQ+RrAqD6MHw/40kkZUJssLzgQ2eg=
X-Received: by 2002:aca:744:: with SMTP id 65mr10371843oih.153.1612773205850;
 Mon, 08 Feb 2021 00:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20210208113208.35449879@canb.auug.org.au> <20210208073037.0b9fe4b9@coco.lan>
In-Reply-To: <20210208073037.0b9fe4b9@coco.lan>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Feb 2021 09:33:14 +0100
Message-ID: <CAMuHMdVTSCtwbTqBOag_sYHfDnVevZHxZyYOgHMVx936x=e1ZA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 8, 2021 at 7:35 AM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> Em Mon, 8 Feb 2021 11:32:08 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> escreveu:
>
> > After merging the v4l-dvb tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> >
> > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_serial_link' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_configure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_high_threshold' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_configure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_clear_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_enable_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_disable_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_verify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_deserializer_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_translation' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> >
> > Introduced by commit
> >
> >   a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> >
>
> It sounds to be due to a Makefile mess:
>
>         drivers/media/i2c/Makefile:rdacm20-camera_module-objs   := rdacm20.o max9271.o
>         drivers/media/i2c/Makefile:rdacm21-camera_module-objs   := rdacm21.o max9271.o
>
> Neither drivers should be including max9271.o as their objects, but, instead,
> be addressing max9271 dependency via Kconfig.

Wouldn't

    obj-$(CONFIG_VIDEO_RDACM20)     += rdacm20.o max9271.o
    obj-$(CONFIG_VIDEO_RDACM21)     += rdacm21.o max9271.o

work, too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
