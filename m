Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E35DC7B7866
	for <lists+linux-next@lfdr.de>; Wed,  4 Oct 2023 09:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232647AbjJDHLv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Oct 2023 03:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232624AbjJDHLv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Oct 2023 03:11:51 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B28AB
        for <linux-next@vger.kernel.org>; Wed,  4 Oct 2023 00:11:45 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-694ed84c981so1380743b3a.3
        for <linux-next@vger.kernel.org>; Wed, 04 Oct 2023 00:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1696403504; x=1697008304; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QD+hfsr6DvU+m1Wg0FpAQe/H++2IvwBuCepWVewJZ9o=;
        b=fAI1USJzXWzBHZZ1X0RG2JaTOv92VJCoBoa7A/lUIdqSAcdea3nZamjsIG9vqkt3/1
         sOWGbExVf0BkGcbIwtVUCqoXZxk7EZiRrIkPUriZpEMHWNo/lliWxuQnZiofI1pwAB0P
         RTY4o+RO7IdhM0t69AD0hwti2fEq6So5O1RBLDwOc5ih4osuqL258aElSnyN5o0Ghoo8
         w7tDiOB0LAvsuttszTonmHJXawGXQe23Dw/3/CIPPNaVjhqG+8CtInc63Y1lCQn4UR6x
         H259YJU0CaGujcOQwjaoPMO4y20KBOvWAzImLQ1bonOx4nUyjLXd8cdPwSxRmvYDK+0k
         GS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696403504; x=1697008304;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QD+hfsr6DvU+m1Wg0FpAQe/H++2IvwBuCepWVewJZ9o=;
        b=dRoPwenFWz5143S81g9+YmSDrgcnObx5XCf1I+8CcC3uTja+hOGT3w3wEwuFu/Yyd7
         dff6rS/mSaCAOhMkhE5lAkPnjVssSZEYhJ3PyWebEhgvm0XMkfPpMUFlZ+jTsrX+kjW9
         jk2kexKTSTTnXtMR5uLdx8ZJ0piVOQelV1hBhGuO4l21f7n3NRV1hGx/ZGcK1vTaR3yP
         55gpJy9zTy/39l81cDO6vAoRrjJygqntKzveei6IILsc16jr+rJ2ZrkAeicSqG1LkeCU
         eD9S1vb4wQP7b74LDDRY328/LktYxsxw/pyhaNYW0y/Yldf5qaInoeo1GHmHL+IbfvTo
         EFJQ==
X-Gm-Message-State: AOJu0YzCQim508kje3iJixTqCeBxFogfIPvx5GYHRn5e2nHJ4GSKVu3h
        GBpGYFEY3zEl9vbmfhEpjbdQB/On5twB377oNzYtOw==
X-Google-Smtp-Source: AGHT+IG07w8KQ94Xi++r8mnFVmrAco24K5UNrQyXUL5XN17U/22ss8x7gfUW6QnC4yhnhT/n6awA+g==
X-Received: by 2002:a05:6a00:244b:b0:68c:3f2:6007 with SMTP id d11-20020a056a00244b00b0068c03f26007mr1746200pfj.8.1696403503685;
        Wed, 04 Oct 2023 00:11:43 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id l1-20020a639841000000b0057406c4306fsm2609677pgo.12.2023.10.04.00.11.41
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 00:11:42 -0700 (PDT)
Message-ID: <651d102e.630a0220.e2b5a.734e@mx.google.com>
Date:   Wed, 04 Oct 2023 00:11:42 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20231004
X-Kernelci-Report-Type: build
Subject: next/master build: 184 builds: 3 failed, 181 passed, 7 errors,
 79 warnings (next-20231004)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 184 builds: 3 failed, 181 passed, 7 errors, 79 warnings =
(next-20231004)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20231004/

Tree: next
Branch: master
Git Describe: next-20231004
Git Commit: 33b64befb1a28bca3f5a9ed9807d2f87e976c63a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm:
    rpc_defconfig: (gcc-10) FAIL

mips:
    cavium_octeon_defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-10): 3 warnings

arm:
    ixp4xx_defconfig (gcc-10): 3 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-10): 3 warnings
    rpc_defconfig (gcc-10): 2 errors

i386:

