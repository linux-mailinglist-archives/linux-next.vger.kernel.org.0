Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684AE3FFC6F
	for <lists+linux-next@lfdr.de>; Fri,  3 Sep 2021 10:57:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348427AbhICI4k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Sep 2021 04:56:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348420AbhICI4j (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 3 Sep 2021 04:56:39 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8737C061575
        for <linux-next@vger.kernel.org>; Fri,  3 Sep 2021 01:55:38 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 17so4922373pgp.4
        for <linux-next@vger.kernel.org>; Fri, 03 Sep 2021 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kWQ+kVJnoZLSakf4usDv/JSIXpnjrgYm0HG5PA6Me5g=;
        b=jGWsznXTeJ+QgEVh+NUIBOazcEl592H9R+wvftE1c96jBzPLUwIG41P2zrZBHCREp7
         Zf+zPDQ8nHOYxDAI5u0/igsT3H6SPjAan8eGd6pk7P2S9mjsGbwSupSEwLpmtR6EH4iz
         hWN8hNLHobY//FEVMRThRJO71gJ4qYsCNlLZ51vchclko70BhwR4TbmL4BKoy3Sb5sdz
         mEEpamn9AY9Iz9FR3Kkjmcq2a8ZqJiTkr0BXWnKyGT4+s3wy5qiixlDZHAXTBGYlwFDf
         4DjzXE0lYZIGVyXwB0wkOMD2itEsX7gAAyviKb+XylxsFKNtniaE8aUOZk+ybZfSTKVc
         8aYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kWQ+kVJnoZLSakf4usDv/JSIXpnjrgYm0HG5PA6Me5g=;
        b=bXwRl+NikFwHZu/JsNoWgTFqJHi7Ig5jM4aqVVTAQBmfpUmhHLXK5adNtFZPw/yZKJ
         xXKHel+xksWZ8ICFeWwXINyocTkzmVtySRiaEcbOzuH5xjXN6H7cLUeDN9AzM7VtXNhW
         9ueHrsngjnzr5BXjBKKUACwsk5wUF8Avau3iSyHteiB+6EG+7m+tW9BVnduQVqjgLNCP
         qL4WFoLrwa77CLYIbGDTiEFnv6JlWPrJIFsmi2kddKl1T/+JgoRXSL7AEnDANlarbsio
         MuizXl17z7Dkni47jjHY7I3xm2zOHKufgRE5yIp2quH5QGHth7GFb9fydAAzlyAVtyj9
         H12A==
X-Gm-Message-State: AOAM530E/50GmmDZghYiIxCCUIpihnnSA1RHtJSxayPYVmtVUnsBjKDw
        jNhbEvZCaasN2f/I6TekTQKK31g03xuH1j1s
X-Google-Smtp-Source: ABdhPJxoYpfxuOMZdIMjZNFxcYh0gBB34IOKo1EF2JR8ReFV7HdyI7vjMWPn4xB/qwLrnVfNAYP9OQ==
X-Received: by 2002:a63:dc03:: with SMTP id s3mr2745345pgg.88.1630659336598;
        Fri, 03 Sep 2021 01:55:36 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id g19sm4403869pjl.25.2021.09.03.01.55.35
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 01:55:35 -0700 (PDT)
Message-ID: <6131e307.1c69fb81.c71ba.c23b@mx.google.com>
Date:   Fri, 03 Sep 2021 01:55:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20210903
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master build: 206 builds: 5 failed, 201 passed, 252 errors,
 2044 warnings (next-20210903)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 206 builds: 5 failed, 201 passed, 252 errors, 2044 warni=
ngs (next-20210903)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20210903/

Tree: next
Branch: master
Git Describe: next-20210903
Git Commit: 14c6345e6e6ca0570f3897214f24748ef6009761
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-12) FAIL
    allmodconfig: (gcc-8) FAIL

i386:
    allmodconfig: (clang-10) FAIL
    allmodconfig: (clang-12) FAIL

mips:
    lemote2f_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-8): 3 warnings
    tinyconfig (gcc-8): 1 warning

arm64:
    allmodconfig (gcc-8): 21 errors, 24 warnings
    allmodconfig (clang-12): 1 error, 11 warnings
    defconfig (clang-12): 823 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-12): 834 warnings
    defconfig+kselftest (gcc-8): 26 errors, 25 warnings

arm:
    aspeed_g4_defconfig (gcc-8): 26 errors, 25 warnings
    aspeed_g5_defconfig (gcc-8): 26 errors, 25 warnings
    multi_v5_defconfig (clang-10): 3 warnings
    multi_v5_defconfig (clang-12): 3 warnings
    multi_v7_defconfig (clang-12): 23 warnings
    multi_v7_defconfig+kselftest (gcc-8): 26 errors, 25 warnings
    socfpga_defconfig (gcc-8): 1 warning

i386:
    allmodconfig (clang-10): 1 error, 30 warnings
    allmodconfig (clang-12): 1 error, 30 warnings
    allnoconfig (clang-12): 3 warnings
    allnoconfig (clang-10): 3 warnings
    i386_defconfig (clang-10): 3 warnings
    i386_defconfig (clang-12): 3 warnings
    i386_defconfig+kselftest (gcc-8): 23 errors, 22 warnings

mips:
    32r2el_defconfig (gcc-8): 1 warning
    32r2el_defconfig+kselftest (gcc-8): 23 errors, 23 warnings
    loongson2k_defconfig (gcc-8): 1 warning
    loongson3_defconfig (gcc-8): 1 warning
    rbtx49xx_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 1 warning

riscv:
    defconfig+CONFIG_EFI=3Dn (clang-12): 3 warnings
    defconfig+kselftest (gcc-8): 26 errors, 25 warnings
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    allnoconfig (clang-10): 6 warnings
    allnoconfig (clang-12): 3 warnings
    x86_64_defconfig (clang-12): 3 warnings
    x86_64_defconfig+kselftest (gcc-8): 26 errors, 25 warnings
    x86_64_defconfig+x86-chromebook+kselftest (gcc-8): 26 errors, 25 warnin=
gs

Errors summary:

    20   include/linux/fortify-string.h:56:3: error: call to =E2=80=98__wri=
te_overflow=E2=80=99 declared with attribute error: detected write beyond s=
ize of object (1st parameter)
    20   include/linux/fortify-string.h:319:3: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    20   include/linux/fortify-string.h:125:4: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    18   include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_me=
mcpy=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of objec=
t =E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    18   include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_me=
mcpy=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of objec=
t =E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    10   include/linux/fortify-string.h:289:3: error: call to =E2=80=98__re=
ad_overflow=E2=80=99 declared with attribute error: detected read beyond si=
ze of object (1st parameter)
    10   include/linux/fortify-string.h:277:3: error: call to =E2=80=98__re=
ad_overflow=E2=80=99 declared with attribute error: detected read beyond si=
ze of object (1st parameter)
    10   include/linux/fortify-string.h:265:4: error: call to =E2=80=98__re=
ad_overflow2=E2=80=99 declared with attribute error: detected read beyond s=
ize of object (2nd parameter)
    10   include/linux/fortify-string.h:263:4: error: call to =E2=80=98__re=
ad_overflow=E2=80=99 declared with attribute error: detected read beyond si=
ze of object (1st parameter)
    10   include/linux/fortify-string.h:250:3: error: call to =E2=80=98__re=
ad_overflow=E2=80=99 declared with attribute error: detected read beyond si=
ze of object (1st parameter)
    10   include/linux/fortify-string.h:237:4: error: call to =E2=80=98__re=
ad_overflow2=E2=80=99 declared with attribute error: detected read beyond s=
ize of object (2nd parameter)
    10   include/linux/fortify-string.h:235:4: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    10   include/linux/fortify-string.h:221:4: error: call to =E2=80=98__re=
ad_overflow2=E2=80=99 declared with attribute error: detected read beyond s=
ize of object (2nd parameter)
    10   include/linux/fortify-string.h:219:4: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    10   include/linux/fortify-string.h:206:3: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    10   include/linux/fortify-string.h:154:3: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    9    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_me=
mcpy=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of objec=
t =E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Da=
rray-bounds]
    9    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_me=
mcpy=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of objec=
t =E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Da=
rray-bounds]
    8    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement wit=
h no effect [-Werror=3Dunused-value]
    8    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with=
 no effect [-Werror=3Dunused-value]
    8    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with=
 no effect [-Werror=3Dunused-value]
    2    ERROR: modpost: "__mulodi4" [drivers/block/nbd.ko] undefined!
    1    drivers/firmware/iscsi_ibft.c:868:15: error: implicit declaration =
of function =E2=80=98isa_bus_to_virt=E2=80=99; did you mean =E2=80=98phys_t=
o_virt=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    1    drivers/firmware/iscsi_ibft.c:868:15: error: implicit declaration =
of function 'isa_bus_to_virt' [-Werror,-Wimplicit-function-declaration]

Warnings summary:

    69   cc1: all warnings being treated as errors
    28   1 warning generated.
    16   fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitiali=
zed whenever 'if' condition is false [-Wsometimes-uninitialized]
    16   fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to si=
lence this warning
    10   warning: unsafe strscpy() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-strscpy.c
    10   warning: unsafe strncpy() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-strncpy.c
    10   warning: unsafe strncpy() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-strncpy-src.c
    10   warning: unsafe strlcpy() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-strlcpy.c
    10   warning: unsafe strlcpy() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-strlcpy-src.c
    10   warning: unsafe strcpy() usage lacked '__write_overflow' warning i=
n ../lib/test_fortify/write_overflow-strcpy.c
    10   warning: unsafe strcpy() usage lacked '__write_overflow' warning i=
n ../lib/test_fortify/write_overflow-strcpy-lit.c
    10   warning: unsafe memset() usage lacked '__write_overflow' warning i=
n ../lib/test_fortify/write_overflow-memset.c
    10   warning: unsafe memscan() usage lacked '__read_overflow' warning i=
n ../lib/test_fortify/read_overflow-memscan.c
    10   warning: unsafe memmove() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-memmove.c
    10   warning: unsafe memmove() usage lacked '__read_overflow2' warning =
in ../lib/test_fortify/read_overflow2-memmove.c
    10   warning: unsafe memcpy() usage lacked '__write_overflow' warning i=
n ../lib/test_fortify/write_overflow-memcpy.c
    10   warning: unsafe memcpy() usage lacked '__read_overflow2' warning i=
n ../lib/test_fortify/read_overflow2-memcpy.c
    10   warning: unsafe memcmp() usage lacked '__read_overflow2' warning i=
n ../lib/test_fortify/read_overflow2-memcmp.c
    10   warning: unsafe memcmp() usage lacked '__read_overflow' warning in=
 ../lib/test_fortify/read_overflow-memcmp.c
    10   warning: unsafe memchr_inv() usage lacked '__read_overflow' warnin=
g in ../lib/test_fortify/read_overflow-memchr_inv.c
    10   warning: unsafe memchr() usage lacked '__read_overflow' warning in=
 ../lib/test_fortify/read_overflow-memchr.c
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-Wa,-march=3D=
armv7-a' [-Wunused-command-line-argument]
    6    2 warnings generated.
    5    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: war=
ning: variable 'err' is used uninitialized whenever switch case is taken [-=
Wsometimes-uninitialized]
    5    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: war=
ning: variable 'err' is used uninitialized whenever 'if' condition is false=
 [-Wsometimes-uninitialized]
    5    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: not=
e: initialize the variable 'err' to silence this warning
    5    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: wa=
rning: variable 'err' is used uninitialized whenever 'if' condition is fals=
e [-Wsometimes-uninitialized]
    5    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: not=
e: initialize the variable 'err' to silence this warning
    5    3 warnings generated.
    2    kernel/trace/trace_events_hist.c:4713:13: warning: stack frame siz=
e of 1332 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=
=3D]
    2    include/linux/slab.h:618:9: warning: argument 1 value =E2=80=98184=
46744073709551615=E2=80=99 exceeds maximum object size 9223372036854775807 =
[-Walloc-size-larger-than=3D]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_=
calc_31.c:939:13: warning: stack frame size of 1292 bytes in function 'dml_=
rq_dlg_get_dlg_params' [-Wframe-larger-than=3D]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:452:13:=
 warning: stack frame size of 1580 bytes in function 'dcn_bw_calc_rq_dlg_tt=
u' [-Wframe-larger-than=3D]
    2    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' i=
