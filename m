Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F323B428C2D
	for <lists+linux-next@lfdr.de>; Mon, 11 Oct 2021 13:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234272AbhJKLkt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 07:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234218AbhJKLks (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 07:40:48 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF3ECC061570
        for <linux-next@vger.kernel.org>; Mon, 11 Oct 2021 04:38:48 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id g8so66703242edt.7
        for <linux-next@vger.kernel.org>; Mon, 11 Oct 2021 04:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=aVAseHFlKtR4hY18T2FRHhS7NIeZFLXno7FnFl0RhbU=;
        b=qomjv+hAHgs1U+H0KeSPd9BBRDuEcnJleuwPcs5pDM6bKTvkTuJ6QEgrJ2LVntS2YX
         k0prMnz6lKfgCO9svnOiIWDSGLBgy9E58QpgydyRLHTaDlduShMHSzLBOEU5Etrdc55m
         rWQRAqjY7nDKb8yX8+X5rt7PDtLXTxSQv4fs9iuSXcV24dWoO0Otr12dSdwsChJtcz+L
         WYd2YHr3Lj5oihAYIkm4gdjXreOisPrpELpCtIXjYxzIds2KosGWgKcsVZZ3zLbz0LSh
         gYDlRutNPxi7z2lgFIVEFb11+cylpFz8Sj3MJtU7WYdZfqGgTODOTdsmX6LgOI7xVIoX
         G6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=aVAseHFlKtR4hY18T2FRHhS7NIeZFLXno7FnFl0RhbU=;
        b=CCf4BgVGBwgOu3ovQTWw6BBzzpYzDlfqRBKIYP/h1+3yjLIhjBYSRsRaY16AT+PoSF
         9MF4pkWOAq2o9ZkdTfaizYZpGDGC06nYx/oD4INBrs4yjtmLsG30QO31ls55JwVJehTm
         5KUG5sFlf+xo6uGcy8vtdMDumMtqRpcKDo5VDmX3aBfb2/JQOTWzkk24oHuz5H14qrPH
         GpW641w3DnQ8GpvI5UdcHp7DVeFSSXetYMO8FKwbDkdOLxlxQxMRBNgEe1C5UpPyIFCw
         1qVR0YGMCceYND5FvREDRUKf6hYseFrm9xmCmFrS6TR3LbXiUP8/9jeGCr3Lql7Aa8Ps
         c7KA==
X-Gm-Message-State: AOAM531ZKPv/chJ9Uvt3yi5B3Q9jNXSpsyXHYjlEIcCj5lWrJFfs1LnI
        am/rMBfjSHzUHWbtd6exYYP1s5sRzZjQzZ6sKvxOGwKUc90p4A==
X-Google-Smtp-Source: ABdhPJwkQ76ovFx13C9zczM3mcDGc+ax0KkVrNWG1kmrISGVUNnIWrO3TGZ47niR5zT4915iDVERR1VzJAEaX4CubUI=
X-Received: by 2002:a17:906:318b:: with SMTP id 11mr25186720ejy.493.1633952326385;
 Mon, 11 Oct 2021 04:38:46 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 11 Oct 2021 17:08:35 +0530
Message-ID: <CA+G9fYv1Vbc-Y_czipb-z1bG=9axE4R1BztKGqWz-yy=+Wcsqw@mail.gmail.com>
Subject: mm/kasan/init.c:282:20: error: redefinition of 'kasan_populate_early_vm_area_shadow'
To:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        kasan-dev <kasan-dev@googlegroups.com>
Cc:     Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Andrew Morton <akpm@linux-foundatio.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Regression found on x86_64 gcc-11 built with KASAN enabled.
Following build warnings / errors reported on linux next 20211011.

metadata:
    git_describe: next-20211011
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_short_log: d3134eb5de85 (\"Add linux-next specific files for 20211011\")
    target_arch: x86_64
    toolchain: gcc-11

build error :
--------------
mm/kasan/init.c:282:20: error: redefinition of
'kasan_populate_early_vm_area_shadow'
  282 | void __init __weak kasan_populate_early_vm_area_shadow(void *start,
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/mm.h:34,
                 from include/linux/memblock.h:13,
                 from mm/kasan/init.c:9:
include/linux/kasan.h:463:20: note: previous definition of
'kasan_populate_early_vm_area_shadow' with type 'void(void *, long
unsigned int)'
  463 | static inline void kasan_populate_early_vm_area_shadow(void *start,
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
make[3]: *** [scripts/Makefile.build:288: mm/kasan/init.o] Error 1
make[3]: Target '__build' not remade because of errors.


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build link:
-----------
https://builds.tuxbuild.com/1zLv2snHfZN8QV01yA9MB8NhUZt/build.log

build config:
-------------
https://builds.tuxbuild.com/1zLv2snHfZN8QV01yA9MB8NhUZt/config

# To install tuxmake on your system globally
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch x86_64 --toolchain gcc-11
--kconfig defconfig --kconfig-add
https://builds.tuxbuild.com/1zLv2snHfZN8QV01yA9MB8NhUZt/config

-- 
Linaro LKFT
https://lkft.linaro.org