mips:
    ath25_defconfig (gcc-10): 3 warnings
    ath79_defconfig (gcc-10): 3 warnings
    bcm63xx_defconfig (gcc-10): 3 warnings
    bigsur_defconfig (gcc-10): 3 warnings
    bmips_be_defconfig (gcc-10): 3 warnings
    cavium_octeon_defconfig (gcc-10): 4 errors, 6 warnings
    ip22_defconfig (gcc-10): 3 warnings
    ip27_defconfig (gcc-10): 3 warnings
    ip28_defconfig (gcc-10): 3 warnings
    ip32_defconfig (gcc-10): 3 warnings
    rbtx49xx_defconfig (gcc-10): 3 warnings
    sb1250_swarm_defconfig (gcc-10): 3 warnings

riscv:

sparc:
    allnoconfig (gcc-10): 4 warnings
    sparc32_defconfig (gcc-10): 5 warnings
    sparc64_defconfig (gcc-10): 7 warnings
    sparc64_defconfig+debug (gcc-10): 5 warnings
    sparc64_defconfig+kselftest (gcc-10): 5 warnings
    tinyconfig (gcc-10): 4 warnings

x86_64:
    x86_64_defconfig+kselftest (rustc-1.71): 1 warning

Errors summary:

    1    fs/proc/task_mmu.c:2104:21: error: 'HPAGE_SIZE' undeclared (first =
use in this function); did you mean 'PAGE_SIZE'?
    1    drivers/staging/octeon/ethernet.c:801:8: error: variable =E2=80=98=
imode=E2=80=99 has initializer but incomplete type
    1    drivers/staging/octeon/ethernet.c:801:35: error: storage size of =
=E2=80=98imode=E2=80=99 isn=E2=80=99t known
    1    drivers/staging/octeon/ethernet.c:205:30: error: storage size of =
=E2=80=98tx_status=E2=80=99 isn=E2=80=99t known
    1    drivers/staging/octeon/ethernet.c:204:30: error: storage size of =
=E2=80=98rx_status=E2=80=99 isn=E2=80=99t known
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    63   scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=
=98__endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointe=
r target type [-Wdiscarded-qualifiers]
    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to=
 !ENDBR: .text+0x14b6ab
    1    drivers/staging/octeon/ethernet.c:801:35: warning: unused variable=
 =E2=80=98imode=E2=80=99 [-Wunused-variable]
    1    drivers/staging/octeon/ethernet.c:205:30: warning: unused variable=
 =E2=80=98tx_status=E2=80=99 [-Wunused-variable]
    1    drivers/staging/octeon/ethernet.c:204:30: warning: unused variable=
 =E2=80=98rx_status=E2=80=99 [-Wunused-variable]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

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
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 FAIL, 4 errors, 6 warnings=
, 0 section mismatches

Errors:
    drivers/staging/octeon/ethernet.c:204:30: error: storage size of =E2=80=
=98rx_status=E2=80=99 isn=E2=80=99t known
    drivers/staging/octeon/ethernet.c:205:30: error: storage size of =E2=80=
=98tx_status=E2=80=99 isn=E2=80=99t known
    drivers/staging/octeon/ethernet.c:801:8: error: variable =E2=80=98imode=
=E2=80=99 has initializer but incomplete type
    drivers/staging/octeon/ethernet.c:801:35: error: storage size of =E2=80=
=98imode=E2=80=99 isn=E2=80=99t known

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    drivers/staging/octeon/ethernet.c:205:30: warning: unused variable =E2=
=80=98tx_status=E2=80=99 [-Wunused-variable]
    drivers/staging/octeon/ethernet.c:204:30: warning: unused variable =E2=
=80=98rx_status=E2=80=99 [-Wunused-variable]
    drivers/staging/octeon/ethernet.c:801:35: warning: unused variable =E2=
=80=98imode=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
decstation_64_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
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
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-17) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 3 warnings, 0 section mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

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
defconfig+arm64-chromebook+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 FAIL, 1 error, 0 wa=
rnings, 0 section mismatches

Errors:
    fs/proc/task_mmu.c:2104:21: error: 'HPAGE_SIZE' undeclared (first use i=
n this function); did you mean 'PAGE_SIZE'?

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
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

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
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 3 warnings, 0 section mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

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
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

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
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

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
rv32_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 7 warnings, 0 s=
ection mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 5 warning=
s, 0 section mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 5 war=
nings, 0 section mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section =
mismatches

Warnings:
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    scripts/mod/modpost.h:66:17: warning: passing argument 2 of =E2=80=98__=
endian=E2=80=99 discards =E2=80=98const=E2=80=99 qualifier from pointer tar=
get type [-Wdiscarded-qualifiers]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, rustc-1.71) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, rustc-1.71) =E2=80=94 PASS, 0 errors, 1=
 warning, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to !END=
BR: .text+0x14b6ab

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust (x86_64, rustc-1.71) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust-samples (x86_64, rustc-1.71) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
