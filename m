Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58B92A61B5
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 08:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfICGqQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Sep 2019 02:46:16 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35996 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfICGqQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Sep 2019 02:46:16 -0400
Received: by mail-io1-f67.google.com with SMTP id b136so9338556iof.3
        for <linux-next@vger.kernel.org>; Mon, 02 Sep 2019 23:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=evIBGpMkKq7gF2bmpGJVBBvFtlHOCCwSRuXGW57v0+I=;
        b=oDI5zO2M8YPD9bqqe8WAGL5+SleeShW5D3daIfkP4IBrrtXnD8iiyqQSSSur5aK/+6
         tnXF13xw3i9XX6HysJWBNS2tnbdzOimL7w66m7ezaTaFsxq1/UcfO+cBBwWOFwVMHMxV
         tq3hIjQlxiuxg80Z/I3ThLDprCX5lXjcEn053bs24k59SCmmMdQdAb2g6Xmu/SOiP/l7
         1DPQFOui3x52Xy12pyhTRUA1NjZo1TOIN1+jQq90/KptExJ5SbGYuevS3C1T5eLPGnjT
         xRjE93h4x90xtAQKaaeGcoidicG7tIvfIcw9wl/Yq1tlNXLgOpPwg0vD4u/VvFuHRfQJ
         CExg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=evIBGpMkKq7gF2bmpGJVBBvFtlHOCCwSRuXGW57v0+I=;
        b=e+r5o+7j67bFiFvH1Oqhp1zPFzr4drTYyoP2vx4fapQ54Sy9ynqHQ0V+t0jKcKvBfL
         L7xGz6KMeVqaNaFmiB9wl+3mWlRc6QSjcKRGryQ6hc+85vuAf+vwyjFDkoWuRvdrVg+/
         8X87eBN/x++0TiCVtxKJnwX4PbAcGd8xPSdwun+8NcaOzXcONN65ySKkLTtP6N0VQtKJ
         cFBQjxL//vj5lsOHa5RoP9qL+G2RL0JLwQ79I7PxsgrTK+9cLb38hJPtj0m0TlYCRntF
         3tQuxDrDwhx123PpZXe0glvmyfJJsNUyvMPxUeUm8kVASpGEIfGNkMTbz6iZTzZZZalC
         hQew==
X-Gm-Message-State: APjAAAUgB/PjrnTSgo1rlB9m8Bt6GhB+M9PH2k6SA89fuK0DCJFqnKlx
        O6AetRfFWGd4mk2mtU6vr4v507X71VRjPKl0Xv1hxQ==
X-Google-Smtp-Source: APXvYqxCXXDVuNB2PUOLGJK10JygRjb97+McBAXtxlqw5yercmiWGDQp5Y2f1gYVpwc4cq+ZwIk5nVJf7wrFx10heJ0=
X-Received: by 2002:a02:6a56:: with SMTP id m22mr34218784jaf.114.1567493175261;
 Mon, 02 Sep 2019 23:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190903142638.79d2cc87@canb.auug.org.au>
In-Reply-To: <20190903142638.79d2cc87@canb.auug.org.au>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 3 Sep 2019 08:46:04 +0200
Message-ID: <CAMRc=Mc=nCCgjrp_4j+n0RBKSoboHzvUFJnQZeG2qOXc8KnZ=g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the regulator tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

wt., 3 wrz 2019 o 06:26 Stephen Rothwell <sfr@canb.auug.org.au> napisa=C5=
=82(a):
>
> Hi all,
>
> After merging the regulator tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> ld: drivers/ata/ahci.o:(.opd+0x150): multiple definition of `regulator_bu=
lk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined he=
re
> ld: drivers/ata/ahci.o: in function `.regulator_bulk_set_supply_names':
> ahci.c:(.text+0x1780): multiple definition of `.regulator_bulk_set_supply=
_names'; drivers/phy/phy-core.o:(.text+0x2390): first defined here
> ld: drivers/ata/libahci.o: in function `.regulator_bulk_set_supply_names'=
:
> (.text+0x84a0): multiple definition of `.regulator_bulk_set_supply_names'=
; drivers/phy/phy-core.o:(.text+0x2390): first defined here
> ld: drivers/ata/libahci.o:(.opd+0x5d0): multiple definition of `regulator=
_bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined=
 here
