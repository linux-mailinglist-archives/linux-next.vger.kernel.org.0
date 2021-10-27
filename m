Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B95A43C2D9
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 08:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234008AbhJ0GWc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 27 Oct 2021 02:22:32 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:35169 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230381AbhJ0GWc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 27 Oct 2021 02:22:32 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MHoVE-1mU2mB3bJW-00EwGO; Wed, 27 Oct 2021 08:20:05 +0200
Received: by mail-wr1-f45.google.com with SMTP id p14so2129738wrd.10;
        Tue, 26 Oct 2021 23:20:05 -0700 (PDT)
X-Gm-Message-State: AOAM533fassirFhq1tEZK7fBE4e19OjGc3h7ORD1Hbsg3kQtG3G9ZJ4e
        0c3qt88SkP1Vp2MsJ98wTKd6X8kue+odFWcroN4=
X-Google-Smtp-Source: ABdhPJyy7nMJ2AqnRxxIsziFa0nrcomvSIh2Cl1eTfL7Cca9Sa5hYBCRHYi7xeYQozcc/3b5PTQdRRvxP40Y1dTgIRA=
X-Received: by 2002:adf:b1c4:: with SMTP id r4mr37906808wra.428.1635315605492;
 Tue, 26 Oct 2021 23:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
 <857ab1a9-0175-2b2c-e729-2620d0221e1e@suse.de> <6862b109-ea12-6ffa-c82b-b23ee26aa5b2@infradead.org>
In-Reply-To: <6862b109-ea12-6ffa-c82b-b23ee26aa5b2@infradead.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 27 Oct 2021 08:19:49 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0wG8dKnuQMOL=bKmBHuSkWcu6OfvhTP-86rpLdr7_5CA@mail.gmail.com>
Message-ID: <CAK8P3a0wG8dKnuQMOL=bKmBHuSkWcu6OfvhTP-86rpLdr7_5CA@mail.gmail.com>
Subject: Re: gpu: drm_fb_cma_helper.c:46: undefined reference to `drm_gem_fb_get_obj'
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:yBcXJFPn8Y6xWw62wbkCtGBqdGJ/n5rB9HPooT4fcehRZrYbt/X
 8Kd0q/LUJkfO3fhmyJDED/em8GbQ3VA8CaOSsmPv9IfWbNggxPSYe6Y59jdGDMEM9OFsqRY
 jKDm2Uz2bwuonKTKvK+hlpCexqkBUnnUd0P2d15qseuN8HwzUvvqbvOAETkGjXJfFtl3dV3
 Q2yUZl/CEZ1yIscx4f8Kg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BkCGmcLK+tE=:SIyL9ZXsHcyOxz7sB1XQPc
 QI+KkO+1/zEJBJGLqRU2okF2/LxB1P9UxNw4gRZmAzHDlyB9ZvNc4KB7cYmb0N+xBe4xsu9Xw
 I5uBK1izN0Ppnegydwoavbf5IKebfVaT/JRzO0scGiAG6mnJSEooKvWDpPhrygPrhKlAbrnZ+
 Xd/kk8ue90XdTiOnkv8aKjJBsdPn72HT5bXmmMZf2NZcswU6i2fPKWtcmu9D8qNUKs9ZeiWfB
 ZMkLZPIVR5r75QL5i7fEGvqe+O/POHqIcBotIjVBhb4pz8/Kjg9pTJq3s/ZOdPAbwKuKm4mnc
 EXMyUxiBfCXSvrdQYLLq0hs2mhMk0GoC7KXIAActbA5l2EhrrEX1fEtwEBSu/AwuKBa8LtlEI
 gi8ITTb4tk8XgUX3IdcYmcSvfJQHj6v9faIStWgdOfw0/gCH8AeWYJxyrkLkv95Oo/ndV/LdC
 fXrwroKCrpvL+QaMOABj6kB71/NALXturk0wJtp5mTeM9ShyLew7onrQIphcITa3clgrTh3Y1
 f6WRCq/CNp9Y9Nlambok+ZgfBfV4oj6Pm7bFV6AIr/CakL8fEfeyfFHzdqMpSNdaMioObD0LM
 paDNea9c/DgPm+8wn/y4Qk2N0WYo/Ws1ztv9pO7XC47mwcl0gECs8JdCVq9mb15vK0MZUrraA
 fl9tL9IiHUWnMAObDisxp0TCnF3n2xqpglIVulmgGLO9BuTX5zIoumhWGUgph5j5/HHg=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 27, 2021 at 2:58 AM Randy Dunlap <rdunlap@infradead.org> wrote:

> >
> > Looking at this config, there is:
> >
> > CONFIG_DRM=y
> > # CONFIG_DRM_DP_AUX_CHARDEV is not set
> > # CONFIG_DRM_DEBUG_MM is not set
> > # CONFIG_DRM_DEBUG_SELFTEST is not set
> > CONFIG_DRM_KMS_HELPER=m
> > # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> > # CONFIG_DRM_DP_CEC is not set
> > CONFIG_DRM_GEM_CMA_HELPER=y
> > CONFIG_DRM_KMS_CMA_HELPER=y
> >
> > GEM_CMA_HELPER depends on KMS_HELPER, but the latter is a module. That's probably the cause of the problem. Is it intentionally set this way?
> >
>
> The only drivers that select DRM_KMS_HELPER are both =m, so that's how
> DRM_KMS_HELPER is set also.
>
> Symbol: DRM_KMS_HELPER [=m]
> Type : tristate
> Defined at drivers/gpu/drm/Kconfig:82
> Depends on: HAS_IOMEM [=y] && DRM [=y]
> Selected by [m]:
> - DRM_ATMEL_HLCDC [=m] && HAS_IOMEM [=y] && DRM [=y] && OF [=y] && COMMON_CLK [=y] && MFD_ATMEL_HLCDC [=y] && ARM [=y]
> - DRM_ASPEED_GFX [=m] && HAS_IOMEM [=y] && DRM [=y] && OF [=y] && (COMPILE_TEST [=n] || ARCH_ASPEED [=y]) && MMU [=y]
>
>
> I did the ARM cross-build and also see the linker error.
> I didn't understand why -- and still don't, but here is a little
> speculation:
>
> In the past (e.g. 10 years ago), we have to move some .o files
> in lib/ from lib-y to obj-y so that they would always be included
> in the final object file and not cause their user/caller object
> files to suffer from undefined references.
> These happened because unused functions(?) in lib-y files are
> stripped out of the final object files.
> The same thing could be happening here (still just guessing).
>
> Does that help any?  I dunno.
>
> Adding Arnd to Cc: to see if he has any ideas...

From all I can tell, the problem is that DRM_KMS_CMA_HELPER is a 'bool'
symbol, so if it gets selected by a '=m' driver, it turns into '=y', which
then selects DRM_GEM_CMA_HELPER=y, but that one cannot link
against DRM_KMS_HELPER=m code.

This trivial change makes it all build:

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index c08860db2520..699f434ce813 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -218,7 +218,7 @@ config DRM_GEM_CMA_HELPER
          Choose this if you need the GEM CMA helper functions

 config DRM_KMS_CMA_HELPER
-       bool
+       tristate
        depends on DRM
        select DRM_GEM_CMA_HELPER
        help

but this needs some more testing to make sure it doesn't add
any other regressions.

Interestingly, I never hit the problem in randconfig testing since
there is always some '=y' driver that selects DRM_KMS_HELPER.

        Arnd
