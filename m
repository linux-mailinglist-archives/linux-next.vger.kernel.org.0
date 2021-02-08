Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9679312C7B
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 09:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbhBHIzR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 03:55:17 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:41399 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231180AbhBHIxP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2021 03:53:15 -0500
Received: by mail-oi1-f182.google.com with SMTP id v193so9400538oie.8;
        Mon, 08 Feb 2021 00:52:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zHudw0TAP+YeZRvB+TR6ZUnftiytNBVnLvjklahW0oo=;
        b=tzQEalYLCl8saKCZDrhDmcgTboQ3hemZWHvXmDdeFLqydnWrRFfM+v7LY5CBEndolt
         ub2iDdiKWidZv+LU74EYmF0/FCeb7lxhxS34jQXvhWcpHc2xdLZP2zzb10pESYTsBo4/
         6rjCPcckvbNtXlK1Ymd9fcjstzOSSkfAoCnQ44B98OA5HlSSS39lVLHQX1DKvxl0MjbL
         rpIZvGg+uF32gQ4Kme+pTqXRPUSbFWJcLXfd6c3/JpCzkaOkEH5i0/yHSvgc1QRHUaSz
         t37MF1srSS+Lkz7FQ1JEwBN2/cGb+HdpaLR/clvmJklDvfym3LWEQTYMngcALVL3DQ9K
         te5w==
X-Gm-Message-State: AOAM531hlodfM9msX1bdih0jhFU9220uCAp7ye3LiGuZGJaV/cpfpovu
        2khwVlR+9zXGB1o/Gl6RtWejNm5J4bXeyyphl9A=
X-Google-Smtp-Source: ABdhPJyxve59tNdWgfofA/nLNkbqjjIxo/R+1WXcOfsVCAIYZGcgAKwETZyEVWm957bgHDuco4qw21G5ziyOd5Lq81Y=
X-Received: by 2002:aca:744:: with SMTP id 65mr10411020oih.153.1612774353903;
 Mon, 08 Feb 2021 00:52:33 -0800 (PST)
MIME-Version: 1.0
References: <20210208113208.35449879@canb.auug.org.au> <20210208073037.0b9fe4b9@coco.lan>
 <CAMuHMdVTSCtwbTqBOag_sYHfDnVevZHxZyYOgHMVx936x=e1ZA@mail.gmail.com> <20210208094901.087762b8@coco.lan>
In-Reply-To: <20210208094901.087762b8@coco.lan>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Feb 2021 09:52:22 +0100
Message-ID: <CAMuHMdXb99O9j0ji65=GqXOu1iArBgjhzYEGHmO_mM=ursDp9w@mail.gmail.com>
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

Hi Mauro,

On Mon, Feb 8, 2021 at 9:49 AM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> Em Mon, 8 Feb 2021 09:33:14 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> escreveu:
> > On Mon, Feb 8, 2021 at 7:35 AM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
> > > Em Mon, 8 Feb 2021 11:32:08 +1100
> > > Stephen Rothwell <sfr@canb.auug.org.au> escreveu:
> > >
> > > > After merging the v4l-dvb tree, today's linux-next build (x86_64
> > > > allmodconfig) produced this warning:
> > > >
> > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_serial_link' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_configure_i2c' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_high_threshold' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_configure_gmsl_link' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_clear_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_enable_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_disable_gpios' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_verify_id' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_deserializer_address' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max9271_set_translation' exported twice. Previous export was in drivers/media/i2c/rdacm20-camera_module.ko
> > > >
> > > > Introduced by commit
> > > >
> > > >   a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module")
> > > >
> > >
> > > It sounds to be due to a Makefile mess:
> > >
> > >         drivers/media/i2c/Makefile:rdacm20-camera_module-objs   := rdacm20.o max9271.o
> > >         drivers/media/i2c/Makefile:rdacm21-camera_module-objs   := rdacm21.o max9271.o
> > >
> > > Neither drivers should be including max9271.o as their objects, but, instead,
> > > be addressing max9271 dependency via Kconfig.
> >
> > Wouldn't
> >
> >     obj-$(CONFIG_VIDEO_RDACM20)     += rdacm20.o max9271.o
> >     obj-$(CONFIG_VIDEO_RDACM21)     += rdacm21.o max9271.o
> >
> > work, too?
>
> Not 100% sure, but I guess this would cause problems with allyesconfig.

Duplicates will be filtered out.
An example using this method is drivers/net/ethernet/8390/Makefile.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
