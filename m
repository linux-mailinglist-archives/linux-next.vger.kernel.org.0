Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF5316F1D1E
	for <lists+linux-next@lfdr.de>; Fri, 28 Apr 2023 19:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346508AbjD1RCe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 28 Apr 2023 13:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346429AbjD1RCO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 28 Apr 2023 13:02:14 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB2FB5FE9
        for <linux-next@vger.kernel.org>; Fri, 28 Apr 2023 10:02:00 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-63b67a26069so298882b3a.0
        for <linux-next@vger.kernel.org>; Fri, 28 Apr 2023 10:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682701320; x=1685293320;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FWZkLQ+vN8mG87IznvZ7gpWiCF7adRPXX+kphbRMtg4=;
        b=KXF2gLKUW1M/C6PGVFAFzEJQGyf+87ydy2yUzhpL1iXEi4yzdV3LeB+5Q270bPks2F
         LW8w2Xr7SY5j9vOOXXtifozQSL+2KZFHh0shC/1BpVso35KSKGGuGIW3RdscY0M7zSqG
         +6bhgf0oCznikxKG/aev6ImJH2FJnixvdzm3dSFehOvDhG3cBIdJiiWzecOOoNl13ti6
         miP+AeW3cT4KKC1r5AwrLaFpLe2Fpdu3weSePzLzBxCoIti0fsoMUWYQikyZPIuW7adc
         fhxRUVGjbHhcQ1OzU/+PL0MAE/3boBzWfb1iRuP9EAGpQCG/EhWy2zGQlt3Q2E7UHYKd
         l3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682701320; x=1685293320;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWZkLQ+vN8mG87IznvZ7gpWiCF7adRPXX+kphbRMtg4=;
        b=HJPXd17vKZnwAkrR8GPvXJ40S5WmwFNSc7rh511dTaBgDg2yGQQtvT7LEofk0q5SXI
         Bnv0COJMuI+05IvQAfbPM8iP2vNpmZJW38flNygp0WbAH4W5oU8E8DDZ0yWR6ypHpIFh
         K9ffuGYJzjfjHeoGgMM1ZtemaGvvYDPwbgbr/3Ff9B3JEuIPIdvnnBuWm+HTF68OwHso
         d3WpLp6Pu6EO1Cyr4BGgNEYo9fP2e/tEdwgyQnWq6PIn0jq1bdtFnzheMd/nKdqE95gc
         SB7lz2TkE4bk5UQsJ0tQq4MYHPdY9lgU+FfBel2F+qEsrnhj2Oh5friRtNhnFv6a3LWb
         u5KQ==
X-Gm-Message-State: AC+VfDyj/jbAEloyO3em0dx3vu/SdW5D+4TqzzmdZ+FD/IIt+DqL3iLz
        sFCvdJiWtb1m6Q7IYCn7YYyHPxxBMHDgvOS9OxE=
X-Google-Smtp-Source: ACHHUZ5FxHZMPzLGcQhwIRbWNX9EuUluzkUQJOOuFcZzVGw2gNukqcdhs+WbnOfX9tECdiPbT4Y6gg==
X-Received: by 2002:a05:6a21:6d94:b0:ed:1d7a:3339 with SMTP id wl20-20020a056a216d9400b000ed1d7a3339mr7636025pzb.57.1682701318436;
        Fri, 28 Apr 2023 10:01:58 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b17-20020a62a111000000b00640f1e4a811sm6739300pff.22.2023.04.28.10.01.57
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 10:01:57 -0700 (PDT)
Message-ID: <644bfc05.620a0220.51d0a.eddb@mx.google.com>
Date:   Fri, 28 Apr 2023 10:01:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.3-10703-gb3f869e79cdf
X-Kernelci-Report-Type: build
Subject: next/pending-fixes build: 149 builds: 2 failed, 147 passed, 7 errors,
 174 warnings (v6.3-10703-gb3f869e79cdf)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 149 builds: 2 failed, 147 passed, 7 errors, 174 w=
arnings (v6.3-10703-gb3f869e79cdf)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v6.3-10703-gb3f869e79cdf/

Tree: next
Branch: pending-fixes
Git Describe: v6.3-10703-gb3f869e79cdf
Git Commit: b3f869e79cdf0e15e03b2e77ca14e825c18d933e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arm:
    allmodconfig: (gcc-10) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    axs103_defconfig (gcc-10): 2 warnings
    axs103_smp_defconfig (gcc-10): 2 warnings
    hsdk_defconfig (gcc-10): 2 warnings
    vdk_hs38_defconfig (gcc-10): 2 warnings
    vdk_hs38_smp_defconfig (gcc-10): 2 warnings

arm64:

arm:
    allmodconfig (gcc-10): 3 errors, 1 warning
    aspeed_g5_defconfig (gcc-10): 2 warnings
    at91_dt_defconfig (gcc-10): 2 warnings
    axm55xx_defconfig (gcc-10): 2 warnings
    bcm2835_defconfig (gcc-10): 2 warnings
    davinci_all_defconfig (gcc-10): 2 warnings
    exynos_defconfig (gcc-10): 2 warnings
    hisi_defconfig (gcc-10): 2 warnings
    imx_v4_v5_defconfig (gcc-10): 2 warnings
    imxrt_defconfig (gcc-10): 2 warnings
    ixp4xx_defconfig (gcc-10): 2 warnings
    keystone_defconfig (gcc-10): 2 warnings
    milbeaut_m10v_defconfig (gcc-10): 2 warnings
    mmp2_defconfig (gcc-10): 2 warnings
    moxart_defconfig (gcc-10): 2 warnings
    multi_v7_defconfig (gcc-10): 2 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-10): 2 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-10): 2 warni=
