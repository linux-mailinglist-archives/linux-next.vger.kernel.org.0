Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7672D7DDCEA
	for <lists+linux-next@lfdr.de>; Wed,  1 Nov 2023 08:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjKAHBD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Nov 2023 03:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjKAHBC (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Nov 2023 03:01:02 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF8DE8
        for <linux-next@vger.kernel.org>; Wed,  1 Nov 2023 00:00:56 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1cc29f39e7aso30391465ad.0
        for <linux-next@vger.kernel.org>; Wed, 01 Nov 2023 00:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698822055; x=1699426855; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c5yeALCTqvdZiMlSW2eey9Fb8Sxa+6Ebrw6JjVpiiKA=;
        b=GvQQpD1ApRznyppQJClvBlMPMr1Jcb5q0EhSrIPqD6RUekdhSYpPj5fJ+LKshQj5e3
         EodGZyyC97nCfbxXJqrD5NUuNWbSNPEpLogGV1jvtC1Vc5XM9JiZX3ciSjnjVaCVIic+
         kPmTRYRlwPgfrKB276kOGsBuzIovQVQojafZCLGoucnzovI2BOJJQQj+BpQxMmVSMJAA
         EHuf5XE9r0BPBWxogrz0InpwPjS3N3OC8PG4BXY/b/gp4pGxl4GS2s8XJV6C/YBFgKnj
         53zPQh9FjjKVml7vqp4so20I7KunNXKdZTSoYOqKNvpI5aXU/UJxNFoXnLcClsG9NmyP
         udvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698822055; x=1699426855;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5yeALCTqvdZiMlSW2eey9Fb8Sxa+6Ebrw6JjVpiiKA=;
        b=JZdW/ELQsWc75/ufdvU+5n5j2WYbGcTATw1D+sEKe6izow959wtOtHGAsMN8r25edZ
         qp44S+k+aApTAYKHKQglq5dhrJ2A1NCeiJcYeadzJx3dwQPTKATIbv6z5sXtbztRoeJx
         d5rwFBQMLfNakJI0jyN9HlNC5H4uBb4qVPIh1I7PmGidJgtFhVCfiDWcHFgnawczckKL
         S5LeavN/Es0Wn29CtjYUtcd5r5tTtLlHTTeb4KS1Ucv0su6PuWXWPRwBn6hWtVKWbAPu
         N9D+mGTxsLKe9judvPzPG6evbhSv89Oy3yLX46YeXeaD2BTmRYC9H0OYtB77v6FqHfKH
         /TUQ==
X-Gm-Message-State: AOJu0YwbYUCjZjwzvB6R6DGLllyUr3WlSZJw6uwGg29hyrqSfyZ8C/bc
        N48sYqPd/fDvAKo0yf91EZAYelxDRQBnP9GaVtMtMg==
X-Google-Smtp-Source: AGHT+IHAxDAPzoR8hKcG9zEjNl2TX06KRUGLCf4QPY1FnTaN3wS4YZ6Fq2N1w8LddWdvZzwkiRLHvw==
X-Received: by 2002:a17:902:e545:b0:1cc:6fdb:b639 with SMTP id n5-20020a170902e54500b001cc6fdbb639mr2759945plf.13.1698822053869;
        Wed, 01 Nov 2023 00:00:53 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001c771740da4sm669626plc.195.2023.11.01.00.00.53
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 00:00:53 -0700 (PDT)
Message-ID: <6541f7a5.170a0220.f91c7.1f00@mx.google.com>
Date:   Wed, 01 Nov 2023 00:00:53 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231101
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 184 builds: 5 failed, 179 passed, 21 errors,
 71 warnings (next-20231101)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 184 builds: 5 failed, 179 passed, 21 errors, 71 warnings=
 (next-20231101)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20231101/

Tree: next
Branch: master
Git Describe: next-20231101
Git Commit: fa7d0c17278644aa691f96d08bef8001b762f9cd
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm:
    rpc_defconfig: (gcc-10) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL
    decstation_defconfig: (gcc-10) FAIL
    decstation_r4k_defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error

arm64:
    defconfig (gcc-10): 2 warnings
    defconfig (clang-17): 2 warnings
    defconfig+CONFIG_ARM64_16K_PAGES=3Dy (gcc-10): 2 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-17): 2 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-10): 2 warnings
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-10): 2 warnings
    defconfig+arm64-chromebook (gcc-10): 2 warnings
    defconfig+debug (gcc-10): 2 warnings
    defconfig+kselftest (gcc-10): 2 warnings
    defconfig+videodec (gcc-10): 2 warnings