s unknown, fallback to ''
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra210-ahu=
b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra186-dsp=
k.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra-audio-=
graph-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/sunxi/sun4i-spdif.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/sh/rcar/snd-soc-rcar.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/rockchip/snd-soc-rockchip-=
spdif.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/rockchip/snd-soc-rockchip-=
pcm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/rockchip/snd-soc-rockchip-=
i2s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/rockchip/snd-soc-rk3399-gr=
u-sound.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-sm8250.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-sdm845.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-lpass-cpu.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-lpass-apq8016=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-apq8016-sbc.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6routing.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6dsp-common.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6core.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6asm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6asm-dai.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6afe.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6afe-dai.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6afe-clocks.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6adm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-t9015.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-g12a-t=
oacodec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-codec-=
glue.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-card-u=
tils.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-to=
ddr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-td=
mout.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-td=
min.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-td=
m-interface.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-td=
m-formatter.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-sp=
difout.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-sp=
difin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-so=
und-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-fr=
ddr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-fi=
fo.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-aiu.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/generic/snd-soc-simple-car=
d.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/generic/snd-soc-simple-car=
d-utils.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/generic/snd-soc-audio-grap=
h-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-imx-spdif.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-imx-sgtl5000.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-imx-audmux.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-imx-audmix.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-ssi.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-spdif.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-micfil.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-easrc.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-audmix.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-asrc.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-asoc-card.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wsa881x.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wm8994.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wm8962.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wm8960.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wm8904.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wm-hubs.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wcd934x.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wcd-mbhc.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-tas571x.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-spdif-tx.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-spdif-rx.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-simple-mux.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-sgtl5000.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rt5659.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rt5645.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rt5514.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rt5514-spi.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rl6231.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-pcm3168a.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-pcm3168a-i2=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-msm8916-dig=
ital.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-msm8916-ana=
log.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-gtm601.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-es7134.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-da7219.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-cros-ec-cod=
ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/pci/hda/snd-hda-tegra.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/hda/snd-hda-core.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/wireless/cfg80211.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/sched/sch_ingress.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/sched/sch_etf.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/sched/sch_cbs.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/sched/cls_flower.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/sched/cls_basic.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/sched/act_mirred.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/sched/act_gact.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/qrtr/qrtr.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/qrtr/qrtr-tun.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/qrtr/ns.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/nfc/nfc.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/nfc/nci/nci.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/netfilter/xt_tcpudp.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/netfilter/xt_nat.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/netfilter/xt_conntrack.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/netfilter/xt_MASQUERADE.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/netfilter/xt_LOG.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/netfilter/xt_CHECKSUM.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/netfilter/nf_log_syslog.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/netfilter/nf_conntrack.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/mac80211/mac80211.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/llc/llc.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv6/sit.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/nf_reject_ipv6.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/nf_defrag_ipv6.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/ip6table_nat.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/ip6table_mangle.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/ip6t_REJECT.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/ip6_tables.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv6/ipv6.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv4/tunnel4.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/iptable_nat.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/iptable_mangle.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/iptable_filter.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv4/ip_tunnel.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/dsa/tag_ocelot.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/dsa/dsa_core.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/can/can.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/can/can-raw.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/can/can-gw.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/can/can-bcm.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/bridge/bridge.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/bluetooth/hidp/hidp.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/bluetooth/bluetooth.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/802/psnap.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/802/p8022.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/lib/zstd/zstd_compress.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/lib/raid6/raid6_pq.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/lib/libcrc32c.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/lib/crypto/libsm4.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/lib/crypto/libcurve25519-generic.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/lib/crypto/libchacha.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/lib/crc-ccitt.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/fs/overlayfs/overlay.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/fs/fuse/fuse.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/fs/fuse/cuse.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/fs/btrfs/btrfs.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/watchdog/sl28cpld_wdt.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/watchdog/qcom-wdt.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/watchdog/meson_wdt.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/watchdog/meson_gxbb_wdt.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/watchdog/imx_sc_wdt.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/video/backlight/lp855x_bl.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/typec/tipd/tps6598x.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/typec/tcpm/tcpci.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/typec/tcpm/fusb302.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/typec/hd3ss3220.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/serial/usb_wwan.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/serial/option.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/serial/ftdi_sio.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/serial/cp210x.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/renesas_usbhs/renesas_us=
bhs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/host/xhci-pci.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_se=
rial.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_rn=
dis.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_ob=
ex.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_nc=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_ma=
ss_storage.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_fs=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_ac=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/u_ether.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/class/cdc-acm.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/thermal/tegra/tegra-soctherm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/thermal/rockchip_thermal.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/thermal/qcom/qcom-spmi-temp-=
alarm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/thermal/imx_sc_thermal.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/thermal/imx8mm_thermal.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/thermal/broadcom/bcm2835_the=
rmal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/staging/media/hantro/hantro-=
vpu.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/spi/spidev.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-sh-msiof.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-rpc-if.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-meson-spicc.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-imx.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-dw-mmio.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/soundwire/soundwire-bus.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/soc/qcom/socinfo.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/soc/qcom/rmtfs_mem.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/soc/qcom/qmi_helpers.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/soc/qcom/pdr_interface.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/soc/qcom/mdt_loader.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/soc/qcom/apr.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/soc/mediatek/mtk-devapc.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/soc/amlogic/meson-canvas.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/slimbus/slimbus.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/slimbus/slim-qcom-ctrl.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/scsi/ufs/ufs_qcom.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/scsi/raid_class.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/scsi/mpt3sas/mpt3sas.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-snvs.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-rx8581.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-rv8803.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-rv3028.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-rk808.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-pm8xxx.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-pcf85363.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-pcf2127.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-imx-sc.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-hym8563.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-ds1307.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/reset/reset-raspberrypi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/reset/reset-berlin.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_sysmon.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_q6v5_pas.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_q6v5_mss.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_pil_info.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_common.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/regulator/vctrl-regulator.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/regulator/tps65132-regulator=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-visconti.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-sun4i.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-sl28cpld.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-rcar.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-mtk-disp.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-meson.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-mediatek.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-imx27.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-cros-ec.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/power/supply/sbs-battery.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/power/supply/max17042_batter=
y.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/power/supply/bq25890_charger=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/power/reset/qcom-pon.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/platform/chrome/cros_ec_type=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/platform/chrome/cros_ec_char=
dev.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pinctrl/qcom/pinctrl-lpass-l=
pi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/phy/tegra/phy-tegra194-p2u.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/phy/rockchip/phy-rockchip-pc=
ie.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/phy/rockchip/phy-rockchip-in=
no-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/phy/rockchip/phy-rockchip-in=
no-dsidphy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/phy/renesas/phy-rcar-gen3-us=
b3.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/phy/qualcomm/phy-qcom-qmp.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/phy/mediatek/phy-mtk-mipi-ds=
i-drv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/phy/freescale/phy-fsl-imx8-m=
ipi-dphy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/phy/allwinner/phy-sun6i-mipi=
-dphy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/perf/thunderx2_pmu.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/perf/fsl_imx8_ddr_perf.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/perf/arm_smmuv3_pmu.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pci/endpoint/functions/pci-e=
pf-test.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pci/controller/pcie-rockchip=
-host.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pci/controller/pcie-brcmstb.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pci/controller/dwc/pcie-tegr=
a194.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/nvmem/nvmem-rmem.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/nvme/host/nvme.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/nvme/host/nvme-core.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/nfc/s3fwrn5/s3fwrn5_i2c.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/nfc/s3fwrn5/s3fwrn5.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/wireless/ti/wlcore/wlcor=
e_sdio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/wireless/ti/wlcore/wlcor=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/wireless/ti/wl18xx/wl18x=
x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/wireless/marvell/mwifiex=
/mwifiex_pcie.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/wireless/marvell/mwifiex=
/mwifiex.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/wireless/broadcom/brcm80=
211/brcmutil/brcmutil.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/wireless/broadcom/brcm80=
211/brcmfmac/brcmfmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/wireless/ath/ath10k/ath1=
0k_snoc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/wireless/ath/ath10k/ath1=
0k_pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/wireless/ath/ath10k/ath1=
0k_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/wireless/ath/ath.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/veth.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/usbnet.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/smsc75xx.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/rtl8150.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/plusb.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/pegasus.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/net1080.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/mcs7830.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/lan78xx.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/cdc_subset.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/cdc_ether.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/tap.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/phy/smsc.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/phy/microchip.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/phy/meson-gxl.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/phy/marvell10g.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/phy/broadcom.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/phy/bcm54140.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/phy/bcm-phy-lib.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/phy/ax88796b.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/pcs/pcs_xpcs.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/mdio/mdio-mux-meson-g12a=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/mdio.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/macvtap.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/macvlan.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ipa/ipa.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/=
stmmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/=
stmmac-platform.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-sunxi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-sun8i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-rk.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-qcom-ethqos.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-meson8b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-meson.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-ipq806x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/mellanox/mlx5/c=
ore/mlx5_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/mellanox/mlx4/m=
lx4_en.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/mellanox/mlx4/m=
lx4_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/broadcom/genet/=
genet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/broadcom/bnx2x/=
bnx2x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/atheros/atl1c/a=
tl1c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/can/rcar/rcar_canfd.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/can/rcar/rcar_can.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/can/flexcan.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/can/dev/can-dev.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/misc/eeprom/at25.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/misc/eeprom/at24.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/mfd/wm8994.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/mfd/wcd934x.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/memory/renesas-rpc-if.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/v4l2-core/v4l2-mem2mem=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/v4l2-core/v4l2-h264.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/v4l2-core/v4l2-fwnode.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/v4l2-core/v4l2-async.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/usb/uvc/uvcvideo.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/tuners/xc4000.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/tuners/tuner-types.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/tuners/tuner-simple.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/tuners/tda9887.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/tuners/tda8290.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/tuners/tda827x.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/tuners/mt20xx.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/sunxi-cir.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/rc-core.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/meson-ir.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-zx-irdec=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-xbox-dvd=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-x96max.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-winfast.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-winfast-=
usbii-deluxe.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-wetek-pl=
ay2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-wetek-hu=
b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-videostr=
ong-kii-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-videomat=
e-tv-pvr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-videomat=
e-s350.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-videomat=
e-m1f.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-vega-s9x=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-trekstor=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-total-me=
dia-in-hand.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tivo.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-terratec=
-slim-2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-terratec=
-cinergy-xs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-terratec=
-cinergy-s2-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-terratec=
-cinergy-c-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-technisa=
t-usb2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-technisa=
t-ts35.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tbs-nec.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tanix-tx=
5max.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tanix-tx=
3mini.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-su3000.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-streamza=
p.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-real-aud=
io-220-32-keys.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-rc6-mce.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pixelvie=
w-new.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pinnacle=
-pctv-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pinnacle=
-color.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pine64.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pctv-sed=
na.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-odroid.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-npgtech.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-norwood.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-nec-terr=
atec-cinergy-xs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-nebula.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-msi-tvan=
ywhere.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-msi-digi=
vox-iii.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-minix-ne=
o.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-medion-x=
10-or2x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-medion-x=
10-digitainer.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-manli.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-lme2510.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-kworld-p=
lus-tv-analog.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-kworld-p=
c150u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-kworld-3=
15u.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-khamsin.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-khadas.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-kaiomy.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-it913x-v=
2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-imon-rsc=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-imon-pad=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-imon-mce=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-hisi-tv-=
demo.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-hisi-pop=
lar.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-hauppaug=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-gotview7=
135.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-genius-t=
vgo-a11mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-gadmei-r=
m008z.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-fusionhd=
tv-mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-flyvideo=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-flydvb.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-encore-e=
nltv2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-encore-e=
nltv.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-encore-e=
nltv-fm53.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-em-terra=
tec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dvico-po=
rtable.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dvico-mc=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dvbsky.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dtt200u.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dm1105-n=
ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-digittra=
de.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dib0700-=
rc5.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dib0700-=
nec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-delock-6=
1959.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-d680-dmb=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-ct-90405=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-cinergy.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-cinergy-=
1400.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-behold-c=
olumbus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-azurewav=
e-ad-tu700.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avertv-3=
03.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedi=
a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedi=
a-rm-ks.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedi=
a-m733a-rm-k6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-ati-tv-w=
onder-hd-600.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-asus-ps3=
-100.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-asus-pc3=
9.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-apac-vie=
wcomp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-anysee.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-alink-dt=
u-m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-adstech-=
dvb-t-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/platform/sunxi/sun6i-c=
si/sun6i-csi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/platform/s5p-jpeg/s5p-=
jpeg.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/platform/rcar_fdp1.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/platform/rcar-vin/rcar=
-vin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/platform/rcar-vin/rcar=
-csi2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/platform/qcom/venus/ve=
nus-enc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/platform/qcom/venus/ve=
nus-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/platform/qcom/camss/qc=
om-camss.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/platform/exynos-gsc/ex=
ynos-gsc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/mc/mc.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/i2c/ov5645.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/i2c/ir-kbd-i2c.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/common/videobuf2/video=
buf2-memops.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/common/videobuf2/video=
buf2-dma-sg.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/common/videobuf2/video=
buf2-dma-contig.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/common/videobuf2/video=
buf2-common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/cec/core/cec.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/md/md-mod.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/md/dm-mod.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/md/dm-mirror.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/md/dm-log.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/mailbox/bcm-flexrm-mailbox.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/leds/leds-pca9532.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/leds/leds-lm3692x.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/qnoc-sm835=
0.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/qnoc-sm815=
0.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/qnoc-msm89=
16.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/icc-smd-rp=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/icc-osm-l3=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/interconnect/imx/imx8mq-inte=
rconnect.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/interconnect/imx/imx-interco=
nnect.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/input/touchscreen/atmel_mxt_=
ts.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/input/misc/pwm-vibra.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/input/misc/pm8xxx-vibrator.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/input/keyboard/snvs_pwrkey.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/input/keyboard/imx_sc_key.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/input/keyboard/adc-keys.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/pressure/mpl3115.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/pressure/cros_ec_baro.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/magnetometer/st_magn_spi=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/magnetometer/st_magn_i2c=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/magnetometer/st_magn.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/light/vcnl4000.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/light/isl29018.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/light/cros_ec_light_prox=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6ds=
x_spi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6ds=
x_i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6ds=
x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/common/st_sensors/st_sen=
sors_spi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/common/st_sensors/st_sen=
sors_i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/common/st_sensors/st_sen=
sors.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/common/cros_ec_sensors/c=
ros_ec_sensors_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/common/cros_ec_sensors/c=
ros_ec_sensors.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/adc/max9611.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/i2c/busses/i2c-qcom-geni.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/i2c/busses/i2c-qcom-cci.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/i2c/busses/i2c-gpio.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/i2c/busses/i2c-bcm2835.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/hwmon/sl28cpld-hwmon.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/hwmon/lm90.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/hwmon/ina3221.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/hwmon/ina2xx.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/hid/i2c-hid/i2c-hid.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/hid/i2c-hid/i2c-hid-of.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/host1x/host1x.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/vc4/vc4.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/ttm/ttm.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun8i_tcon_top=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun6i_drc.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i_tv.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i-frontend=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i-backend.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/scheduler/gpu-sched.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/rcar-du/rcar_lvds.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/rcar-du/rcar_dw_hdmi=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/rcar-du/rcar_cmm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/pl111/pl111_drm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panfrost/panfrost.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-truly-nt=
35597.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-sitronix=
-st7703.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-simple.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-raydium-=
rm67191.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-mantix-m=
laf057we51.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-lvds.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-boe-tv10=
1wum-nl6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/nouveau/nouveau.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/mxsfb/mxsfb.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/meson/meson_dw_hdmi.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/meson/meson-drm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/mediatek/mediatek-dr=
m-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/lima/lima.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/imx/dcss/imx-dcss.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/i2c/sil164.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/i2c/ch7006.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/hisilicon/kirin/kiri=
n-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/hisilicon/hibmc/hibm=
c-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/etnaviv/etnaviv.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/drm_vram_helper.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/drm_ttm_helper.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/drm_kms_helper.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/drm.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/thc63lvd1024.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/synopsys/dw-m=
ipi-dsi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/synopsys/dw-h=
dmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/synopsys/dw-h=
dmi-i2s-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/synopsys/dw-h=
dmi-cec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/synopsys/dw-h=
dmi-ahb-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/simple-bridge=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/parade-ps8640=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/nwl-dsi.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/lontium-lt961=
1uxc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/lontium-lt961=
1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/lontium-lt891=
2b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/display-conne=
ctor.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/analogix/anal=
ogix_dp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/adv7511/adv75=
11.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/arm/mali-dp.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpio/gpio-wcd934x.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpio/gpio-sl28cpld.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpio/gpio-bd9571mwv.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gnss/gnss.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gnss/gnss-serial.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gnss/gnss-mtk.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/fpga/stratix10-soc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/fpga/of-fpga-region.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/fpga/fpga-region.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/fpga/fpga-bridge.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/fpga/altera-freeze-bridge.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/firmware/stratix10-rsu.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/dma/tegra210-adma.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/dma/sun6i-dma.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/dma/sh/usb-dmac.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/dma/bcm-sba-raid.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/devfreq/imx8m-ddrc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/devfreq/imx-bus.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/devfreq/governor_userspace.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/qcom-rng.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/zip/hisi_zi=
p.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/trng/hisi-t=
rng-v2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/hpre/hisi_h=
pre.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/caam/error.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/caam/dpaa2_caam.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/caam/caamhash_desc.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/caam/caamalg_desc.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/caam/caam_jr.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/caam/caam.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/bcm/bcm_crypto_spu.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/amlogic/amlogic-gxl-c=
rypto.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/allwinner/sun8i-ce/su=
n8i-ce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/cpufreq/sun50i-cpufreq-nvmem=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/cpufreq/raspberrypi-cpufreq.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/cpufreq/imx-cpufreq-dt.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/cpufreq/cpufreq_powersave.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/cpufreq/cpufreq_conservative=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/clk/qcom/camcc-sdm845.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/clk/meson/clk-phase.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/clk/meson/axg-audio.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/ipmi/ipmi_msghandler.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/hw_random/xgene-rng.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/hw_random/rng-core.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/hw_random/optee-rng.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/hw_random/omap-rng.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/hw_random/meson-rng.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/hw_random/iproc-rng200.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/hw_random/cavium-rng.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/hw_random/cavium-rng-vf=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/hw_random/bcm2835-rng.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/hw_random/arm_smccc_trn=
g.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/bus/tegra-aconnect.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/bluetooth/hci_uart.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/bluetooth/btusb.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/bluetooth/btrtl.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/bluetooth/btqca.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/base/regmap/regmap-slimbus.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/base/regmap/regmap-sdw.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/xts.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/xor.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/sm4_generic.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/sha3_generic.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/sha256_generic.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/md5.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/ghash-generic.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/ecc.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/ecb.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/dh_generic.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/curve25519-generic.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/ctr.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/crypto_engine.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/cmac.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/ccm.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/cbc.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/blake2b_generic.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/authencesn.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/authenc.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/algif_rng.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/af_alg.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/arch/arm64/lib/xor-neon.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/sound/soc/tegra/snd-soc-tegra210-dmic.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/sound/soc/tegra/snd-soc-tegra210-admaif.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/sound/soc/tegra/snd-soc-tegra-pcm.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/sound/soc/rockchip/snd-soc-rockchip-rt5645.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/sound/soc/qcom/snd-soc-lpass-platform.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/sound/soc/qcom/snd-soc-apq8096.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/sound/soc/meson/snd-soc-meson-g12a-tohdmitx.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/sound/soc/fsl/snd-soc-fsl-esai.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/sound/soc/codecs/snd-soc-rt5663.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/sound/soc/codecs/snd-soc-hdmi-codec.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/sound/pci/hda/snd-hda-codec.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/net/sched/sch_mqprio.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/net/qrtr/qrtr-smd.ko: unsupported GNU_PROPERTY_TYPE (5) type:=
 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/net/ipv6/netfilter/ip6table_filter.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/net/ipv4/netfilter/nf_defrag_ipv4.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/net/ipv4/netfilter/ipt_REJECT.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/net/802/mrp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/net/802/garp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/lib/crypto/libsha256.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/usb/serial/usbserial.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/usb/gadget/libcomposite.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0x  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.=
