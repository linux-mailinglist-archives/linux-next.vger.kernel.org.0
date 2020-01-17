Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91B7E1404B9
	for <lists+linux-next@lfdr.de>; Fri, 17 Jan 2020 08:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729334AbgAQH7T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jan 2020 02:59:19 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41455 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727033AbgAQH7T (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jan 2020 02:59:19 -0500
Received: by mail-wr1-f65.google.com with SMTP id c9so21687855wrw.8
        for <linux-next@vger.kernel.org>; Thu, 16 Jan 2020 23:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yvnayWHUgEHSsLLIMBLc7EtgeLCJaava7PRozMO6vYM=;
        b=IPal5oCO8G72ECZr1TW2Zg3Q4oi9HvJjBWEVWFQUINpC1YPsTd0hHXLs+APL9gAd8Q
         aPAkqCdL9Y9QUfnFpSspgsVHMVc8h87dNHHS97NppDHW2WuHcGFz82CTTJnvyJaMntzT
         pbHpNozhY/8ZpOmRB1WCz8EQ1to4aAat9Cq5mIt74Wcm1Xh7PbpnqKQQ9lQBYP4V2POp
         wdRjb3kVUB0UMsGxf/s9AktYZYHOm0G8FJKuCerNfpdjCXNoDdZ/q9uVchG/OsAXDiwk
         LpUbsKmDQdeAZUo4aEeqKaP416uZ0+oMcmRf4neu+JeV7n1ZprLKFDo2nFBaaMPHXoVQ
         flzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yvnayWHUgEHSsLLIMBLc7EtgeLCJaava7PRozMO6vYM=;
        b=SQkLvg/mltGqKemjUwlV5XsxgxxolZk+tRdmAz7/sX+SgC4+c/33PQcsTc0JCuJeft
         A7Rk4eCkB/qU0yinCHNazJZOrIbbt0g2L2MNhBJBYP1f7AI/s8I8BRACyXBdmaVpM2wI
         wBqE0lTeY9spGGkTHAwaVdS0xHjRmNO9p11R3n//OimGM9FO4vAtpAFL0FfX/BMtp2on
         7qEi931MIbKQ2dIFVCwz5yba42ZeB4EXzHjMIb6/NUwStgVpRLCYIvpC/TsHRxsMb5t3
         8IxskpuQ6u/ioQ9DDZ5ZkFwqPGAlWqcaEkOdOiqLj9QRo/z2cwR7A3x264Ljmv+K7KET
         rzAw==
X-Gm-Message-State: APjAAAVLnRsN07YupYegPLl2o97wZhWRD84lESZ0/K30toiQHSHYH/Gx
        iDEcSDuIB/7pmdL0RJCr1BmXUYjqNAjOJw==
X-Google-Smtp-Source: APXvYqzdG6Yc/nAfwaQqUkd+IEBb2SRUPaZOwLnfieUipXf5z7NvmXgw/3MJ8vEpal078TNk2w0mbA==
X-Received: by 2002:a5d:6089:: with SMTP id w9mr1686715wrt.228.1579247951702;
        Thu, 16 Jan 2020 23:59:11 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x6sm8137285wmi.44.2020.01.16.23.59.10
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 23:59:11 -0800 (PST)
Message-ID: <5e21694f.1c69fb81.172bc.fe07@mx.google.com>
Date:   Thu, 16 Jan 2020 23:59:11 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20200117
Subject: next/master build: 215 builds: 56 failed, 159 passed, 112 errors,
 259 warnings (next-20200117)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 215 builds: 56 failed, 159 passed, 112 errors, 259 warni=
ngs (next-20200117)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200117/

Tree: next
Branch: master
Git Describe: next-20200117
Git Commit: de970dffa7d19eae1d703c3534825308ef8d5dec
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

mips:
    32r2el_defconfig: (gcc-8) FAIL
    32r2el_defconfig+kselftest: (gcc-8) FAIL
    allnoconfig: (gcc-8) FAIL
    ar7_defconfig: (gcc-8) FAIL
    ath25_defconfig: (gcc-8) FAIL
    ath79_defconfig: (gcc-8) FAIL
    bcm47xx_defconfig: (gcc-8) FAIL
    bcm63xx_defconfig: (gcc-8) FAIL
    bmips_be_defconfig: (gcc-8) FAIL
    bmips_stb_defconfig: (gcc-8) FAIL
    capcella_defconfig: (gcc-8) FAIL
    ci20_defconfig: (gcc-8) FAIL
    cobalt_defconfig: (gcc-8) FAIL
    cu1000-neo_defconfig: (gcc-8) FAIL
    db1xxx_defconfig: (gcc-8) FAIL
    decstation_defconfig: (gcc-8) FAIL
    decstation_r4k_defconfig: (gcc-8) FAIL
    e55_defconfig: (gcc-8) FAIL
    gcw0_defconfig: (gcc-8) FAIL
    gpr_defconfig: (gcc-8) FAIL
    ip22_defconfig: (gcc-8) FAIL
    jazz_defconfig: (gcc-8) FAIL
    jmr3927_defconfig: (gcc-8) FAIL
    lasat_defconfig: (gcc-8) FAIL
    loongson1b_defconfig: (gcc-8) FAIL
    loongson1c_defconfig: (gcc-8) FAIL
    malta_defconfig: (gcc-8) FAIL
    malta_kvm_defconfig: (gcc-8) FAIL
    malta_kvm_guest_defconfig: (gcc-8) FAIL
    malta_qemu_32r6_defconfig: (gcc-8) FAIL
    maltaaprp_defconfig: (gcc-8) FAIL
    maltasmvp_defconfig: (gcc-8) FAIL
    maltasmvp_eva_defconfig: (gcc-8) FAIL
    maltaup_defconfig: (gcc-8) FAIL
    maltaup_xpa_defconfig: (gcc-8) FAIL
    markeins_defconfig: (gcc-8) FAIL
    mpc30x_defconfig: (gcc-8) FAIL
    msp71xx_defconfig: (gcc-8) FAIL
    mtx1_defconfig: (gcc-8) FAIL
    nlm_xlr_defconfig: (gcc-8) FAIL
    omega2p_defconfig: (gcc-8) FAIL
    pic32mzda_defconfig: (gcc-8) FAIL
    pistachio_defconfig: (gcc-8) FAIL
    pnx8335_stb225_defconfig: (gcc-8) FAIL
    qi_lb60_defconfig: (gcc-8) FAIL
    rb532_defconfig: (gcc-8) FAIL
    rbtx49xx_defconfig: (gcc-8) FAIL
    rm200_defconfig: (gcc-8) FAIL
    rt305x_defconfig: (gcc-8) FAIL
    tb0219_defconfig: (gcc-8) FAIL
    tb0226_defconfig: (gcc-8) FAIL
    tb0287_defconfig: (gcc-8) FAIL
    tinyconfig: (gcc-8) FAIL
    vocore2_defconfig: (gcc-8) FAIL
    workpad_defconfig: (gcc-8) FAIL
    xway_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 3 warnings
    axs103_smp_defconfig (gcc-8): 3 warnings
    haps_hs_defconfig (gcc-8): 3 warnings
    haps_hs_smp_defconfig (gcc-8): 3 warnings
    hsdk_defconfig (gcc-8): 3 warnings
    nsimosci_hs_defconfig (gcc-8): 3 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 3 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 2 warnings
    vdk_hs38_smp_defconfig (gcc-8): 2 warnings

arm64:
    allmodconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 1 warning

arm:
    allmodconfig (gcc-8): 20 warnings
    am200epdkit_defconfig (gcc-8): 1 warning
    aspeed_g4_defconfig (gcc-8): 1 warning
    aspeed_g5_defconfig (gcc-8): 1 warning
    assabet_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (gcc-8): 1 warning
    axm55xx_defconfig (gcc-8): 1 warning
    badge4_defconfig (gcc-8): 1 warning
    bcm2835_defconfig (gcc-8): 1 warning
    cerfcube_defconfig (gcc-8): 1 warning
    clps711x_defconfig (gcc-8): 1 warning
    cm_x2xx_defconfig (gcc-8): 1 warning
    cm_x300_defconfig (gcc-8): 1 warning
    cns3420vb_defconfig (gcc-8): 1 warning
    colibri_pxa270_defconfig (gcc-8): 1 warning
    colibri_pxa300_defconfig (gcc-8): 1 warning
    collie_defconfig (gcc-8): 1 warning
    corgi_defconfig (gcc-8): 1 warning
    davinci_all_defconfig (gcc-8): 2 warnings
    dove_defconfig (gcc-8): 1 warning
    ebsa110_defconfig (gcc-8): 1 warning
    efm32_defconfig (gcc-8): 1 warning
    em_x270_defconfig (gcc-8): 1 warning
    ep93xx_defconfig (gcc-8): 1 warning
    eseries_pxa_defconfig (gcc-8): 1 warning
    exynos_defconfig (gcc-8): 1 warning
    ezx_defconfig (gcc-8): 2 warnings
    footbridge_defconfig (gcc-8): 1 warning
    gemini_defconfig (gcc-8): 1 warning
    h3600_defconfig (gcc-8): 1 warning
    h5000_defconfig (gcc-8): 1 warning
    hackkit_defconfig (gcc-8): 1 warning
    hisi_defconfig (gcc-8): 1 warning
    imote2_defconfig (gcc-8): 1 warning
    imx_v4_v5_defconfig (gcc-8): 1 warning
    imx_v6_v7_defconfig (gcc-8): 1 warning
    integrator_defconfig (gcc-8): 1 warning
    iop32x_defconfig (gcc-8): 1 warning
    ixp4xx_defconfig (gcc-8): 1 warning
    jornada720_defconfig (gcc-8): 1 warning
    keystone_defconfig (gcc-8): 1 warning
    lart_defconfig (gcc-8): 1 warning
    lpc18xx_defconfig (gcc-8): 1 warning
    lpc32xx_defconfig (gcc-8): 1 warning
    lpd270_defconfig (gcc-8): 1 warning
    lubbock_defconfig (gcc-8): 1 warning
    magician_defconfig (gcc-8): 1 warning
    mainstone_defconfig (gcc-8): 1 warning
    milbeaut_m10v_defconfig (gcc-8): 1 warning
    mini2440_defconfig (gcc-8): 1 warning
    mmp2_defconfig (gcc-8): 1 warning
    moxart_defconfig (gcc-8): 1 warning
    mps2_defconfig (gcc-8): 1 warning
    multi_v4t_defconfig (gcc-8): 1 warning
    multi_v5_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 3 warnings
    mv78xx0_defconfig (gcc-8): 1 warning
    mvebu_v5_defconfig (gcc-8): 1 warning
    mvebu_v7_defconfig (gcc-8): 1 warning
    mxs_defconfig (gcc-8): 1 warning
    neponset_defconfig (gcc-8): 1 warning
    netwinder_defconfig (gcc-8): 1 warning
    nhk8815_defconfig (gcc-8): 1 warning
    omap1_defconfig (gcc-8): 1 warning
    omap2plus_defconfig (gcc-8): 1 warning
    orion5x_defconfig (gcc-8): 1 warning
    oxnas_v6_defconfig (gcc-8): 1 warning
    palmz72_defconfig (gcc-8): 1 warning
    pcm027_defconfig (gcc-8): 1 warning
    pleb_defconfig (gcc-8): 1 warning
    prima2_defconfig (gcc-8): 1 warning
    pxa168_defconfig (gcc-8): 1 warning
    pxa255-idp_defconfig (gcc-8): 1 warning
    pxa3xx_defconfig (gcc-8): 1 warning
    pxa910_defconfig (gcc-8): 1 warning
    pxa_defconfig (gcc-8): 2 warnings
    qcom_defconfig (gcc-8): 1 warning
    realview_defconfig (gcc-8): 1 warning
    rpc_defconfig (gcc-8): 1 warning
    s3c2410_defconfig (gcc-8): 1 warning
    s3c6400_defconfig (gcc-8): 1 warning
    s5pv210_defconfig (gcc-8): 1 warning
    sama5_defconfig (gcc-8): 1 warning
    shannon_defconfig (gcc-8): 1 warning
    shmobile_defconfig (gcc-8): 1 warning
    simpad_defconfig (gcc-8): 1 warning
    socfpga_defconfig (gcc-8): 1 warning
    spear13xx_defconfig (gcc-8): 1 warning
    spear3xx_defconfig (gcc-8): 1 warning
    spear6xx_defconfig (gcc-8): 1 warning
    spitz_defconfig (gcc-8): 1 warning
    stm32_defconfig (gcc-8): 1 warning
    sunxi_defconfig (gcc-8): 1 warning
    tango4_defconfig (gcc-8): 1 warning
    tct_hammer_defconfig (gcc-8): 1 warning
    tegra_defconfig (gcc-8): 1 warning
    trizeps4_defconfig (gcc-8): 1 warning
    u300_defconfig (gcc-8): 1 warning
    u8500_defconfig (gcc-8): 1 warning
    versatile_defconfig (gcc-8): 1 warning
    vexpress_defconfig (gcc-8): 1 warning
    vf610m4_defconfig (gcc-8): 1 warning
    viper_defconfig (gcc-8): 1 warning
    vt8500_v6_v7_defconfig (gcc-8): 1 warning
    xcep_defconfig (gcc-8): 1 warning
    zeus_defconfig (gcc-8): 1 warning
    zx_defconfig (gcc-8): 1 warning

i386:
    i386_defconfig (gcc-8): 1 warning
    i386_defconfig (gcc-8): 3 warnings

mips:
    32r2el_defconfig (gcc-8): 2 errors, 2 warnings
    32r2el_defconfig (gcc-8): 2 errors, 4 warnings
    allnoconfig (gcc-8): 2 errors, 1 warning
    ar7_defconfig (gcc-8): 2 errors, 2 warnings
    ath25_defconfig (gcc-8): 2 errors, 1 warning
    ath79_defconfig (gcc-8): 2 errors, 1 warning
    bcm47xx_defconfig (gcc-8): 2 errors, 2 warnings
    bcm63xx_defconfig (gcc-8): 2 errors, 1 warning
    bmips_be_defconfig (gcc-8): 2 errors, 2 warnings
    bmips_stb_defconfig (gcc-8): 2 errors, 1 warning
    capcella_defconfig (gcc-8): 2 errors, 2 warnings
    ci20_defconfig (gcc-8): 2 errors, 1 warning
    cobalt_defconfig (gcc-8): 2 errors, 2 warnings
    cu1000-neo_defconfig (gcc-8): 2 errors, 1 warning
    db1xxx_defconfig (gcc-8): 2 errors, 3 warnings
    decstation_defconfig (gcc-8): 2 errors, 1 warning
    decstation_r4k_defconfig (gcc-8): 2 errors, 2 warnings
    e55_defconfig (gcc-8): 2 errors, 1 warning
    gcw0_defconfig (gcc-8): 2 errors, 2 warnings
    gpr_defconfig (gcc-8): 2 errors, 1 warning
    ip22_defconfig (gcc-8): 2 errors, 1 warning
    ip27_defconfig (gcc-8): 1 warning
    jazz_defconfig (gcc-8): 2 errors, 1 warning
    jmr3927_defconfig (gcc-8): 2 errors, 1 warning
    lasat_defconfig (gcc-8): 2 errors, 1 warning
    lemote2f_defconfig (gcc-8): 1 warning
    loongson1b_defconfig (gcc-8): 2 errors, 1 warning
    loongson1c_defconfig (gcc-8): 2 errors, 1 warning
    malta_defconfig (gcc-8): 2 errors, 1 warning
    malta_kvm_defconfig (gcc-8): 2 errors, 1 warning
    malta_kvm_guest_defconfig (gcc-8): 2 errors, 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 2 errors, 3 warnings
    maltaaprp_defconfig (gcc-8): 2 errors, 1 warning
    maltasmvp_defconfig (gcc-8): 2 errors, 1 warning
    maltasmvp_eva_defconfig (gcc-8): 2 errors, 1 warning
    maltaup_defconfig (gcc-8): 2 errors, 1 warning
    maltaup_xpa_defconfig (gcc-8): 2 errors, 1 warning
    markeins_defconfig (gcc-8): 2 errors, 1 warning
    mpc30x_defconfig (gcc-8): 2 errors, 1 warning
    msp71xx_defconfig (gcc-8): 2 errors, 2 warnings
    mtx1_defconfig (gcc-8): 2 errors, 1 warning
    nlm_xlr_defconfig (gcc-8): 2 errors, 1 warning
    omega2p_defconfig (gcc-8): 2 errors, 1 warning
    pic32mzda_defconfig (gcc-8): 2 errors, 1 warning
    pistachio_defconfig (gcc-8): 2 errors, 2 warnings
    pnx8335_stb225_defconfig (gcc-8): 2 errors, 2 warnings
    qi_lb60_defconfig (gcc-8): 2 errors, 1 warning
    rb532_defconfig (gcc-8): 2 errors, 1 warning
    rbtx49xx_defconfig (gcc-8): 2 errors, 1 warning
    rm200_defconfig (gcc-8): 2 errors, 1 warning
    rt305x_defconfig (gcc-8): 2 errors, 2 warnings
    tb0219_defconfig (gcc-8): 2 errors, 2 warnings
    tb0226_defconfig (gcc-8): 2 errors, 1 warning
    tb0287_defconfig (gcc-8): 2 errors, 1 warning
    tinyconfig (gcc-8): 2 errors, 1 warning
    vocore2_defconfig (gcc-8): 2 errors, 1 warning
    workpad_defconfig (gcc-8): 2 errors, 1 warning
    xway_defconfig (gcc-8): 2 errors, 1 warning

riscv:
    defconfig (gcc-8): 1 warning
    rv32_defconfig (gcc-8): 7 warnings

x86_64:
    allmodconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 1 warning

Errors summary:

    56   arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration o=
f function =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=
=80=98__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-de=
claration]
    56   arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration o=
