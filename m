Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD3B7AE7EF
	for <lists+linux-next@lfdr.de>; Tue, 26 Sep 2023 10:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbjIZIWN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Sep 2023 04:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232778AbjIZIWM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Sep 2023 04:22:12 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70EC97
        for <linux-next@vger.kernel.org>; Tue, 26 Sep 2023 01:22:02 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6c4f1f0774dso1311745a34.2
        for <linux-next@vger.kernel.org>; Tue, 26 Sep 2023 01:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1695716522; x=1696321322; darn=vger.kernel.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2PSwfRxOY56VkJVaMbdmAEvh2D+9l5biQzhoaigkn5I=;
        b=bJvdL5JoMsAHOmcVCJEnbsw4Ry7hmwA4mJV7jmv0x9zRJtpri8oHAl7iQ7TWHp0ud/
         lPPydSiDc5K34Kg8jSl+P9oZ8160jSEodeUJIIGERr5IMpZAyMk6BmSBrRAH7AyDUN8b
         J73cvC9Ukk/U5Lr7j0ayYhymGEMJRV0QU0BsBlWfYFZ5QkRr/anzkEKOWwYM0Del5Gbg
         RlbGWQe/y6frNzvLFrAqiiH73CsYKKCTC4McCIxiWmKZEcPNUwAp+UBh7V4hHH7hkvYs
         Pqsixfcdrd8IN4PlI1y3dvBlAW7weGdiIgaUP0/kXDi1ASPgDri74wFyxwzIm3iW5+K+
         CHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695716522; x=1696321322;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PSwfRxOY56VkJVaMbdmAEvh2D+9l5biQzhoaigkn5I=;
        b=QZp2053oVl90U10nPXwjPaLY+KocNte5ywNR7VY5kOHpGLJ7ie3WnrZTWj2jvsKsGc
         By2WuW4qOLS+Kdc6aPUyA/kRVRs9gvQ6xM43w69DU03f+HBIXel+m5ejZ6ZGyo9gem04
         YrHjfT4sgM3FEkilwasvSqkiNCIfcdwSHB1D2azGU9w2opBsUrddqBDDy6SS1M/V/Z15
         Zj5O5cDRdnZbEjj28iTcIllMoSuaBHdAzhHe+/NSEyWfXnVLdB9YIGP2IKB672daeO7q
         Djf7W8O6NkfoTSwJmaMZWGOVd0C8+jU7Vnft9/AHEBVBp971lp+l4Zqpowx+S5Dbg1VT
         2BNQ==
X-Gm-Message-State: AOJu0Ywx3ULd0zCaMPngInAKyQnmScaq82WZgascv8OJg2sIgih3ftKB
        B6zQIr41FiFWv64KKKdoaSv43/fZozqZgd+MipXHOA==
X-Google-Smtp-Source: AGHT+IHlZ+C1syLypqU6FLXpTwtM0Vg7D9VbXbjDVTM/GgWCTj6AuBopPBG3SD+HCmIObgLTU0aDPA==
X-Received: by 2002:a05:6358:91a6:b0:13a:bd3:3f85 with SMTP id j38-20020a05635891a600b0013a0bd33f85mr10583081rwa.23.1695716521009;
        Tue, 26 Sep 2023 01:22:01 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id i6-20020aa787c6000000b0068a0b5df6b2sm9399747pfo.196.2023.09.26.01.21.59
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 01:21:59 -0700 (PDT)
Message-ID: <651294a7.a70a0220.5b80e.7e3b@mx.google.com>
Date:   Tue, 26 Sep 2023 01:21:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230926
X-Kernelci-Report-Type: build
Subject: next/master build: 184 builds: 15 failed, 169 passed, 28 errors,
 144 warnings (next-20230926)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 184 builds: 15 failed, 169 passed, 28 errors, 144 warnin=
gs (next-20230926)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230926/

Tree: next
Branch: master
Git Describe: next-20230926
Git Commit: 4ae73bba62a367f2314f6ce69e3085a941983d8b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    axs103_defconfig: (gcc-10) FAIL
    axs103_smp_defconfig: (gcc-10) FAIL
    haps_hs_defconfig: (gcc-10) FAIL
    haps_hs_smp_defconfig: (gcc-10) FAIL
    haps_hs_smp_defconfig+debug: (gcc-10) FAIL
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL
    nsimosci_hs_defconfig: (gcc-10) FAIL
    nsimosci_hs_smp_defconfig: (gcc-10) FAIL
    vdk_hs38_defconfig: (gcc-10) FAIL
    vdk_hs38_smp_defconfig: (gcc-10) FAIL

