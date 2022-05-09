Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67D9E51FF23
	for <lists+linux-next@lfdr.de>; Mon,  9 May 2022 16:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236800AbiEIOFa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 May 2022 10:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236797AbiEIOF3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 May 2022 10:05:29 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 007EFA6230
        for <linux-next@vger.kernel.org>; Mon,  9 May 2022 07:01:32 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id x88so1690891pjj.1
        for <linux-next@vger.kernel.org>; Mon, 09 May 2022 07:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6T2f4CEtGbg48WS0jCCASfdEF0a6oWUvRghh6dI0L/E=;
        b=uYjqdimcFHjmJNMcC3qRrmXs+iuomfwmiTIG19XP5LoRO3hkX/HuVffvhcmDEG+5Td
         sfFznDDofFGUtgQN8JQhNOssrEm4q+RrjwH8OeHCY3t0hjMBurTHw+jRrFwzM/9sCrL9
         P3p01T4zU7uhAgg2ke7tufP5iC5OiqJy0y+Nw9PSpRwnAMaZYVs+nyZaCGBFKW72u7WE
         7blPkB+f4MddxQFazG69U7NWOfCRGWv/3J+LlOTncwZeNQSXaoST4d/U+/lzik4PM/Zu
         YQKzARVqfnaOo/5j6/ZoW/0uSPNcF51BOzRb3+z1xnx2NxnNMChqyTQiPmwVmvAyFVgZ
         xv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6T2f4CEtGbg48WS0jCCASfdEF0a6oWUvRghh6dI0L/E=;
        b=CznRXFUdZM2I6+a0WeUlgfBFkdPJ3RWLY9YN1KPNx2nhDpOfWf8dyTZe6N0NS9nlkQ
         46LwVnEAdUDeB/Rf3qKX+pz6bhtCcjC7EU9li4SRTs+Eg0ZnXzyFRqLP5IlzoG8/LwPL
         xvUlWeA1uWQCu7i6Up7xSa7pbRUaBNwAPqs5hQYuZlIviXg41LfIu2Ll6uA/rze2Nihb
         okHYf/cRQba5BF+ohCXeWcg46IVLHN6F3GpJrk9r9w11q+x7uIjWlIAc5NkEnKu/R+mX
         1ZOSLRDxzoZzf3VxzkiM20N5x/xez63MCrv2HjpIo04LXBaT9iGpVnEjZCyhPInK89ZS
         O+Qg==
X-Gm-Message-State: AOAM531dl+pgEBtkmwKTQPzttnX05Rj7XdCYF8bfsbjyuR6DZiK4RSui
        GsyxoPq8W8JMlh4DgPMGToMgaHieHJ5dbrHJ
X-Google-Smtp-Source: ABdhPJylLjbjZ1izRuVXbIrBJ5Nm/S5rF/Jvmh3yLfZo2WHQppKqF0vYr/smYGDRIoV+VFJJwmaC6g==
X-Received: by 2002:a17:90b:4a41:b0:1dc:1342:e584 with SMTP id lb1-20020a17090b4a4100b001dc1342e584mr18292809pjb.179.1652104891441;
        Mon, 09 May 2022 07:01:31 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 20-20020a630d54000000b003c14af50627sm8559547pgn.63.2022.05.09.07.01.30
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 07:01:30 -0700 (PDT)
Message-ID: <62791eba.1c69fb81.2d10c.3446@mx.google.com>
Date:   Mon, 09 May 2022 07:01:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20220509
Subject: next/master build: 220 builds: 24 failed, 196 passed, 42 errors,
 86 warnings (next-20220509)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 220 builds: 24 failed, 196 passed, 42 errors, 86 warning=
s (next-20220509)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220509/

Tree: next
Branch: master
Git Describe: next-20220509
Git Commit: ab38272e99730375c5db3db1c4cebf691a0550ab
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-14) FAIL

arm:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL
    multi_v7_defconfig+kselftest: (gcc-10) FAIL
    omap2plus_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL
    spear3xx_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-14) FAIL
    i386_defconfig: (clang-14) FAIL
    i386_defconfig+kselftest: (gcc-10) FAIL

mips:
    32r2el_defconfig: (gcc-10) FAIL
    32r2el_defconfig+debug: (gcc-10) FAIL
    32r2el_defconfig+kselftest: (gcc-10) FAIL
    ci20_defconfig: (gcc-10) FAIL
    cu1000-neo_defconfig: (gcc-10) FAIL
    cu1830-neo_defconfig: (gcc-10) FAIL
    db1xxx_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    loongson2k_defconfig: (gcc-10) FAIL
    loongson3_defconfig: (gcc-10) FAIL
    omega2p_defconfig: (gcc-10) FAIL
    vocore2_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-14) FAIL
    x86_64_defconfig: (clang-14) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 4 warnings