f function =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=
=98__cvdso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]

Warnings summary:

    139  fs/io_uring.c:5567:8: warning: cast to pointer from integer of dif=
ferent size [-Wint-to-pointer-cast]
    56   cc1: all warnings being treated as errors
    20   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    16   fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=
=E2=80=99 [-Wunused-variable]
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    2    kernel/bpf/bpf_struct_ops.c:197:1: warning: the frame size of 1192=
 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    2    WARNING: unmet direct dependencies detected for I2C_S3C2410
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    kernel/bpf/bpf_struct_ops.c:197:1: warning: the frame size of 1184=
 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    1    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%ld=E2=
=80=99 expects argument of type =E2=80=98long int=E2=80=99, but argument 5 =
has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wf=
ormat=3D]
    1    drivers/scsi/qla1280.c:1702:5: warning: "QLA_64BIT_PTR" is not def=
ined, evaluates to 0 [-Wundef]
    1    drivers/net/phy/mdio-octeon.c:48:3: warning: cast from pointer to =
integer of different size [-Wpointer-to-int-cast]
    1    /tmp/ccf9PGqN.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccf9PGqN.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1163:warning: override: UNWINDER_GUESS changes choice state

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sect=
ion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 4 warnin=
gs, 0 section mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors
    kernel/bpf/bpf_struct_ops.c:197:1: warning: the frame size of 1184 byte=