0-next-20210903/kernel/drivers/usb/host/xhci-pci-renesas.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/usb/gadget/function/usb_f_ecm.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/linux/build/_modules_/lib=
/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_obex=
.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/spi/spi-geni-qcom.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/spi/spi-bitbang.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/spi/spi-bcm2835.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/rtc/rtc-fsl-ftm-alarm.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/reset/reset-qcom-pdc.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/remoteproc/qcom_q6v5.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/phy/qualcomm/phy-qcom-qusb2.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/pci/controller/dwc/pci-meson.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_modules_/lib/=
modules/5.14.0-next-20210903/kernel/drivers/pci/controller/pcie-rockchip-ho=
st.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/net/usb/sr9800.ko: unsupported GNU_PROPERTY_TYPE (5  =
STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/ker=
nel/drivers/net/usb/zaurus.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/net/usb/cdc_ncm.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/net/usb/asix.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/net/phy/marvell.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac-altr-socfpga.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/net/ethernet/qualcomm/emac/qcom-emac.koaarch64-linux-=
gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-=
20210903/kernel/drivers/net/ethernet/mscc/mscc_ocelot_switch_lib.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/mfd/exynos-lpass.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/v4l2-core/v4l2-dv-timings.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/tuners/xc5000.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/tuners/tuner-xc2028.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/rc/keymaps/rc-xbox-360.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/rc/keymaps/rc-twinhan1027.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/rc/keymaps/rc-pixelview-mk12.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/rc/keymaps/rc-pinnacle-grey.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/rc/keymaps/rc-msi-digivox-ii.ko: unsupported GN=
U_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_m=
odules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc=
-msi-tvanywhere-plus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/rc/keymaps/rc-mecool-kiii-pro.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/rc/keymaps/rc-leadtek-y04g0051.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/rc/keymaps/rc-eztv.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/rc/keymaps/rc-evga-indtube.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/rc/keymaps/rc-dntv-live-dvb-t.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/rc/keymaps/rc-digitalnow-tinytwin.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/rc/keymaps/rc-beelink-gs1.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/rc/keymaps/rc-avermedia-m135a.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/rc/keymaps/rc-avermedia-a16d.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/platform/s5p-mfc/s5p-mfc.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/i2c/imx219.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/media/common/videobuf2/videobuf2-vmalloc.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/md/dm-zero.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/interconnect/qcom/qnoc-sm8250.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/input/touchscreen/goodix.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/input/touchscreen/edt-ft5x06.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/iio/buffer/industrialio-triggered-buffer.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/iio/adc/qcom-spmi-adc5.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/hwmon/pwm-fan.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/gpu/drm/tegra/tegra-drm.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/gpu/drm/sun4i/sun8i-mixer.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun8=
i-drm-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/gpu/drm/sun4i/sun4i-tcon.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko  INSTALL /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/=
sun4i/sun6i_drc.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/gpu/drm/drm_dp_aux_bus.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/gpu/drm/bridge/sii902x.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/gpio/gpio-regmap.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/gpio/gpio-altera.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/extcon/extcon-ptn5150.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/crypto/ccree/ccree.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/clk/meson/sclk-div.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/clk/bcm/clk-raspberrypi.ko: unsupported GNU_PROPERTY_=
TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021=
0903/kernel/drivers/clk/meson/clk-phase.ko
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/char/hw_random/mtk-rng.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/char/hw_random/hisi-rng.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/char/hw_random/exynos-trng.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/crypto/gcm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/crypto/des_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    1    warning:   INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14=
.0-next-20210903/kernel/drivers/net/can/dev/can-dev.ko
    1    kernel/trace/trace_osnoise.c:1515:8: warning: =E2=80=98main=E2=80=
=99 is usually a function [-Wmain]
    1    include/linux/slab.h:461:9: warning: argument 1 value =E2=80=98429=
4967295=E2=80=99 exceeds maximum object size 2147483647 [-Walloc-size-large=
r-than=3D]
    1    include/linux/slab.h:461:9: warning: argument 1 value =E2=80=98184=
46744073709551615=E2=80=99 exceeds maximum object size 9223372036854775807 =
[-Walloc-size-larger-than=3D]
    1    drivers/staging/media/hantro/hantro_g2_hevc_dec.c:586:5: warning: =
stack frame size of 1236 bytes in function 'hantro_g2_hevc_dec_run' [-Wfram=
e-larger-than=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 1828 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 1804 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/net/ethernet/8390/ne.c:909:20: warning: =E2=80=98ne_add_de=
vices=E2=80=99 defined but not used [-Wunused-function]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_c=
alc.c:997:6: warning: stack frame size of 1196 bytes in function 'dml1_rq_d=
lg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_c=
alc.c:997:6: warning: stack frame size of 1164 bytes in function 'dml1_rq_d=
lg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_=
calc_30.c:981:13: warning: stack frame size of 1052 bytes in function 'dml_=
rq_dlg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3397:6: warning: stack frame size of 1516 bytes in function 'dml21_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3397:6: warning: stack frame size of 1468 bytes in function 'dml21_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1466:13: warning: stack frame size of 1148 bytes in function 'DISPCL=
KDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation=
' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1466:13: warning: stack frame size of 1132 bytes in function 'DISPCL=
KDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation=
' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: warning: stack frame size of 1436 bytes in function 'dml20=
v2_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: warning: stack frame size of 1420 bytes in function 'dml20=
v2_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: warning: stack frame size of 1196 bytes in function 'dml2=
0v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceC=
alculation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: warning: stack frame size of 1164 bytes in function 'dml2=
0v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceC=
alculation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: warning: stack frame size of 1436 bytes in function 'dml20_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: warning: stack frame size of 1404 bytes in function 'dml20_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: warning: stack frame size of 1196 bytes in function 'dml20_=
DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcu=
lation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: warning: stack frame size of 1180 bytes in function 'dml20_=
DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcu=
lation' [-Wframe-larger-than=3D]
    1    drivers/firmware/iscsi_ibft.c:868:13: warning: incompatible intege=
r to pointer conversion assigning to 'struct acpi_table_ibft *' from 'int' =
[-Wint-conversion]
    1    drivers/firmware/iscsi_ibft.c:868:13: warning: assignment to =E2=
=80=98struct acpi_table_ibft *=E2=80=99 from =E2=80=98int=E2=80=99 makes po=
inter from integer without a cast [-Wint-conversion]
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    cc1: some warnings being treated as errors
    1    arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't f=
ind starting instruction
    1    arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't f=
ind starting instruction
    1    arch/x86/entry/entry_64.o: warning: objtool: asm_load_gs_index(): =
can't find starting instruction
    1    arch/arc/include/asm/perf_event.h:91:27: warning: =E2=80=98arc_pmu=
_ev_hw_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    1    arch/arc/include/asm/perf_event.h:126:27: warning: =E2=80=98arc_pm=
u_cache_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/ne=
t/802/stp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/dr=
ivers/reset/reset-meson-audio-arb.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/dr=
ivers/bluetooth/btintel.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000=
000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/sound/soc/c=
odecs/snd-soc-lpass-wsa-macro.kowarning: : unsupported GNU_PROPERTY_TYPE (/=
tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/sound=
/soc/codecs/snd-soc-max98357a.ko: unsupported GNU_PROPERTY_TYPE (55) type: =
0x) type: 0xc0000000c0000000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/sound/pci/h=
da/snd-hda-codec-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/med=
ia/platform/rcar-fcp.ko: unsupported GNU_PROPERTY_TYPE (warning: 5/tmp/kci/=
linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media=
/platform/qcom/venus/venus-dec.ko) type: 0x: unsupported GNU_PROPERTY_TYPE =
(c00000005) type: 0x
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/md/=
dm-region-hash.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/blu=
etooth/btintel.ko: unsupported GNU_PROPERTY_TYPE (warning: 5/tmp/kci/linux/=
build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/block/nbd.k=
o) type: 0x: unsupported GNU_PROPERTY_TYPE (c00000005
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra210-i2s=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra210-dmi=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra210-adm=
aif.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra-pcm.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/sunxi/sun4i-i2s.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/rockchip/snd-soc-rockchip-=
rt5645.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-qcom-common.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-qcom-common.k=
o  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/=
kernel/sound/soc/rockchip/snd-soc-rockchip-spdif.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-lpass-platfor=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-apq8096.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-gx-sou=
nd-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-g12a-t=
ohdmitx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux=
-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next=
-20210903/kernel/sound/soc/meson/snd-soc-meson-gx-sound-card.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-pd=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-sai.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-esai.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/imx-pcm-dma.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/imx-pcm-dma.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/_modules=
_/lib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-asoc-ca=
rd.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-simple-ampl=
ifier.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rt5663.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-max98927.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-max98927.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/=
_modules_/lib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-=
pcm3168a.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-max98357a.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-lpass-wsa-m=
acro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-lpass-va-ma=
cro.ko  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021=
0903/kernel/sound/soc/codecs/snd-soc-pcm3168a-i2c.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-hdmi-codec.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-es7241.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-dmic.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-dmic.ko: un=
supported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/=
modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-gtm601.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-ak4613.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/bcm/snd-soc-bcm2835-i2s.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/soc/bcm/snd-soc-bcm2835-i2s.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: warnin=
g: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/s=
ound/soc/codecs/snd-soc-ak4613.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/pci/hda/snd-hda-codec.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/sound/pci/hda/snd-hda-codec-hdmi.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/sched/sch_taprio.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/sched/sch_mqprio.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/sched/act_gate.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/sched/act_gate.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/build/_modules_/lib/m=
odules/5.14.0-next-20210903/kernel/net/sched/cls_basic.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/rfkill/rfkill.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/rfkill/rfkill.ko: unsupported GN=
U_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14=
.0-next-20210903/kernel/net/sched/act_gact.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/qrtr/qrtr-smd.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/netfilter/xt_addrtype.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/netfilter/x_tables.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/netfilter/x_tables.ko: unsupport=
ed GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/=
5.14.0-next-20210903/kernel/net/netfilter/xt_CHECKSUM.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/netfilter/nf_nat.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/ip6table_filter.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/nf_reject_ipv4.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip:
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/nf_reject_ipv4.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/nf_defrag_ipv4.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/ipt_REJECT.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/ip_tables.koaarch=
64-linux-gnu-strip: : unsupported GNU_PROPERTY_TYPE (warning: /tmp/kci/linu=
x/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/net/dsa/tag_ocelo=
t_8021q.ko5: unsupported GNU_PROPERTY_TYPE () type: 0x5c0000000) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/ip_tables.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/dsa/tag_ocelot_8021q.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modul=
es/5.14.0-next-20210903/kernel/net/ipv4/netfilter/ipt_REJECT.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/8021q/8021q.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/802/stp.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/802/mrp.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/net/802/garp.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/lib/crypto/libsha256.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/lib/crypto/libdes.koaarch64-linux-gn=
u-strip:   STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2=
0210903/kernel/lib/crypto/libsm4.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/lib/crypto/libdes.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/lib/crypto/libarc4.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/lib/crypto/libarc4.ko: unsupported G=
NU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14=
.0-next-20210903/kernel/lib/crypto/libsha256.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/fs/nfs/blocklayout/blocklayoutdriver=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/watchdog/sunxi_wdt.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/video/backlight/pwm_bl.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/video/backlight/pwm_bl.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: warning: =
/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/driv=
ers/usb/typec/typec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/typec/typec.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: ) type: 0xwarning: c000000=
0/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/dri=
vers/usb/typec/tcpm/tcpm.ko: unsupported GNU_PROPERTY_TYPE (
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/typec/tcpm/tcpm.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/serial/usbserial.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/host/xhci-pci-renesas.ko=
: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/usb=
/gadget/udc/tegra-xudc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00000=
00
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/host/xhci-pci-renesas.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/udc/tegra-xudc.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/udc/renesas_usb3.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/libcomposite.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_ee=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_ec=
m_subset.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_ec=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/u_serial=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/thermal/tegra/tegra-bpmp-the=
rmal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/thermal/tegra/tegra-bpmp-the=
rmal.ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_mod=
ules_/lib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/u=
sb_f_ecm_subset.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/thermal/qoriq_thermal.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/thermal/broadcom/brcmstb_the=
rmal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/thermal/broadcom/bcm2711_the=
rmal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/thermal/broadcom/bcm2711_the=
rmal.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip:=
 c0000000warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20=
210903/kernel/drivers/thermal/broadcom/brcmstb_thermal.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-qcom-qspi.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-qcom-qspi.ko  STRIP =
  /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/dr=
ivers/spi/spi-rpc-if.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-meson-spifc.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-meson-spifc.ko: unsu=
pported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/broadcom/brcmstb_thermal.=
ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-geni-qcom.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-dw.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-bitbang.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-bcm2835aux.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-bcm2835aux.ko: unsup=
ported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/mod=
ules/5.14.0-next-20210903/kernel/drivers/spi/spi-dw-mmio.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-bcm2835.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/soundwire/soundwire-qcom.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip:
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/soundwire/soundwire-qcom.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/slimbus/slim-qcom-ngd-ctrl.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/slimbus/slim-qcom-ngd-ctrl.k=
o: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/=
lib/modules/5.14.0-next-20210903/kernel/drivers/slimbus/slim-qcom-ctrl.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-meson-vrtc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-m41t80.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-m41t80.ko: unsupport=
ed GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/modules=
/5.14.0-next-20210903/kernel/drivers/rtc/rtc-pcf2127.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/rpmsg/qcom_glink_smem.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/reset/reset-meson-audio-arb.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_q6v5.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-tegra.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-tegra.ko: unsupporte=
d GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/=
5.14.0-next-20210903/kernel/drivers/pwm/pwm-visconti.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-bcm2835.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-bcm2835.ko  INSTALL =
/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/driv=
ers/pwm/pwm-imx27.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/power/supply/bq25980_charger=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/phy/qualcomm/phy-qcom-qusb2.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/phy/mediatek/phy-mtk-hdmi-dr=
v.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/phy/mediatek/phy-mtk-hdmi-dr=
v.ko: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/drivers/phy/qualcomm/phy-qcom-q=
usb2.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/pci/controller/dwc/pci-meson=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/nvmem/nvmem_meson_efuse.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/zaurus.ko: unsupport=
ed GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/linux/bui=
ld/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/smsc95=
xx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/zaurus.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/sr9800.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/smsc95xx.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/r8152.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/dm9601.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/dm9601.ko  INSTALL /=
tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drive=
rs/net/usb/pegasus.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/cdc_ncm.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/ax88179_178a.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/asix.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/phy/marvell.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/phy/bcm7xxx.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/mdio/mdio-bcm-unimac.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/mdio/mdio-bcm-unimac.ko =
 STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/ke=
rnel/drivers/net/pcs/pcs_xpcs.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-visconti.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-imx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/=
dwmac-imx.ko: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/buil=
d/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/st=
micro/stmmac/dwmac-meson8b.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/qualcomm/rmnet/=
rmnet.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/qualcomm/rmnet/=
rmnet.ko: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_mo=
dules_/lib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro=
/stmmac/dwmac-altr-socfpga.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/qualcomm/emac/q=
com-emac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/mscc/mscc_ocelo=
t_switch_lib.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/dsa/ocelot/mscc_felix.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/net/dsa/ocelot/mscc_felix.ko=
: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/=
lib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/atheros/atl1c/=
atl1c.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/misc/uacce/uacce.koaarch64-l=
inux-gnu-strip: : unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/misc/uacce/uacce.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/misc/pci_endpoint_test.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/mfd/exynos-lpass.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/v4l2-core/videodev.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/v4l2-core/v4l2-dv-timi=
ngs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/tuners/xc5000.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/tuners/tuner-xc2028.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/tuners/tda18271.ko: un=
supported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/tu=
ners/mc44s803.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/tuners/tda18271.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/tuners/mc44s803.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-xbox-360=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-twinhan1=
027.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: =
c0000000warning:
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tt-1500.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tt-1500.=
ko  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903=
/kernel/drivers/media/rc/keymaps/rc-vega-s9x.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-total-me=
dia-in-hand-02.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-total-me=
dia-in-hand-02.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp=
/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/=
media/rc/keymaps/rc-twinhan-dtv-cab-ci.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tevii-ne=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-terratec=
-slim.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-terratec=
-slim.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip=
: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/=
kernel/drivers/media/rc/keymaps/rc-tevii-nec.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-snapstre=
am-firefly.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warn=
ing: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel=
/drivers/media/rc/keymaps/rc-reddo.ko5: unsupported GNU_PROPERTY_TYPE () ty=
pe: 0x5c0000000) type: 0x
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-snapstre=
am-firefly.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-reddo.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pv951.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-purpletv=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-proteus-=
2309.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/k=
ci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/me=
dia/rc/keymaps/rc-rc6-mce.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-proteus-=
2309.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-powercol=
or-real-angel.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_mod=
ules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-p=
ixelview.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-powercol=
or-real-angel.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pixelvie=
w.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pixelvie=
w-mk12.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pixelvie=
w-002t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pinnacle=
-grey.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-msi-tvan=
ywhere-plus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-msi-digi=
vox-ii.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-medion-x=
10.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-medion-x=
10.ko: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modu=
les_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-ms=
i-tvanywhere-plus.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-mecool-k=
iii-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-mecool-k=
ii-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-mecool-k=
ii-pro.ko: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/r=
c-medion-x10.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-leadtek-=
y04g0051.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-it913x-v=
1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-iodata-b=
ctv7e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-geekbox.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-geekbox.=
ko  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903=
/kernel/drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-eztv.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-evga-ind=
tube.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dntv-liv=
e-dvbt-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dntv-liv=
e-dvb-t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-digitaln=
ow-tinytwin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-budget-c=
i-old.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-g=
nu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2=
0210903/kernel/drivers/media/rc/keymaps/rc-behold.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-budget-c=
i-old.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-behold.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-beelink-=
gs1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedi=
a-m135a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedi=
a-dvbt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp=
/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/=
media/rc/keymaps/rc-azurewave-ad-tu700.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedi=
a-dvbt.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedi=
a-cardbus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedi=
a-a16d.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-ati-x10.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-astromet=
a-t2hybrid.ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: war=
ning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kerne=
l/drivers/media/platform/vsp1/vsp1.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-astromet=
a-t2hybrid.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/platform/vsp1/vsp1.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/platform/s5p-mfc/s5p-m=
fc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/platform/rcar_drif.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux=
/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/plat=
form/s5p-jpeg/s5p-jpeg.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/platform/rcar_drif.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/platform/rcar-fcp.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/platform/qcom/venus/ve=
nus-dec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/i2c/imx219.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/dvb-core/dvb-core.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/common/videobuf2/video=
buf2-vmalloc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/media/common/videobuf2/video=
buf2-v4l2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/md/dm-zero.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/md/dm-region-hash.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/qnoc-sm825=
0.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/input/touchscreen/goodix.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/input/touchscreen/edt-ft5x06=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/buffer/kfifo_buf.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/buffer/kfifo_buf.ko: uns=
upported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/m=
odules/5.14.0-next-20210903/kernel/drivers/iio/common/cros_ec_sensors/cros_=
ec_sensors_core.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/adc/qcom-vadc-common.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/adc/qcom-vadc-common.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: c000000=
0warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/k=
ernel/drivers/iio/adc/rockchip_saradc.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/adc/qcom-spmi-vadc.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/iio/adc/qcom-spmi-adc5.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/hwmon/raspberrypi-hwmon.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/hwmon/pwm-fan.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/hid/i2c-hid/i2c-hid-acpi.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/hid/hid-multitouch.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/hid/hid-multitouch.ko  STRIP=
   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/d=
rivers/hid/i2c-hid/i2c-hid-of.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/tegra/tegra-drm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun8i-mixer.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun8i-drm-hdmi=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun6i_mipi_dsi=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun6i_mipi_dsi=
.ko  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/gpu/drm/sun4i/sun8i-mixer.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i-tcon.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i-drm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i-drm-hdmi=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/rockchip/rockchipdrm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/rockchip/rockchipdrm=
.ko  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/gpu/drm/sun4i/sun4i-tcon.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/msm/msm.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/msm/msm.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/module=
s/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i-drm.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/mediatek/mediatek-dr=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/mediatek/mediatek-dr=
m.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/bu=
ild/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/meson=
/meson_dw_hdmi.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/i2c/tda998x.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/i2c/tda998x.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/lima/lima.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/hisilicon/kirin/dw_d=
rm_dsi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/exynos/exynosdrm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/exynos/exynosdrm.ko:=
 unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/li=
b/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/hisilicon/kirin/dw_dr=
m_dsi.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/drm_dp_aux_bus.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/ti-sn65dsi86.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/li=
nux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm=
/drm_kms_helper.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/ti-sn65dsi86.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/sii902x.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpio/gpio-regmap.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpio/gpio-altera.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/extcon/extcon-ptn5150.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/edac/layerscape_edac_mod.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/sec2/hisi_s=
ec2.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/=
modules/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/hisi_qm.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/sec2/hisi_s=
ec2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/hisi_qm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/crypto/ccree/ccree.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/cpufreq/cppc_cpufreq.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/clk/qcom/lpass-gfm-sm8250.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/clk/qcom/lpass-gfm-sm8250.ko=
: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/cpufreq/cppc_cpufreq.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/clk/meson/sclk-div.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/clk/clk-bd718x7.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/clk/bcm/clk-raspberrypi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/ipmi/ipmi_si.ko: unsupp=
orted GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modul=
es/5.14.0-next-20210903/kernel/drivers/clk/meson/sclk-div.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/ipmi/ipmi_devintf.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/ipmi/ipmi_devintf.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/_mo=
dules_/lib/modules/5.14.0-next-20210903/kernel/drivers/char/ipmi/ipmi_si.ko
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/hw_random/mtk-rng.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/hw_random/hisi-rng.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/char/hw_random/exynos-trng.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/bluetooth/btbcm.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/block/nbd.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/xxhash_generic.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/sm3_generic.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/gcm.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/ecdh_generic.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/crypto/des_generic.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-me=
son-axg-spdifout.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/fs/fuse/fuse.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/udc/teg=
ra-xudc.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/thermal/rockchip_t=
hermal.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/power/supply/max17=
042_battery.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/net/phy/marvell10g=
.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmic=
ro/stmmac/dwmac-generic.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/r=
c-avermedia-m733a-rm-k6.ko
    1    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/iio/adc/rockchip_s=
aradc.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-imx.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/misc/pci_endpoint_=
test.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/r=
c-videomate-m1f.ko
    1    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/r=
c-real-audio-220-32-keys.ko
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/so=
und/soc/codecs/snd-soc-lpass-va-macro.ko/tmp/kci/linux/build/_modules_/lib/=
modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-es7241.ko: uns=
upported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55) type: 0x) =
type: 0xc0000000c0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/dr=
ivers/usb/gadget/function/usb_f_ecm_subset.ko/tmp/kci/linux/build/_modules_=
/lib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_=
eem.ko: unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (5) =
type: 0x5c0000000) type: 0x
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/dr=
ivers/reset/reset-qcom-pdc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/dr=
ivers/media/rc/keymaps/rc-purpletv.ko/tmp/kci/linux/build/_modules_/lib/mod=
ules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pv951.ko: unsu=
pported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55) type: 0x) t=
ype: 0xc0000000c0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/dr=
ivers/media/rc/keymaps/rc-iodata-bctv7e.ko/tmp/kci/linux/build/_modules_/li=
b/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-it913x-v1=
.ko: unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc00000005) type: 0x
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning=
: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/cr=
ypto/xxhash_generic.ko/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-nex=
t-20210903/kernel/crypto/sm3_generic.ko: unsupported GNU_PROPERTY_TYPE (: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc00000005
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/sound/soc/t=
egra/snd-soc-tegra210-i2s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/sound/soc/s=
unxi/sun4i-i2s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/sound/soc/f=
sl/snd-soc-fsl-sai.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/sound/soc/c=
odecs/snd-soc-simple-amplifier.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/net/sched/s=
ch_taprio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/net/netfilt=
er/nf_nat.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xwarning: /tmp/kci/l=
inux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/net/netfilter/=
xt_addrtype.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/usb=
/gadget/function/u_serial.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/net=
/usb/r8152.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/net=
/usb/ax88179_178a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/med=
ia/rc/keymaps/rc-dntv-live-dvbt-pro.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/med=
ia/rc/keymaps/rc-ati-x10.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc000=
0000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/med=
ia/dvb-core/dvb-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/med=
ia/common/videobuf2/videobuf2-v4l2.ko  STRIP   /tmp/kci/linux/build/_module=
s_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/i2c/imx219.ko
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/iio=
/adc/rockchip_saradc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/hwm=
on/raspberrypi-hwmon.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/hid=
/i2c-hid/i2c-hid-acpi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/gpu=
/drm/sun4i/sun4i-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/eda=
c/layerscape_edac_mod.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/cpu=
freq/cppc_cpufreq.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/cha=
r/ipmi/ipmi_si.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_mo=
dules_/lib/modules/5.14.0-next-20210903/kernel/drivers/clk/clk-bd718x7.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kc=
i/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/crypto/ecdh=
_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: 5warning: /tmp/kci/linux/build/_modules_/=
lib/modules/5.14.0-next-20210903/kernel/fs/nfs/blocklayout/blocklayoutdrive=
r.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    1 warning and 1 error generated.
    1    ) type: 0xaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-meson-vrtc=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    ) type: 0xaarch64-linux-gnu-strip: c0000000warning: /tmp/kci/linux=