arm64:
    allmodconfig (clang-14): 2 errors, 2 warnings
    defconfig (clang-14): 3 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-14): 3 warnings

arm:
    allmodconfig (gcc-10): 1 error
    allmodconfig (clang-14): 2 errors, 15 warnings
    aspeed_g4_defconfig (gcc-10): 1 warning
    aspeed_g5_defconfig (clang-14): 13 warnings
    aspeed_g5_defconfig (gcc-10): 1 warning
    at91_dt_defconfig (gcc-10): 1 warning
    bcm2835_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (clang-14): 6 warnings
    multi_v7_defconfig (clang-14): 16 warnings
    multi_v7_defconfig+kselftest (gcc-10): 1 error
    omap2plus_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors
    spear3xx_defconfig (gcc-10): 10 errors

i386:
    allmodconfig (clang-14): 2 errors, 2 warnings
    allnoconfig (clang-14): 3 warnings
    i386_defconfig (clang-14): 1 error, 1 warning
    i386_defconfig+kselftest (gcc-10): 4 errors, 1 warning

mips:
    32r2el_defconfig (gcc-10): 1 error, 1 warning
    32r2el_defconfig+debug (gcc-10): 1 error, 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 error, 1 warning
    ci20_defconfig (gcc-10): 1 error
    cu1000-neo_defconfig (gcc-10): 1 error
    cu1830-neo_defconfig (gcc-10): 1 error
    db1xxx_defconfig (gcc-10): 1 error
    fuloong2e_defconfig (gcc-10): 1 error
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 1 error
    omega2p_defconfig (gcc-10): 1 error
    rb532_defconfig (gcc-10): 1 warning
    vocore2_defconfig (gcc-10): 1 error

riscv:
    defconfig+CONFIG_EFI=3Dn (clang-14): 3 warnings

x86_64:
    allmodconfig (clang-14): 2 errors, 2 warnings
    allnoconfig (clang-14): 3 warnings
    x86_64_defconfig (clang-14): 1 error, 1 warning

Errors summary:

    10   ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=
=98__compiletime_assert_253=E2=80=99 declared with attribute error: BUILD_B=
UG_ON failed: sizeof(*edid) !=3D EDID_LENGTH
    6    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized w=
henever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    4    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when us=
ed here [-Werror,-Wuninitialized]
    2    drivers/misc/lkdtm/cfi.c:62:3: error: cast to pointer from integer=
 of different size [-Werror=3Dint-to-pointer-cast]
    2    drivers/misc/lkdtm/cfi.c:62:30: error: cast from pointer to intege=
r of different size [-Werror=3Dpointer-to-int-cast]
    2    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    2    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=
=98__compiletime_assert_286=E2=80=99 declared with attribute error: BUILD_B=
UG failed
    2    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=
=98__compiletime_assert_285=E2=80=99 declared with attribute error: BUILD_B=
UG failed
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=
=98__compiletime_assert_406=E2=80=99 declared with attribute error: BUILD_B=
UG failed
    1    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=
=98__compiletime_assert_397=E2=80=99 declared with attribute error: BUILD_B=
UG failed
    1    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=
=98__compiletime_assert_396=E2=80=99 declared with attribute error: BUILD_B=
UG failed
    1    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=
=98__compiletime_assert_387=E2=80=99 declared with attribute error: BUILD_B=
UG failed
    1    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=
=98__compiletime_assert_315=E2=80=99 declared with attribute error: BUILD_B=
UG failed
    1    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=
=98__compiletime_assert_307=E2=80=99 declared with attribute error: BUILD_B=
UG failed
    1    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=
=98__compiletime_assert_305=E2=80=99 declared with attribute error: BUILD_B=
UG failed
    1    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=
=98__compiletime_assert_295=E2=80=99 declared with attribute error: BUILD_B=
UG failed
    1    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=
=98__compiletime_assert_289=E2=80=99 declared with attribute error: BUILD_B=
UG failed
    1    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=
=98__compiletime_assert_284=E2=80=99 declared with attribute error: BUILD_B=
UG failed

Warnings summary:

    23   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    14   mm/shmem.c:1685:21: note: initialize the variable 'folio' to silen=
ce this warning
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    10   1 warning generated.
    8    mm/shmem.c:1704:7: warning: variable 'folio' is used uninitialized=
 whenever 'if' condition is true [-Wsometimes-uninitialized]
    4    mm/shmem.c:2318:19: note: initialize the variable 'page' to silenc=
e this warning
    3    mm/shmem.c:1761:5: warning: =E2=80=98folio=E2=80=99 is used uninit=
