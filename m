Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 780286AF65C
	for <lists+linux-next@lfdr.de>; Tue,  7 Mar 2023 21:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjCGUGN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Mar 2023 15:06:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbjCGUGM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Mar 2023 15:06:12 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAEA89B99A
        for <linux-next@vger.kernel.org>; Tue,  7 Mar 2023 12:05:46 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so12974321pjp.2
        for <linux-next@vger.kernel.org>; Tue, 07 Mar 2023 12:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678219546;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X4oKJ3pYgk4Fo7T+rgWL8x5CwbI/NIyDq5xW2lQ4Rcw=;
        b=jwiblPAIhNL/5Wmq+7OoEpcdcHy0xvKs/3+9HUpEZ+/qZJdtthqiNzr6DJyUhmuZ9o
         SzfrWfCkW1UQwWz/QXatdyf63xeA4V+RHzBH9sHISf3pnMBLI71OhPGhVii13T9AfpBK
         Oe4OpGtUFzuHewzMtQYAoIOWdiFQc3I6oHnf3ccjE0Nu6RWTYd/VHIMwu7PmqGEelLVS
         4BG4i8EfMHc32VnTeaXDZewgYdXz2GrFUu1fyXCWrAvvAUForTfiE18vmAZI5fCb3ON1
         CknVro9WT0WdRKNGPCkUPVUFVP03qMWeHoTMRD9SDsHx5b87RcZwceizU2tCB3ABjCQC
         hbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678219546;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4oKJ3pYgk4Fo7T+rgWL8x5CwbI/NIyDq5xW2lQ4Rcw=;
        b=PjSsOdJdqZN/x54nYPKSbwv29M03Q5uu1FGvmGaotHkQD3w+g22aPhHXFCph+PDs2L
         ePCF7IzJO+d9LUrAw4m65qyY8O0+xcjmFNYCvW6CaqR+SElKCy9bVikrS/3nBHOQ1cuj
         JByQq9bfAZUlc+bjZa1i5rXEhdM6HuJ+XoMo8l/ZlYXo5IxkzBYQrla7N4GN8BuA1q/1
         AD+KpBAH8s3doqQQ57THl8/gZBkKroA/S/3cR4iF4vsgrnlYMq9XzEJc+asZVidmXnqV
         SBE+jNmKCrMGnLUsf+5XZkiwGJER2WC2ED1cIpAzRLCJdyLEOk1YPi/rdwjEUijxWp0n
         h19A==
X-Gm-Message-State: AO0yUKVeksWchhmJf0h1MfaLZtqMNHd+3KRbFWE3z5J8ZF0P6Y4RVWiN
        PzDbEP4tFgPOH5SXH5XBrT6p0YFKz8+3kznzans31XCA
X-Google-Smtp-Source: AK7set8Y1ByA97KKL6bcFx1mXintqm+AFFzSI7jplh6TzAoOHgSKbGogAIaw1YJvXRx2DCH96i2BPg==
X-Received: by 2002:a05:6a20:6620:b0:c7:3209:f24d with SMTP id n32-20020a056a20662000b000c73209f24dmr12042699pzh.56.1678219545247;
        Tue, 07 Mar 2023 12:05:45 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j8-20020aa78008000000b005a8bc11d259sm8569479pfi.141.2023.03.07.12.05.44
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 12:05:44 -0800 (PST)
Message-ID: <64079918.a70a0220.5f769.fa75@mx.google.com>
Date:   Tue, 07 Mar 2023 12:05:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230307
X-Kernelci-Report-Type: build
Subject: next/master build: 196 builds: 15 failed, 181 passed, 30 errors,
 24 warnings (next-20230307)
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

next/master build: 196 builds: 15 failed, 181 passed, 30 errors, 24 warning=
s (next-20230307)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230307/

Tree: next
Branch: master
Git Describe: next-20230307
Git Commit: 709c6adf19dc558e44ab5c01659b09a16a2d3c82
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm64:
    allmodconfig: (clang-17) FAIL

arm:
    allmodconfig: (clang-17) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-17) FAIL
    i386_defconfig+kselftest: (gcc-10) FAIL

mips:
    32r2el_defconfig+debug: (gcc-10) FAIL
    ar7_defconfig: (gcc-10) FAIL
    cavium_octeon_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    xway_defconfig: (gcc-10) FAIL

riscv:
    defconfig+kselftest: (gcc-10) FAIL

sparc:
    sparc64_defconfig+kselftest: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-17) FAIL
    x86_64_defconfig+kselftest: (rustc-1.62) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error, 1 warning

arm64:
    allmodconfig (clang-17): 1 error

arm:
    allmodconfig (clang-17): 1 error
    aspeed_g5_defconfig (clang-17): 2 warnings
    rpc_defconfig (gcc-10): 2 errors

i386:
    allmodconfig (clang-17): 2 errors
    i386_defconfig+kselftest (gcc-10): 1 error, 1 warning

