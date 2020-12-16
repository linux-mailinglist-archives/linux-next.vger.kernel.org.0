Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B812DC966
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 00:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbgLPXK1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Dec 2020 18:10:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727582AbgLPXK1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Dec 2020 18:10:27 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3573BC06179C
        for <linux-next@vger.kernel.org>; Wed, 16 Dec 2020 15:09:47 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id b5so2681990pjl.0
        for <linux-next@vger.kernel.org>; Wed, 16 Dec 2020 15:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=AdgKCOmBwxuGVlbpjnWhoegkQIgVhmPaWPnCW93BdNg=;
        b=x7hhiGiQ1KphnxaTFXegbz84TtfRsjN/+/WXvEBGao/Ze9ziSdQvkHzKcccqX6JI3O
         A0ZVuKR75IzzlUxzYDcUZVwkO64ecIBycFhUOdGCzGwBwPutUbOchTdMUrejvisv/33t
         FCQK8OOwzsBB1XU0BWwFauT0G3JJyJdYLuEzyatuTw4TEeFkAD1KvjcmM/IqhVM8wQB2
         kkmm2hBPlbCU4Sc1l1HSF4wIm/v0qlvlIWYUrpev05cdMZ2UiNrG4RaIa1kHRkbd922+
         GZhh5JoYuW6gP3HOyeMmyogM9TB7BEMXPmRoo8Wa9yLpdHg5eXCvNsyhd9Wa1ouERVA4
         Xp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=AdgKCOmBwxuGVlbpjnWhoegkQIgVhmPaWPnCW93BdNg=;
        b=rusLZMeyD2aErWwLxibT+0/PM+HTi3EAFRjPS6rtF3QiRy//AC0X6JrOlSTd/+NBJO
         2CMtIa3HK5G308N+S8Za2qoqFr+z92NSGDv0jJfg3i1kdaKNXSvO6T3MiGnpFZr1E0FV
         LuHoqdajasAmlSNbFlyKI69ajdUBV0DaNPJjTnN0BROKQXfa4Wit3kHaspK+WGPn7t7z
         1mKzXHDLEpfQW8r1WnCQYVGNvdm6jDnaJI1OAZpmaeY3MdzwnpNgfAP/YYPJMUVuv9ZB
         4aznngNbGYlF7/U0SddHI8FnGz5g0s3YAYMvDO4S/SB0Pbba11hLdEEVEHxj43ivoxgc
         /NzA==
X-Gm-Message-State: AOAM533aDu+D5GV3jtJmTS/CRomB1IWUL6CDPwCZnzqMMsjvgdbhpJoq
        x3T5Yq8BLmn7D4ihBKKoNZ+rdMYh+iBXUg==
X-Google-Smtp-Source: ABdhPJz0HlRzSTeSYjG2vH41P1ILxh+OMHHuiE7hJySPhZCKTUzUzFDfd3P4epGPDnUKJ5ifn0O0Ig==
X-Received: by 2002:a17:90a:4dcd:: with SMTP id r13mr5048546pjl.74.1608160185264;
        Wed, 16 Dec 2020 15:09:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id h11sm3580449pfn.27.2020.12.16.15.09.43
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 15:09:44 -0800 (PST)
Message-ID: <5fda93b8.1c69fb81.c2a93.9c89@mx.google.com>
Date:   Wed, 16 Dec 2020 15:09:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.10-9016-g31c318f75dc4
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 205 builds: 7 failed, 198 passed, 6 errors,
 181 warnings (v5.10-9016-g31c318f75dc4)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 205 builds: 7 failed, 198 passed, 6 errors, 181 w=
arnings (v5.10-9016-g31c318f75dc4)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.10-9016-g31c318f75dc4/

Tree: next
Branch: pending-fixes
Git Describe: v5.10-9016-g31c318f75dc4
Git Commit: 31c318f75dc40b05022f1eba1494878a408c100d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (gcc-8) FAIL
    allnoconfig: (gcc-8) FAIL
    defconfig: (gcc-8) FAIL
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy: (gcc-8) FAIL
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy: (gcc-8) FAIL
    tinyconfig: (gcc-8) FAIL

arm:
    milbeaut_m10v_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (gcc-8): 1 error
    allnoconfig (gcc-8): 1 error
    defconfig (gcc-8): 1 error
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 1 error
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-8): 1 error
    tinyconfig (gcc-8): 1 error

arm:
    allmodconfig (gcc-8): 165 warnings
    omap1_defconfig (gcc-8): 2 warnings
    tegra_defconfig (gcc-8): 1 warning

i386:

mips:
    loongson3_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 1 warning

riscv:
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig+x86-chromebook (gcc-8): 3 warnings

Errors summary:

    6    arch/arm64/kernel/entry.S:733: Error: immediate out of range at op=
