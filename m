Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C86D81371D1
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2020 16:53:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728265AbgAJPxS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jan 2020 10:53:18 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33804 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbgAJPxS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jan 2020 10:53:18 -0500
Received: by mail-wr1-f66.google.com with SMTP id t2so2302293wrr.1
        for <linux-next@vger.kernel.org>; Fri, 10 Jan 2020 07:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=tjKu2hdHma05/Mrn+R7Ye3q6eVv2ixoSdIgHK23d0OA=;
        b=TPjdBBiXLnjj8eeREye2kBIQ0K6QgAQNz+fA4Q5o02nZRhyv68/Qfna6YirSsmX5N7
         5Xjbs7ZEFjEVV+4t4ht2bE8jT2zcRF/J43Jj5Kenyccpu2can+7tEecV69Y/7QIG3OPC
         y8FvZeNMUdaryxVTtDDhmo9CpRSpc7UXpuzBqY9yRyhMYA+BRa3sCT70QyopUkcTvFRa
         pccytJbUqWRxsUoFxdz5bABchxIMpQJcw66bm2svD3+1jE837PBZK3mHJ617bkBB+rRz
         BC8aLnfbYQMKKc6m/c0Lztz/8nhWhq5QyExOqI9oAE9Hl+B9KDSBEgymTU3c9DYXWcwt
         o1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=tjKu2hdHma05/Mrn+R7Ye3q6eVv2ixoSdIgHK23d0OA=;
        b=LTqy0mqvL73scD0w0qoJrgo4vlb0ZNVNfb7msbck/gHcffaUyY8qeN/GnLQp8+FB/y
         3uY5VmUz3VkiAlR4GVaO4yvU/F5FvSinXA7H/n4/811phP385iXKsO94V6fbvMmB2qA4
         Zpqq2BfCCOjrh4uj9HNJOrPSD7eAbFLu39A0FhMb1+kJRb3clquYGccWAhAa0KbAbJBy
         iyoyQVlZJw+AQiKOTW3hhHSALeZLPfTQd0SceWHqjQs+flLmcS3+WlK1oj7EGZV6DhXc
         vItXxaHRfg04nxuDOagQlMf8m3U/SXLKEqh6232SwPm1pn/9XGi3mIpRRZfRhbVAHUqL
         usGg==
X-Gm-Message-State: APjAAAXfwEmBRKffwCkp62K7RDQOE6dJ/ydBxlMFvXSDMX/AoZ2OfnoL
        jmrQptJDs1U6hnZTRnk15IrsM/L/zQHSSA==
X-Google-Smtp-Source: APXvYqxGj9fdWcwTufbhOjKG5CTUzt3j84MwAj17SrAYXEMbcjologU7QlDmBRcObjRs69W6fIqpuw==
X-Received: by 2002:adf:dd8a:: with SMTP id x10mr4279634wrl.117.1578671590295;
        Fri, 10 Jan 2020 07:53:10 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id a16sm2626330wrt.37.2020.01.10.07.53.09
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 07:53:09 -0800 (PST)
Message-ID: <5e189de5.1c69fb81.c3ea4.c4d3@mx.google.com>
Date:   Fri, 10 Jan 2020 07:53:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200110
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
Subject: next/master build: 215 builds: 1 failed, 214 passed, 2 errors,
 371 warnings (next-20200110)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 215 builds: 1 failed, 214 passed, 2 errors, 371 warnings=
 (next-20200110)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200110/

Tree: next
Branch: master
Git Describe: next-20200110
Git Commit: 6c09d7dbb7d366122d0218bc7487e0a1e6cca6ed
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failure Detected:

arm64:
    allmodconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 2 warnings
    axs103_defconfig (gcc-8): 2 warnings
    axs103_smp_defconfig (gcc-8): 2 warnings
    haps_hs_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    hsdk_defconfig (gcc-8): 3 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 2 warnings
    vdk_hs38_smp_defconfig (gcc-8): 2 warnings

arm64:
    allmodconfig (gcc-8): 2 errors, 2 warnings
    allnoconfig (gcc-8): 1 warning
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 1 warning