> ld: drivers/ata/sata_mv.o:(.opd+0x690): multiple definition of `regulator=
_bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined=
 here
> ld: drivers/ata/sata_mv.o: in function `.regulator_bulk_set_supply_names'=
:
> sata_mv.c:(.text+0xb9b0): multiple definition of `.regulator_bulk_set_sup=
ply_names'; drivers/phy/phy-core.o:(.text+0x2390): first defined here
> ld: drivers/usb/common/common.o: in function `.regulator_bulk_set_supply_=
names':
> (.text+0x7d0): multiple definition of `.regulator_bulk_set_supply_names';=
 drivers/phy/phy-core.o:(.text+0x2390): first defined here
> ld: drivers/usb/common/common.o:(.opd+0x120): multiple definition of `reg=
ulator_bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first d=
efined here
> ld: drivers/usb/core/usb.o: in function `.regulator_bulk_set_supply_names=
':
> (.text+0x17d0): multiple definition of `.regulator_bulk_set_supply_names'=
; drivers/phy/phy-core.o:(.text+0x2390): first defined here
> ld: drivers/usb/core/usb.o:(.opd+0x348): multiple definition of `regulato=
r_bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first define=
d here
> ld: drivers/usb/core/hub.o: in function `.regulator_bulk_set_supply_names=
':
> (.text+0x2610): multiple definition of `.regulator_bulk_set_supply_names'=
; drivers/phy/phy-core.o:(.text+0x2390): first defined here
> ld: drivers/usb/core/hub.o:(.opd+0x378): multiple definition of `regulato=
r_bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first define=
d here
> ld: drivers/usb/core/hcd.o: in function `.regulator_bulk_set_supply_names=
':
> (.text+0x3020): multiple definition of `.regulator_bulk_set_supply_names'=
; drivers/phy/phy-core.o:(.text+0x2390): first defined here
> ld: drivers/usb/core/hcd.o:(.opd+0x378): multiple definition of `regulato=
r_bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first define=
d here
> ld: drivers/usb/core/message.o: in function `.regulator_bulk_set_supply_n=
ames':
> (.text+0x2350): multiple definition of `.regulator_bulk_set_supply_names'=
; drivers/phy/phy-core.o:(.text+0x2390): first defined here
> ld: drivers/usb/core/message.o:(.opd+0x240): multiple definition of `regu=
lator_bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first de=
fined here
> ld: drivers/usb/core/phy.o: in function `.regulator_bulk_set_supply_names=
':
> (.text+0x700): multiple definition of `.regulator_bulk_set_supply_names';=
 drivers/phy/phy-core.o:(.text+0x2390): first defined here
> ld: drivers/usb/core/phy.o:(.opd+0xc0): multiple definition of `regulator=
_bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined=
 here
> ld: drivers/usb/core/of.o: in function `.regulator_bulk_set_supply_names'=
:
> (.text+0x2f0): multiple definition of `.regulator_bulk_set_supply_names';=
 drivers/phy/phy-core.o:(.text+0x2390): first defined here
> ld: drivers/usb/core/of.o:(.opd+0x48): multiple definition of `regulator_=
bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined =
here
> ld: drivers/usb/phy/of.o: in function `.regulator_bulk_set_supply_names':
> (.text+0x120): multiple definition of `.regulator_bulk_set_supply_names';=
 drivers/phy/phy-core.o:(.text+0x2390): first defined here
> ld: drivers/usb/phy/of.o:(.opd+0x18): multiple definition of `regulator_b=
ulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined h=
ere
> ld: drivers/usb/host/ehci-hcd.o: in function `.regulator_bulk_set_supply_=
names':
> (.text+0x11830): multiple definition of `.regulator_bulk_set_supply_names=
'; drivers/phy/phy-core.o:(.text+0x2390): first defined here
> ld: drivers/usb/host/ehci-hcd.o:(.opd+0x8d0): multiple definition of `reg=
ulator_bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first d=
efined here
> ld: drivers/usb/host/ohci-hcd.o: in function `.regulator_bulk_set_supply_=
names':
> (.text+0xe8d0): multiple definition of `.regulator_bulk_set_supply_names'=
; drivers/phy/phy-core.o:(.text+0x2390): first defined here
> ld: drivers/usb/host/ohci-hcd.o:(.opd+0x570): multiple definition of `reg=
ulator_bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first d=
efined here
> ld: drivers/of/platform.o: in function `.regulator_bulk_set_supply_names'=
:
> (.text+0x1180): multiple definition of `.regulator_bulk_set_supply_names'=
; drivers/phy/phy-core.o:(.text+0x2390): first defined here
> ld: drivers/of/platform.o:(.opd+0x180): multiple definition of `regulator=
_bulk_set_supply_names'; drivers/phy/phy-core.o:(.opd+0x3f0): first defined=
 here
>
> Caused by commit
>
>   d0087e72710c ("regulator: provide regulator_bulk_set_supply_names()")
>
> I applied the following patch for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 3 Sep 2019 14:23:17 +1000
> Subject: [PATCH] regulator: stubs in header files should be static inline
>
> Fixes: d0087e72710c ("regulator: provide regulator_bulk_set_supply_names(=
)")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  include/linux/regulator/consumer.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/regulator/consumer.h b/include/linux/regulator=
/consumer.h
> index 6d2181a76987..fe9bdf37c296 100644
> --- a/include/linux/regulator/consumer.h
> +++ b/include/linux/regulator/consumer.h
> @@ -586,7 +586,7 @@ static inline int regulator_list_voltage(struct regul=
ator *regulator, unsigned s
>         return -EINVAL;
>  }
>
> -void regulator_bulk_set_supply_names(struct regulator_bulk_data *consume=
rs,
> +static inline void regulator_bulk_set_supply_names(struct regulator_bulk=
_data *consumers,
>                                      const char *const *supply_names,
>                                      unsigned int num_supplies)
>  {
> --
> 2.23.0.rc1
>
> --
> Cheers,
> Stephen Rothwell

Hi Stephen,

a patch for this was already on the list: https://lkml.org/lkml/2019/9/2/66=
8

Bart