mips:
    ar7_defconfig (gcc-10): 11 errors, 1 warning
    cavium_octeon_defconfig (gcc-10): 1 error, 1 warning
    decstation_64_defconfig (gcc-10): 1 error, 1 warning
    fuloong2e_defconfig (gcc-10): 1 error
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 1 error
    xway_defconfig (gcc-10): 1 error

riscv:
    defconfig (clang-17): 2 warnings
    defconfig+kselftest (gcc-10): 1 error, 1 warning
    rv32_defconfig (clang-17): 2 warnings

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 1 error, 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    allmodconfig (clang-17): 1 error
    x86_64_defconfig+kselftest (rustc-1.62): 1 error

Errors summary:

    5    mm/khugepaged.c:1702:9: error: implicit declaration of function =
=E2=80=98vma_try_start_write=E2=80=99; did you mean =E2=80=98vma_start_writ=
e=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    4    kernel/bpf/verifier.c:10298:24: error: array index 16 is past the =
end of the array (that has type 'u32[16]' (aka 'unsigned int[16]')) [-Werro=
r,-Warray-bounds]
    4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    1    mm/khugepaged.c:1702:9: error: implicit declaration of function 'v=
ma_try_start_write'; did you mean 'vma_start_write'? [-Werror=3Dimplicit-fu=
nction-declaration]
    1    mm/khugepaged.c:1702:9: error: call to undeclared function 'vma_tr=
y_start_write'; ISO C99 and later do not support implicit function declarat=
ions [-Wimplicit-function-declaration]
    1    kernel/bpf/verifier.c:10298:24: error: array index 16 is past the =
end of the array (which contains 16 elements) [-Werror,-Warray-bounds]
    1    drivers/gpio/gpio-mm-lantiq.c:13:10: fatal error: linux/gpio/legac=
y-of-mm-gpiochip.h.h: No such file or directory
    1    arch/mips/ar7/gpio.c:93:31: error: initialization of =E2=80=98stru=
ct ar7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from i=
nteger without a cast [-Werror=3Dint-conversion]
    1    arch/mips/ar7/gpio.c:78:31: error: initialization of =E2=80=98stru=
ct ar7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from i=
nteger without a cast [-Werror=3Dint-conversion]
    1    arch/mips/ar7/gpio.c:68:31: error: initialization of =E2=80=98stru=
ct ar7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from i=
nteger without a cast [-Werror=3Dint-conversion]
    1    arch/mips/ar7/gpio.c:55:31: error: initialization of =E2=80=98stru=
ct ar7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from i=
nteger without a cast [-Werror=3Dint-conversion]
    1    arch/mips/ar7/gpio.c:42:31: error: initialization of =E2=80=98stru=
ct ar7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from i=
nteger without a cast [-Werror=3Dint-conversion]
    1    arch/mips/ar7/gpio.c:32:31: error: initialization of =E2=80=98stru=
ct ar7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from i=
nteger without a cast [-Werror=3Dint-conversion]
    1    arch/mips/ar7/gpio.c:318:8: error: implicit declaration of functio=
n =E2=80=98gpiochip_add_data=E2=80=99 [-Werror=3Dimplicit-function-declarat=
ion]
    1    arch/mips/ar7/gpio.c:24:31: error: initialization of =E2=80=98stru=
ct ar7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from i=
nteger without a cast [-Werror=3Dint-conversion]
    1    arch/mips/ar7/gpio.c:24:31: error: implicit declaration of functio=
n =E2=80=98gpiochip_get_data=E2=80=99 [-Werror=3Dimplicit-function-declarat=
ion]
    1    arch/mips/ar7/gpio.c:19:19: error: field =E2=80=98chip=E2=80=99 ha=
s incomplete type
    1    arch/mips/ar7/gpio.c:105:31: error: initialization of =E2=80=98str=
uct ar7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from =
integer without a cast [-Werror=3Dint-conversion]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    9    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    5    cc1: some warnings being treated as errors
    3    kernel/bpf/verifier.c:10298:24: warning: array index 16 is past th=
e end of the array (that has type 'u32[16]' (aka 'unsigned int[16]')) [-War=
ray-bounds]
    3    1 warning generated.
    2    cc1: all warnings being treated as errors
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.

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
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-17) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    mm/khugepaged.c:1702:9: error: call to undeclared function 'vma_try_sta=
rt_write'; ISO C99 and later do not support implicit function declarations =
[-Wimplicit-function-declaration]
    kernel/bpf/verifier.c:10298:24: error: array index 16 is past the end o=
f the array (that has type 'u32[16]' (aka 'unsigned int[16]')) [-Werror,-Wa=
rray-bounds]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-17) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    kernel/bpf/verifier.c:10298:24: error: array index 16 is past the end o=
f the array (that has type 'u32[16]' (aka 'unsigned int[16]')) [-Werror,-Wa=
rray-bounds]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-17) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/bpf/verifier.c:10298:24: error: array index 16 is past the end o=
f the array (that has type 'u32[16]' (aka 'unsigned int[16]')) [-Werror,-Wa=
rray-bounds]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-17) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/bpf/verifier.c:10298:24: error: array index 16 is past the end o=
f the array (that has type 'u32[16]' (aka 'unsigned int[16]')) [-Werror,-Wa=
rray-bounds]

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
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 FAIL, 11 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    arch/mips/ar7/gpio.c:19:19: error: field =E2=80=98chip=E2=80=99 has inc=
omplete type
    arch/mips/ar7/gpio.c:24:31: error: implicit declaration of function =E2=