arm:
    ep93xx_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL
    socfpga_defconfig: (gcc-10) FAIL

mips:
    cavium_octeon_defconfig: (gcc-10) FAIL
    cobalt_defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-10): 1 warning
    axs103_defconfig (gcc-10): 2 errors, 1 warning
    axs103_smp_defconfig (gcc-10): 2 errors, 1 warning
    haps_hs_defconfig (gcc-10): 2 errors, 1 warning
    haps_hs_smp_defconfig (gcc-10): 2 errors, 1 warning
    haps_hs_smp_defconfig+debug (gcc-10): 2 errors, 1 warning
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error
    hsdk_defconfig (gcc-10): 1 warning
    nsimosci_hs_defconfig (gcc-10): 2 errors, 1 warning
    nsimosci_hs_smp_defconfig (gcc-10): 2 errors, 1 warning
    vdk_hs38_defconfig (gcc-10): 2 errors, 1 warning
    vdk_hs38_smp_defconfig (gcc-10): 2 errors, 1 warning

arm64:

arm:
    am200epdkit_defconfig (gcc-10): 1 warning
    aspeed_g4_defconfig (gcc-10): 1 warning
    aspeed_g5_defconfig (gcc-10): 1 warning
    aspeed_g5_defconfig (clang-17): 2 warnings
    assabet_defconfig (gcc-10): 1 warning
    at91_dt_defconfig (gcc-10): 1 warning
    axm55xx_defconfig (gcc-10): 1 warning
    bcm2835_defconfig (gcc-10): 1 warning
    collie_defconfig (gcc-10): 1 warning
    davinci_all_defconfig (gcc-10): 1 warning
    ep93xx_defconfig (gcc-10): 1 error, 1 warning
    exynos_defconfig (gcc-10): 1 warning
    footbridge_defconfig (gcc-10): 1 warning
    gemini_defconfig (gcc-10): 1 warning
    h3600_defconfig (gcc-10): 1 warning
    hisi_defconfig (gcc-10): 1 warning
    imx_v6_v7_defconfig (gcc-10): 1 warning
    integrator_defconfig (gcc-10): 1 warning
    ixp4xx_defconfig (gcc-10): 1 warning
    jornada720_defconfig (gcc-10): 1 warning
    keystone_defconfig (gcc-10): 1 warning
    lpc32xx_defconfig (gcc-10): 1 warning
    milbeaut_m10v_defconfig (gcc-10): 1 warning
    mmp2_defconfig (gcc-10): 1 warning
    moxart_defconfig (gcc-10): 1 warning
    multi_v4t_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (clang-17): 2 warnings
    multi_v5_defconfig (gcc-10): 1 warning
    multi_v7_defconfig (gcc-10): 1 warning
    multi_v7_defconfig (clang-17): 2 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-10): 1 warning
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-10): 1 warni=
ng
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 1 warning
    multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (gcc-10): 1 warning
    multi_v7_defconfig+debug (gcc-10): 1 warning
    multi_v7_defconfig+kselftest (gcc-10): 1 warning
    mvebu_v5_defconfig (gcc-10): 1 warning
    mvebu_v7_defconfig (gcc-10): 1 warning
    mxs_defconfig (gcc-10): 1 warning
    neponset_defconfig (gcc-10): 1 warning
    netwinder_defconfig (gcc-10): 1 warning
    nhk8815_defconfig (gcc-10): 1 warning
    omap2plus_defconfig (gcc-10): 1 warning
    orion5x_defconfig (gcc-10): 1 warning
    pxa168_defconfig (gcc-10): 1 warning
    pxa3xx_defconfig (gcc-10): 1 warning
    pxa910_defconfig (gcc-10): 1 warning
    pxa_defconfig (gcc-10): 1 warning
    qcom_defconfig (gcc-10): 1 warning
    realview_defconfig (gcc-10): 1 warning
    rpc_defconfig (gcc-10): 2 errors
    s3c6400_defconfig (gcc-10): 1 warning
    s5pv210_defconfig (gcc-10): 1 warning
    sama5_defconfig (gcc-10): 1 warning
    sama7_defconfig (gcc-10): 1 warning
    shmobile_defconfig (gcc-10): 1 warning
    socfpga_defconfig (gcc-10): 1 error, 1 warning
    sp7021_defconfig (gcc-10): 1 warning
    spear13xx_defconfig (gcc-10): 1 warning
    spear3xx_defconfig (gcc-10): 1 warning
    spear6xx_defconfig (gcc-10): 1 warning
    spitz_defconfig (gcc-10): 1 warning
    sunxi_defconfig (gcc-10): 1 warning
    tegra_defconfig (gcc-10): 1 warning
    u8500_defconfig (gcc-10): 1 warning
    versatile_defconfig (gcc-10): 1 warning
    vexpress_defconfig (gcc-10): 1 warning
    vt8500_v6_v7_defconfig (gcc-10): 1 warning
    wpcm450_defconfig (gcc-10): 1 warning