arm:
    rpc_defconfig (gcc-10): 2 errors

i386:
    i386_defconfig (gcc-10): 2 warnings
    i386_defconfig (clang-17): 2 warnings
    i386_defconfig+debug (gcc-10): 2 warnings
    i386_defconfig+kselftest (gcc-10): 2 warnings

mips:
    decstation_64_defconfig (gcc-10): 6 errors, 2 warnings
    decstation_defconfig (gcc-10): 6 errors, 2 warnings
    decstation_r4k_defconfig (gcc-10): 6 errors, 2 warnings

riscv:
    defconfig (clang-17): 1 warning
    defconfig (gcc-10): 1 warning
    defconfig+debug (gcc-10): 1 warning
    defconfig+kselftest (gcc-10): 1 warning

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    x86_64_defconfig (gcc-10): 2 warnings
    x86_64_defconfig (rustc-1.73): 2 warnings
    x86_64_defconfig (clang-17): 2 warnings
    x86_64_defconfig+debug (gcc-10): 2 warnings
    x86_64_defconfig+kselftest (gcc-10): 2 warnings
    x86_64_defconfig+kselftest (rustc-1.73): 3 warnings
    x86_64_defconfig+rust (rustc-1.73): 2 warnings
    x86_64_defconfig+rust-samples (rustc-1.73): 2 warnings
    x86_64_defconfig+x86-board (gcc-10): 2 warnings
    x86_64_defconfig+x86-board+kselftest (gcc-10): 2 warnings

Errors summary:

    3    kernel/bpf/task_iter.c:947:2: error: implicit declaration of funct=
ion =E2=80=98css_task_iter_end=E2=80=99 [-Werror=3Dimplicit-function-declar=
ation]
    3    kernel/bpf/task_iter.c:938:9: error: implicit declaration of funct=
ion =E2=80=98css_task_iter_next=E2=80=99; did you mean =E2=80=98class_dev_i=
ter_next=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    3    kernel/bpf/task_iter.c:928:2: error: implicit declaration of funct=
ion =E2=80=98css_task_iter_start=E2=80=99; did you mean =E2=80=98task_seq_s=
tart=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    3    kernel/bpf/task_iter.c:925:53: error: invalid application of =E2=
=80=98sizeof=E2=80=99 to incomplete type =E2=80=98struct css_task_iter=E2=
=80=99
    3    kernel/bpf/task_iter.c:917:7: error: =E2=80=98CSS_TASK_ITER_PROCS=
=E2=80=99 undeclared (first use in this function)
    3    kernel/bpf/task_iter.c:917:29: error: =E2=80=98CSS_TASK_ITER_THREA=
DED=E2=80=99 undeclared (first use in this function)
    1    fs/proc/task_mmu.c:2099:21: error: 'HPAGE_SIZE' undeclared (first =
use in this function); did you mean 'PAGE_SIZE'?
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    50   WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL=
 used for init symbol. Remove __init or EXPORT_SYMBOL.
    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    3    kernel/bpf/task_iter.c:938:9: warning: returning =E2=80=98int=E2=
=80=99 from a function with return type =E2=80=98struct task_struct *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]
    3    cc1: some warnings being treated as errors
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to=
 !ENDBR: .text+0x14c599

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
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

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
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warnings=
, 0 section mismatches

Errors:
    kernel/bpf/task_iter.c:917:7: error: =E2=80=98CSS_TASK_ITER_PROCS=E2=80=
=99 undeclared (first use in this function)
    kernel/bpf/task_iter.c:917:29: error: =E2=80=98CSS_TASK_ITER_THREADED=
=E2=80=99 undeclared (first use in this function)
    kernel/bpf/task_iter.c:925:53: error: invalid application of =E2=80=98s=
izeof=E2=80=99 to incomplete type =E2=80=98struct css_task_iter=E2=80=99
    kernel/bpf/task_iter.c:928:2: error: implicit declaration of function =
=E2=80=98css_task_iter_start=E2=80=99; did you mean =E2=80=98task_seq_start=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    kernel/bpf/task_iter.c:938:9: error: implicit declaration of function =
=E2=80=98css_task_iter_next=E2=80=99; did you mean =E2=80=98class_dev_iter_=
next=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    kernel/bpf/task_iter.c:947:2: error: implicit declaration of function =
=E2=80=98css_task_iter_end=E2=80=99 [-Werror=3Dimplicit-function-declaratio=
n]