erand 3 -- `and x2,x19,#((1<<1)|(1<<0)|(1<<2)|(1<<3)|(1<<4)|(1<<5)|(1<<7))'

Warnings summary:

    158  ./include/vdso/bits.h:7:26: warning: left shift count >=3D width o=
f type [-Wshift-count-overflow]
    2    drivers/gpu/drm/ttm/ttm_pool.c:240:21: warning: =E2=80=98ttm_pool_=
type_count=E2=80=99 defined but not used [-Wunused-function]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:39: Warning: macro instruction expanded into mult=
iple instructions
    1    lib/bitfield_kunit.c:93:1: warning: the frame size of 4200 bytes i=
s larger than 2048 bytes [-Wframe-larger-than=3D]
    1    drivers/pinctrl/core.c:1607:20: warning: unused variable =E2=80=98=
chip=E2=80=99 [-Wunused-variable]
    1    drivers/pinctrl/core.c:1606:15: warning: unused variable =E2=80=98=
gpio_num=E2=80=99 [-Wunused-variable]
    1    drivers/pinctrl/core.c:1605:29: warning: unused variable =E2=80=98=
range=E2=80=99 [-Wunused-variable]
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    arch/arm/mach-omap1/board-h2.c:347:34: warning: =E2=80=98isp1301_g=
piod_table=E2=80=99 defined but not used [-Wunused-variable]
    1    arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=98am=
s_delta_camera_power=E2=80=99 defined but not used [-Wunused-function]
    1    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:57.21-61.5: Warning (interr=
upts_property): /paxi/dmac@50000: Missing interrupt-parent
    1    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:51.21-55.5: Warning (interr=
upts_property): /paxi/dmac@40000: Missing interrupt-parent
    1    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:45.19-49.5: Warning (interr=
upts_property): /paxi/gem@30000: Missing interrupt-parent
    1    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:233.21-237.5: Warning (inte=
rrupts_property): /rwid-axi/axi2pico@c0000000: Missing interrupt-parent
    1    /tmp/ccQQ5fBK.s:18192: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccQQ5fBK.s:18120: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1178:warning: override: UNWINDER_GUESS changes choice state

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    arch/arm64/kernel/entry.S:733: Error: immediate out of range at operand=
 3 -- `and x2,x19,#((1<<1)|(1<<0)|(1<<2)|(1<<3)|(1<<4)|(1<<5)|(1<<7))'

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 165 warnings, 0 section=
 mismatches

Warnings:
    /tmp/ccQQ5fBK.s:18120: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccQQ5fBK.s:18192: Warning: using r15 results in unpredictable beha=
viour
    lib/bitfield_kunit.c:93:1: warning: the frame size of 4200 bytes is lar=
ger than 2048 bytes [-Wframe-larger-than=3D]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:45.19-49.5: Warning (interrupts_=
property): /paxi/gem@30000: Missing interrupt-parent
    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:51.21-55.5: Warning (interrupts_=
property): /paxi/dmac@40000: Missing interrupt-parent
    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:57.21-61.5: Warning (interrupts_=
property): /paxi/dmac@50000: Missing interrupt-parent
    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:233.21-237.5: Warning (interrupt=
s_property): /rwid-axi/axi2pico@c0000000: Missing interrupt-parent

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    arch/arm64/kernel/entry.S:733: Error: immediate out of range at operand=
 3 -- `and x2,x19,#((1<<1)|(1<<0)|(1<<2)|(1<<3)|(1<<4)|(1<<5)|(1<<7))'

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mis=
matches

Errors:
    arch/arm64/kernel/entry.S:733: Error: immediate out of range at operand=
 3 -- `and x2,x19,#((1<<1)|(1<<0)|(1<<2)|(1<<3)|(1<<4)|(1<<5)|(1<<7))'

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 FAIL, 1 error,=
 0 warnings, 0 section mismatches

Errors:
    arch/arm64/kernel/entry.S:733: Error: immediate out of range at operand=
 3 -- `and x2,x19,#((1<<1)|(1<<0)|(1<<2)|(1<<3)|(1<<4)|(1<<5)|(1<<7))'

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 FAIL, 1 error,=
 0 warnings, 0 section mismatches

Errors:
    arch/arm64/kernel/entry.S:733: Error: immediate out of range at operand=
 3 -- `and x2,x19,#((1<<1)|(1<<0)|(1<<2)|(1<<3)|(1<<4)|(1<<5)|(1<<7))'

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/gpu/drm/ttm/ttm_pool.c:240:21: warning: =E2=80=98ttm_pool_type_=
count=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    {standard input}:39: Warning: macro instruction expanded into multiple =
instructions

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mach-omap1/board-h2.c:347:34: warning: =E2=80=98isp1301_gpiod_=
table=E2=80=99 defined but not used [-Wunused-variable]
    arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=98ams_del=
ta_camera_power=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/block/paride/bpck.c:32: warning: "PC" redefined

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/gpu/drm/ttm/ttm_pool.c:240:21: warning: =E2=80=98ttm_pool_type_=
count=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1178:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    arch/arm64/kernel/entry.S:733: Error: immediate out of range at operand=
 3 -- `and x2,x19,#((1<<1)|(1<<0)|(1<<2)|(1<<3)|(1<<4)|(1<<5)|(1<<7))'

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 3=
 warnings, 0 section mismatches

Warnings:
    drivers/pinctrl/core.c:1607:20: warning: unused variable =E2=80=98chip=
=E2=80=99 [-Wunused-variable]
    drivers/pinctrl/core.c:1606:15: warning: unused variable =E2=80=98gpio_=
num=E2=80=99 [-Wunused-variable]
    drivers/pinctrl/core.c:1605:29: warning: unused variable =E2=80=98range=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