ngs
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 2 warnings
    multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (gcc-10): 2 warnings
    multi_v7_defconfig+crypto (gcc-10): 2 warnings
    multi_v7_defconfig+ima (gcc-10): 2 warnings
    mvebu_v5_defconfig (gcc-10): 2 warnings
    nhk8815_defconfig (gcc-10): 2 warnings
    orion5x_defconfig (gcc-10): 2 warnings
    pxa_defconfig (gcc-10): 2 warnings
    qcom_defconfig (gcc-10): 2 warnings
    s3c6400_defconfig (gcc-10): 2 warnings
    s5pv210_defconfig (gcc-10): 2 warnings
    sama5_defconfig (gcc-10): 2 warnings
    sama7_defconfig (gcc-10): 2 warnings
    socfpga_defconfig (gcc-10): 2 warnings
    sp7021_defconfig (gcc-10): 2 warnings
    spear13xx_defconfig (gcc-10): 2 warnings
    spear6xx_defconfig (gcc-10): 2 warnings
    spitz_defconfig (gcc-10): 2 warnings
    sunxi_defconfig (gcc-10): 2 warnings
    tegra_defconfig (gcc-10): 2 warnings
    u8500_defconfig (gcc-10): 2 warnings
    vf610m4_defconfig (gcc-10): 2 warnings
    vt8500_v6_v7_defconfig (gcc-10): 2 warnings

i386:

mips:
    32r2el_defconfig (gcc-10): 2 warnings
    32r2el_defconfig+debug (gcc-10): 2 warnings
    bmips_be_defconfig (gcc-10): 2 warnings
    bmips_stb_defconfig (gcc-10): 2 warnings
    cavium_octeon_defconfig (gcc-10): 2 warnings
    ci20_defconfig (gcc-10): 2 warnings
    cobalt_defconfig (gcc-10): 2 warnings
    cu1000-neo_defconfig (gcc-10): 2 warnings
    cu1830-neo_defconfig (gcc-10): 2 warnings
    db1xxx_defconfig (gcc-10): 2 warnings
    decstation_64_defconfig (gcc-10): 2 warnings
    decstation_defconfig (gcc-10): 2 warnings
    decstation_r4k_defconfig (gcc-10): 2 warnings
    fuloong2e_defconfig (gcc-10): 1 error, 2 warnings
    ip27_defconfig (gcc-10): 2 warnings
    jazz_defconfig (gcc-10): 2 warnings
    lemote2f_defconfig (gcc-10): 1 error
    loongson1b_defconfig (gcc-10): 2 warnings
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 1 error
    pic32mzda_defconfig (gcc-10): 2 warnings
    qi_lb60_defconfig (gcc-10): 2 warnings
    rm200_defconfig (gcc-10): 2 warnings
    rs90_defconfig (gcc-10): 2 warnings

riscv:
    defconfig (gcc-10): 2 warnings
    defconfig+kselftest (gcc-10): 2 warnings
    rv32_defconfig (gcc-10): 2 warnings

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 6 warnings
    sparc64_defconfig+debug (gcc-10): 4 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    allnoconfig (gcc-10): 3 warnings
    x86_64_defconfig (gcc-10): 3 warnings
    x86_64_defconfig+amdgpu (gcc-10): 3 warnings
    x86_64_defconfig+ima (gcc-10): 3 warnings
    x86_64_defconfig+x86-chromebook (gcc-10): 3 warnings
    x86_64_defconfig+x86-chromebook+amdgpu (gcc-10): 3 warnings
    x86_64_defconfig+x86_kvm_guest (gcc-10): 3 warnings

Errors summary:

    4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    1    drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:66:5: error: "CO=
NFIG_ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Werror=3Dundef]
    1    drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:51:5: error: "CO=
NFIG_ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Werror=3Dundef]
    1    drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:33:5: error: "CO=
NFIG_ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Werror=3Dundef]

Warnings summary:

    66   fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=
=99 [-Wunused-variable]
    66   fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=
=99 [-Wunused-variable]
    8    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    6    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    6    vmlinux.o: warning: objtool: __import_iovec+0x1b2: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    6    vmlinux.o: warning: objtool: .altinstr_replacement+0x1aca: redunda=
nt UACCESS disable
    5    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-va=
riable]
    5    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-var=
iable]
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    lib/iov_iter.o: warning: objtool: iovec_from_user.part.0+0x52: cal=
l to copy_iovec_from_user.part.0() with UACCESS enabled
    1    lib/iov_iter.o: warning: objtool: __import_iovec+0x16c: call to co=
py_iovec_from_user.part.0() with UACCESS enabled
    1    lib/iov_iter.o: warning: objtool: .altinstr_replacement+0x1f: redu=
ndant UACCESS disable
    1    cc1: all warnings being treated as errors

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 3 errors, 1 warning, 0 section m=
ismatches

Errors:
    drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:33:5: error: "CONFIG_=
ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Werror=3Dundef]
    drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:51:5: error: "CONFIG_=
ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Werror=3Dundef]
    drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:66:5: error: "CONFIG_=
ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Werror=3Dundef]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    lib/iov_iter.o: warning: objtool: .altinstr_replacement+0x1f: redundant=
 UACCESS disable
    lib/iov_iter.o: warning: objtool: iovec_from_user.part.0+0x52: call to =
copy_iovec_from_user.part.0() with UACCESS enabled
    lib/iov_iter.o: warning: objtool: __import_iovec+0x16c: call to copy_io=
vec_from_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 2 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]

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
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 2 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2=
 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 2 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+crypto (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+ima (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1aca: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x1b2: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnin=
gs, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1aca: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x1b2: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1aca: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x1b2: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
3 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1aca: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x1b2: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 3 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1aca: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x1b2: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3=
 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1aca: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x6d: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x1b2: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---
For more info write to <info@kernelci.org>