=80=98gpiochip_get_data=E2=80=99 [-Werror=3Dimplicit-function-declaration]
    arch/mips/ar7/gpio.c:24:31: error: initialization of =E2=80=98struct ar=
7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from intege=
r without a cast [-Werror=3Dint-conversion]
    arch/mips/ar7/gpio.c:32:31: error: initialization of =E2=80=98struct ar=
7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from intege=
r without a cast [-Werror=3Dint-conversion]
    arch/mips/ar7/gpio.c:42:31: error: initialization of =E2=80=98struct ar=
7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from intege=
r without a cast [-Werror=3Dint-conversion]
    arch/mips/ar7/gpio.c:55:31: error: initialization of =E2=80=98struct ar=
7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from intege=
r without a cast [-Werror=3Dint-conversion]
    arch/mips/ar7/gpio.c:68:31: error: initialization of =E2=80=98struct ar=
7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from intege=
r without a cast [-Werror=3Dint-conversion]
    arch/mips/ar7/gpio.c:78:31: error: initialization of =E2=80=98struct ar=
7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from intege=
r without a cast [-Werror=3Dint-conversion]
    arch/mips/ar7/gpio.c:93:31: error: initialization of =E2=80=98struct ar=
7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from intege=
r without a cast [-Werror=3Dint-conversion]
    arch/mips/ar7/gpio.c:105:31: error: initialization of =E2=80=98struct a=
r7_gpio_chip *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integ=
er without a cast [-Werror=3Dint-conversion]
    arch/mips/ar7/gpio.c:318:8: error: implicit declaration of function =E2=
=80=98gpiochip_add_data=E2=80=99 [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    kernel/bpf/verifier.c:10298:24: warning: array index 16 is past the end=
 of the array (that has type 'u32[16]' (aka 'unsigned int[16]')) [-Warray-b=
ounds]
    1 warning generated.

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section mismatches

Errors:
    mm/khugepaged.c:1702:9: error: implicit declaration of function =E2=80=
=98vma_try_start_write=E2=80=99; did you mean =E2=80=98vma_start_write=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

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
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section mismatches

Errors:
    mm/khugepaged.c:1702:9: error: implicit declaration of function =E2=80=
=98vma_try_start_write=E2=80=99; did you mean =E2=80=98vma_start_write=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

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
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    kernel/bpf/verifier.c:10298:24: warning: array index 16 is past the end=
 of the array (that has type 'u32[16]' (aka 'unsigned int[16]')) [-Warray-b=
ounds]
    1 warning generated.

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
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

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
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

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
defconfig+kselftest (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection mismatches

Errors:
    mm/khugepaged.c:1702:9: error: implicit declaration of function =E2=80=
=98vma_try_start_write=E2=80=99; did you mean =E2=80=98vma_start_write=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
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
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 FAIL, 1 error, 1 wa=
rning, 0 section mismatches

Errors:
    mm/khugepaged.c:1702:9: error: implicit declaration of function 'vma_tr=
y_start_write'; did you mean 'vma_start_write'? [-Werror=3Dimplicit-functio=
n-declaration]

Warnings:
    cc1: some warnings being treated as errors

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
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section mismatches

Errors:
    mm/khugepaged.c:1702:9: error: implicit declaration of function =E2=80=
=98vma_try_start_write=E2=80=99; did you mean =E2=80=98vma_start_write=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]

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
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

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
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

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
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
rv32_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    kernel/bpf/verifier.c:10298:24: warning: array index 16 is past the end=
 of the array (that has type 'u32[16]' (aka 'unsigned int[16]')) [-Warray-b=
ounds]
    1 warning generated.

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
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 FAIL, 1 error, 2 warn=
ings, 0 section mismatches

Errors:
    mm/khugepaged.c:1702:9: error: implicit declaration of function =E2=80=
=98vma_try_start_write=E2=80=99; did you mean =E2=80=98vma_start_write=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    cc1: some warnings being treated as errors

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
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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
x86_64_defconfig+kselftest (x86_64, rustc-1.62) =E2=80=94 FAIL, 1 error, 0 =
warnings, 0 section mismatches

Errors:
    kernel/bpf/verifier.c:10298:24: error: array index 16 is past the end o=
f the array (which contains 16 elements) [-Werror,-Warray-bounds]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust-samples (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

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
xway_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    drivers/gpio/gpio-mm-lantiq.c:13:10: fatal error: linux/gpio/legacy-of-=
mm-gpiochip.h.h: No such file or directory

---
For more info write to <info@kernelci.org>
