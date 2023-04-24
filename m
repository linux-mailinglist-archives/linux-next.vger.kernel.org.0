Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDDB6ED444
	for <lists+linux-next@lfdr.de>; Mon, 24 Apr 2023 20:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbjDXSTW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Apr 2023 14:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230343AbjDXSTV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Apr 2023 14:19:21 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57EBA123
        for <linux-next@vger.kernel.org>; Mon, 24 Apr 2023 11:19:16 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-63d2ba63dddso3950969b3a.2
        for <linux-next@vger.kernel.org>; Mon, 24 Apr 2023 11:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682360355; x=1684952355;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=77sGzm++QUEbqa9XSdus/vmi/xgHdheg59j8JSPD0lk=;
        b=ucQcZKd0yfCYWWdENqtARhPitVFRjy1A5QSImEajBRv4lsT7noQstD78NdSyujaGk8
         aSQI/F+SYBMSYRZoPNKnoB3fkx61cA4DEO+tcfUEUldDfKQuUVnv/Q4RVpFUsA5A+qXW
         iVT6CUQEzerGmM2hTHrMGSsIPdtfFsfXLWkoA7latoac6gBYCXZAIlZ+gNS93tVP1lcU
         50eGS6nucB4O60qXN9oGH5Uy06rDsKdBQF7yu5rmHvVcEQugQk/pNgYI9v3iNdoB+wJe
         FkyHoFHMtaONiwt01C2Bx6fA3b7uEO/zhPLa+Os7GiZdERw9507+qpZKy4/LIohdpwmw
         OrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682360355; x=1684952355;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77sGzm++QUEbqa9XSdus/vmi/xgHdheg59j8JSPD0lk=;
        b=UK78/4jQZ1UBI5Z09HldsR7uCPbefWem2c7FUi1/4VMmX9+xKe09pSz+ZDEfVKp4z3
         PIHAr0iZhoQDV2PYz7MhV2tIco64KIlgSO1VVMohxJpHjnBIWSiMI+2gYsmVPZ+4plDG
         qY5+FH8dP3/vwhRoc0ebwMVo1FySaSai2Rnrn4bynw7aUm2UCj+6ry+A5baDLJ5hooTA
         meS5hS/9YSYZvJx5lY10g/2JuwuBVVhxDV/xRKz/TiQbbvv4HeqtA6QaZlYcXJHZERMV
         1WdqyGqigl3shbNZrCND3Oj4cQhyIInJakOWTDpZN9M1BSejFF4hvTQZQeV0kuSMNSCD
         GHRQ==
X-Gm-Message-State: AAQBX9el+A8h8YBimMpSKTZIQciG0SC8kE/WKRI5CiqzWeuFzcP+xrZq
        sjVmu5UqNSAe0K/iNca7zylhEH4xATQ0bGCHkZLgvg==
X-Google-Smtp-Source: AKy350ZRXK+2b7TBvc9GgcwzKcGbT8aun/Cn+Rivzq5J99jZ1Wzzfj2IlAuEC54jY8JWNfmI0jSjlQ==
X-Received: by 2002:a05:6a20:8f1e:b0:ee:5625:662f with SMTP id b30-20020a056a208f1e00b000ee5625662fmr19211281pzk.22.1682360354177;
        Mon, 24 Apr 2023 11:19:14 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y7-20020a056a00190700b0063f1430dd57sm5576031pfi.49.2023.04.24.11.19.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 11:19:13 -0700 (PDT)
Message-ID: <6446c821.050a0220.78621.a214@mx.google.com>
Date:   Mon, 24 Apr 2023 11:19:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230424
X-Kernelci-Report-Type: build
Subject: next/master build: 202 builds: 14 failed, 188 passed, 18 errors,
 200 warnings (next-20230424)
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

next/master build: 202 builds: 14 failed, 188 passed, 18 errors, 200 warnin=
gs (next-20230424)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230424/

Tree: next
Branch: master
Git Describe: next-20230424
Git Commit: 3b85b9b39960c08f29fa91b8d984d055dde6017e
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config: (clang-13) =
FAIL
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    allmodconfig: (clang-17) FAIL

arm:
    allmodconfig: (clang-17) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-17) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL

riscv:
    nommu_k210_defconfig: (clang-17) FAIL
    nommu_k210_sdcard_defconfig: (clang-17) FAIL
    nommu_k210_defconfig: (gcc-10) FAIL
    nommu_k210_sdcard_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-17) FAIL

Errors and Warnings Detected:

arc:
    axs103_defconfig (gcc-10): 2 warnings
    axs103_smp_defconfig (gcc-10): 2 warnings
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error
    hsdk_defconfig (gcc-10): 2 warnings
    vdk_hs38_defconfig (gcc-10): 2 warnings
    vdk_hs38_smp_defconfig (gcc-10): 2 warnings

arm64:
    allmodconfig (clang-17): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (clang-13): =
1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook (clang-13): 1 error, 1 warning
    defconfig (clang-17): 3 warnings

arm:
    allmodconfig (clang-17): 1 error, 1 warning
    aspeed_g5_defconfig (clang-17): 3 warnings
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
    multi_v5_defconfig (gcc-10): 2 warnings
    multi_v5_defconfig (clang-17): 3 warnings
    multi_v7_defconfig (gcc-10): 2 warnings
    multi_v7_defconfig (clang-17): 3 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-10): 2 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-10): 2 warni=