arm:
    allmodconfig (gcc-8): 25 warnings
    allnoconfig (gcc-8): 1 warning
    am200epdkit_defconfig (gcc-8): 2 warnings
    aspeed_g4_defconfig (gcc-8): 1 warning
    aspeed_g5_defconfig (gcc-8): 1 warning
    assabet_defconfig (gcc-8): 2 warnings
    at91_dt_defconfig (gcc-8): 1 warning
    axm55xx_defconfig (gcc-8): 2 warnings
    badge4_defconfig (gcc-8): 2 warnings
    cerfcube_defconfig (gcc-8): 2 warnings
    clps711x_defconfig (gcc-8): 2 warnings
    cm_x2xx_defconfig (gcc-8): 2 warnings
    cm_x300_defconfig (gcc-8): 2 warnings
    cns3420vb_defconfig (gcc-8): 2 warnings
    colibri_pxa270_defconfig (gcc-8): 2 warnings
    colibri_pxa300_defconfig (gcc-8): 1 warning
    collie_defconfig (gcc-8): 2 warnings
    corgi_defconfig (gcc-8): 2 warnings
    davinci_all_defconfig (gcc-8): 2 warnings
    dove_defconfig (gcc-8): 2 warnings
    ebsa110_defconfig (gcc-8): 1 warning
    efm32_defconfig (gcc-8): 1 warning
    em_x270_defconfig (gcc-8): 2 warnings
    ep93xx_defconfig (gcc-8): 2 warnings
    eseries_pxa_defconfig (gcc-8): 2 warnings
    exynos_defconfig (gcc-8): 1 warning
    ezx_defconfig (gcc-8): 1 warning
    footbridge_defconfig (gcc-8): 1 warning
    gemini_defconfig (gcc-8): 2 warnings
    h3600_defconfig (gcc-8): 2 warnings
    h5000_defconfig (gcc-8): 2 warnings
    hackkit_defconfig (gcc-8): 2 warnings
    hisi_defconfig (gcc-8): 2 warnings
    imote2_defconfig (gcc-8): 1 warning
    imx_v4_v5_defconfig (gcc-8): 1 warning
    imx_v6_v7_defconfig (gcc-8): 1 warning
    integrator_defconfig (gcc-8): 2 warnings
    iop32x_defconfig (gcc-8): 2 warnings
    ixp4xx_defconfig (gcc-8): 2 warnings
    jornada720_defconfig (gcc-8): 2 warnings
    keystone_defconfig (gcc-8): 1 warning
    lart_defconfig (gcc-8): 2 warnings
    lpc18xx_defconfig (gcc-8): 1 warning
    lpc32xx_defconfig (gcc-8): 1 warning
    lpd270_defconfig (gcc-8): 2 warnings
    lubbock_defconfig (gcc-8): 2 warnings
    magician_defconfig (gcc-8): 2 warnings
    mainstone_defconfig (gcc-8): 2 warnings
    mini2440_defconfig (gcc-8): 2 warnings
    mmp2_defconfig (gcc-8): 2 warnings
    moxart_defconfig (gcc-8): 1 warning
    multi_v4t_defconfig (gcc-8): 2 warnings
    multi_v5_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    mv78xx0_defconfig (gcc-8): 1 warning
    mvebu_v5_defconfig (gcc-8): 2 warnings
    mvebu_v7_defconfig (gcc-8): 1 warning
    mxs_defconfig (gcc-8): 1 warning
    neponset_defconfig (gcc-8): 2 warnings
    netwinder_defconfig (gcc-8): 1 warning
    nhk8815_defconfig (gcc-8): 2 warnings
    omap1_defconfig (gcc-8): 2 warnings
    omap2plus_defconfig (gcc-8): 2 warnings
    orion5x_defconfig (gcc-8): 2 warnings
    oxnas_v6_defconfig (gcc-8): 1 warning
    palmz72_defconfig (gcc-8): 2 warnings
    pcm027_defconfig (gcc-8): 2 warnings
    pleb_defconfig (gcc-8): 2 warnings
    prima2_defconfig (gcc-8): 2 warnings
    pxa168_defconfig (gcc-8): 1 warning
    pxa255-idp_defconfig (gcc-8): 2 warnings
    pxa3xx_defconfig (gcc-8): 2 warnings
    pxa910_defconfig (gcc-8): 1 warning
    pxa_defconfig (gcc-8): 1 warning
    qcom_defconfig (gcc-8): 1 warning
    realview_defconfig (gcc-8): 2 warnings
    rpc_defconfig (gcc-8): 2 warnings
    s3c2410_defconfig (gcc-8): 2 warnings
    s3c6400_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (gcc-8): 2 warnings
    sama5_defconfig (gcc-8): 2 warnings
    shannon_defconfig (gcc-8): 2 warnings
    shmobile_defconfig (gcc-8): 1 warning
    simpad_defconfig (gcc-8): 2 warnings
    socfpga_defconfig (gcc-8): 1 warning
    spear13xx_defconfig (gcc-8): 2 warnings
    spear3xx_defconfig (gcc-8): 2 warnings
    spear6xx_defconfig (gcc-8): 2 warnings
    spitz_defconfig (gcc-8): 2 warnings
    stm32_defconfig (gcc-8): 1 warning
    sunxi_defconfig (gcc-8): 2 warnings
    tango4_defconfig (gcc-8): 2 warnings
    tct_hammer_defconfig (gcc-8): 2 warnings
    tegra_defconfig (gcc-8): 1 warning
    trizeps4_defconfig (gcc-8): 2 warnings
    u300_defconfig (gcc-8): 2 warnings
    u8500_defconfig (gcc-8): 2 warnings
    versatile_defconfig (gcc-8): 2 warnings
    vexpress_defconfig (gcc-8): 1 warning
    vf610m4_defconfig (gcc-8): 1 warning
    viper_defconfig (gcc-8): 2 warnings
    vt8500_v6_v7_defconfig (gcc-8): 2 warnings
    xcep_defconfig (gcc-8): 2 warnings
    zeus_defconfig (gcc-8): 2 warnings
    zx_defconfig (gcc-8): 1 warning

