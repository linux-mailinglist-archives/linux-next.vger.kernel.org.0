Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 292537D2C75
	for <lists+linux-next@lfdr.de>; Mon, 23 Oct 2023 10:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbjJWIR3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Oct 2023 04:17:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbjJWIR2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Oct 2023 04:17:28 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 001C9D70
        for <linux-next@vger.kernel.org>; Mon, 23 Oct 2023 01:17:22 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6bd96cfb99cso2212873b3a.2
        for <linux-next@vger.kernel.org>; Mon, 23 Oct 2023 01:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1698049042; x=1698653842; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pmeXDHuU06UT6fKthnP1Hn8CE+t5myG37vu0tPxfrrk=;
        b=ityCPvf8HmnHZ6OAu/wJhDSHidqmabElSpoahc8Bh5o86djy16S6WXOZZuyPyn1+yB
         ft13xqU5cvmFN8zdJ9GhuXN4NchR7ozosiEjdn21/PjuycP/3xkapmZ7y17L1esAs3Lr
         jpI2mTECsrmlxdzkAGrFPlZhU9jpOtMeGVWTI5JZY3+nkM8C53/cKZOsmGpl7TPVo52Q
         mZu/FhTP403Y8zQ7KmVdGq977lFtIvLMP5BGuZ0qe2wJdPGuIpaW7MQYPsD95Z55LXAN
         CPeQyTPPv+NqYxZ1Espm9+OVC82BG9f5Rjgny+gTrbM1hsNYJT1pHYthCGDEGEE7/lT+
         doJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049042; x=1698653842;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pmeXDHuU06UT6fKthnP1Hn8CE+t5myG37vu0tPxfrrk=;
        b=HYiQ+QqLAnXgsoxE3G34BWsz6YLMyRuaG1nJs8M6OH3L4fnBajZPBnFsSIrE/vpbsV
         cKbDYDWP8/NGKo+rcf0C/3QHILhRkdsiMpGdbLRF5zIAxHr7FbvsMwKcHz3XS3Ak0rIa
         x5jtCddJ4m1kPr6vMoT5IqFbeR7ouJ6kV21dWie4h811G8Dnj2jQWnXrT/Bt0m2ddWnu
         6TDFbJKB7clcbHREG4q1HVTEyu2KCZUW8fozFZzmct3dOoi7TmlW/xKSXHKujd0gjQ6y
         8q+FHzrY+Fun/xZYYhGrJD0yMw4Ons5/bB+9/Zgjsf+lHg/CZV+LS5ujRsXp4yxgJe47
         2h4w==
X-Gm-Message-State: AOJu0YyxYFVfgp8NvpGF1oPBDbi2wy9jOf9JbjF2PcrRyerLN2gAGZJ4
        OpRVtFgfrDitF2J+f8mk6GYi6i09qsaiu1IVVNdbcQ==
X-Google-Smtp-Source: AGHT+IEKjH/lBVO/OnkioEKN37mmlKGw25sXH1qP7YVLrbovs7iJgT+BuofBDNlqNm11dLcNPuJmPA==
X-Received: by 2002:a05:6a20:9192:b0:15e:a8:6bb4 with SMTP id v18-20020a056a20919200b0015e00a86bb4mr6212610pzd.8.1698049041305;
        Mon, 23 Oct 2023 01:17:21 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id x11-20020aa7956b000000b006baa1cf561dsm5625814pfq.0.2023.10.23.01.17.20
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 01:17:20 -0700 (PDT)
Message-ID: <65362c10.a70a0220.2d0a.0d1c@mx.google.com>
Date:   Mon, 23 Oct 2023 01:17:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20231023
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 179 builds: 6 failed, 173 passed, 31 errors,
 50 warnings (next-20231023)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 179 builds: 6 failed, 173 passed, 31 errors, 50 warnings=
 (next-20231023)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20231023/

Tree: next
Branch: master
Git Describe: next-20231023
Git Commit: e8361b005d7c92997d12f2b85a9e4a525738bd9d
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm:
    rpc_defconfig: (gcc-10) FAIL

mips:
    cavium_octeon_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    decstation_defconfig: (gcc-10) FAIL
    decstation_r4k_defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error

arm64:

arm:
    imx_v6_v7_defconfig (gcc-10): 28 warnings
    rpc_defconfig (gcc-10): 8 errors

i386:

mips:
    cavium_octeon_defconfig (gcc-10): 4 errors, 3 warnings
    decstation_64_defconfig (gcc-10): 6 errors, 2 warnings
    decstation_defconfig (gcc-10): 6 errors, 2 warnings
    decstation_r4k_defconfig (gcc-10): 6 errors, 2 warnings

riscv:

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    x86_64_defconfig+kselftest (rustc-1.72): 1 warning

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
    1    arch/arm/kernel/debug.S:84: Error: missing expression -- `ldr r2,=
=3D0x'
    1    arch/arm/kernel/debug.S:84: Error: missing expression -- `ldr r1,=
=3D0x'
    1    arch/arm/kernel/debug.S:118: Error: missing expression -- `ldr r3,=
=3D0x'
    1    arch/arm/kernel/debug.S:118: Error: missing expression -- `ldr r2,=
=3D0x'
    1    arch/arm/kernel/debug.S:110: Error: missing expression -- `ldr r2,=
=3D0x'
    1    arch/arm/kernel/debug.S:110: Error: missing expression -- `ldr r1,=
=3D0x'

Warnings summary:

    28   include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_=
dirty_bitmap=E2=80=99 declared inside parameter list will not be visible ou=
tside of this definition or declaration
    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    3    kernel/bpf/task_iter.c:938:9: warning: returning =E2=80=98int=E2=
=80=99 from a function with return type =E2=80=98struct task_struct *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]
    3    cc1: some warnings being treated as errors
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x39: relocation to=
 !ENDBR: .text+0x14bf94
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
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 FAIL, 4 errors, 3 warnings=
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
defconfig (arm64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
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
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 28 warnings, 0 =
section mismatches

Warnings:
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration
    include/linux/io-pgtable.h:172:16: warning: =E2=80=98struct iommu_dirty=
_bitmap=E2=80=99 declared inside parameter list will not be visible outside=
 of this definition or declaration

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
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

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
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'
    arch/arm/kernel/debug.S:84: Error: missing expression -- `ldr r1,=3D0x'
    arch/arm/kernel/debug.S:84: Error: missing expression -- `ldr r2,=3D0x'
    arch/arm/kernel/debug.S:110: Error: missing expression -- `ldr r1,=3D0x'
    arch/arm/kernel/debug.S:110: Error: missing expression -- `ldr r2,=3D0x'
    arch/arm/kernel/debug.S:118: Error: missing expression -- `ldr r2,=3D0x'
    arch/arm/kernel/debug.S:118: Error: missing expression -- `ldr r3,=3D0x'

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
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, rustc-1.72) =E2=80=94 PASS, 0 errors, 0 warnings,=
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
x86_64_defconfig+kselftest (x86_64, rustc-1.72) =E2=80=94 PASS, 0 errors, 1=
 warning, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x39: relocation to !END=
BR: .text+0x14bf94

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust (x86_64, rustc-1.72) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust-samples (x86_64, rustc-1.72) =E2=80=94 PASS, 0 errors=
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
