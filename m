Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A651F47D853
	for <lists+linux-next@lfdr.de>; Wed, 22 Dec 2021 21:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhLVUb0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Dec 2021 15:31:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhLVUb0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Dec 2021 15:31:26 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0032C061574
        for <linux-next@vger.kernel.org>; Wed, 22 Dec 2021 12:31:25 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id v13so3375947pfi.3
        for <linux-next@vger.kernel.org>; Wed, 22 Dec 2021 12:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Y2uDR0N7Di5U+trrSfl7yaDpVmOz/sGfjn8hMd6DwpQ=;
        b=Pww64rTjutENY2WTFVNtKzo3GG/Eiv79nOWlaZSbWyxsNMDljVWF2Ye6Z19suCwm95
         AuQicbHyx1BpSuPq++ax2BIoRij/9uUx3WsTHN1Ejc5gMYa8nOcAveGgB8h71ju5fv1P
         vVEqmfciB0SDV4l/A9d47V5sz7ogm4ccpbUB5Zr/k0RpmFPWO9155l3mhXIghkY1bVT/
         xdugK/Y7ePqcf057Eea5xB8jmx7oScLgQMfOpDkkuJ4QuvZEJbtZg/ftp4qT+/hqbLVq
         IlcgAWbSwZr0goVtmpMBBNbTg/deNf5P1FxZbrpNNXaVUXeUXfSREzxydMiAAm3WdCRJ
         7BrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Y2uDR0N7Di5U+trrSfl7yaDpVmOz/sGfjn8hMd6DwpQ=;
        b=DMGqitpG25TtjEwarEKBLVUQ6kXAwbPLG/Ax8MkFzExFBHHcmayxHhrEx3L8bJGceV
         j0EZj3RUr49/fM/TrirLwiwGibaiXoPV1ZW38iJI6d+MbSiiOL7MytfG56wbjpEc3qLn
         rc2SHyL27Vfw+XIFAGwlx1NHHRuIRM2p9pFWkZd/zGlxu1fSbuGm8Qv9K1PtVRHyWiUP
         oVQ394bNJ1W6PXSW3LW4pgf082aF446JAocPqOsZz6n4yIAxQzv9kdxTCDp8joPo2CFP
         r5HDK4Bsc5WvIXe5BROtSz9/OYjy29gtDn2pNyELnvBdGbhKn/G8ico3qDB8IqcikW9h
         28yQ==
X-Gm-Message-State: AOAM532xpovSTnUVCK8b4aZIEHBA/XLRtRSWRnmbdWT2wSSs1UUmSeVV
        nzTQw3y2xtg8t92zk8kyFmpqPSYAKbLW1BZQmxk=
X-Google-Smtp-Source: ABdhPJy2JWVWtUxPd9Q5WOBrzTo4G3NQ40jTte8DDJOV6E1cd/pAjy+c7wJCqh/p953RUMMHr3o+MQ==
X-Received: by 2002:a65:6a4a:: with SMTP id o10mr4148258pgu.357.1640205082803;
        Wed, 22 Dec 2021 12:31:22 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s15sm3111865pjs.51.2021.12.22.12.31.21
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 12:31:22 -0800 (PST)
Message-ID: <61c38b1a.1c69fb81.48189.8555@mx.google.com>
Date:   Wed, 22 Dec 2021 12:31:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211222
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 206 builds: 18 failed, 188 passed, 293 errors,
 66 warnings (next-20211222)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 206 builds: 18 failed, 188 passed, 293 errors, 66 warnin=
gs (next-20211222)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20211222/

Tree: next
Branch: master
Git Describe: next-20211222
Git Commit: 2bd48302750c652889a2604b3df8b591c1d3af08
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL

arm:
    allmodconfig: (clang-13) FAIL
    multi_v5_defconfig: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL
    multi_v7_defconfig+CONFIG_SMP=3Dn: (gcc-10) FAIL
    qcom_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-13) FAIL