i386:
    allnoconfig (gcc-8): 1 warning
    i386_defconfig (gcc-8): 1 warning
    i386_defconfig (gcc-8): 2 warnings

mips:
    32r2el_defconfig (gcc-8): 3 warnings
    32r2el_defconfig (gcc-8): 1 warning
    allnoconfig (gcc-8): 1 warning
    ar7_defconfig (gcc-8): 2 warnings
    ath25_defconfig (gcc-8): 1 warning
    ath79_defconfig (gcc-8): 2 warnings
    bcm47xx_defconfig (gcc-8): 1 warning
    bcm63xx_defconfig (gcc-8): 2 warnings
    bigsur_defconfig (gcc-8): 1 warning
    bmips_be_defconfig (gcc-8): 2 warnings
    bmips_stb_defconfig (gcc-8): 2 warnings
    capcella_defconfig (gcc-8): 2 warnings
    cavium_octeon_defconfig (gcc-8): 2 warnings
    ci20_defconfig (gcc-8): 1 warning
    cobalt_defconfig (gcc-8): 2 warnings
    cu1000-neo_defconfig (gcc-8): 1 warning
    db1xxx_defconfig (gcc-8): 2 warnings
    decstation_64_defconfig (gcc-8): 2 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
    e55_defconfig (gcc-8): 2 warnings
    fuloong2e_defconfig (gcc-8): 1 warning
    gcw0_defconfig (gcc-8): 1 warning
    gpr_defconfig (gcc-8): 1 warning
    ip22_defconfig (gcc-8): 2 warnings
    ip27_defconfig (gcc-8): 2 warnings
    ip28_defconfig (gcc-8): 1 warning
    ip32_defconfig (gcc-8): 1 warning
    jazz_defconfig (gcc-8): 1 warning
    jmr3927_defconfig (gcc-8): 2 warnings
    lasat_defconfig (gcc-8): 2 warnings
    loongson1b_defconfig (gcc-8): 1 warning
    loongson1c_defconfig (gcc-8): 1 warning
    loongson3_defconfig (gcc-8): 2 warnings
    malta_defconfig (gcc-8): 2 warnings
    malta_kvm_defconfig (gcc-8): 1 warning
    malta_kvm_guest_defconfig (gcc-8): 2 warnings
    malta_qemu_32r6_defconfig (gcc-8): 3 warnings
    maltaaprp_defconfig (gcc-8): 2 warnings
    maltasmvp_defconfig (gcc-8): 2 warnings
    maltasmvp_eva_defconfig (gcc-8): 2 warnings
    maltaup_defconfig (gcc-8): 2 warnings
    maltaup_xpa_defconfig (gcc-8): 2 warnings
    markeins_defconfig (gcc-8): 2 warnings
    mips_paravirt_defconfig (gcc-8): 1 warning
    mpc30x_defconfig (gcc-8): 2 warnings
    msp71xx_defconfig (gcc-8): 2 warnings
    mtx1_defconfig (gcc-8): 1 warning
    nlm_xlp_defconfig (gcc-8): 1 warning
    nlm_xlr_defconfig (gcc-8): 1 warning
    pistachio_defconfig (gcc-8): 1 warning
    pnx8335_stb225_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 2 warnings
    rb532_defconfig (gcc-8): 2 warnings
    rbtx49xx_defconfig (gcc-8): 3 warnings
    rm200_defconfig (gcc-8): 1 warning
    rt305x_defconfig (gcc-8): 1 warning
    sb1250_swarm_defconfig (gcc-8): 1 warning
    tb0219_defconfig (gcc-8): 2 warnings
    tb0226_defconfig (gcc-8): 2 warnings
    tb0287_defconfig (gcc-8): 1 warning
    workpad_defconfig (gcc-8): 2 warnings
    xway_defconfig (gcc-8): 1 warning