ialized in this function [-Wuninitialized]
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    drivers/misc/lkdtm/cfi.c:62:3: warning: cast to pointer from integ=
er of different size [-Wint-to-pointer-cast]
    2    drivers/misc/lkdtm/cfi.c:62:30: warning: cast from pointer to inte=
ger of different size [-Wpointer-to-int-cast]
    2    drivers/i2c/busses/i2c-at91-master.c:707:6: warning: variable 'dma=
_buf' is used uninitialized whenever 'if' condition is false [-Wsometimes-u=
ninitialized]
    2    drivers/i2c/busses/i2c-at91-master.c:659:13: note: initialize the =
variable 'dma_buf' to silence this warning
    1    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 fo=
rming offset [20, 23] is out of the bounds [0, 20] [-Warray-bounds]
    1    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 require=
s 44 bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift=
-overflow=3D]
    1    cc1: all warnings being treated as errors

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_387=E2=80=99 declared with attribute error: BUILD_BUG fai=
led

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches

Errors:
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_396=E2=80=99 declared with attribute error: BUILD_BUG fai=
led

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warnin=
g, 0 section mismatches

Errors:
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_397=E2=80=99 declared with attribute error: BUILD_BUG fai=
led

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_307=E2=80=99 declared with attribute error: BUILD_BUG fai=
led

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-14) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sect=
ion mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-14) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sec=
tion mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-14) =E2=80=94 FAIL, 2 errors, 15 warnings, 0 secti=
on mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

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
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-14) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 secti=
on mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]
    mm/shmem.c:2337:8: error: variable 'page' is uninitialized when used he=
re [-Werror,-Wuninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    mm/shmem.c:2318:19: note: initialize the variable 'page' to silence thi=
s warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-14) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    mm/shmem.c:1704:7: warning: variable 'folio' is used uninitialized when=
ever 'if' condition is true [-Wsometimes-uninitialized]
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-14) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    mm/shmem.c:1704:7: warning: variable 'folio' is used uninitialized when=
ever 'if' condition is true [-Wsometimes-uninitialized]
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:1761:5: warning: =E2=80=98folio=E2=80=99 is used uninitializ=
ed in this function [-Wuninitialized]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 13 warnings, =
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
    mm/shmem.c:1704:7: warning: variable 'folio' is used uninitialized when=
ever 'if' condition is true [-Wsometimes-uninitialized]
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    1 warning generated.
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:1761:5: warning: =E2=80=98folio=E2=80=99 is used uninitializ=
ed in this function [-Wuninitialized]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/shmem.c:1761:5: warning: =E2=80=98folio=E2=80=99 is used uninitializ=
ed in this function [-Wuninitialized]

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
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/bitmap.h:261:2: warning: =E2=80=98memcpy=E2=80=99 forming=
 offset [20, 23] is out of the bounds [0, 20] [-Warray-bounds]

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
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
ci20_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_284=E2=80=99 declared with attribute error: BUILD_BUG fai=
led

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
colibri_pxa270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

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
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_286=E2=80=99 declared with attribute error: BUILD_BUG fai=
led

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_286=E2=80=99 declared with attribute error: BUILD_BUG fai=
led

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_305=E2=80=99 declared with attribute error: BUILD_BUG fai=
led

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

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
defconfig (arm64, clang-14) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    mm/shmem.c:1704:7: warning: variable 'folio' is used uninitialized when=
ever 'if' condition is true [-Wsometimes-uninitialized]
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-14) =E2=80=94 PASS, 0 er=
rors, 3 warnings, 0 section mismatches

Warnings:
    mm/shmem.c:1704:7: warning: variable 'folio' is used uninitialized when=
ever 'if' condition is true [-Wsometimes-uninitialized]
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-14) =E2=80=94 PASS, 0 errors, 3 warn=
ings, 0 section mismatches

Warnings:
    mm/shmem.c:1704:7: warning: variable 'folio' is used uninitialized when=
ever 'if' condition is true [-Wsometimes-uninitialized]
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    1 warning generated.

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
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 4 w=
arnings, 0 section mismatches

Warnings:
    drivers/misc/lkdtm/cfi.c:62:30: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    drivers/misc/lkdtm/cfi.c:62:3: warning: cast to pointer from integer of=
 different size [-Wint-to-pointer-cast]
    drivers/misc/lkdtm/cfi.c:62:30: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    drivers/misc/lkdtm/cfi.c:62:3: warning: cast to pointer from integer of=
 different size [-Wint-to-pointer-cast]

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
i386_defconfig (i386, clang-14) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning

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
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 FAIL, 4 errors, 1 warning=
, 0 section mismatches

Errors:
    drivers/misc/lkdtm/cfi.c:62:30: error: cast from pointer to integer of =