s is larger than 1024 bytes [-Wframe-larger-than=3D]
    fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=E2=80=
=99 [-Wunused-variable]
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    WARNING: unmet direct dependencies detected for I2C_S3C2410
    fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: unmet direct dependencies detected for I2C_S3C2410
    fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 20 warnings, 0 section =
mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    /tmp/ccf9PGqN.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccf9PGqN.s:18191: Warning: using r15 results in unpredictable beha=
viour
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
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 5 has ty=
pe =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=
=3D]
    fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=E2=80=
=99 [-Wunused-variable]
    drivers/scsi/qla1280.c:1702:5: warning: "QLA_64BIT_PTR" is not defined,=
 evaluates to 0 [-Wundef]

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section mi=
smatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section=
 mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sec=
tion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 se=
ction mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 se=
ction mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 se=
ction mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section=
 mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sect=
ion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8d8): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 s=
ection mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 3 warnings, 0 sect=
ion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors
    fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=E2=80=
=99 [-Wunused-variable]
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 s=
ection mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings=
, 0 section mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section =
mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x7a4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sectio=
n mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section =
mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8d8): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings=
, 0 section mismatches

Warnings:
    kernel/bpf/bpf_struct_ops.c:197:1: warning: the frame size of 1192 byte=
s is larger than 1024 bytes [-Wframe-larger-than=3D]
    fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=E2=80=