i386:
    allnoconfig (clang-17): 2 warnings
    allnoconfig (gcc-10): 1 warning

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    bcm47xx_defconfig (gcc-10): 1 warning
    bcm63xx_defconfig (gcc-10): 1 warning
    bigsur_defconfig (gcc-10): 1 warning
    bmips_be_defconfig (gcc-10): 1 warning
    bmips_stb_defconfig (gcc-10): 1 warning
    cavium_octeon_defconfig (gcc-10): 4 errors, 3 warnings
    cobalt_defconfig (gcc-10): 1 error, 1 warning
    db1xxx_defconfig (gcc-10): 1 warning
    decstation_defconfig (gcc-10): 1 warning
    decstation_r4k_defconfig (gcc-10): 1 warning
    fuloong2e_defconfig (gcc-10): 1 warning
    gcw0_defconfig (gcc-10): 1 warning
    gpr_defconfig (gcc-10): 1 warning
    ip22_defconfig (gcc-10): 1 warning
    ip27_defconfig (gcc-10): 1 warning
    ip32_defconfig (gcc-10): 1 warning
    jazz_defconfig (gcc-10): 1 warning
    lemote2f_defconfig (gcc-10): 1 warning
    loongson1b_defconfig (gcc-10): 1 warning
    loongson1c_defconfig (gcc-10): 1 warning
    loongson2k_defconfig (gcc-10): 1 warning
    malta_defconfig (gcc-10): 1 warning
    malta_kvm_defconfig (gcc-10): 1 warning
    malta_qemu_32r6_defconfig (gcc-10): 1 warning
    maltaaprp_defconfig (gcc-10): 1 warning
    maltasmvp_defconfig (gcc-10): 1 warning
    maltasmvp_eva_defconfig (gcc-10): 1 warning
    maltaup_defconfig (gcc-10): 1 warning
    maltaup_xpa_defconfig (gcc-10): 1 warning
    mtx1_defconfig (gcc-10): 1 warning
    pic32mzda_defconfig (gcc-10): 1 warning
    rb532_defconfig (gcc-10): 1 warning
    rbtx49xx_defconfig (gcc-10): 1 warning
    rm200_defconfig (gcc-10): 1 warning
    rs90_defconfig (gcc-10): 1 warning
    sb1250_swarm_defconfig (gcc-10): 1 warning

riscv:

sparc:
    allnoconfig (gcc-10): 2 warnings
    sparc32_defconfig (gcc-10): 3 warnings
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    allnoconfig (gcc-10): 1 warning
    allnoconfig (clang-17): 2 warnings
    x86_64_defconfig+kselftest (rustc-1.71): 1 warning

Errors summary:

    8    xfrm_algo.c:(.text+0x460): undefined reference to `crypto_has_aead'
    8    arc-elf32-ld: xfrm_algo.c:(.text+0x460): undefined reference to `c=
rypto_has_aead'
    2    /tmp/kci/linux/build/../net/xfrm/xfrm_algo.c:695: undefined refere=
nce to `crypto_has_aead'
    1    xfrm_algo.c:(.text+0x800): undefined reference to `crypto_has_aead'
    1    xfrm_algo.c:(.text+0x634): undefined reference to `crypto_has_aead'
    1    fs/proc/task_mmu.c:2102:21: error: 'HPAGE_SIZE' undeclared (first =
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
    1    arc-elf32-ld: /tmp/kci/linux/build/../net/xfrm/xfrm_algo.c:695: un=
defined reference to `crypto_has_aead'

Warnings summary:

    107  fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout=
_range=E2=80=99 defined but not used [-Wunused-function]
    11   fs/proc/task_mmu.c:2022:13: warning: 'pagemap_scan_backout_range' =