/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/iio/buffer=
/industrialio-triggered-buffer.ko

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 23 errors, 23 warn=
ings, 0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-10) =E2=80=94 FAIL, 1 error, 30 warnings, 0 secti=
on mismatches

Errors:
    ERROR: modpost: "__mulodi4" [drivers/block/nbd.ko] undefined!

Warnings:
    kernel/trace/trace_events_hist.c:4713:13: warning: stack frame size of =
1332 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to silence=
 this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:452:13: warn=
ing: stack frame size of 1580 bytes in function 'dcn_bw_calc_rq_dlg_ttu' [-=
Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: warning=
: variable 'err' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: note: in=
itialize the variable 'err' to silence this warning
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: warning:=
 variable 'err' is used uninitialized whenever switch case is taken [-Wsome=
times-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: warning:=
 variable 'err' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: note: in=
itialize the variable 'err' to silence this warning
    3 warnings generated.
    drivers/staging/media/hantro/hantro_g2_hevc_dec.c:586:5: warning: stack=
 frame size of 1236 bytes in function 'hantro_g2_hevc_dec_run' [-Wframe-lar=
ger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c=
:997:6: warning: stack frame size of 1164 bytes in function 'dml1_rq_dlg_ge=
t_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_=
31.c:939:13: warning: stack frame size of 1292 bytes in function 'dml_rq_dl=
g_get_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: warning: stack frame size of 1196 bytes in function 'dml20_DISPC=
LKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculatio=
n' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: warning: stack frame size of 1436 bytes in function 'dml20_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: warning: stack frame size of 1196 bytes in function 'dml20v2_D=
ISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcul=
ation' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: warning: stack frame size of 1436 bytes in function 'dml20v2_Mo=
deSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1466:13: warning: stack frame size of 1148 bytes in function 'DISPCLKDPPC=
LKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-W=
frame-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3397:6: warning: stack frame size of 1516 bytes in function 'dml21_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 1828 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 21 errors, 24 warnings, 0 secti=
on mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    drivers/firmware/iscsi_ibft.c:868:15: error: implicit declaration of fu=
nction =E2=80=98isa_bus_to_virt=E2=80=99; did you mean =E2=80=98phys_to_vir=
t=E2=80=99? [-Werror=3Dimplicit-function-declaration]

Warnings:
    kernel/trace/trace_osnoise.c:1515:8: warning: =E2=80=98main=E2=80=99 is=
 usually a function [-Wmain]
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    drivers/firmware/iscsi_ibft.c:868:13: warning: assignment to =E2=80=98s=
truct acpi_table_ibft *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer f=
rom integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors
    include/linux/slab.h:618:9: warning: argument 1 value =E2=80=9818446744=
073709551615=E2=80=99 exceeds maximum object size 9223372036854775807 [-Wal=
loc-size-larger-than=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-12) =E2=80=94 FAIL, 1 error, 30 warnings, 0 secti=
on mismatches

Errors:
    ERROR: modpost: "__mulodi4" [drivers/block/nbd.ko] undefined!

Warnings:
    kernel/trace/trace_events_hist.c:4713:13: warning: stack frame size of =
1332 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to silence=
 this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:452:13: warn=
ing: stack frame size of 1580 bytes in function 'dcn_bw_calc_rq_dlg_ttu' [-=
Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: warning=
: variable 'err' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: note: in=
itialize the variable 'err' to silence this warning
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: warning:=
 variable 'err' is used uninitialized whenever switch case is taken [-Wsome=
times-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: warning:=
 variable 'err' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: note: in=
itialize the variable 'err' to silence this warning
    3 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c=
:997:6: warning: stack frame size of 1196 bytes in function 'dml1_rq_dlg_ge=
t_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: warning: stack frame size of 1180 bytes in function 'dml20_DISPC=
LKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculatio=
n' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: warning: stack frame size of 1404 bytes in function 'dml20_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: warning: stack frame size of 1164 bytes in function 'dml20v2_D=
ISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcul=
ation' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: warning: stack frame size of 1420 bytes in function 'dml20v2_Mo=
deSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 1804 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1466:13: warning: stack frame size of 1132 bytes in function 'DISPCLKDPPC=
LKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-W=
frame-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3397:6: warning: stack frame size of 1468 bytes in function 'dml21_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_=
30.c:981:13: warning: stack frame size of 1052 bytes in function 'dml_rq_dl=
g_get_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_=
31.c:939:13: warning: stack frame size of 1292 bytes in function 'dml_rq_dl=
g_get_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-12) =E2=80=94 FAIL, 1 error, 11 warnings, 0 sect=
ion mismatches

Errors:
    drivers/firmware/iscsi_ibft.c:868:15: error: implicit declaration of fu=
nction 'isa_bus_to_virt' [-Werror,-Wimplicit-function-declaration]

Warnings:
    fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to silence=
 this warning
    1 warning generated.
    drivers/firmware/iscsi_ibft.c:868:13: warning: incompatible integer to =
pointer conversion assigning to 'struct acpi_table_ibft *' from 'int' [-Win=
t-conversion]
    1 warning and 1 error generated.
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: warning=
: variable 'err' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: note: in=
itialize the variable 'err' to silence this warning
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: warning:=
 variable 'err' is used uninitialized whenever switch case is taken [-Wsome=
times-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: warning:=
 variable 'err' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: note: in=
itialize the variable 'err' to silence this warning
    3 warnings generated.

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to silence=
 this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    arch/x86/entry/entry_64.o: warning: objtool: asm_load_gs_index(): can't=
 find starting instruction
    arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't find s=
tarting instruction
    arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't find s=
tarting instruction
    fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to silence=
 this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to silence=
 this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to silence=
 this warning
    1 warning generated.

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
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 26 errors, 25 warnings, 0 =
section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 26 errors, 25 warnings, 0 =
section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c

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
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-12) =E2=80=94 PASS, 0 errors, 823 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to silence=
 this warning
    1 warning generated.
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: warning=
: variable 'err' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: note: in=
itialize the variable 'err' to silence this warning
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: warning:=
 variable 'err' is used uninitialized whenever switch case is taken [-Wsome=
times-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: warning:=
 variable 'err' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: note: in=
itialize the variable 'err' to silence this warning
    3 warnings generated.
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/arch/arm64/lib/xor-neon.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/af_alg.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/algif_rng.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/authenc.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/authencesn.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/blake2b_generic.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/cbc.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/ccm.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/cmac.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/crypto_engine.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/curve25519-generic.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/ctr.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/ecb.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/dh_generic.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/ecc.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/des_generic.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/crypto/ecdh_gene=
ric.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/crypto/gcm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/ghash-generic.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/md5.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/sha256_generic.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/sha3_generic.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/sm3_generic.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/sm4_generic.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/xor.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/xts.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/xxhash_generic.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/base/regmap/regmap-sdw.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/base/regmap/regmap-slimbus.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/block/nbd.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers=
/bluetooth/btintel.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/bluetooth/btqca.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/bluetooth/btrtl.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/bluetooth/btusb.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/bus/tegra-aconnect.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/arm_smccc_trng.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/bluetooth/hci_uart.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/cavium-rng-vf.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/bcm2835-rng.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/cavium-rng.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/char/hw_random/exynos-trng.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/char/hw_random/hisi-rng.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/iproc-rng200.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/meson-rng.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/mtk-rng.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/omap-rng.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/optee-rng.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/rng-core.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/xgene-rng.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/ipmi/ipmi_devintf.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/_modules=
_/lib/modules/5.14.0-next-20210903/kernel/drivers/char/ipmi/ipmi_si.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/ipmi/ipmi_msghandler.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/clk/bcm/clk-raspberrypi.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/clk/clk-bd718x7.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/ipmi/ipmi_si.ko: unsupported=
 GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.=
14.0-next-20210903/kernel/drivers/clk/meson/sclk-div.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/clk/meson/clk-phase.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/clk/meson/axg-audio.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/clk/qcom/lpass-gfm-sm8250.ko: uns=
upported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/cpufreq/cppc_cpufreq.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/clk/qcom/camcc-sdm845.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/cpufreq/=
cppc_cpufreq.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/clk/meson/sclk-div.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/cpufreq/cpufreq_conservative.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/cpufreq/cpufreq_powersave.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/cpufreq/raspberrypi-cpufreq.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/cpufreq/sun50i-cpufreq-nvmem.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/cpufreq/imx-cpufreq-dt.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/allwinner/sun8i-ce/sun8i-c=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/caam/caam.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/bcm/bcm_crypto_spu.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/amlogic/amlogic-gxl-crypto=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/caam/caam_jr.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/caam/caamalg_desc.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/caam/caamhash_desc.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/hpre/hisi_hpre.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/sec2/hisi_sec2.k=
oaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/modul=
es/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/hisi_qm.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/caam/dpaa2_caam.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/trng/hisi-trng-v=
2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/crypto/ccree/ccree.ko: unsupported GNU_PROPERTY_TYPE (5) t=
ype: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/zip/hisi_zip.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/caam/error.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/qcom-rng.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/devfreq/imx-bus.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/devfreq/governor_userspace.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/dma/sh/usb-dmac.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/devfreq/imx8m-ddrc.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/dma/bcm-sba-raid.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/dma/tegra210-adma.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/dma/sun6i-dma.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/edac/lay=
erscape_edac_mod.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/extcon/extcon-ptn5150.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/fpga/altera-freeze-bridge.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/firmware/stratix10-rsu.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/fpga/fpga-region.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/fpga/fpga-bridge.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/fpga/of-fpga-region.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/fpga/stratix10-soc.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gnss/gnss-mtk.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gnss/gnss-serial.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gnss/gnss.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpio/gpio-altera.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpio/gpio-bd9571mwv.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/gpio/gpio-regmap.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpio/gpio-sl28cpld.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpio/gpio-wcd934x.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/arm/mali-dp.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/analogix/analogix_=
dp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/adv7511/adv7511.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/lontium-lt8912b.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/display-connector.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/lontium-lt9611.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/lontium-lt9611uxc.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/parade-ps8640.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/nwl-dsi.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/sii902x.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi-a=
hb-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/simple-bridge.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi-c=
ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i=
2s-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/synopsys/dw-mipi-d=
si.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/ti-sn65dsi86.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/thc63lvd1024.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/gpu/drm/drm_dp_aux_bus.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/drm_ttm_helper.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/drm_kms_helper.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/drm_vram_helper.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/etnaviv/etnaviv.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/exynos/exynosdrm.ko: unsu=
pported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/lib/mod=
ules/5.14.0-next-20210903/kernel/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi=
.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/hisilicon/hibmc/hibmc-drm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/drm.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/hisilicon/kirin/dw_drm_ds=
i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/i2c/ch7006.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/i2c/sil164.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/hisilicon/kirin/kirin-drm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/i2c/tda998x.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/lima/lima.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/imx/dcss/imx-dcss.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/lima/lima.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/mediatek/mediatek-drm-hdm=
i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/mediatek/mediatek-drm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/build/_=
modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/meson/meso=
n_dw_hdmi.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/meson/meson_dw_hdmi.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/meson/meson-drm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/mxsfb/mxsfb.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-boe-tv101wum-=
nl6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-mantix-mlaf05=
7we51.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-lvds.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-raydium-rm671=
91.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-simple.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-sitronix-st77=
03.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panfrost/panfrost.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-truly-nt35597=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/pl111/pl111_drm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/rcar-du/rcar_cmm.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/rcar-du/rcar_lvds.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/scheduler/gpu-sched.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/rockchip/rockchipdrm.ko  =
INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/ker=
nel/drivers/gpu/drm/sun4i/sun4i-tcon.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i-backend.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/msm/msm.ko: unsupported G=
NU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.1=
4.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i-drm.ko
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/=
sun4i/sun4i-drm.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko  INSTALL /tmp/kci/linux/bu=
ild/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i=
/sun6i_drc.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i-frontend.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/gpu/drm/sun4i/sun4i-tcon.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i_tv.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun6i_drc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.ko  =
STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/ker=
nel/drivers/gpu/drm/sun4i/sun8i-mixer.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/gpu/drm/sun4i/sun8i-mixer.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun8i-drm=
-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun8i_tcon_top.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/ttm/ttm.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hid/hid-multitouch.ko  STRIP   /t=
mp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/driver=
s/hid/i2c-hid/i2c-hid-of.ko
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/hid/i2c-=
hid/i2c-hid-acpi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/gpu/drm/tegra/tegra-drm.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hid/i2c-hid/i2c-hid-of.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/host1x/host1x.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hid/i2c-hid/i2c-hid.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/vc4/vc4.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hwmon/ina2xx.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hwmon/ina3221.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hwmon/lm90.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/hwmon/ra=
spberrypi-hwmon.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hwmon/sl28cpld-hwmon.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/i2c/busses/i2c-bcm2835.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/i2c/busses/i2c-gpio.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/hwmon/pwm-fan.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/i2c/busses/i2c-qcom-geni.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/i2c/busses/i2c-qcom-cci.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/adc/max9611.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/iio/adc/qcom-spmi-adc5.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/drivers/iio/adc/rockchip_saradc=
.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/adc/qcom-vadc-common.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: c0000000warn=
ing: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel=
/drivers/iio/adc/rockchip_saradc.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/buffer/kfifo_buf.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/module=
s/5.14.0-next-20210903/kernel/drivers/iio/common/cros_ec_sensors/cros_ec_se=
nsors_core.ko
    ) type: 0xaarch64-linux-gnu-strip: c0000000warning: /tmp/kci/linux/buil=
d/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/iio/buffer/indu=
strialio-triggered-buffer.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/common/cros_ec_sensors/cros_e=
c_sensors.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/common/st_sensors/st_sensors.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/common/cros_ec_sensors/cros_e=
c_sensors_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/common/st_sensors/st_sensors_=
i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/common/st_sensors/st_sensors_=
spi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/light/cros_ec_light_prox.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/light/vcnl4000.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/light/isl29018.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/magnetometer/st_magn.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/magnetometer/st_magn_i2c.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/pressure/cros_ec_baro.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/magnetometer/st_magn_spi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/input/keyboard/adc-keys.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/pressure/mpl3115.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/input/keyboard/snvs_pwrkey.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/input/misc/pm8xxx-vibrator.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/input/keyboard/imx_sc_key.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/input/misc/pwm-vibra.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/input/touchscreen/atmel_mxt_ts.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/input/touchscreen/edt-ft5x06.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/input/touchscreen/goodix.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/interconnect/imx/imx-interconnect=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/interconnect/imx/imx8mq-interconn=
ect.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/qnoc-msm8916.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/icc-smd-rpm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/icc-osm-l3.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/interconnect/qcom/qnoc-sm8250.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/qnoc-sm8150.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/qnoc-sm8350.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/leds/leds-pca9532.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/leds/leds-lm3692x.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/md/dm-log.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/mailbox/bcm-flexrm-mailbox.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/md/dm-mirror.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/md/dm-mod.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/md/dm-re=
gion-hash.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/md/dm-zero.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/md/md-mod.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/cec/core/cec.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/common/videobuf2/videobuf2-=
common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/common/videobuf2/videobuf2-=
dma-sg.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/common/videobuf2/videobuf2-=
dma-contig.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/common/videobuf2/videobuf2-=
memops.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/co=
mmon/videobuf2/videobuf2-v4l2.ko  STRIP   /tmp/kci/linux/build/_modules_/li=
b/modules/5.14.0-next-20210903/kernel/drivers/media/i2c/imx219.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/common/videobuf2/videobuf2-vmalloc.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/dv=
b-core/dvb-core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/i2c/imx219.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/i2c/ov5645.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/i2c/ir-kbd-i2c.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/exynos-gsc/exynos-=
gsc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/qcom/venus/venus-c=
ore.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/mc/mc.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/qcom/venus/venus-e=
nc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/pl=
atform/rcar-fcp.ko: unsupported GNU_PROPERTY_TYPE (warning: 5/tmp/kci/linux=
/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/plat=
form/qcom/venus/venus-dec.ko) type: 0x: unsupported GNU_PROPERTY_TYPE (c000=
00005) type: 0x
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/qcom/camss/qcom-ca=
mss.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/nouveau/nouveau.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/rcar-vin/rcar-csi2=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/rcar_drif.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/buil=
d/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/platform/=
s5p-jpeg/s5p-jpeg.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/rcar_fdp1.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/rcar-vin/rcar-vin.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/s5p-jpeg/s5p-jpeg.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/sunxi/sun6i-csi/su=
n6i-csi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/s5p-mfc/s5p-mfc.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-alink-dtu-m.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-adstech-dvb-t=
-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-apac-viewcomp=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-anysee.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-astrometa-t2h=
ybrid.ko: unsupported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning:=
 /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/dri=
vers/media/platform/vsp1/vsp1.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-asus-pc39.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-asus-ps3-100.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-ati-tv-wonder=
-hd-600.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/rc=
/keymaps/rc-ati-x10.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/rc/keymaps/rc-avermedia-a16d.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedia-car=
dbus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/rc/keymaps/rc-avermedia-m135a.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedia-dvb=
t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/=
linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media=
/rc/keymaps/rc-azurewave-ad-tu700.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedia-m73=
3a-rm-k6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedia-rm-=
ks.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avertv-303.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedia.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-azurewave-ad-=
tu700.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-budget-ci-old=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-st=
rip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-202109=
03/kernel/drivers/media/rc/keymaps/rc-behold.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/rc/keymaps/rc-beelink-gs1.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-behold-columb=
us.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-cinergy-1400.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-cinergy.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-ct-90405.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-d680-dmb.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-delock-61959.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dib0700-nec.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dib0700-rc5.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-digitalnow-ti=
nytwin.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/rc=
/keymaps/rc-dntv-live-dvbt-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: =
0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dm1105-nec.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-digittrade.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/rc/keymaps/rc-dntv-live-dvb-t.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dvbsky.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dtt200u.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dvico-mce.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dvico-portabl=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-em-terratec.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-encore-enltv-=
fm53.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-encore-enltv.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/rc/keymaps/rc-eztv.ko: unsupported GNU_PROPERTY_TYPE=
 (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-encore-enltv2=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-flydvb.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/rc/keymaps/rc-evga-indtube.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-flyvideo.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-fusionhdtv-mc=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-geekbox.ko  S=
TRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kern=
el/drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-gadmei-rm008z=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-hauppauge.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-gotview7135.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-genius-tvgo-a=
11mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-hisi-poplar.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-hisi-tv-demo.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-imon-pad.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-imon-mce.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-iodata-bctv7e=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-imon-rsc.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-it913x-v1.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-it913x-v2.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-kaiomy.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-khadas.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-khamsin.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-kworld-315u.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-kworld-pc150u=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-kworld-plus-t=
v-analog.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/rc/keymaps/rc-leadtek-y04g0051.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-lme2510.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-manli.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-mecool-kii-pr=
o.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/rc/keymaps/rc-mecool-kiii-pro.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-medion-x10-or=
2x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-minix-neo.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-medion-x10-di=
gitainer.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-medion-x10.ko=
: unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/=
lib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-msi-tva=
nywhere-plus.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-msi-digivox-i=
ii.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/rc/keymaps/rc-msi-digivox-ii.ko: unsupported GNU_PRO=
PERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_module=
s_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-msi-=
tvanywhere-plus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-msi-tvanywher=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-nebula.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-nec-terratec-=
cinergy-xs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-odroid.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-norwood.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pctv-sedna.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-npgtech.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pinnacle-colo=
r.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pine64.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pinnacle-grey=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pinnacle-pctv=
-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-rea=
l-audio-220-32-keys.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/rc/keymaps/rc-pixelview-mk12.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-powercolor-re=
al-angel.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_=
/lib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pixelv=
iew.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pixelview-new=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-proteus-2309.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/li=
nux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/r=
c/keymaps/rc-rc6-mce.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-purpletv.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pv951.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-rc6-mce.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-real-audio-22=
0-32-keys.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-reddo.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-snapstream-fi=
refly.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-su3000.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-streamzap.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tanix-tx5max.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tanix-tx3mini=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tbs-nec.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-technisat-ts3=
5.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-terratec-cine=
rgy-c-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-terratec-cine=
rgy-s2-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-terratec-slim=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: war=
ning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kerne=
l/drivers/media/rc/keymaps/rc-tevii-nec.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-terratec-cine=
rgy-xs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-terratec-slim=
-2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-technisat-usb=
2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tivo.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-total-media-i=
n-hand-02.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/=
linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media=
/rc/keymaps/rc-twinhan-dtv-cab-ci.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-total-media-i=
n-hand.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tt-1500.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-trekstor.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-twinhan1027.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: c0000=
000warning:
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-vega-s9x.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-videomate-m1f=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-videomate-s35=
0.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-videomate-tv-=
pvr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-wetek-play2.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-wetek-hub.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-videostrong-k=
ii-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-winfast-usbii=
-deluxe.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-winfast.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-xbox-dvd.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-x96max.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/rc/keymaps/rc-xbox-360.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-zx-irdec.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/meson-ir.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/rc-core.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/sunxi-cir.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/mc44s803.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/tda827x.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/tda8290.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/tda9887.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/mt20xx.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/tda18271.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/tuner-types.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/tuner-simple.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/xc4000.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/tuners/xc5000.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/tuners/tuner-xc2028.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/v4l2-core/v4l2-dv-timings.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/usb/uvc/uvcvideo.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/v4l2-core/v4l2-fwnode.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/v4l2-core/v4l2-async.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/v4l2-core/v4l2-h264.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/v4l2-core/v4l2-mem2mem.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/drivers/misc/pci_endpoint_test.=
ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/memory/renesas-rpc-if.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/mfd/exynos-lpass.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/mfd/wcd934x.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/mfd/wm8994.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/misc/eeprom/at24.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/misc/eeprom/at25.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/misc/uacce/uacce.koaarch64-linux-=
gnu-strip: : unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning:   INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-ne=
xt-20210903/kernel/drivers/net/can/dev/can-dev.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/can/rcar/rcar_can.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/can/rcar/rcar_canfd.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/can/dev/can-dev.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/can/flexcan.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/dsa/ocelot/mscc_felix.ko: uns=
upported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/m=
odules/5.14.0-next-20210903/kernel/drivers/net/ethernet/atheros/atl1c/atl1c=
.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/broadcom/genet/genet=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/atheros/atl1c/atl1c.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/mellanox/mlx4/mlx4_e=
n.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/mellanox/mlx4/mlx4_c=
ore.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/broadcom/bnx2x/bnx2x=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/net/ethernet/qualcomm/emac/qcom-emac.koaarch64-linux-gnu-s=
trip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210=
903/kernel/drivers/net/ethernet/mscc/mscc_ocelot_switch_lib.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/qualcomm/rmnet/rmnet=
.ko: unsupported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules=
_/lib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmm=
ac/dwmac-altr-socfpga.ko
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/st=
mmac/dwmac-generic.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-imx.ko: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_mo=
dules_/lib/modules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro=
/stmmac/dwmac-meson8b.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-ipq806x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-meson8b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-qcom-ethqos.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-meson.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-sun8i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-rk.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-visconti.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-sunxi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/stmma=
c-platform.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/stmma=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/macvtap.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/mdio.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ipa/ipa.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/macvlan.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/mdio/mdio-bcm-unimac.ko  STRI=
P   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/=
drivers/net/pcs/pcs_xpcs.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/mdio/mdio-mux-meson-g12a.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/pcs/pcs_xpcs.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/ax88796b.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/bcm-phy-lib.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/bcm54140.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/drivers/net/phy/marvell10g.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/broadcom.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/microchip.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/marvell10g.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/net/phy/marvell.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/meson-gxl.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/mellanox/mlx5/core/m=
lx5_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/smsc.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/tap.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/=
ax88179_178a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/net/usb/cdc_ncm.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/asix.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/cdc_subset.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/lan78xx.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/dm9601.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/cdc_ether.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/net1080.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/mcs7830.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/pegasus.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/plusb.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/rtl8150.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/smsc75xx.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/=
r8152.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/net/usb/sr9800.ko: unsupported GNU_PROPERTY_TYPE (5  STRIP=
   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/d=
rivers/net/usb/zaurus.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/usbnet.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/zaurus.ko: unsupported GN=
U_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_m=
odules_/lib/modules/5.14.0-next-20210903/kernel/drivers/net/usb/smsc95xx.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/veth.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/ath/ath.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/ath/ath10k/ath10k_pc=
i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/ath/ath10k/ath10k_sn=
oc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/broadcom/brcm80211/b=
rcmutil/brcmutil.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/marvell/mwifiex/mwif=
iex_pcie.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/broadcom/brcm80211/b=
rcmfmac/brcmfmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/ath/ath10k/ath10k_co=
re.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/ti/wlcore/wlcore_sdi=
o.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/marvell/mwifiex/mwif=
iex.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/nvme/host/nvme-core.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/nfc/s3fwrn5/s3fwrn5_i2c.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/nfc/s3fwrn5/s3fwrn5.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/ti/wl18xx/wl18xx.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/nvme/host/nvme.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/ti/wlcore/wlcore.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/nvmem/nvmem_meson_efuse.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/nvmem/nvmem-rmem.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pci/controller/dwc/pci-meson.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pci/controller/dwc/pcie-tegra194.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pci/controller/pcie-brcmstb.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pci/controller/pcie-rockchip-host=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pci/endpoint/functions/pci-epf-te=
st.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/perf/fsl_imx8_ddr_perf.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/perf/arm_smmuv3_pmu.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/perf/thunderx2_pmu.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/allwinner/phy-sun6i-mipi-dphy=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/freescale/phy-fsl-imx8-mipi-d=
phy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/mediatek/phy-mtk-hdmi-drv.ko:=
 unsupported GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/l=
ib/modules/5.14.0-next-20210903/kernel/drivers/phy/qualcomm/phy-qcom-qusb2.=
ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/mediatek/phy-mtk-mipi-dsi-drv=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/phy/qualcomm/phy-qcom-qusb2.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/qualcomm/phy-qcom-qmp.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/rockchip/phy-rockchip-inno-hd=
mi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/rockchip/phy-rockchip-inno-ds=
idphy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/renesas/phy-rcar-gen3-usb3.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/rockchip/phy-rockchip-pcie.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/tegra/phy-tegra194-p2u.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pinctrl/qcom/pinctrl-lpass-lpi.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/platform/chrome/cros_ec_chardev.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/power/reset/qcom-pon.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/platform/chrome/cros_ec_typec.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/power/supply/bq25890_charger.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/drivers/power/supply/max17042_b=
attery.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/power/supply/max17042_battery.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/power/supply/sbs-battery.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-bcm2835.ko  INSTALL /tmp/=
kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/p=
wm/pwm-imx27.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-cros-ec.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-imx27.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-mediatek.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-meson.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-mtk-disp.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-rcar.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-sl28cpld.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-sun4i.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-tegra.ko: unsupported GNU=
_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.=
0-next-20210903/kernel/drivers/pwm/pwm-visconti.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/regulator/tps65132-regulator.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-visconti.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_common.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/regulator/vctrl-regulator.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_pil_info.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_q6v5_mss.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_q6v5_pas.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_sysmon.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/remoteproc/qcom_q6v5.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/reset/reset-berlin.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers=
/reset/reset-meson-audio-arb.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/reset/reset-raspberrypi.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers=
/reset/reset-qcom-pdc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-hym8563.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-ds1307.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-imx-sc.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-m41t80.ko: unsupported GN=
U_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14=
.0-next-20210903/kernel/drivers/rtc/rtc-pcf2127.ko
    ) type: 0xaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-meson-vrtc.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-pcf2127.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-pcf85363.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-pm8xxx.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-rk808.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-rv3028.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-rx8581.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-snvs.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-rv8803.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/scsi/raid_class.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/scsi/mpt3sas/mpt3sas.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/scsi/ufs/ufs_qcom.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/slimbus/slim-qcom-ctrl.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/slimbus/slim-qcom-ngd-ctrl.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/slimbus/slimbus.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soc/amlogic/meson-canvas.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soc/qcom/apr.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soc/mediatek/mtk-devapc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soc/qcom/mdt_loader.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soc/qcom/pdr_interface.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soc/qcom/qmi_helpers.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soc/qcom/rmtfs_mem.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soc/qcom/socinfo.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soundwire/soundwire-bus.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soundwire/soundwire-qcom.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip:
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/spi/spi-bcm2835.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-bcm2835aux.ko: unsupporte=
d GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/=
5.14.0-next-20210903/kernel/drivers/spi/spi-dw-mmio.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/spi/spi-bitbang.ko: unsupported GNU_PROPERTY_TYPE (5) type=
: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-dw-mmio.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-dw.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/spi/spi-geni-qcom.ko: unsupported GNU_PROPERTY_TYPE (5) ty=
pe: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-imx.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-meson-spicc.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-qcom-qspi.ko  STRIP   /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers=
/spi/spi-rpc-if.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-meson-spifc.ko: unsupport=
ed GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/modules=
/5.14.0-next-20210903/kernel/drivers/thermal/broadcom/brcmstb_thermal.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-sh-msiof.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-rpc-if.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spidev.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/broadcom/bcm2835_thermal.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/broadcom/bcm2711_thermal.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: c000=
0000warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/thermal/broadcom/brcmstb_thermal.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/imx8mm_thermal.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/staging/media/hantro/hantro-vpu.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/imx_sc_thermal.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/qcom/qcom-spmi-temp-alarm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/qoriq_thermal.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/rockchip_thermal.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/tegra/tegra-soctherm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/tegra/tegra-bpmp-thermal.=
ko: unsupported GNU_PROPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_=
/lib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_=
ecm_subset.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/class/cdc-acm.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/u_ether.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadg=
et/function/u_serial.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/usb/gadget/function/usb_f_ecm.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/linux/build/_modules_/lib/modu=
les/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_obex.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_acm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers=
/usb/gadget/function/usb_f_ecm_subset.ko/tmp/kci/linux/build/_modules_/lib/=
modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_eem.k=
o: unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (5) type:=
 0x5c0000000) type: 0x
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_fs.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_obex.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_mass_st=
orage.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_ncm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_rndis.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_serial.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/usb/gadget/libcomposite.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0x  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-nex=
t-20210903/kernel/drivers/usb/host/xhci-pci-renesas.ko
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadget/udc/tegra-xu=
dc.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/host/xhci-pci-renesas.ko: uns=
upported GNU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/usb/gadg=
et/udc/tegra-xudc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/host/xhci-pci.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/renesas_usbhs/renesas_usbhs.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/serial/ftdi_sio.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/serial/cp210x.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/serial/option.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/serial/usb_wwan.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/typec/hd3ss3220.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/usb/serial/usbserial.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/typec/tcpm/fusb302.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/typec/tcpm/tcpci.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/typec/tcpm/tcpm.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/video/backlight/pwm_bl.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: warning: /tmp/=
kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/u=
sb/typec/typec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/typec/tipd/tps6598x.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/video/backlight/lp855x_bl.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/watchdog/imx_sc_wdt.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/watchdog/meson_gxbb_wdt.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/watchdog/meson_wdt.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/watchdog/qcom-wdt.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/watchdog/sl28cpld_wdt.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/fs/fuse/cuse.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/fs/fuse/fuse.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/fs/fuse/fuse.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/crc-ccitt.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/crypto/libarc4.ko: unsupported GNU_PR=
OPERTY_TYPE (  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-ne=
xt-20210903/kernel/lib/crypto/libsha256.ko
    aarch64-linux-gnu-strip: 5warning: /tmp/kci/linux/build/_modules_/lib/m=
odules/5.14.0-next-20210903/kernel/fs/nfs/blocklayout/blocklayoutdriver.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/fs/overlayfs/overlay.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/crypto/libchacha.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/crypto/libcurve25519-generic.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/crypto/libdes.koaarch64-linux-gnu-str=
ip:   STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-202109=
03/kernel/lib/crypto/libsm4.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/lib/crypto/libsha256.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/crypto/libsm4.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/libcrc32c.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/raid6/raid6_pq.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/net/802/garp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/fs/btrfs/btrfs.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/zstd/zstd_compress.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/802/mrp.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/802/p8022.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/802/psnap.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/net/802=
/stp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/can/can-gw.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/bluetooth/hidp/hidp.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/can/can-raw.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/can/can-bcm.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/can/can.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/dsa/dsa_core.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/dsa/tag_ocelot.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/bluetooth/bluetooth.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/bridge/bridge.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/dsa/tag_ocelot_8021q.ko: unsupported =
GNU_PROPERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.=
14.0-next-20210903/kernel/net/ipv4/netfilter/ipt_REJECT.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/ip_tables.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/net/ipv4/netfilter/ipt_REJECT.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv4/ip_tunnel.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/iptable_filter.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/iptable_mangle.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/iptable_nat.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/nf_reject_ipv4.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-strip:
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/net/ipv4/netfilter/nf_defrag_ipv4.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv4/tunnel4.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/ip6_tables.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/ip6t_REJECT.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/net/ipv6/netfilter/ip6table_filter.ko: unsupported GNU_PROPERTY_TY=
PE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/ip6table_mangle.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/ip6table_nat.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/nf_reject_ipv6.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/nf_defrag_ipv6.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/sit.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/llc/llc.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/nf_log_syslog.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/ipv6.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/xt_CHECKSUM.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/x_tables.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/nf_conntrack.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/xt_LOG.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/net/netfilter/nf=
_nat.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xwarning: /tmp/kci/linux/=
build/_modules_/lib/modules/5.14.0-next-20210903/kernel/net/netfilter/xt_ad=
drtype.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/xt_MASQUERADE.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/xt_conntrack.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/xt_nat.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/mac80211/mac80211.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/xt_tcpudp.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/qrtr/ns.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/nfc/nci/nci.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/nfc/nfc.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/qrtr/qrtr-smd.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/qrtr/qrtr-tun.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/qrtr/qrtr.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/act_gact.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/act_gate.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/act_mirred.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/rfkill/rfkill.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/cls_basic.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/sch_cbs.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/cls_flower.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/sch_ingress.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/sch_etf.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/sch_mqprio.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/sch_taprio.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/hda/snd-hda-core.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-ak4613.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/bcm/snd-soc-bcm2835-i2s.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/sound/pci/hda/sn=
d-hda-codec-hdmi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/sound/pci/hda/snd-hda-codec.ko: unsupported GNU_PROPERTY_TYPE (5) =
type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-cros-ec-codec.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/wireless/cfg80211.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/pci/hda/snd-hda-tegra.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-da7219.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-dmic.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modules_/lib/modul=
es/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-gtm601.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-es7134.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-es7241.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/sound/soc/codecs/snd-soc-hdmi-codec.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-gtm601.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs=
/snd-soc-lpass-wsa-macro.kowarning: : unsupported GNU_PROPERTY_TYPE (/tmp/k=
ci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/sound/soc/=
codecs/snd-soc-max98357a.ko: unsupported GNU_PROPERTY_TYPE (55) type: 0x) t=
ype: 0xc0000000c0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-lpass-va-macro.k=
o  INSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/=
kernel/sound/soc/codecs/snd-soc-pcm3168a-i2c.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-max98927.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/_modu=
les_/lib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-pcm31=
68a.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-msm8916-analog.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-pcm3168a-i2c.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-msm8916-digital.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-pcm3168a.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rl6231.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rt5514-spi.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rt5514.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rt5645.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/sound/soc/codecs=
/snd-soc-simple-amplifier.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/sound/soc/codecs/snd-soc-rt5663.ko: unsupported GNU_PROPERTY_TYPE =
(5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rt5659.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-sgtl5000.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-simple-mux.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-spdif-rx.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-spdif-tx.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-tas571x.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wcd-mbhc.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wcd934x.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wm-hubs.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wm8904.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wm8960.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wm8962.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wm8994.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wsa881x.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/imx-pcm-dma.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0x  INSTALL /tmp/kci/linux/build/_modules_/lib=
/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-asoc-card.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-asoc-card.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-audmix.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-asrc.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-easrc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-micfil.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-spdif.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/sound/soc/fsl/sn=
d-soc-fsl-sai.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/sound/soc/fsl/snd-soc-fsl-esai.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-ssi.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-imx-audmix.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-imx-audmux.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/generic/snd-soc-audio-graph-car=
d.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/generic/snd-soc-simple-card-uti=
ls.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-imx-sgtl5000.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-imx-spdif.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/generic/snd-soc-simple-card.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-fifo.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-aiu.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-frddr.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-a=
xg-spdifout.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-sound-c=
ard.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-spdifin=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-spdifou=
t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-tdm-for=
matter.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-tdm-int=
erface.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-tdmin.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-tdmout.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-toddr.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-card-utils.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-codec-glue.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-g12a-toacod=
ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-g12a-tohdmi=
tx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000aarch64-linux-gnu-=
strip: warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021=
0903/kernel/sound/soc/meson/snd-soc-meson-gx-sound-card.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-t9015.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6adm.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6afe-clocks.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6afe-dai.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6asm-dai.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6afe.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6asm.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6core.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6dsp-common.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6routing.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-apq8096.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-apq8016-sbc.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-lpass-apq8016.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-lpass-cpu.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/sound/soc/qcom/snd-soc-lpass-platform.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-qcom-common.ko  IN=
STALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kerne=
l/sound/soc/rockchip/snd-soc-rockchip-spdif.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-sdm845.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-sm8250.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/rockchip/snd-soc-rk3399-gru-sou=
nd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/rockchip/snd-soc-rockchip-i2s.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/rockchip/snd-soc-rockchip-pcm.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/rockchip/snd-soc-rockchip-rt564=
5.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/rockchip/snd-soc-rockchip-spdif=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/sh/rcar/snd-soc-rcar.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/sunxi/sun4i-i2s.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/sunxi/sun4i-spdif.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra-audio-graph=
-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/sound/soc/tegra/snd-soc-tegra-pcm.ko: unsupported GNU_PROPERTY_TYP=
E (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra186-dspk.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra210-admaif.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra210-ahub.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/sound/soc/tegra/=
snd-soc-tegra210-i2s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/sound/soc/tegra/snd-soc-tegra210-dmic.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-12) =E2=80=94 PASS, 0 er=
rors, 834 warnings, 0 section mismatches

Warnings:
    fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to silence=
 this warning
    1 warning generated.
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: warning=
: variable 'err' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: note: in=
itialize the variable 'err' to silence this warning
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: warning:=
 variable 'err' is used uninitialized whenever switch case is taken [-Wsome=
times-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: warning:=
 variable 'err' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: note: in=
itialize the variable 'err' to silence this warning
    3 warnings generated.
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/arch/arm64/lib/xor-neon.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/af_alg.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/algif_rng.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/cbc.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/authenc.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/blake2b_generic.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/ccm.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/authencesn.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/cmac.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/crypto_engine.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/ctr.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/curve25519-generic.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/crypto/des_generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc=
0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/dh_generic.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/ecc.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/ecdh_generic.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/ecb.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/gcm.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/ghash-generic.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/md5.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/sha256_generic.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/sm4_generic.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/crypto/=
xxhash_generic.ko/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-202=
10903/kernel/crypto/sm3_generic.ko: unsupported GNU_PROPERTY_TYPE (: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc00000005
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/sha3_generic.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/xor.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/base/regmap/regmap-sdw.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/crypto/xts.ko: unsupported GNU_PROPERTY_T=
YPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/base/regmap/regmap-slimbus.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: aarch64-linux-gnu-strip: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/bluetoot=
h/btintel.ko: unsupported GNU_PROPERTY_TYPE (warning: 5/tmp/kci/linux/build=
/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/block/nbd.ko) ty=
pe: 0x: unsupported GNU_PROPERTY_TYPE (c00000005
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/bluetooth/btbcm.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/bluetooth/btrtl.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/bluetooth/btusb.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/bluetooth/btqca.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/bluetooth/hci_uart.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/bus/tegra-aconnect.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/bcm2835-rng.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/arm_smccc_trng.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/cavium-rng.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/hisi-rng.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/cavium-rng-vf.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/exynos-trng.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/iproc-rng200.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/meson-rng.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/char/hw_random/mtk-rng.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/omap-rng.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/optee-rng.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/xgene-rng.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/ipmi/ipmi_devintf.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/hw_random/rng-core.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/char/ipm=
i/ipmi_si.koaarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules=
_/lib/modules/5.14.0-next-20210903/kernel/drivers/clk/clk-bd718x7.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/char/ipmi/ipmi_msghandler.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/clk/meson/axg-audio.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/clk/bcm/clk-raspberrypi.ko: unsupported GNU_PROPERTY_TYPE =
(  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/=
kernel/drivers/clk/meson/clk-phase.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/clk/meson/clk-phase.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/clk/qcom/camcc-sdm845.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/clk/meson/sclk-div.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/clk/qcom/lpass-gfm-sm8250.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/cpufreq/cppc_cpufreq.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/cpufreq/cpufreq_conservative.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/cpufreq/cpufreq_powersave.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/cpufreq/imx-cpufreq-dt.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/cpufreq/raspberrypi-cpufreq.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/cpufreq/sun50i-cpufreq-nvmem.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/allwinner/sun8i-ce/sun8i-c=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/amlogic/amlogic-gxl-crypto=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/bcm/bcm_crypto_spu.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/caam/caamhash_desc.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/caam/caam.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/caam/error.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/caam/caamalg_desc.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/caam/caam_jr.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/caam/dpaa2_caam.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/ccree/ccree.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/hisi_qm.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/zip/hisi_zip.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/trng/hisi-trng-v=
2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/hpre/hisi_hpre.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/hisilicon/sec2/hisi_sec2.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/crypto/qcom-rng.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/devfreq/governor_userspace.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/devfreq/imx-bus.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/devfreq/imx8m-ddrc.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/dma/sh/usb-dmac.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/dma/sun6i-dma.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/dma/tegra210-adma.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/dma/bcm-sba-raid.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/edac/layerscape_edac_mod.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/extcon/extcon-ptn5150.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/firmware/stratix10-rsu.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/fpga/fpga-bridge.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/fpga/altera-freeze-bridge.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/fpga/fpga-region.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/fpga/of-fpga-region.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/fpga/stratix10-soc.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gnss/gnss.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gnss/gnss-serial.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpio/gpio-bd9571mwv.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/gpio/gpio-altera.ko: unsupported GNU_PROPERTY_TYPE (5) typ=
e: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpio/gpio-regmap.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gnss/gnss-mtk.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpio/gpio-sl28cpld.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpio/gpio-wcd934x.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/analogix/analogix_=
dp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/lontium-lt8912b.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/arm/mali-dp.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/lontium-lt9611uxc.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/adv7511/adv7511.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/lontium-lt9611.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/display-connector.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/nwl-dsi.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/parade-ps8640.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/simple-bridge.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/gpu/drm/bridge/sii902x.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi-a=
hb-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi-c=
ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i=
2s-audio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/synopsys/dw-mipi-d=
si.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/thc63lvd1024.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/ti-sn65dsi86.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000  INSTALL /tmp/kci/linux/b=
uild/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/gpu/drm/drm_=
kms_helper.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/bridge/synopsys/dw-hdmi.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/drm_dp_aux_bus.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/drm_ttm_helper.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/drm.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/drm_vram_helper.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/drm_kms_helper.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/etnaviv/etnaviv.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/exynos/exynosdrm.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/hisilicon/kirin/kirin-drm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/hisilicon/hibmc/hibmc-drm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/i2c/ch7006.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/i2c/sil164.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/i2c/tda998x.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/imx/dcss/imx-dcss.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/mediatek/mediatek-drm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/mediatek/mediatek-drm-hdm=
i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/lima/lima.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/meson/meson-drm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/meson/meson_dw_hdmi.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-boe-tv101wum-=
nl6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-mantix-mlaf05=
7we51.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-raydium-rm671=
91.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/mxsfb/mxsfb.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-lvds.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-simple.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-sitronix-st77=
03.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panel/panel-truly-nt35597=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/panfrost/panfrost.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/pl111/pl111_drm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/rcar-du/rcar_cmm.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/rcar-du/rcar_lvds.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/scheduler/gpu-sched.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/rcar-du/rcar_dw_hdmi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/rockchip/rockchipdrm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/msm/msm.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i-backend.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i-frontend.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i-drm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i_tv.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun6i_drc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun4i-tcon.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun8i-drm-hdmi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun8i-mixer.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/sun4i/sun8i_tcon_top.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/ttm/ttm.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hid/hid-multitouch.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/host1x/host1x.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/tegra/tegra-drm.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/vc4/vc4.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hid/i2c-hid/i2c-hid-of.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hid/i2c-hid/i2c-hid-acpi.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hid/i2c-hid/i2c-hid.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hwmon/ina2xx.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hwmon/ina3221.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hwmon/pwm-fan.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hwmon/lm90.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hwmon/raspberrypi-hwmon.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/hwmon/sl28cpld-hwmon.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/i2c/busses/i2c-gpio.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/i2c/busses/i2c-bcm2835.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/i2c/busses/i2c-qcom-cci.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/adc/qcom-spmi-vadc.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/iio/adc/=
rockchip_saradc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/iio/buffer/industrialio-triggered-buffer.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/adc/max9611.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/buffer/kfifo_buf.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/adc/qcom-vadc-common.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/common/cros_ec_sensors/cros_e=
c_sensors.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/adc/qcom-spmi-adc5.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/i2c/busses/i2c-qcom-geni.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/common/cros_ec_sensors/cros_e=
c_sensors_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/common/st_sensors/st_sensors.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/common/st_sensors/st_sensors_=
spi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/common/st_sensors/st_sensors_=
i2c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/light/isl29018.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/light/cros_ec_light_prox.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/light/vcnl4000.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/magnetometer/st_magn.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/magnetometer/st_magn_i2c.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/magnetometer/st_magn_spi.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/pressure/cros_ec_baro.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/pressure/mpl3115.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/input/keyboard/adc-keys.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/input/keyboard/imx_sc_key.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/input/keyboard/snvs_pwrkey.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/input/misc/pm8xxx-vibrator.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/input/touchscreen/atmel_mxt_ts.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/input/misc/pwm-vibra.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/input/touchscreen/edt-ft5x06.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/input/touchscreen/goodix.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/icc-osm-l3.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/icc-smd-rpm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/interconnect/imx/imx-interconnect=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/qnoc-msm8916.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/interconnect/imx/imx8mq-interconn=
ect.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/qnoc-sm8150.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/qnoc-sm8250.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/interconnect/qcom/qnoc-sm8350.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/leds/leds-lm3692x.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/leds/leds-pca9532.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/mailbox/bcm-flexrm-mailbox.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/gpu/drm/nouveau/nouveau.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/md/dm-mirror.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/md/dm-log.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/md/dm-region-hash.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/md/dm-zero.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/md/dm-mod.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/md/md-mod.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/cec/core/cec.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/common/videobuf2/videobuf2-=
dma-sg.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/common/videobuf2/videobuf2-=
common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/common/videobuf2/videobuf2-=
dma-contig.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/common/videobuf2/videobuf2-=
v4l2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/common/videobuf2/videobuf2-=
memops.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/common/videobuf2/videobuf2-=
vmalloc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/dvb-core/dvb-core.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/i2c/ir-kbd-i2c.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/i2c/ov5645.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/i2c/imx219.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/mc/mc.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/exynos-gsc/exynos-=
gsc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/rcar-fcp.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/qcom/camss/qcom-ca=
mss.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/qcom/venus/venus-d=
ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/rcar-vin/rcar-csi2=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/qcom/venus/venus-e=
nc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/qcom/venus/venus-c=
ore.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/rcar-vin/rcar-vin.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/rcar_drif.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/rcar_fdp1.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/s5p-jpeg/s5p-jpeg.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/sunxi/sun6i-csi/su=
n6i-csi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/platform/s5p-mfc/s5p-mfc.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-adstech-dvb-t=
-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-apac-viewcomp=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-anysee.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-astrometa-t2h=
ybrid.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-alink-dtu-m.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-asus-pc39.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/platform/vsp1/vsp1.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-asus-ps3-100.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-ati-tv-wonder=
-hd-600.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-ati-x10.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedia-a16=
d.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-ave=
rmedia-m733a-rm-k6.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedia-m13=
5a.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedia-m73=
3a-rm-k6.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedia-dvb=
t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedia-rm-=
ks.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avermedia.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-avertv-303.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-beelink-gs1.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-azurewave-ad-=
tu700.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-behold.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-budget-ci-old=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-behold-columb=
us.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-cinergy-1400.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-cinergy.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-ct-90405.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-delock-61959.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dib0700-nec.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-d680-dmb.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dib0700-rc5.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/rc/keymaps/rc-digitalnow-tinytwin.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dm1105-nec.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-digittrade.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dntv-live-dvb=
-t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dntv-live-dvb=
t-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dtt200u.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dvbsky.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dvico-mce.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-dvico-portabl=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-encore-enltv-=
fm53.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-em-terratec.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-encore-enltv.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-evga-indtube.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-encore-enltv2=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-eztv.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-flydvb.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-flyvideo.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-gadmei-rm008z=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-geekbox.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-fusionhdtv-mc=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-genius-tvgo-a=
11mce.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-hauppauge.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-gotview7135.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-imon-mce.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-hisi-tv-demo.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-hisi-poplar.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-imon-pad.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers=
/media/rc/keymaps/rc-iodata-bctv7e.ko/tmp/kci/linux/build/_modules_/lib/mod=
ules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-it913x-v1.ko: =
unsupported GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (5) type: 0x=
c00000005) type: 0x
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-khadas.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-kaiomy.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-it913x-v2.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-imon-rsc.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-kworld-315u.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-kworld-plus-t=
v-analog.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-kworld-pc150u=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-khamsin.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-leadtek-y04g0=
051.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-lme2510.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-manli.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-mecool-kii-pr=
o.ko: unsupported GNU_PROPERTY_TYPE (5  INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-med=
ion-x10.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-mecool-kiii-p=
ro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-medion-x10-di=
gitainer.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-minix-neo.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-medion-x10-or=
2x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-medion-x10.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-msi-digivox-i=
i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-msi-digivox-i=
ii.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-msi-tvanywher=
e-plus.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-msi-tvanywher=
e.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-nec-terratec-=
cinergy-xs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-nebula.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-norwood.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-npgtech.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-odroid.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pinnacle-colo=
r.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pine64.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pctv-sedna.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/rc/keymaps/rc-pinnacle-grey.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pixelview-002=
t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pinnacle-pctv=
-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pixelview-mk1=
2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pixelview-new=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pixelview.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-powercolor-re=
al-angel.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-proteus-2309.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers=
/media/rc/keymaps/rc-purpletv.ko/tmp/kci/linux/build/_modules_/lib/modules/=
5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-pv951.ko: unsupport=
ed GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55) type: 0x) type: =
0xc0000000c0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-rc6-mce.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-real-audio-22=
0-32-keys.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-snapstream-fi=
refly.ko: unsupported GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: =
/tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/driv=
ers/media/rc/keymaps/rc-reddo.ko5: unsupported GNU_PROPERTY_TYPE () type: 0=
x5c0000000) type: 0x
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-su3000.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-streamzap.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tanix-tx3mini=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tbs-nec.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tanix-tx5max.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-technisat-ts3=
5.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-technisat-usb=
2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-terratec-cine=
rgy-c-pci.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-terratec-cine=
rgy-s2-hd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-terratec-cine=
rgy-xs.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-terratec-slim=
-2.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-terratec-slim=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tivo.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tevii-nec.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-trekstor.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-total-media-i=
n-hand.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-total-media-i=
n-hand-02.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-tt-1500.ko  I=
NSTALL /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kern=
el/drivers/media/rc/keymaps/rc-vega-s9x.ko
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-vid=
eomate-m1f.ko
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/media/rc/keymaps/rc-twinhan1027.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-vega-s9x.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-videomate-m1f=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-videomate-s35=
0.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-videomate-tv-=
pvr.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-videostrong-k=
ii-pro.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-wetek-play2.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-wetek-hub.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-winfast-usbii=
-deluxe.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-winfast.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-x96max.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-xbox-dvd.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-xbox-360.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/keymaps/rc-zx-irdec.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/meson-ir.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/rc-core.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/rc/sunxi-cir.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/tda827x.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/mt20xx.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/tda8290.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/tuner-simple.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/tda18271.ko: unsuppo=
rted GNU_PROPERTY_TYPE (aarch64-linux-gnu-strip: warning: /tmp/kci/linux/bu=
ild/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/media/tuners/=
mc44s803.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/tda9887.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/tuner-types.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/tuner-xc2028.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/xc5000.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/v4l2-core/v4l2-async.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/v4l2-core/v4l2-fwnode.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/v4l2-core/v4l2-h264.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/v4l2-core/v4l2-dv-timings.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/tuners/xc4000.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/usb/uvc/uvcvideo.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/v4l2-core/v4l2-mem2mem.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/media/v4l2-core/videodev.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/memory/renesas-rpc-if.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/mfd/exynos-lpass.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/mfd/wm8994.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/misc/eeprom/at24.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/mfd/wcd934x.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/misc/eeprom/at25.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/misc/pci_endpoint_test.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/misc/uacce/uacce.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/can/flexcan.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/can/dev/can-dev.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/can/rcar/rcar_canfd.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/atheros/atl1c/atl1c.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/can/rcar/rcar_can.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/dsa/ocelot/mscc_felix.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/broadcom/genet/genet=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/broadcom/bnx2x/bnx2x=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/mellanox/mlx4/mlx4_c=
ore.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/mscc/mscc_ocelot_swi=
tch_lib.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/mellanox/mlx4/mlx4_e=
n.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac-altr-socfpga.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-generic.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/qualcomm/rmnet/rmnet=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/qualcomm/emac/qcom-e=
mac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-imx.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-ipq806x.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-meson.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-meson8b.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-rk.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-qcom-ethqos.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-sun8i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/stmma=
c-platform.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/dwmac=
-sunxi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/stmicro/stmmac/stmma=
c.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ipa/ipa.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/mdio.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/macvlan.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/macvtap.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/mdio/mdio-bcm-unimac.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/mdio/mdio-mux-meson-g12a.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/ax88796b.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/pcs/pcs_xpcs.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/bcm-phy-lib.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/ethernet/mellanox/mlx5/core/m=
lx5_core.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/bcm54140.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/bcm7xxx.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/broadcom.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/marvell.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/marvell10g.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/meson-gxl.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/microchip.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/phy/smsc.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/tap.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/ax88179_178a.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/net/usb/asix.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/cdc_ether.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/cdc_ncm.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/cdc_subset.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/dm9601.ko  INSTALL /tmp/k=
ci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/ne=
t/usb/pegasus.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/lan78xx.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/mcs7830.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/net1080.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/pegasus.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/plusb.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/rtl8150.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/r8152.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/smsc75xx.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/sr9800.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/smsc95xx.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/usbnet.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/veth.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/usb/zaurus.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/ath/ath.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/marvell/mwifiex/mwif=
iex_pcie.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/ath/ath10k/ath10k_pc=
i.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/broadcom/brcm80211/b=
rcmutil/brcmutil.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/ti/wlcore/wlcore_sdi=
o.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/ti/wl18xx/wl18xx.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/ath/ath10k/ath10k_co=
re.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/broadcom/brcm80211/b=
rcmfmac/brcmfmac.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/ti/wlcore/wlcore.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/ath/ath10k/ath10k_sn=
oc.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/net/wireless/marvell/mwifiex/mwif=
iex.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/nfc/s3fwrn5/s3fwrn5.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/nvmem/nvmem-rmem.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/nfc/s3fwrn5/s3fwrn5_i2c.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/nvme/host/nvme.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/nvme/host/nvme-core.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/pci/controller/dwc/pci-meson.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000  STRIP   /tmp/kci/linux/build/_modules_/lib/modul=
es/5.14.0-next-20210903/kernel/drivers/pci/controller/pcie-rockchip-host.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pci/controller/dwc/pcie-tegra194.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pci/controller/pcie-brcmstb.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pci/controller/pcie-rockchip-host=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pci/endpoint/functions/pci-epf-te=
st.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/perf/arm_smmuv3_pmu.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/perf/fsl_imx8_ddr_perf.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/allwinner/phy-sun6i-mipi-dphy=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/freescale/phy-fsl-imx8-mipi-d=
phy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/mediatek/phy-mtk-mipi-dsi-drv=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/mediatek/phy-mtk-hdmi-drv.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/perf/thunderx2_pmu.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/qualcomm/phy-qcom-qmp.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/qualcomm/phy-qcom-qusb2.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/renesas/phy-rcar-gen3-usb3.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/rockchip/phy-rockchip-inno-ds=
idphy.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/rockchip/phy-rockchip-inno-hd=
mi.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/tegra/phy-tegra194-p2u.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pinctrl/qcom/pinctrl-lpass-lpi.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/phy/rockchip/phy-rockchip-pcie.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/platform/chrome/cros_ec_typec.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/power/reset/qcom-pon.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/platform/chrome/cros_ec_chardev.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/power/supply/bq25890_charger.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/power/supply/max17042_battery.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/power/supply/bq25980_charger.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/power/supply/sbs-battery.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-bcm2835.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-cros-ec.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-imx27.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-mediatek.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-mtk-disp.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-meson.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-rcar.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-sun4i.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-sl28cpld.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-visconti.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/pwm/pwm-tegra.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/regulator/vctrl-regulator.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/regulator/tps65132-regulator.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_pil_info.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_common.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_q6v5.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_q6v5_mss.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_q6v5_pas.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/reset/reset-berlin.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/reset/reset-meson-audio-arb.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/remoteproc/qcom_sysmon.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/reset/reset-qcom-pdc.ko: unsupported GNU_PROPERTY_TYPE (5)=
 type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/reset/reset-raspberrypi.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rpmsg/qcom_glink_smem.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-ds1307.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/drivers/rtc/rtc-fsl-ftm-alarm.ko: unsupported GNU_PROPERTY_TYPE (5=
) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-imx-sc.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-hym8563.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-pcf2127.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-pm8xxx.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-pcf85363.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-meson-vrtc.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-rk808.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-m41t80.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-rv3028.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-rv8803.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-rx8581.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/rtc/rtc-snvs.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/scsi/mpt3sas/mpt3sas.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/scsi/raid_class.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/scsi/ufs/ufs_qcom.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/slimbus/slim-qcom-ngd-ctrl.ko: un=
supported GNU_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/m=
odules/5.14.0-next-20210903/kernel/drivers/slimbus/slim-qcom-ctrl.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/slimbus/slimbus.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/slimbus/slim-qcom-ctrl.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soc/amlogic/meson-canvas.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soc/mediatek/mtk-devapc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soc/qcom/mdt_loader.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soc/qcom/apr.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soc/qcom/qmi_helpers.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soc/qcom/pdr_interface.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soc/qcom/rmtfs_mem.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soc/qcom/socinfo.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soundwire/soundwire-bus.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/soundwire/soundwire-qcom.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-bcm2835.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-bcm2835aux.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-bitbang.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-dw-mmio.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   INSTALL /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/drivers/spi/spi-imx.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-meson-spicc.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-geni-qcom.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-imx.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-meson-spifc.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-qcom-qspi.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-rpc-if.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spi-sh-msiof.ko: unsupported =
GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/spi/spidev.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/broadcom/bcm2711_thermal.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/broadcom/bcm2835_thermal.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/staging/media/hantro/hantro-vpu.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/imx8mm_thermal.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/imx_sc_thermal.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/broadcom/brcmstb_thermal.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/qcom/qcom-spmi-temp-alarm=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning:   STRIP   /tmp/kci/linux/build/_modul=
es_/lib/modules/5.14.0-next-20210903/kernel/drivers/thermal/rockchip_therma=
l.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/rockchip_thermal.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/tegra/tegra-bpmp-thermal.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/class/cdc-acm.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/thermal/tegra/tegra-soctherm.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/u_ether.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/u_serial.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_acm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_ecm_sub=
set.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_ecm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_mass_st=
orage.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_eem.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_ncm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_rndis.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/libcomposite.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_obex.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_serial.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/function/usb_f_fs.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/udc/tegra-xudc.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/gadget/udc/renesas_usb3.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/host/xhci-pci-renesas.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/renesas_usbhs/renesas_usbhs.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/serial/option.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/host/xhci-pci.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/serial/ftdi_sio.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/serial/usb_wwan.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/serial/cp210x.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/typec/hd3ss3220.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/typec/tcpm/fusb302.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/serial/usbserial.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/typec/tcpm/tcpci.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/typec/tipd/tps6598x.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/video/backlight/lp855x_bl.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/usb/typec/typec.ko: unsupported G=
NU_PROPERTY_TYPE (5aarch64-linux-gnu-strip: ) type: 0xwarning: c0000000/tmp=
/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/drivers/=
usb/typec/tcpm/tcpm.ko: unsupported GNU_PROPERTY_TYPE (
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/video/backlight/pwm_bl.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/watchdog/imx_sc_wdt.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/watchdog/meson_gxbb_wdt.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/watchdog/qcom-wdt.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/watchdog/sl28cpld_wdt.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/watchdog/sunxi_wdt.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/drivers/watchdog/meson_wdt.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/fs/fuse/cuse.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/fs/fuse/fuse.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/fs/nfs/blocklayout/blocklayoutdriver.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/crc-ccitt.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/fs/overlayfs/overlay.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/crypto/libchacha.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/crypto/libarc4.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/crypto/libdes.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/crypto/libcurve25519-generic.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/crypto/libsha256.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/fs/btrfs/btrfs.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/libcrc32c.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/crypto/libsm4.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/raid6/raid6_pq.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/802/garp.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/net/802/mrp.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/802/psnap.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/802/p8022.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/802/stp.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/lib/zstd/zstd_compress.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/8021q/8021q.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/bluetooth/bluetooth.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/can/can-gw.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/bluetooth/hidp/hidp.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/can/can-raw.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/can/can-bcm.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/can/can.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/dsa/tag_ocelot.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/bridge/bridge.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/dsa/dsa_core.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/ip_tables.koaarch64-li=
nux-gnu-strip: : unsupported GNU_PROPERTY_TYPE (warning: /tmp/kci/linux/bui=
ld/_modules_/lib/modules/5.14.0-next-20210903/kernel/net/dsa/tag_ocelot_802=
1q.ko5: unsupported GNU_PROPERTY_TYPE () type: 0x5c0000000) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/ipt_REJECT.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/iptable_filter.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/iptable_mangle.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv4/ip_tunnel.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/nf_defrag_ipv4.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/iptable_nat.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv4/netfilter/nf_reject_ipv4.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/ip6_tables.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv4/tunnel4.ko: unsupported GNU_PROP=
ERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/ip6t_REJECT.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/nf_defrag_ipv6.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/ip6table_filter.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/ip6table_nat.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/ip6table_mangle.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/ipv6.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/netfilter/nf_reject_ipv6.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/llc/llc.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/nf_nat.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/ipv6/sit.ko: unsupported GNU_PROPERTY=
_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/x_tables.ko: unsupported GN=
U_PROPERTY_TYPE (  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.=
0-next-20210903/kernel/net/netfilter/xt_CHECKSUM.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/xt_CHECKSUM.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/nf_conntrack.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/nf_log_syslog.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/xt_LOG.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/xt_addrtype.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/xt_nat.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/xt_tcpudp.ko: unsupported G=
NU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/nfc/nci/nci.ko: unsupported GNU_PROPE=
RTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/xt_conntrack.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/netfilter/xt_MASQUERADE.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/qrtr/ns.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/mac80211/mac80211.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/nfc/nfc.ko: unsupported GNU_PROPERTY_=
TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/qrtr/qrtr-tun.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/qrtr/qrtr.ko: unsupported GNU_PROPERT=
Y_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/net/qrtr/qrtr-smd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0=
000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/rfkill/rfkill.ko: unsupported GNU_PRO=
PERTY_TYPE (5  STRIP   /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-ne=
xt-20210903/kernel/net/sched/act_gact.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/act_gact.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/act_mirred.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/act_gate.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/build/_modules_/lib/module=
s/5.14.0-next-20210903/kernel/net/sched/cls_basic.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/cls_basic.ko: unsupported GNU_P=
ROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/sch_etf.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/sch_cbs.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/cls_flower.ko: unsupported GNU_=
PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/net/sched/sch_ta=
prio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/net/sched/sch_mqprio.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0=
xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/sched/sch_ingress.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/hda/snd-hda-core.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/pci/hda/snd-hda-codec-hdmi.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/net/wireless/cfg80211.ko: unsupported GNU=
_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/pci/hda/snd-hda-tegra.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/bcm/snd-soc-bcm2835-i2s.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xaarch64-linux-gnu-strip: warning: /t=
mp/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/sound/=
soc/codecs/snd-soc-ak4613.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc00=
00000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/pci/hda/snd-hda-codec.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-cros-ec-codec.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-da7219.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-dmic.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-gtm601.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-es7134.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: warning: /tm=
p/kci/linux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/sound/s=
oc/codecs/snd-soc-lpass-va-macro.ko/tmp/kci/linux/build/_modules_/lib/modul=
es/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-es7241.ko: unsuppor=
ted GNU_PROPERTY_TYPE (: unsupported GNU_PROPERTY_TYPE (55) type: 0x) type:=
 0xc0000000c0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-hdmi-codec.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-lpass-wsa-macro.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-max98357a.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-pcm3168a-i2c.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-msm8916-digital.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-max98927.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-msm8916-analog.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-pcm3168a.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rl6231.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rt5514-spi.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rt5514.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rt5645.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rt5659.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-rt5663.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-sgtl5000.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-simple-amplifier=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-simple-mux.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-spdif-rx.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-spdif-tx.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wcd-mbhc.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-tas571x.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wcd934x.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wm8960.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wm-hubs.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wm8904.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wm8962.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wm8994.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/codecs/snd-soc-wsa881x.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/imx-pcm-dma.ko: unsupported=
 GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-asoc-card.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-asrc.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-audmix.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-easrc.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-esai.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-micfil.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-sai.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-ssi.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-imx-audmux.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-imx-audmix.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-imx-sgtl5000.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-imx-spdif.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/generic/snd-soc-audio-graph-car=
d.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/fsl/snd-soc-fsl-spdif.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/generic/snd-soc-simple-card-uti=
ls.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/generic/snd-soc-simple-card.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-fifo.ko=
: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-frddr.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-aiu.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-spdifou=
t.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-sound-c=
ard.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-spdifin=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-tdm-for=
matter.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-pdm.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-tdm-int=
erface.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-tdmin.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-toddr.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-axg-tdmout.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-card-utils.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-codec-glue.=
ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-g12a-toacod=
ec.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-gx-sound-ca=
rd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6adm.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/sound/soc/meson/snd-soc-meson-g12a-tohdmitx.ko: unsupported GNU_PR=
OPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6afe-clocks.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/meson/snd-soc-meson-t9015.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6afe.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6asm.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6asm-dai.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6afe-dai.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6core.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-apq8016-sbc.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6dsp-common.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/sound/soc/qcom/snd-soc-apq8096.ko: unsupported GNU_PROPERTY_TYPE (=
5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/qdsp6/q6routing.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-lpass-apq8016.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-lpass-cpu.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-lpass-platform.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-qcom-common.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-sdm845.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/qcom/snd-soc-sm8250.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/rockchip/snd-soc-rk3399-gru-sou=
nd.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/rockchip/snd-soc-rockchip-i2s.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/rockchip/snd-soc-rockchip-pcm.k=
o: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/sound/soc/rockchip/snd-soc-rockchip-rt5645.ko: unsupported GNU_PRO=
PERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/rockchip/snd-soc-rockchip-spdif=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra-audio-graph=
-card.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra186-dspk.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/sh/rcar/snd-soc-rcar.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: aarch64-linux-gnu-strip: warning: /tmp/kci/lin=
ux/build/_modules_/lib/modules/5.14.0-next-20210903/kernel/sound/soc/sunxi/=
sun4i-i2s.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    warning: /tmp/kci/linux/build/_modules_/lib/modules/5.14.0-next-2021090=
3/kernel/sound/soc/tegra/snd-soc-tegra210-admaif.ko: unsupported GNU_PROPER=
TY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra-pcm.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra210-ahub.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra210-dmic.ko:=
 unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/tegra/snd-soc-tegra210-i2s.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.14.0-next-20210903/kernel/sound/soc/sunxi/sun4i-spdif.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-12) =E2=80=94 PASS, 0 errors, 3 warn=
ings, 0 section mismatches

Warnings:
    fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to silence=
 this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 26 errors, 25 warnings, =
0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 26 errors, 25 warnings, =
0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c

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
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 wa=
rnings, 0 section mismatches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''
    arch/arc/include/asm/perf_event.h:126:27: warning: =E2=80=98arc_pmu_cac=
he_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    arch/arc/include/asm/perf_event.h:91:27: warning: =E2=80=98arc_pmu_ev_h=
w_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]

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
i386_defconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to silence=
 this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to silence=
 this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 23 errors, 22 warnin=
gs, 0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c

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
lemote2f_defconfig (mips, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 se=
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
loongson2k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    include/linux/slab.h:461:9: warning: argument 1 value =E2=80=9818446744=
073709551615=E2=80=99 exceeds maximum object size 9223372036854775807 [-Wal=
loc-size-larger-than=3D]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    include/linux/slab.h:618:9: warning: argument 1 value =E2=80=9818446744=
073709551615=E2=80=99 exceeds maximum object size 9223372036854775807 [-Wal=
loc-size-larger-than=3D]

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
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

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
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
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
multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to silence=
 this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to silence=
 this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 23 warnings, 0=
 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to silence=
 this warning
    1 warning generated.
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]

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
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 26 errors, 25 war=
nings, 0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c

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
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/net/ethernet/8390/ne.c:909:20: warning: =E2=80=98ne_add_devices=
=E2=80=99 defined but not used [-Wunused-function]

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
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
sama7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
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
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/slab.h:461:9: warning: argument 1 value =E2=80=9842949672=
95=E2=80=99 exceeds maximum object size 2147483647 [-Walloc-size-larger-tha=
n=3D]

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
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
x86_64_defconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    fs/io_uring.c:10540:7: warning: variable 'tctx' is used uninitialized w=
henever 'if' condition is false [-Wsometimes-uninitialized]
    fs/io_uring.c:10528:28: note: initialize the variable 'tctx' to silence=
 this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 26 errors, 25 wa=
rnings, 0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 2=
6 errors, 25 warnings, 0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:42:30: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    include/linux/fortify-string.h:45:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [17, 32] is out of the bounds [0, 16] of object =
=E2=80=98small=E2=80=99 with type =E2=80=98char[16]=E2=80=99 [-Werror=3Darr=
ay-bounds]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    include/linux/fortify-string.h:41:29: error: =E2=80=98__builtin_memcpy=
=E2=80=99 forming offset [25, 36] is out of the bounds [0, 24] of object =
=E2=80=98instance=E2=80=99 with type =E2=80=98struct fortify_object=E2=80=
=99 [-Werror=3Darray-bounds]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---
For more info write to <info@kernelci.org>