=99 [-Wunused-variable]
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section=
 mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section=
 mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x860): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 s=
ection mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 s=
ection mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 se=
ction mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning=
, 0 section mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 3 warning=
s, 0 section mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors
    fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=E2=80=
=99 [-Wunused-variable]
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 se=
ction mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 se=
ction mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, =
0 section mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 =
section mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sec=
tion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 secti=
on mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sec=
tion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section=
 mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 1 warning, 0 section mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 1 warning, 0 section mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 =
warning, 0 section mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warni=
ngs, 0 section mismatches

Warnings:
    kernel/bpf/bpf_struct_ops.c:197:1: warning: the frame size of 1192 byte=
s is larger than 1024 bytes [-Wframe-larger-than=3D]
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 se=
ction mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 s=
ection mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8d8): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings=
, 0 section mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sec=
tion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x97c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sect=
ion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sect=
ion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 secti=
on mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 secti=
on mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1163:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section mis=
matches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

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
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    fs/xfs/xfs_inode.c:1523:8: warning: unused variable =E2=80=98done=E2=80=
=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section=
 mismatches

Errors:
    arch/mips/vdso/vgettimeofday.c:17:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_gettime32=E2=80=99; did you mean =E2=80=98__cv=
dso_clock_gettime=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    arch/mips/vdso/vgettimeofday.c:39:9: error: implicit declaration of fun=
ction =E2=80=98__cvdso_clock_getres_time32=E2=80=99; did you mean =E2=80=98=
__cvdso_clock_getres_common=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    fs/io_uring.c:5567:8: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]

---
For more info write to <info@kernelci.org>