mips:
    bigsur_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    decstation_defconfig: (gcc-10) FAIL
    decstation_r4k_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL
    ip28_defconfig: (gcc-10) FAIL
    sb1250_swarm_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+debug (gcc-10): 1 warning
    tinyconfig (gcc-10): 1 warning

arm64:
    allmodconfig (gcc-10): 1 error, 1 warning
    allmodconfig (clang-13): 2 errors, 1 warning

arm:
    allmodconfig (gcc-10): 179 errors, 2 warnings
    allmodconfig (clang-13): 40 errors, 13 warnings
    aspeed_g5_defconfig (clang-13): 10 warnings
    at91_dt_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (clang-13): 56 errors
    multi_v7_defconfig (clang-13): 10 warnings
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 2 errors
    qcom_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors

i386:
    allmodconfig (clang-13): 1 error, 1 warning

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    bigsur_defconfig (gcc-10): 1 error
    ci20_defconfig (gcc-10): 1 warning
    decstation_64_defconfig (gcc-10): 1 error
    decstation_defconfig (gcc-10): 1 error
    decstation_r4k_defconfig (gcc-10): 1 error
    fuloong2e_defconfig (gcc-10): 1 error
    rm200_defconfig (gcc-10): 1 warning
    sb1250_swarm_defconfig (gcc-10): 1 error

riscv:

x86_64:
    allmodconfig (clang-13): 1 error, 18 warnings
    allmodconfig (gcc-10): 2 errors
    x86_64_defconfig+debug (gcc-10): 2 warnings

Errors summary:

    54   arch/arm/include/asm/current.h:53:6: error: out of range pc-relati=
ve fixup value
    25   arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relati=
ve fixup value
    13   arch/arm/include/asm/current.h:39:28: error: out of range pc-relat=
ive fixup value
    3    fatal error: too many errors emitted, stopping now [-ferror-limit=
=3D]
    3    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of =
read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99
    3    drivers/gpio/gpio-sim.c:889:7: error: variable 'ret' is uninitiali=
zed when used here [-Werror,-Wuninitialized]
    2    drivers/net/ethernet/broadcom/sb1250-mac.c:2187:20: error: assignm=
ent of read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99
    2    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h=
:2500:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or d=
irectory
    1    irq-gic-v3-its.c:(.text+0x14b8): undefined reference to `cpus_boot=
ed_once_mask'
    1    include/asm-generic/div64.h:222:28: error: comparison of distinct =
pointer types lacks a cast [-Werror]
    1    drivers/usb/gadget/udc/at91_udc.h:174:33: error: format =E2=80=98%=
d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 3 h=
as type =E2=80=98struct gpio_desc *=E2=80=99 [-Werror=3Dformat=3D]
    1    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assignment disc=
ards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=3D=
discarded-qualifiers]
    1    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assigning to 'c=
onst char **' from 'const char *const *' discards qualifiers [-Werror,-Winc=
ompatible-pointer-types-discards-qualifiers]
    1    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    1    arm-linux-gnueabihf-ld: irq-gic-v3-its.c:(.text+0x14bc): undefined=
 reference to `cpus_booted_once_mask'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    <inline asm>:1:3: error: out of range pc-relative fixup value
    1    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: und=