different size [-Werror=3Dpointer-to-int-cast]
    drivers/misc/lkdtm/cfi.c:62:3: error: cast to pointer from integer of d=
ifferent size [-Werror=3Dint-to-pointer-cast]
    drivers/misc/lkdtm/cfi.c:62:30: error: cast from pointer to integer of =
different size [-Werror=3Dpointer-to-int-cast]
    drivers/misc/lkdtm/cfi.c:62:3: error: cast to pointer from integer of d=
ifferent size [-Werror=3Dint-to-pointer-cast]

Warnings:
    cc1: all warnings being treated as errors

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
imxrt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
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
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

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
loongson2k_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_315=E2=80=99 declared with attribute error: BUILD_BUG fai=
led

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_406=E2=80=99 declared with attribute error: BUILD_BUG fai=
led

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
magician_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    mm/shmem.c:1704:7: warning: variable 'folio' is used uninitialized when=
ever 'if' condition is true [-Wsometimes-uninitialized]
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    1 warning generated.
    drivers/i2c/busses/i2c-at91-master.c:707:6: warning: variable 'dma_buf'=
 is used uninitialized whenever 'if' condition is false [-Wsometimes-uninit=
ialized]
    drivers/i2c/busses/i2c-at91-master.c:659:13: note: initialize the varia=
ble 'dma_buf' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 16 warnings, 0=
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
    mm/shmem.c:1704:7: warning: variable 'folio' is used uninitialized when=
ever 'if' condition is true [-Wsometimes-uninitialized]
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning
    1 warning generated.
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    drivers/i2c/busses/i2c-at91-master.c:707:6: warning: variable 'dma_buf'=
 is used uninitialized whenever 'if' condition is false [-Wsometimes-uninit=
ialized]
    drivers/i2c/busses/i2c-at91-master.c:659:13: note: initialize the varia=
ble 'dma_buf' to silence this warning
    1 warning generated.

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
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

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
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warni=
ngs, 0 section mismatches

Errors:
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_289=E2=80=99 declared with attribute error: BUILD_BUG fai=
led

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
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
omap2plus_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_295=E2=80=99 declared with attribute error: BUILD_BUG fai=
led

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_285=E2=80=99 declared with attribute error: BUILD_BUG fai=
led

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 requires 44 =
bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift-over=
flow=3D]

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
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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
spear3xx_defconfig (arm, gcc-10) =E2=80=94 FAIL, 10 errors, 0 warnings, 0 s=
ection mismatches

Errors:
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_253=E2=80=99 declared with attribute error: BUILD_BUG_ON =
failed: sizeof(*edid) !=3D EDID_LENGTH
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_253=E2=80=99 declared with attribute error: BUILD_BUG_ON =
failed: sizeof(*edid) !=3D EDID_LENGTH
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_253=E2=80=99 declared with attribute error: BUILD_BUG_ON =
failed: sizeof(*edid) !=3D EDID_LENGTH
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_253=E2=80=99 declared with attribute error: BUILD_BUG_ON =
failed: sizeof(*edid) !=3D EDID_LENGTH
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_253=E2=80=99 declared with attribute error: BUILD_BUG_ON =
failed: sizeof(*edid) !=3D EDID_LENGTH
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_253=E2=80=99 declared with attribute error: BUILD_BUG_ON =
failed: sizeof(*edid) !=3D EDID_LENGTH
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_253=E2=80=99 declared with attribute error: BUILD_BUG_ON =
failed: sizeof(*edid) !=3D EDID_LENGTH
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_253=E2=80=99 declared with attribute error: BUILD_BUG_ON =
failed: sizeof(*edid) !=3D EDID_LENGTH
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_253=E2=80=99 declared with attribute error: BUILD_BUG_ON =
failed: sizeof(*edid) !=3D EDID_LENGTH
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_253=E2=80=99 declared with attribute error: BUILD_BUG_ON =
failed: sizeof(*edid) !=3D EDID_LENGTH

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
vocore2_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    ./../include/linux/compiler_types.h:352:38: error: call to =E2=80=98__c=
ompiletime_assert_285=E2=80=99 declared with attribute error: BUILD_BUG fai=
led

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
x86_64_defconfig (x86_64, clang-14) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection mismatches

Errors:
    mm/shmem.c:1704:7: error: variable 'folio' is used uninitialized whenev=
er 'if' condition is true [-Werror,-Wsometimes-uninitialized]

Warnings:
    mm/shmem.c:1685:21: note: initialize the variable 'folio' to silence th=
is warning

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
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

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
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 0 warnings, 0 section mismatches

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
xcep_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---
For more info write to <info@kernelci.org>