riscv:
    allnoconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    rv32_defconfig (gcc-8): 7 warnings

x86_64:
    allmodconfig (gcc-8): 9 warnings
    allnoconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 1 warning

Errors summary:

    1    arch/arm64/mm/dump.c:364:2: error: too few arguments to function =
=E2=80=98ptdump_walk_pgd=E2=80=99
    1    arch/arm64/mm/dump.c:326:2: error: too few arguments to function =
=E2=80=98ptdump_walk_pgd=E2=80=99

Warnings summary:

    168  drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=
=E2=80=99 from a function with return type =E2=80=98struct nvmem_device *=
=E2=80=99 makes pointer from integer without a cast [-Wint-conversion]
    134  kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=
=99 may be used uninitialized in this function [-Wmaybe-uninitialized]
    20   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    8    drivers/clocksource/timer-ti-dm.c:798:13: warning: =E2=80=98timer=
=E2=80=99 may be used uninitialized in this function [-Wmaybe-uninitialized]
    4    drivers/net/wireless/intel/iwlegacy/common.h:2928:32: warning: for=
mat =E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, bu=
t argument 6 has type =E2=80=98long int=E2=80=99 [-Wformat=3D]
    4    drivers/net/wireless/intel/iwlegacy/common.h:2928:32: warning: for=
mat =E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, bu=
t argument 5 has type =E2=80=98long int=E2=80=99 [-Wformat=3D]
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    2    kernel/bpf/bpf_struct_ops.c:197:1: warning: the frame size of 1192=
 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    2    drivers/gpio/gpio-grgpio.c:438:16: warning: unused variable =E2=80=
=98flags=E2=80=99 [-Wunused-variable]
    2    WARNING: unmet direct dependencies detected for I2C_S3C2410
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:141: Warning: macro instruction expanded into mul=
tiple instructions
    1    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable =E2=80=
=98rtd=E2=80=99 [-Wunused-variable]
    1    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%ld=E2=
=80=99 expects argument of type =E2=80=98long int=E2=80=99, but argument 5 =
has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wf=
ormat=3D]
    1    drivers/regulator/mpq7920.c:224:13: warning: conversion from =E2=
=80=98long unsigned int=E2=80=99 to =E2=80=98unsigned int=E2=80=99 changes =
value from =E2=80=9818446744073709551551=E2=80=99 to =E2=80=984294967231=E2=
=80=99 [-Woverflow]
    1    drivers/platform/x86/intel_telemetry_pltdrv.c:1121:6: warning: unu=
sed variable =E2=80=98size=E2=80=99 [-Wunused-variable]
    1    drivers/net/phy/mdio-octeon.c:48:3: warning: cast from pointer to =
integer of different size [-Wpointer-to-int-cast]
    1    drivers/base/test/property-entry-test.c:214:1: warning: the frame =
size of 3128 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    1    /tmp/cc34qTmi.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/cc34qTmi.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1161:warning: override: UNWINDER_GUESS changes choice state

Section mismatches summary:

    5    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    3    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    3    WARNING: vmlinux.o(.text.unlikely+0x8d8): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x97c): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x860): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x7a4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x3a98): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    1    WARNING: vmlinux.o(.text.unlikely+0x3740): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warnin=
g, 0 section mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: unmet direct dependencies detected for I2C_S3C2410
    drivers/gpio/gpio-grgpio.c:438:16: warning: unused variable =E2=80=98fl=
ags=E2=80=99 [-Wunused-variable]
    drivers/regulator/mpq7920.c:224:13: warning: conversion from =E2=80=98l=
ong unsigned int=E2=80=99 to =E2=80=98unsigned int=E2=80=99 changes value f=
rom =E2=80=9818446744073709551551=E2=80=99 to =E2=80=984294967231=E2=80=99 =
[-Woverflow]
    drivers/net/wireless/intel/iwlegacy/common.h:2928:32: warning: format =
=E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but ar=
gument 6 has type =E2=80=98long int=E2=80=99 [-Wformat=3D]
    drivers/net/wireless/intel/iwlegacy/common.h:2928:32: warning: format =