defined but not used [-Wunused-function]
    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    5    fs/proc/task_mmu.c:2022:13: warning: unused function 'pagemap_scan=
_backout_range' [-Wunused-function]
    5    1 warning generated.
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x23: relocation to=
 !ENDBR: .text+0x14b57b
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
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: unused function 'pagemap_scan_back=
out_range' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: unused function 'pagemap_scan_back=
out_range' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: 'pagemap_scan_backout_range' defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: unused function 'pagemap_scan_back=
out_range' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

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
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 secti=
on mismatches

Errors:
    xfrm_algo.c:(.text+0x460): undefined reference to `crypto_has_aead'
    arc-elf32-ld: xfrm_algo.c:(.text+0x460): undefined reference to `crypto=
_has_aead'

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: 'pagemap_scan_backout_range' defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 s=
ection mismatches

Errors:
    xfrm_algo.c:(.text+0x460): undefined reference to `crypto_has_aead'
    arc-elf32-ld: xfrm_algo.c:(.text+0x460): undefined reference to `crypto=
_has_aead'

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: 'pagemap_scan_backout_range' defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

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
cobalt_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    xfrm_algo.c:(.text+0x800): undefined reference to `crypto_has_aead'

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

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
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

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
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
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
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    xfrm_algo.c:(.text+0x634): undefined reference to `crypto_has_aead'

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    xfrm_algo.c:(.text+0x460): undefined reference to `crypto_has_aead'
    arc-elf32-ld: xfrm_algo.c:(.text+0x460): undefined reference to `crypto=
_has_aead'

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: 'pagemap_scan_backout_range' defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 =
section mismatches

Errors:
    xfrm_algo.c:(.text+0x460): undefined reference to `crypto_has_aead'
    arc-elf32-ld: xfrm_algo.c:(.text+0x460): undefined reference to `crypto=
_has_aead'

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: 'pagemap_scan_backout_range' defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warni=
ng, 0 section mismatches

Errors:
    /tmp/kci/linux/build/../net/xfrm/xfrm_algo.c:695: undefined reference t=
o `crypto_has_aead'
    arc-elf32-ld: /tmp/kci/linux/build/../net/xfrm/xfrm_algo.c:695: undefin=
ed reference to `crypto_has_aead'

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: 'pagemap_scan_backout_range' defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 FAIL, 1 error, 0 wa=
rnings, 0 section mismatches

Errors:
    fs/proc/task_mmu.c:2102:21: error: 'HPAGE_SIZE' undeclared (first use i=
n this function); did you mean 'PAGE_SIZE'?

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: 'pagemap_scan_backout_range' defin=
ed but not used [-Wunused-function]

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
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warnin=
g, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: unused function 'pagemap_scan_back=
out_range' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: unused function 'pagemap_scan_back=
out_range' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 1 warning, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 1 warning, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1=
 warning, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 1 warning, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

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
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 =
section mismatches

Errors:
    xfrm_algo.c:(.text+0x460): undefined reference to `crypto_has_aead'
    arc-elf32-ld: xfrm_algo.c:(.text+0x460): undefined reference to `crypto=
_has_aead'

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: 'pagemap_scan_backout_range' defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning=
, 0 section mismatches

Errors:
    xfrm_algo.c:(.text+0x460): undefined reference to `crypto_has_aead'
    arc-elf32-ld: xfrm_algo.c:(.text+0x460): undefined reference to `crypto=
_has_aead'

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: 'pagemap_scan_backout_range' defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    /tmp/kci/linux/build/../net/xfrm/xfrm_algo.c:695: undefined reference t=
o `crypto_has_aead'

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]
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
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sec=
tion mismatches

Errors:
    xfrm_algo.c:(.text+0x460): undefined reference to `crypto_has_aead'
    arc-elf32-ld: xfrm_algo.c:(.text+0x460): undefined reference to `crypto=
_has_aead'

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: 'pagemap_scan_backout_range' defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0=
 section mismatches

Errors:
    xfrm_algo.c:(.text+0x460): undefined reference to `crypto_has_aead'
    arc-elf32-ld: xfrm_algo.c:(.text+0x460): undefined reference to `crypto=
_has_aead'

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: 'pagemap_scan_backout_range' defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

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
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/proc/task_mmu.c:2022:13: warning: =E2=80=98pagemap_scan_backout_rang=
e=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, rustc-1.71) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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
BR: .text+0x14b57b

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