ngs
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 2 warnings
    multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (gcc-10): 2 warnings
    multi_v7_defconfig+debug (gcc-10): 2 warnings
    multi_v7_defconfig+kselftest (gcc-10): 2 warnings
    mvebu_v5_defconfig (gcc-10): 2 warnings
    mvebu_v7_defconfig (gcc-10): 2 warnings
    mxs_defconfig (gcc-10): 2 warnings
    nhk8815_defconfig (gcc-10): 2 warnings
    orion5x_defconfig (gcc-10): 2 warnings
    pxa_defconfig (gcc-10): 2 warnings
    qcom_defconfig (gcc-10): 2 warnings
    rpc_defconfig (gcc-10): 2 errors
    s3c6400_defconfig (gcc-10): 2 warnings
    s5pv210_defconfig (gcc-10): 2 warnings
    sama5_defconfig (gcc-10): 2 warnings
    sama7_defconfig (gcc-10): 2 warnings
    socfpga_defconfig (gcc-10): 2 warnings
    sp7021_defconfig (gcc-10): 2 warnings
    spear13xx_defconfig (gcc-10): 2 warnings
    spear3xx_defconfig (gcc-10): 2 warnings
    spear6xx_defconfig (gcc-10): 2 warnings
    spitz_defconfig (gcc-10): 2 warnings
    stm32_defconfig (gcc-10): 2 warnings
    sunxi_defconfig (gcc-10): 2 warnings
    tegra_defconfig (gcc-10): 2 warnings
    u8500_defconfig (gcc-10): 2 warnings
    vexpress_defconfig (gcc-10): 2 warnings
    vf610m4_defconfig (gcc-10): 2 warnings
    vt8500_v6_v7_defconfig (gcc-10): 2 warnings

i386:
    allmodconfig (clang-17): 1 error, 1 warning

mips:
    32r2el_defconfig (gcc-10): 2 warnings
    32r2el_defconfig+debug (gcc-10): 2 warnings
    32r2el_defconfig+kselftest (gcc-10): 2 warnings
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
    gcw0_defconfig (gcc-10): 2 warnings
    ip27_defconfig (gcc-10): 2 warnings
    jazz_defconfig (gcc-10): 2 warnings
    lemote2f_defconfig (gcc-10): 1 error
    loongson1b_defconfig (gcc-10): 2 warnings
    loongson1c_defconfig (gcc-10): 2 warnings
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 1 error
    pic32mzda_defconfig (gcc-10): 2 warnings
    qi_lb60_defconfig (gcc-10): 2 warnings
    rm200_defconfig (gcc-10): 2 warnings
    rs90_defconfig (gcc-10): 2 warnings

riscv:
    defconfig (clang-17): 3 warnings
    defconfig (gcc-10): 2 warnings
    defconfig+debug (gcc-10): 2 warnings
    nommu_k210_defconfig (clang-17): 1 error
    nommu_k210_defconfig (gcc-10): 1 error
    nommu_k210_sdcard_defconfig (clang-17): 1 error
    nommu_k210_sdcard_defconfig (gcc-10): 1 error
    rv32_defconfig (clang-17): 3 warnings
    rv32_defconfig (gcc-10): 2 warnings

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 6 warnings
    sparc64_defconfig+debug (gcc-10): 4 warnings
    sparc64_defconfig+kselftest (gcc-10): 4 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    allmodconfig (clang-17): 1 error, 2 warnings

Errors summary:

    7    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable =
'ret' is uninitialized when used here [-Werror,-Wuninitialized]
    4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    4    ERROR: modpost: Section mismatches detected.
    1    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or =
directory
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    76   fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=
=99 [-Wunused-variable]
    76   fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=
=99 [-Wunused-variable]
    10   fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-va=
riable]
    10   fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-var=
iable]
    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    8    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initializ=
e the variable 'ret' to silence this warning
    5    2 warnings generated.
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    fs/reiserfs/reiserfs.o: warning: objtool: balance_leaf+0x7683: sta=
ck state mismatch: cfa1=3D4+360 cfa2=3D4+352
    1    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: warning: variabl=
e 'ret' is uninitialized when used here [-Wuninitialized]
    1    1 warning generated.

Section mismatches summary:

    9    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_ca=
llin (section: .text) -> probe_vendor_features (section: .init.text)

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
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warni=
ngs, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-17) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-17) =E2=80=94 FAIL, 1 error, 2 warnings, 0 sect=
ion mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning
    fs/reiserfs/reiserfs.o: warning: objtool: balance_leaf+0x7683: stack st=
ate mismatch: cfa1=3D4+360 cfa2=3D4+352

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-17) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-17) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

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
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]
    2 warnings generated.

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
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
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
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatc=
hes

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

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
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]
    2 warnings generated.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-17) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: warning: variable 're=
t' is uninitialized when used here [-Wuninitialized]
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning
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
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
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
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

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
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

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
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 FAIL, 1 error, 0 wa=
rnings, 0 section mismatches

Errors:
    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or direc=
tory

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
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
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
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]
    2 warnings generated.

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
multi_v7_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]
    2 warnings generated.

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
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warn=
ings, 0 section mismatches

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
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

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
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 FAIL, 1 error, 0 warnings,=
 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0=
 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 FAIL, 1 error, 0 wa=
rnings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warn=
ings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

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
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

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
rv32_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]
    2 warnings generated.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

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
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 war=
nings, 0 section mismatches

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
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

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
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
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
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

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

---
For more info write to <info@kernelci.org>
