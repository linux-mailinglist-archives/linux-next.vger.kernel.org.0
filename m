Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62EEB321E37
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 18:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbhBVRgy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 12:36:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbhBVRgs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Feb 2021 12:36:48 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A31C061786
        for <linux-next@vger.kernel.org>; Mon, 22 Feb 2021 09:36:07 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id i14so22810101eds.8
        for <linux-next@vger.kernel.org>; Mon, 22 Feb 2021 09:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=1GMWB21gxYIdFKY+JbAlNikjNhpFsZRzOlIryYv/C60=;
        b=chpHouipAawuXrrCL7n6NNCssg0dqK1Gvj/vQHP40t5xWoUmxb4fBtU7Ra4szjuQwp
         FQ0JVZyv1am8ymlC5RHVNcjQ6U9+eSJPoqXs3uUZJ/32Ld0lK/uy5HEcpbXAXDZfRTeU
         ArkhRzp6qzB/vAgWUsyXvcHoQuV/zMe+GxlOsXkL/YAvSogKjX5DgV2Hg3YMS35n0AAC
         3fzR1q6zNeG66pVLNVsh+1JqnEp2XbxyJ+KL+pD5zbsRA8j+fPKtvpIB8iewzjy6GRaE
         63ImA2cCQHhpRqaLLDnqfyH4O+rc0C/w7PdqEfGEpJeQYXug40Zbw1a7n5Zw70Oo2R9p
         cFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=1GMWB21gxYIdFKY+JbAlNikjNhpFsZRzOlIryYv/C60=;
        b=P57q9CeNld/G3gyV1enzwjFsVbkHLe8EEmbG3aNDi5LaXuJA/LPiw5J8Z9SeJjbuge
         pDt+H7K7uQS4tt4SNhduLj2NPYi2jG0NLkraeodQiRDKe3CZBln/mGwX8unKOD2hEUar
         jRzuankSJnsuMkSW9lxhXwg/aaM2mchO8PhUsU611yy+1MolBKolhEN3rhKEGrHCJ2Cu
         BOJ5xahgEIo2vLfb7+Xd7nrapT4XiGbP520jhUuPSPdknAbxoPL8SyPLGJK5315/mC2P
         QeRgvYqNM8SzbgTul0FbYYXLmgc1OskpPhKxcVOCts1a0rOSPSTp/oSVVdxuYkoWGTtV
         96AQ==
X-Gm-Message-State: AOAM532kLMS4IrL+dTapuxn2q6wcTuO1nBGIR0Fi9VC/kxzmIk+SEReh
        iE7E2zcjQKDuzXAlb53Rgom8MOLgCI0UqV8GXeptJA==
X-Google-Smtp-Source: ABdhPJyfsevqFXW4RbRtEqx6tGmO8iTJQ7yn+w60Po8NZ4Em92wLPtPTqDbZzA8JFlxSbw9j2OHZDPanhXC6IM/75Mo=
X-Received: by 2002:aa7:c0cd:: with SMTP id j13mr23193423edp.230.1614015366222;
 Mon, 22 Feb 2021 09:36:06 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 22 Feb 2021 23:05:55 +0530
Message-ID: <CA+G9fYsb0LRBatwtbjULObmc4zA6SrYBE6W+S_AjxXedPwPdVQ@mail.gmail.com>
Subject: gfp.h:20:32: error: redefinition of typedef 'gfp_t' is a C11 feature
To:     clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

arm davinci_all_defconfig config with clang 10, 11 and 12 failing
on Linux next tag 20210222 due to below listed errors / warnings.

 - arm (davinci_all_defconfig) with clang-10
 - arm (davinci_all_defconfig) with clang-11
 - arm (davinci_all_defconfig) with clang-12

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf- 'HOSTCC=sccache clang' 'CC=sccache
clang' davinci_all_defconfig

make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=arm
CROSS_COMPILE=arm-linux-gnueabihf- 'HOSTCC=sccache clang' 'CC=sccache
clang'


include/linux/gfp.h:20:32: error: redefinition of typedef 'gfp_t' is a
C11 feature [-Werror,-Wtypedef-redefinition]
typedef unsigned int __bitwise gfp_t;   // repeated here for kernel-doc
                               ^
include/linux/types.h:148:32: note: previous definition is here
typedef unsigned int __bitwise gfp_t;
                               ^
1 warning generated.
1 warning generated.
1 warning generated.
1 warning generated.
1 error generated.
make[5]: *** [scripts/Makefile.build:287:
drivers/gpu/drm/tilcdc/tilcdc_plane.o] Error 1

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Step to reproduce:
---------------------------
# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.

tuxmake --runtime podman --target-arch arm --toolchain clang-10
--kconfig davinci_all_defconfig

build log,
https://builds.tuxbuild.com/1opbM56yvX4uyeXV8JBwFNz9WEQ/

-- 
Linaro LKFT
https://lkft.linaro.org