efined reference to `drm_panel_dp_aux_backlight'
    1    /tmp/ccja1mFG.s:7958: Error: invalid literal constant: pool needs =
to be closer
    1    /tmp/ccja1mFG.s:516: Error: invalid literal constant: pool needs t=
o be closer
    1    /tmp/ccja1mFG.s:45416: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:45357: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:45295: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:45200: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:44681: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:44622: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:44560: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:44463: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:44099: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:44040: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:43980: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:43890: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:43664: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:43605: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:43538: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:43438: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:42992: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:42947: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:42699: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:42640: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:42573: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:42473: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:42028: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:41983: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:41324: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:41265: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:41205: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:41115: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:40852: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:40793: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:40731: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:40637: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:40413: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:40354: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:40287: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:40189: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:39984: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:39925: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:39863: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:39769: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:39585: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:39526: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:39459: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:39359: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:39115: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:39056: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:38996: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:38892: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:38654: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:38595: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:38528: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:38430: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:38170: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:38111: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:38044: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:37948: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:37732: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:37673: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:37611: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:37516: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:37318: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:37259: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:37192: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:37096: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:36918: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:36859: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:36797: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:36701: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:36069: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:36010: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:35948: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:35853: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:35674: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:35615: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:35548: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:35452: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:35298: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:35239: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:35173: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:35076: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:34931: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:34872: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:34806: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:34709: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:34545: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:34486: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:34419: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:34323: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:34122: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:34063: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:34001: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:33905: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:33739: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:33680: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:33613: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:33514: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:33362: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:33303: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:33237: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:33140: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:32986: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:32927: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:32865: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:32768: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:32639: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:32580: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:32518: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:32423: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:32267: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:32208: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:32145: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:32050: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:31912: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:31853: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:31791: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:31696: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:31555: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:31496: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:31436: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:31347: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:31197: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:31138: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:31076: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:30987: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:30892: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:30833: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:30773: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:30684: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:30547: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:30488: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:30426: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:30331: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:30192: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:30133: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:30071: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:29982: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:29894: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:29835: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:29775: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:29686: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:29534: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:29475: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:29413: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:29318: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:29211: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:29152: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:29092: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:29002: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:28703: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:28643: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:28583: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:28491: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:28418: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:28358: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:28298: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:28208: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:28135: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:28075: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:28015: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:27930: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:27858: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:27798: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:27738: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:27654: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:27585: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:27526: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:27466: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:27382: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:25872: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:17774: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:17713: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:13634: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:13534: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:12244: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccja1mFG.s:12204: Error: invalid literal constant: pool needs=
 to be closer

Warnings summary:

    23   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    3    drivers/gpio/gpio-sim.c:868:9: note: initialize the variable 'ret'=
 to silence this warning
    3    cc1: all warnings being treated as errors
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' i=
s unknown, fallback to ''
    1    vmlinux.o: warning: objtool: vc_switch_off_ist()+0x8a: call to mem=
cpy() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() le=
aves .noinstr.text section
    1    vmlinux.o: warning: objtool: mce_start()+0x44: call to __kasan_che=
ck_write() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: mce_severity_amd()+0x5e: call to mce_=
severity_amd_smca() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: mce_read_aux()+0x4b: call to mca_msr_=
reg() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: in_task_stack()+0xc: call to task_sta=
ck_page() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_en=
try_stack() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: fixup_bad_iret()+0x32: call to memset=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_syscall_64()+0x44: call to memset(=
) leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_machine_check()+0x13a: call to mce=
_no_way_out() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_int80_syscall_32()+0x52: call to m=
emset() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_put_ghcb()+0x36: call to memcpy=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_get_ghcb()+0xa1: call to memcpy=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x5a: call to=
 ghcb_set_sw_exit_code() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x52: call to =
memset() leaves .noinstr.text section
    1    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x5d: call to=
 do_strnlen_user() with UACCESS enabled
    1    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8=
a: call to do_strncpy_from_user() with UACCESS enabled
    1    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=
=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 2 has t=
ype =E2=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]
    1    fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely=
()+0x734: stack state mismatch: cfa1=3D4+200 cfa2=3D4+192
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls t=
hrough to next function startup_64_setup_env()
    1    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit=
_address_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name shou=
ld not have leading "0x"

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text+0x70513): Section mismatch in re=
ference from the function __nodes_weight() to the variable .init.data:numa_=
nodes_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x15dc97): Section mismatch in r=
eference from the function __next_node() to the variable .init.data:numa_no=
des_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x15dc22): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x15dc0e): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 179 errors, 2 warnings, 0 sectio=
n mismatches

Errors:
    /tmp/ccja1mFG.s:516: Error: invalid literal constant: pool needs to be =
closer
    /tmp/ccja1mFG.s:7958: Error: invalid literal constant: pool needs to be=
 closer
    /tmp/ccja1mFG.s:12204: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:12244: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:13534: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:13634: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:17713: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:17774: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:25872: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:27382: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:27466: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:27526: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:27585: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:27654: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:27738: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:27798: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:27858: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:27930: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:28015: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:28075: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:28135: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:28208: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:28298: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:28358: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:28418: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:28491: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:28583: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:28643: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:28703: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:29002: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:29092: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:29152: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:29211: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:29318: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:29413: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:29475: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:29534: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:29686: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:29775: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:29835: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:29894: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:29982: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:30071: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:30133: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:30192: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:30331: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:30426: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:30488: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:30547: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:30684: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:30773: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:30833: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:30892: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:30987: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:31076: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:31138: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:31197: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:31347: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:31436: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:31496: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:31555: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:31696: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:31791: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:31853: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:31912: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:32050: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:32145: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:32208: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:32267: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:32423: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:32518: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:32580: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:32639: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:32768: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:32865: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:32927: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:32986: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:33140: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:33237: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:33303: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:33362: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:33514: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:33613: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:33680: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:33739: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:33905: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:34001: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:34063: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:34122: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:34323: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:34419: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:34486: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:34545: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:34709: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:34806: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:34872: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:34931: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:35076: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:35173: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:35239: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:35298: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:35452: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:35548: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:35615: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:35674: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:35853: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:35948: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:36010: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:36069: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:36701: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:36797: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:36859: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:36918: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:37096: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:37192: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:37259: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:37318: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:37516: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:37611: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:37673: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:37732: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:37948: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:38044: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:38111: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:38170: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:38430: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:38528: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:38595: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:38654: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:38892: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:38996: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:39056: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:39115: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:39359: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:39459: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:39526: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:39585: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:39769: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:39863: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:39925: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:39984: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:40189: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:40287: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:40354: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:40413: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:40637: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:40731: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:40793: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:40852: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:41115: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:41205: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:41265: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:41324: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:41983: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:42028: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:42473: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:42573: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:42640: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:42699: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:42947: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:42992: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:43438: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:43538: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:43605: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:43664: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:43890: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:43980: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:44040: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:44099: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:44463: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:44560: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:44622: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:44681: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:45200: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:45295: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:45357: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccja1mFG.s:45416: Error: invalid literal constant: pool needs to b=
e closer
    include/asm-generic/div64.h:222:28: error: comparison of distinct point=
er types lacks a cast [-Werror]
    drivers/usb/gadget/udc/at91_udc.h:174:33: error: format =E2=80=98%d=E2=
=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 3 has t=
ype =E2=80=98struct gpio_desc *=E2=80=99 [-Werror=3Dformat=3D]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-13) =E2=80=94 FAIL, 40 errors, 13 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    fatal error: too many errors emitted, stopping now [-ferror-limit=3D]

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 18 warnings, 0 sec=
tion mismatches

Errors:
    drivers/gpio/gpio-sim.c:889:7: error: variable 'ret' is uninitialized w=
hen used here [-Werror,-Wuninitialized]

Warnings:
    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls throug=
h to next function startup_64_setup_env()
    vmlinux.o: warning: objtool: do_syscall_64()+0x44: call to memset() lea=
ves .noinstr.text section
    vmlinux.o: warning: objtool: do_int80_syscall_32()+0x52: call to memset=
() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x52: call to memse=
t() leaves .noinstr.text section
    vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() leaves =
.noinstr.text section
    vmlinux.o: warning: objtool: vc_switch_off_ist()+0x8a: call to memcpy()=
 leaves .noinstr.text section
    vmlinux.o: warning: objtool: fixup_bad_iret()+0x32: call to memset() le=
aves .noinstr.text section
    vmlinux.o: warning: objtool: in_task_stack()+0xc: call to task_stack_pa=
ge() leaves .noinstr.text section
    vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_entry_s=
tack() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_read_aux()+0x4b: call to mca_msr_reg()=
 leaves .noinstr.text section
    vmlinux.o: warning: objtool: do_machine_check()+0x13a: call to mce_no_w=
ay_out() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_start()+0x44: call to __kasan_check_wr=
ite() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_severity_amd()+0x5e: call to mce_sever=
ity_amd_smca() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x5a: call to ghcb=
_set_sw_exit_code() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_get_ghcb()+0xa1: call to memcpy() le=
aves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_put_ghcb()+0x36: call to memcpy() le=
aves .noinstr.text section
    fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely()+0x=
734: stack state mismatch: cfa1=3D4+200 cfa2=3D4+192
    drivers/gpio/gpio-sim.c:868:9: note: initialize the variable 'ret' to s=
ilence this warning

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x15dc0e): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x15dc22): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x15dc97): Section mismatch in refere=
nce from the function __next_node() to the variable .init.data:numa_nodes_p=
arsed

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    drivers/gpio/gpio-sim.c:889:7: error: variable 'ret' is uninitialized w=
hen used here [-Werror,-Wuninitialized]

Warnings:
    drivers/gpio/gpio-sim.c:868:9: note: initialize the variable 'ret' to s=
ilence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assignment discards =
=E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=3Ddisca=
rded-qualifiers]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h:2500=
:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or direct=
ory
    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h:2500=
:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or direct=
ory

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-13) =E2=80=94 FAIL, 2 errors, 1 warning, 0 secti=
on mismatches

Errors:
    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assigning to 'const =
char **' from 'const char *const *' discards qualifiers [-Werror,-Wincompat=
ible-pointer-types-discards-qualifiers]
    drivers/gpio/gpio-sim.c:889:7: error: variable 'ret' is uninitialized w=
hen used here [-Werror,-Wuninitialized]

Warnings:
    drivers/gpio/gpio-sim.c:868:9: note: initialize the variable 'ret' to s=
ilence this warning

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-13) =E2=80=94 PASS, 0 errors, 10 warnings, =
0 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=80=99 =
expects argument of type =E2=80=98int=E2=80=99, but argument 2 has type =E2=
=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    drivers/net/ethernet/broadcom/sb1250-mac.c:2187:20: error: assignment o=
f read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit_addr=
ess_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name should no=
t have leading "0x"

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings,=
 0 section mismatches

Errors:
    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of read-=
only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of read-=
only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings=
, 0 section mismatches

Errors:
    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of read-=
only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-13) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-13) =E2=80=94 FAIL, 56 errors, 0 warnings, 0=
 section mismatches

Errors:
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    <inline asm>:1:3: error: out of range pc-relative fixup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-13) =E2=80=94 PASS, 0 errors, 10 warnings, 0=
 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0=
 warnings, 0 section mismatches

Errors:
    irq-gic-v3-its.c:(.text+0x14b8): undefined reference to `cpus_booted_on=
ce_mask'
    arm-linux-gnueabihf-ld: irq-gic-v3-its.c:(.text+0x14bc): undefined refe=
rence to `cpus_booted_once_mask'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: undefine=
d reference to `drm_panel_dp_aux_backlight'

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/block/paride/bpck.c:32: warning: "PC" redefined

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, =
0 section mismatches

Errors:
    drivers/net/ethernet/broadcom/sb1250-mac.c:2187:20: error: assignment o=
f read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x70513): Section mismatch in referen=
ce from the function __nodes_weight() to the variable .init.data:numa_nodes=
_parsed

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8a: ca=
ll to do_strncpy_from_user() with UACCESS enabled
    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x5d: call to do_s=
trnlen_user() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---
For more info write to <info@kernelci.org>