Warnings:
    kernel/bpf/task_iter.c:938:9: warning: returning =E2=80=98int=E2=80=99 =
from a function with return type =E2=80=98struct task_struct *=E2=80=99 mak=
es pointer from integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warnings, 0=
 section mismatches

Errors:
    kernel/bpf/task_iter.c:917:7: error: =E2=80=98CSS_TASK_ITER_PROCS=E2=80=
=99 undeclared (first use in this function)
    kernel/bpf/task_iter.c:917:29: error: =E2=80=98CSS_TASK_ITER_THREADED=
=E2=80=99 undeclared (first use in this function)
    kernel/bpf/task_iter.c:925:53: error: invalid application of =E2=80=98s=
izeof=E2=80=99 to incomplete type =E2=80=98struct css_task_iter=E2=80=99
    kernel/bpf/task_iter.c:928:2: error: implicit declaration of function =
=E2=80=98css_task_iter_start=E2=80=99; did you mean =E2=80=98task_seq_start=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    kernel/bpf/task_iter.c:938:9: error: implicit declaration of function =
=E2=80=98css_task_iter_next=E2=80=99; did you mean =E2=80=98class_dev_iter_=
next=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    kernel/bpf/task_iter.c:947:2: error: implicit declaration of function =
=E2=80=98css_task_iter_end=E2=80=99 [-Werror=3Dimplicit-function-declaratio=
n]

Warnings:
    kernel/bpf/task_iter.c:938:9: warning: returning =E2=80=98int=E2=80=99 =
from a function with return type =E2=80=98struct task_struct *=E2=80=99 mak=
es pointer from integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 FAIL, 6 errors, 2 warning=
s, 0 section mismatches

Errors:
    kernel/bpf/task_iter.c:917:7: error: =E2=80=98CSS_TASK_ITER_PROCS=E2=80=
=99 undeclared (first use in this function)
    kernel/bpf/task_iter.c:917:29: error: =E2=80=98CSS_TASK_ITER_THREADED=
=E2=80=99 undeclared (first use in this function)
    kernel/bpf/task_iter.c:925:53: error: invalid application of =E2=80=98s=
izeof=E2=80=99 to incomplete type =E2=80=98struct css_task_iter=E2=80=99
    kernel/bpf/task_iter.c:928:2: error: implicit declaration of function =
=E2=80=98css_task_iter_start=E2=80=99; did you mean =E2=80=98task_seq_start=
=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    kernel/bpf/task_iter.c:938:9: error: implicit declaration of function =
=E2=80=98css_task_iter_next=E2=80=99; did you mean =E2=80=98class_dev_iter_=
next=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    kernel/bpf/task_iter.c:947:2: error: implicit declaration of function =
=E2=80=98css_task_iter_end=E2=80=99 [-Werror=3Dimplicit-function-declaratio=
n]

Warnings:
    kernel/bpf/task_iter.c:938:9: warning: returning =E2=80=98int=E2=80=99 =
from a function with return type =E2=80=98struct task_struct *=E2=80=99 mak=
es pointer from integer without a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 2 warnings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-17) =E2=80=94 PASS, 0 er=
rors, 2 warnings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 2 warnings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 2 warnings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warn=
ings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

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
    fs/proc/task_mmu.c:2099:21: error: 'HPAGE_SIZE' undeclared (first use i=
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
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

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
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

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
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 war=
nings, 0 section mismatches

Warnings:
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
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, rustc-1.73) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 war=
nings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, rustc-1.73) =E2=80=94 PASS, 0 errors, 3=
 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to !END=
BR: .text+0x14c599
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust (x86_64, rustc-1.73) =E2=80=94 PASS, 0 errors, 2 warn=
ings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust-samples (x86_64, rustc-1.73) =E2=80=94 PASS, 0 errors=
, 2 warnings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 war=
nings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-board+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 err=
ors, 2 warnings, 0 section mismatches

Warnings:
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.
    WARNING: modpost: vmlinux: acpi_parse_entries_array: EXPORT_SYMBOL used=
 for init symbol. Remove __init or EXPORT_SYMBOL.

---
For more info write to <info@kernelci.org>