=E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but ar=
gument 5 has type =E2=80=98long int=E2=80=99 [-Wformat=3D]
    drivers/net/wireless/intel/iwlegacy/common.h:2928:32: warning: format =
=E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but ar=
gument 6 has type =E2=80=98long int=E2=80=99 [-Wformat=3D]
    drivers/net/wireless/intel/iwlegacy/common.h:2928:32: warning: format =
=E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but ar=
gument 5 has type =E2=80=98long int=E2=80=99 [-Wformat=3D]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]
    drivers/platform/x86/intel_telemetry_pltdrv.c:1121:6: warning: unused v=
ariable =E2=80=98size=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 25 warnings, 0 section =
mismatches

Warnings:
    drivers/base/test/property-entry-test.c:214:1: warning: the frame size =
of 3128 bytes is larger than 2048 bytes [-Wframe-larger-than=3D]
    drivers/clocksource/timer-ti-dm.c:798:13: warning: =E2=80=98timer=E2=80=
=99 may be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]
    /tmp/cc34qTmi.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/cc34qTmi.s:18191: Warning: using r15 results in unpredictable beha=
viour
    drivers/gpio/gpio-grgpio.c:438:16: warning: unused variable =E2=80=98fl=
ags=E2=80=99 [-Wunused-variable]
    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-octeon.c:48:3: warning: cast from pointer to integ=
er of different size [-Wpointer-to-int-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/wireless/intel/iwlegacy/common.h:2928:32: warning: format =
=E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but ar=
gument 6 has type =E2=80=98long int=E2=80=99 [-Wformat=3D]
    drivers/net/wireless/intel/iwlegacy/common.h:2928:32: warning: format =
=E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but ar=
gument 5 has type =E2=80=98long int=E2=80=99 [-Wformat=3D]
    drivers/net/wireless/intel/iwlegacy/common.h:2928:32: warning: format =
=E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but ar=
gument 6 has type =E2=80=98long int=E2=80=99 [-Wformat=3D]
    drivers/net/wireless/intel/iwlegacy/common.h:2928:32: warning: format =
=E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but ar=
gument 5 has type =E2=80=98long int=E2=80=99 [-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 5 has ty=
pe =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=
=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section=
 mismatches

Errors:
    arch/arm64/mm/dump.c:326:2: error: too few arguments to function =E2=80=
=98ptdump_walk_pgd=E2=80=99
    arch/arm64/mm/dump.c:364:2: error: too few arguments to function =E2=80=
=98ptdump_walk_pgd=E2=80=99

Warnings:
    WARNING: unmet direct dependencies detected for I2C_S3C2410
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8d8): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3a98): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3740): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 2 warnings, 0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 2 warnings, 0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x7a4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8d8): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    kernel/bpf/bpf_struct_ops.c:197:1: warning: the frame size of 1192 byte=
s is larger than 1024 bytes [-Wframe-larger-than=3D]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x860): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    {standard input}:141: Warning: macro instruction expanded into multiple=
 instructions
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/clocksource/timer-ti-dm.c:798:13: warning: =E2=80=98timer=E2=80=
=99 may be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 2 warnings, 0 section mismatches

Warnings:
    drivers/clocksource/timer-ti-dm.c:798:13: warning: =E2=80=98timer=E2=80=
=99 may be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
    drivers/clocksource/timer-ti-dm.c:798:13: warning: =E2=80=98timer=E2=80=
=99 may be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 =
warnings, 0 section mismatches

Warnings:
    drivers/clocksource/timer-ti-dm.c:798:13: warning: =E2=80=98timer=E2=80=
=99 may be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warni=
ngs, 0 section mismatches

Warnings:
    kernel/bpf/bpf_struct_ops.c:197:1: warning: the frame size of 1192 byte=
s is larger than 1024 bytes [-Wframe-larger-than=3D]
    drivers/clocksource/timer-ti-dm.c:798:13: warning: =E2=80=98timer=E2=80=
=99 may be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/clocksource/timer-ti-dm.c:798:13: warning: =E2=80=98timer=E2=80=
=99 may be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/clocksource/timer-ti-dm.c:798:13: warning: =E2=80=98timer=E2=80=
=99 may be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8d8): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable =E2=80=98rtd=
=E2=80=99 [-Wunused-variable]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x97c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1161:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    drivers/nvmem/core.c:356:10: warning: returning =E2=80=98long int=E2=80=
=99 from a function with return type =E2=80=98struct nvmem_device *=E2=80=
=99 makes pointer from integer without a cast [-Wint-conversion]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---
For more info write to <info@kernelci.org>
