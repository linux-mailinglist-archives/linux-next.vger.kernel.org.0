Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7543B1771E8
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 10:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727741AbgCCJFD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Mar 2020 04:05:03 -0500
Received: from mail-pl1-f179.google.com ([209.85.214.179]:32928 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgCCJFD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Mar 2020 04:05:03 -0500
Received: by mail-pl1-f179.google.com with SMTP id ay11so1048788plb.0
        for <linux-next@vger.kernel.org>; Tue, 03 Mar 2020 01:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eeCnrw/Fj4Xuc5bks0q8/YOiGOf80aEl0QjjTneMgjY=;
        b=dAs/JV0DAtS7ONlfkXXN7yCHB1EDiXWlLajmLNHwXF3UFuliEDLTqj+RBO4Xa3HjkC
         fDDPKCAr92UZ0BrAwbUXELV8sq7xe233pkDUkpq7+NMHNCtCcZYz4h0+I8CFfQ1Zs5/y
         YkIkJEPJ6wZQIyqMklUb+N9M5n4vXfTYuX+W/9FuycNNmO5KibMt+wFz05JdfdH7x+6r
         pOJP738qHQEUEFkAp9huZyfYrRINgdcFC2MmzYAZq9W48nAgBWvIfnOPKLGX8Ha+6gry
         teQWQZxzBhVdmpwZsfkHGBDnUqp2iJVztGwGB/YybyiZI5gKmFcEv2KynKywKrAyKe+8
         UTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eeCnrw/Fj4Xuc5bks0q8/YOiGOf80aEl0QjjTneMgjY=;
        b=X8XZ0RqiR8ek9E6AhuESAlug+KoCf/Lb6FJuiWa82rkNTKmJg5GAr4Y/50te94drMX
         r2GBNnj1r3H/o3OdsQFWMi1zc1es1XsQv1CVR+vjUqMLUCcXehFHS8EtJbx8hTGWMbKH
         lEyli23S8ABCd/lX/aLF8nKd6pCO0tZ48sbGQ+PEihVuRpX2mkmBIBYQ4uqx+dvKcXoK
         BWnxhmhVXVqnVEJhWu8lZ2CZMqlaUs0WVzova55PvEX4M26pcuLWb2UJmycPP0aqhcms
         OR5G5O/niyPXl7oeUahJjAqmRgn/s2h+i0ulLhkbJL1DupaaRgWWhs4WZJkC3tZb8yK4
         n59Q==
X-Gm-Message-State: ANhLgQ1hEJaxUqFBdAGcTwiyp1haJWGSEdEzUWEtLQU+R8dOFB12cajl
        CppisLuPPDdPhYpIr5L6wuRWCUfXFXE=
X-Google-Smtp-Source: ADFU+vuSLw2OKllCSHGM6ldZn3dWsofKB01DB1mUfSwUs78BF+IfJrfL8gLNL5SGHXH1M317rYL4uA==
X-Received: by 2002:a17:90b:2290:: with SMTP id kx16mr2959019pjb.152.1583226288492;
        Tue, 03 Mar 2020 01:04:48 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id p2sm4894184pfb.41.2020.03.03.01.04.46
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 01:04:47 -0800 (PST)
Message-ID: <5e5e1daf.1c69fb81.ab58.c4f5@mx.google.com>
Date:   Tue, 03 Mar 2020 01:04:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200303
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
Subject: next/master build: 329 builds: 42 failed, 287 passed, 96 errors,
 1984 warnings (next-20200303)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 329 builds: 42 failed, 287 passed, 96 errors, 1984 warni=
ngs (next-20200303)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200303/

Tree: next
Branch: master
Git Describe: next-20200303
Git Commit: e78aa714e3261e23c7413fd6e719820e271ff128
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    cm_x300_defconfig: (clang-9) FAIL
    em_x270_defconfig: (clang-9) FAIL
    eseries_pxa_defconfig: (clang-9) FAIL
    pxa_defconfig: (clang-9) FAIL
    rpc_defconfig: (clang-9) FAIL
    vf610m4_defconfig: (clang-9) FAIL
    assabet_defconfig: (gcc-8) FAIL
    badge4_defconfig: (gcc-8) FAIL
    cerfcube_defconfig: (gcc-8) FAIL
    cm_x300_defconfig: (gcc-8) FAIL
    collie_defconfig: (gcc-8) FAIL
    corgi_defconfig: (gcc-8) FAIL
    ebsa110_defconfig: (gcc-8) FAIL
    em_x270_defconfig: (gcc-8) FAIL
    eseries_pxa_defconfig: (gcc-8) FAIL
    footbridge_defconfig: (gcc-8) FAIL
    h3600_defconfig: (gcc-8) FAIL
    hackkit_defconfig: (gcc-8) FAIL
    iop32x_defconfig: (gcc-8) FAIL
    jornada720_defconfig: (gcc-8) FAIL
    lart_defconfig: (gcc-8) FAIL
    lpd270_defconfig: (gcc-8) FAIL
    lubbock_defconfig: (gcc-8) FAIL
    mainstone_defconfig: (gcc-8) FAIL
    neponset_defconfig: (gcc-8) FAIL
    netwinder_defconfig: (gcc-8) FAIL
    pleb_defconfig: (gcc-8) FAIL
    pxa255-idp_defconfig: (gcc-8) FAIL
    pxa_defconfig: (gcc-8) FAIL
    rpc_defconfig: (gcc-8) FAIL
    s3c2410_defconfig: (gcc-8) FAIL
    shannon_defconfig: (gcc-8) FAIL
    simpad_defconfig: (gcc-8) FAIL
    spear3xx_defconfig: (gcc-8) FAIL
    spear6xx_defconfig: (gcc-8) FAIL
    spitz_defconfig: (gcc-8) FAIL
    tct_hammer_defconfig: (gcc-8) FAIL
    vf610m4_defconfig: (gcc-8) FAIL

mips:
    ip27_defconfig: (gcc-8) FAIL

riscv:
    allnoconfig: (gcc-8) FAIL
    tinyconfig: (gcc-8) FAIL

x86_64:
    x86_64_defconfig+kvm_guest: (clang-9) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 5 warnings
    axs103_smp_defconfig (gcc-8): 5 warnings
    haps_hs_defconfig (gcc-8): 5 warnings
    haps_hs_smp_defconfig (gcc-8): 5 warnings
    haps_hs_smp_defconfig (gcc-8): 5 warnings
    hsdk_defconfig (gcc-8): 5 warnings
    nsimosci_hs_defconfig (gcc-8): 5 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 5 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 5 warnings
    vdk_hs38_smp_defconfig (gcc-8): 5 warnings

arm64:
    allmodconfig (clang-9): 10 warnings
    allnoconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 2 warnings

arm:
    allmodconfig (gcc-8): 26 warnings
    allmodconfig (clang-9): 39 warnings
    allnoconfig (gcc-8): 1 warning
    am200epdkit_defconfig (gcc-8): 5 warnings
    am200epdkit_defconfig (clang-9): 2 warnings
    aspeed_g4_defconfig (gcc-8): 11 warnings
    aspeed_g4_defconfig (clang-9): 11 warnings
    aspeed_g5_defconfig (clang-9): 10 warnings
    aspeed_g5_defconfig (gcc-8): 11 warnings
    assabet_defconfig (gcc-8): 2 errors, 7 warnings
    assabet_defconfig (clang-9): 7 warnings
    at91_dt_defconfig (gcc-8): 6 warnings
    at91_dt_defconfig (clang-9): 4 warnings
    axm55xx_defconfig (clang-9): 6 warnings
    axm55xx_defconfig (gcc-8): 7 warnings
    badge4_defconfig (gcc-8): 2 errors, 7 warnings
    badge4_defconfig (clang-9): 7 warnings
    bcm2835_defconfig (gcc-8): 5 warnings
    bcm2835_defconfig (clang-9): 2 warnings
    cerfcube_defconfig (gcc-8): 2 errors, 7 warnings
    cerfcube_defconfig (clang-9): 7 warnings
    clps711x_defconfig (gcc-8): 5 warnings
    clps711x_defconfig (clang-9): 2 warnings
    cm_x2xx_defconfig (clang-9): 5 warnings
    cm_x2xx_defconfig (gcc-8): 6 warnings
    cm_x300_defconfig (gcc-8): 1 error, 9 warnings
    cm_x300_defconfig (clang-9): 1 error, 9 warnings
    cns3420vb_defconfig (gcc-8): 8 warnings
    cns3420vb_defconfig (clang-9): 6 warnings
    colibri_pxa270_defconfig (gcc-8): 6 warnings
    colibri_pxa270_defconfig (clang-9): 4 warnings
    colibri_pxa300_defconfig (gcc-8): 5 warnings
    colibri_pxa300_defconfig (clang-9): 3 warnings
    collie_defconfig (gcc-8): 2 errors, 6 warnings
    collie_defconfig (clang-9): 5 warnings
    corgi_defconfig (gcc-8): 2 errors, 6 warnings
    corgi_defconfig (clang-9): 4 warnings
    davinci_all_defconfig (gcc-8): 9 warnings
    davinci_all_defconfig (clang-9): 10 warnings
    dove_defconfig (gcc-8): 9 warnings
    dove_defconfig (clang-9): 10 warnings
    ebsa110_defconfig (gcc-8): 2 errors, 6 warnings
    ebsa110_defconfig (clang-9): 5 warnings
    efm32_defconfig (clang-9): 4 warnings
    efm32_defconfig (gcc-8): 6 warnings
    em_x270_defconfig (clang-9): 1 error, 9 warnings
    em_x270_defconfig (gcc-8): 1 error, 9 warnings
    ep93xx_defconfig (clang-9): 5 warnings
    ep93xx_defconfig (gcc-8): 6 warnings
    eseries_pxa_defconfig (gcc-8): 14 errors, 17 warnings
    eseries_pxa_defconfig (clang-9): 5 errors, 5 warnings
    exynos_defconfig (clang-9): 2 warnings
    exynos_defconfig (gcc-8): 5 warnings
    ezx_defconfig (gcc-8): 7 warnings
    ezx_defconfig (clang-9): 6 warnings
    footbridge_defconfig (clang-9): 5 warnings
    footbridge_defconfig (gcc-8): 2 errors, 6 warnings
    gemini_defconfig (clang-9): 2 warnings
    gemini_defconfig (gcc-8): 5 warnings
    h3600_defconfig (gcc-8): 2 errors, 6 warnings
    h3600_defconfig (clang-9): 4 warnings
    h5000_defconfig (clang-9): 3 warnings
    h5000_defconfig (gcc-8): 5 warnings
    hackkit_defconfig (clang-9): 7 warnings
    hackkit_defconfig (gcc-8): 2 errors, 7 warnings
    hisi_defconfig (clang-9): 6 warnings
    hisi_defconfig (gcc-8): 7 warnings
    imote2_defconfig (clang-9): 4 warnings
    imote2_defconfig (gcc-8): 6 warnings
    imx_v4_v5_defconfig (clang-9): 4 warnings
    imx_v4_v5_defconfig (gcc-8): 6 warnings
    imx_v6_v7_defconfig (gcc-8): 5 warnings
    imx_v6_v7_defconfig (clang-9): 2 warnings
    integrator_defconfig (gcc-8): 9 warnings
    integrator_defconfig (clang-9): 10 warnings
    iop32x_defconfig (clang-9): 5 warnings
    iop32x_defconfig (gcc-8): 2 errors, 6 warnings
    ixp4xx_defconfig (gcc-8): 6 warnings
    ixp4xx_defconfig (clang-9): 5 warnings
    jornada720_defconfig (clang-9): 5 warnings
    jornada720_defconfig (gcc-8): 2 errors, 6 warnings
    keystone_defconfig (gcc-8): 5 warnings
    keystone_defconfig (clang-9): 2 warnings
    lart_defconfig (clang-9): 7 warnings
    lart_defconfig (gcc-8): 2 errors, 7 warnings
    lpc18xx_defconfig (clang-9): 4 warnings
    lpc18xx_defconfig (gcc-8): 6 warnings
    lpc32xx_defconfig (clang-9): 4 warnings
    lpc32xx_defconfig (gcc-8): 6 warnings
    lpd270_defconfig (clang-9): 5 warnings
    lpd270_defconfig (gcc-8): 2 errors, 6 warnings
    lubbock_defconfig (clang-9): 5 warnings
    lubbock_defconfig (gcc-8): 2 errors, 6 warnings
    magician_defconfig (gcc-8): 7 warnings
    magician_defconfig (clang-9): 6 warnings
    mainstone_defconfig (gcc-8): 2 errors, 6 warnings
    mainstone_defconfig (clang-9): 5 warnings
    milbeaut_m10v_defconfig (clang-9): 12 warnings
    milbeaut_m10v_defconfig (gcc-8): 10 warnings
    mini2440_defconfig (clang-9): 3 warnings
    mini2440_defconfig (gcc-8): 5 warnings
    mmp2_defconfig (clang-9): 2 warnings
    mmp2_defconfig (gcc-8): 5 warnings
    moxart_defconfig (gcc-8): 6 warnings
    moxart_defconfig (clang-9): 4 warnings
    mps2_defconfig (gcc-8): 5 warnings
    mps2_defconfig (clang-9): 2 warnings
    multi_v4t_defconfig (gcc-8): 9 warnings
    multi_v4t_defconfig (clang-9): 9 warnings
    multi_v5_defconfig (clang-9): 6 warnings
    multi_v5_defconfig (gcc-8): 9 warnings
    multi_v7_defconfig (gcc-8): 9 warnings
    multi_v7_defconfig (clang-9): 8 warnings
    multi_v7_defconfig (gcc-8): 9 warnings
    multi_v7_defconfig (gcc-8): 9 warnings
    multi_v7_defconfig (gcc-8): 9 warnings
    multi_v7_defconfig (gcc-8): 10 warnings
    mv78xx0_defconfig (gcc-8): 6 warnings
    mv78xx0_defconfig (clang-9): 4 warnings
    mvebu_v5_defconfig (gcc-8): 5 warnings
    mvebu_v5_defconfig (clang-9): 2 warnings
    mvebu_v7_defconfig (clang-9): 2 warnings
    mvebu_v7_defconfig (gcc-8): 5 warnings
    mxs_defconfig (gcc-8): 5 warnings
    mxs_defconfig (clang-9): 3 warnings
    neponset_defconfig (gcc-8): 2 errors, 7 warnings
    neponset_defconfig (clang-9): 7 warnings
    netwinder_defconfig (gcc-8): 2 errors, 6 warnings
    netwinder_defconfig (clang-9): 5 warnings
    nhk8815_defconfig (gcc-8): 5 warnings
    nhk8815_defconfig (clang-9): 2 warnings
    omap1_defconfig (gcc-8): 5 warnings
    omap1_defconfig (clang-9): 2 warnings
    omap2plus_defconfig (gcc-8): 5 warnings
    omap2plus_defconfig (clang-9): 2 warnings
    orion5x_defconfig (gcc-8): 6 warnings
    orion5x_defconfig (clang-9): 4 warnings
    oxnas_v6_defconfig (gcc-8): 6 warnings
    oxnas_v6_defconfig (clang-9): 6 warnings
    palmz72_defconfig (gcc-8): 6 warnings
    palmz72_defconfig (clang-9): 4 warnings
    pcm027_defconfig (clang-9): 2 warnings
    pcm027_defconfig (gcc-8): 5 warnings
    pleb_defconfig (gcc-8): 2 errors, 7 warnings
    pleb_defconfig (clang-9): 7 warnings
    prima2_defconfig (gcc-8): 8 warnings
    prima2_defconfig (clang-9): 6 warnings
    pxa168_defconfig (gcc-8): 5 warnings
    pxa168_defconfig (clang-9): 2 warnings
    pxa255-idp_defconfig (gcc-8): 2 errors, 6 warnings
    pxa255-idp_defconfig (clang-9): 5 warnings
    pxa3xx_defconfig (gcc-8): 6 warnings
    pxa3xx_defconfig (clang-9): 4 warnings
    pxa910_defconfig (gcc-8): 5 warnings
    pxa910_defconfig (clang-9): 2 warnings
    pxa_defconfig (gcc-8): 3 errors, 20 warnings
    pxa_defconfig (clang-9): 1 error, 26 warnings
    qcom_defconfig (gcc-8): 5 warnings
    qcom_defconfig (clang-9): 2 warnings
    realview_defconfig (gcc-8): 6 warnings
    realview_defconfig (clang-9): 4 warnings
    rpc_defconfig (gcc-8): 2 errors, 5 warnings
    rpc_defconfig (clang-9): 5 errors
    s3c2410_defconfig (gcc-8): 2 errors, 7 warnings
    s3c2410_defconfig (clang-9): 7 warnings
    s3c6400_defconfig (clang-9): 8 warnings
    s3c6400_defconfig (gcc-8): 9 warnings
    s5pv210_defconfig (gcc-8): 7 warnings
    s5pv210_defconfig (clang-9): 6 warnings
    sama5_defconfig (gcc-8): 7 warnings
    sama5_defconfig (clang-9): 6 warnings
    shannon_defconfig (clang-9): 7 warnings
    shannon_defconfig (gcc-8): 2 errors, 7 warnings
    shmobile_defconfig (gcc-8): 5 warnings
    shmobile_defconfig (clang-9): 2 warnings
    simpad_defconfig (clang-9): 6 warnings
    simpad_defconfig (gcc-8): 2 errors, 7 warnings
    socfpga_defconfig (gcc-8): 6 warnings
    socfpga_defconfig (clang-9): 4 warnings
    spear13xx_defconfig (gcc-8): 5 warnings
    spear13xx_defconfig (clang-9): 2 warnings
    spear3xx_defconfig (clang-9): 3 warnings
    spear3xx_defconfig (gcc-8): 2 errors, 5 warnings
    spear6xx_defconfig (clang-9): 3 warnings
    spear6xx_defconfig (gcc-8): 2 errors, 5 warnings
    spitz_defconfig (gcc-8): 2 errors, 6 warnings
    spitz_defconfig (clang-9): 4 warnings
    stm32_defconfig (gcc-8): 8 warnings
    stm32_defconfig (clang-9): 6 warnings
    sunxi_defconfig (clang-9): 2 warnings
    sunxi_defconfig (gcc-8): 5 warnings
    tango4_defconfig (gcc-8): 5 warnings
    tango4_defconfig (clang-9): 2 warnings
    tct_hammer_defconfig (gcc-8): 2 errors, 5 warnings
    tct_hammer_defconfig (clang-9): 3 warnings
    tegra_defconfig (gcc-8): 9 warnings
    tegra_defconfig (clang-9): 10 warnings
    tinyconfig (gcc-8): 1 warning
    trizeps4_defconfig (clang-9): 4 warnings
    trizeps4_defconfig (gcc-8): 6 warnings
    u300_defconfig (clang-9): 6 warnings
    u300_defconfig (gcc-8): 8 warnings
    u8500_defconfig (clang-9): 2 warnings
    u8500_defconfig (gcc-8): 5 warnings
    versatile_defconfig (gcc-8): 5 warnings
    versatile_defconfig (clang-9): 3 warnings
    vexpress_defconfig (gcc-8): 7 warnings
    vexpress_defconfig (clang-9): 6 warnings
    vf610m4_defconfig (gcc-8): 4 errors, 14 warnings
    vf610m4_defconfig (clang-9): 2 errors, 8 warnings
    viper_defconfig (gcc-8): 7 warnings
    viper_defconfig (clang-9): 7 warnings
    vt8500_v6_v7_defconfig (clang-9): 6 warnings
    vt8500_v6_v7_defconfig (gcc-8): 7 warnings
    xcep_defconfig (gcc-8): 7 warnings
    xcep_defconfig (clang-9): 7 warnings
    zeus_defconfig (gcc-8): 7 warnings
    zeus_defconfig (clang-9): 7 warnings
    zx_defconfig (clang-9): 6 warnings
    zx_defconfig (gcc-8): 8 warnings

i386:
    allnoconfig (gcc-8): 1 warning
    i386_defconfig (gcc-8): 30 warnings
    i386_defconfig (gcc-8): 30 warnings
    tinyconfig (gcc-8): 1 warning

mips:
    32r2el_defconfig (gcc-8): 6 warnings
    32r2el_defconfig (gcc-8): 7 warnings
    allnoconfig (gcc-8): 1 warning
    ar7_defconfig (gcc-8): 5 warnings
    ath25_defconfig (gcc-8): 5 warnings
    ath79_defconfig (gcc-8): 5 warnings
    bcm47xx_defconfig (gcc-8): 6 warnings
    bcm63xx_defconfig (gcc-8): 5 warnings
    bigsur_defconfig (gcc-8): 1 warning
    bmips_be_defconfig (gcc-8): 6 warnings
    bmips_stb_defconfig (gcc-8): 7 warnings
    capcella_defconfig (gcc-8): 5 warnings
    cavium_octeon_defconfig (gcc-8): 1 warning
    ci20_defconfig (gcc-8): 5 warnings
    cobalt_defconfig (gcc-8): 5 warnings
    cu1000-neo_defconfig (gcc-8): 6 warnings
    db1xxx_defconfig (gcc-8): 7 warnings
    decstation_64_defconfig (gcc-8): 1 warning
    decstation_defconfig (gcc-8): 5 warnings
    decstation_r4k_defconfig (gcc-8): 5 warnings
    e55_defconfig (gcc-8): 8 warnings
    fuloong2e_defconfig (gcc-8): 1 warning
    gcw0_defconfig (gcc-8): 6 warnings
    gpr_defconfig (gcc-8): 6 warnings
    ip22_defconfig (gcc-8): 9 warnings
    ip27_defconfig (gcc-8): 2 errors, 1 warning
    ip28_defconfig (gcc-8): 1 warning
    ip32_defconfig (gcc-8): 2 warnings
    jazz_defconfig (gcc-8): 5 warnings
    jmr3927_defconfig (gcc-8): 5 warnings
    lasat_defconfig (gcc-8): 5 warnings
    lemote2f_defconfig (gcc-8): 8 warnings
    loongson1b_defconfig (gcc-8): 5 warnings
    loongson1c_defconfig (gcc-8): 5 warnings
    loongson3_defconfig (gcc-8): 2 warnings
    malta_defconfig (gcc-8): 5 warnings
    malta_kvm_defconfig (gcc-8): 5 warnings
    malta_kvm_guest_defconfig (gcc-8): 5 warnings
    malta_qemu_32r6_defconfig (gcc-8): 6 warnings
    maltaaprp_defconfig (gcc-8): 5 warnings
    maltasmvp_defconfig (gcc-8): 5 warnings
    maltasmvp_eva_defconfig (gcc-8): 5 warnings
    maltaup_defconfig (gcc-8): 5 warnings
    maltaup_xpa_defconfig (gcc-8): 5 warnings
    markeins_defconfig (gcc-8): 6 warnings
    mips_paravirt_defconfig (gcc-8): 1 warning
    mpc30x_defconfig (gcc-8): 5 warnings
    msp71xx_defconfig (gcc-8): 6 warnings
    mtx1_defconfig (gcc-8): 6 warnings
    nlm_xlp_defconfig (gcc-8): 1 warning
    nlm_xlr_defconfig (gcc-8): 5 warnings
    omega2p_defconfig (gcc-8): 5 warnings
    pic32mzda_defconfig (gcc-8): 8 warnings
    pistachio_defconfig (gcc-8): 5 warnings
    pnx8335_stb225_defconfig (gcc-8): 5 warnings
    qi_lb60_defconfig (gcc-8): 7 warnings
    rb532_defconfig (gcc-8): 5 warnings
    rbtx49xx_defconfig (gcc-8): 5 warnings
    rm200_defconfig (gcc-8): 5 warnings
    rt305x_defconfig (gcc-8): 5 warnings
    sb1250_swarm_defconfig (gcc-8): 1 warning
    tb0219_defconfig (gcc-8): 5 warnings
    tb0226_defconfig (gcc-8): 5 warnings
    tb0287_defconfig (gcc-8): 5 warnings
    tinyconfig (gcc-8): 1 warning
    vocore2_defconfig (gcc-8): 5 warnings
    workpad_defconfig (gcc-8): 5 warnings
    xway_defconfig (gcc-8): 5 warnings

riscv:
    allnoconfig (gcc-8): 1 error
    defconfig (gcc-8): 3 warnings
    defconfig (gcc-8): 3 warnings
    nommu_virt_defconfig (gcc-8): 1 warning
    rv32_defconfig (gcc-8): 13 warnings
    tinyconfig (gcc-8): 1 error

x86_64:
    allmodconfig (clang-9): 12 warnings
    allmodconfig (gcc-8): 1 warning
    allnoconfig (clang-9): 2 warnings
    allnoconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 2 warnings
    x86_64_defconfig (gcc-8): 27 warnings
    x86_64_defconfig (clang-9): 54 warnings
    x86_64_defconfig (gcc-8): 27 warnings
    x86_64_defconfig (gcc-8): 27 warnings

Errors summary:

    27   include/linux/compiler.h:394:38: error: call to =E2=80=98__compile=
time_assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON faile=
d: sizeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)
    27   include/linux/compiler.h:394:38: error: call to =E2=80=98__compile=
time_assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON faile=
d: sizeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    5    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] undef=
ined!
    2    clang: error: assembler command failed with exit code 1 (use -v to=
 see invocation)
    2    arch/riscv/kernel/stacktrace.c:78:8: error: =E2=80=98sp_in_global=
=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98sp=
in_lock=E2=80=99?
    2    arch/mips/include/asm/sn/addrs.h:58:44: error: left shift count >=
=3D width of type [-Werror=3Dshift-count-overflow]
    1    sound/soc/codecs/wm9712.c:94:3: error: =E2=80=98const struct regma=
p_config=E2=80=99 has no member named =E2=80=98num_reg_defaults=E2=80=99
    1    sound/soc/codecs/wm9712.c:93:3: error: =E2=80=98const struct regma=
p_config=E2=80=99 has no member named =E2=80=98reg_defaults=E2=80=99
    1    sound/soc/codecs/wm9712.c:91:3: error: =E2=80=98const struct regma=
p_config=E2=80=99 has no member named =E2=80=98volatile_reg=E2=80=99
    1    sound/soc/codecs/wm9712.c:89:3: error: =E2=80=98const struct regma=
p_config=E2=80=99 has no member named =E2=80=98cache_type=E2=80=99
    1    sound/soc/codecs/wm9712.c:88:3: error: =E2=80=98const struct regma=
p_config=E2=80=99 has no member named =E2=80=98max_register=E2=80=99
    1    sound/soc/codecs/wm9712.c:87:3: error: =E2=80=98const struct regma=
p_config=E2=80=99 has no member named =E2=80=98val_bits=E2=80=99
    1    sound/soc/codecs/wm9712.c:86:3: error: =E2=80=98const struct regma=
p_config=E2=80=99 has no member named =E2=80=98reg_stride=E2=80=99
    1    sound/soc/codecs/wm9712.c:85:3: error: =E2=80=98const struct regma=
p_config=E2=80=99 has no member named =E2=80=98reg_bits=E2=80=99
    1    sound/soc/codecs/wm9712.c:84:35: error: variable has incomplete ty=
pe 'const struct regmap_config'
    1    sound/soc/codecs/wm9712.c:84:35: error: storage size of =E2=80=98w=
m9712_regmap_config=E2=80=99 isn=E2=80=99t known
    1    sound/soc/codecs/wm9712.c:84:21: error: variable =E2=80=98wm9712_r=
egmap_config=E2=80=99 has initializer but incomplete type
    1    sound/soc/codecs/wm9712.c:80:10: error: implicit declaration of fu=
nction =E2=80=98regmap_ac97_default_volatile=E2=80=99 [-Werror=3Dimplicit-f=
unction-declaration]
    1    sound/soc/codecs/wm9712.c:80:10: error: implicit declaration of fu=
nction 'regmap_ac97_default_volatile' [-Werror,-Wimplicit-function-declarat=
ion]
    1    sound/soc/codecs/wm9712.c:675:3: error: implicit declaration of fu=
nction =E2=80=98snd_soc_component_exit_regmap=E2=80=99; did you mean =E2=80=
=98snd_soc_component_trigger=E2=80=99? [-Werror=3Dimplicit-function-declara=
tion]
    1    sound/soc/codecs/wm9712.c:675:3: error: implicit declaration of fu=
nction 'snd_soc_component_exit_regmap' [-Werror,-Wimplicit-function-declara=
tion]
    1    sound/soc/codecs/wm9712.c:662:2: error: implicit declaration of fu=
nction =E2=80=98snd_soc_component_init_regmap=E2=80=99; did you mean =E2=80=
=98snd_soc_component_trigger=E2=80=99? [-Werror=3Dimplicit-function-declara=
tion]
    1    sound/soc/codecs/wm9712.c:662:2: error: implicit declaration of fu=
nction 'snd_soc_component_init_regmap' [-Werror,-Wimplicit-function-declara=
tion]
    1    sound/soc/codecs/wm9712.c:653:12: error: implicit declaration of f=
unction =E2=80=98regmap_init_ac97=E2=80=99; did you mean =E2=80=98memmap_in=
it_zone=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    1    sound/soc/codecs/wm9712.c:653:12: error: implicit declaration of f=
unction 'regmap_init_ac97' [-Werror,-Wimplicit-function-declaration]
    1    drivers/usb/gadget/udc/pxa25x_udc.c:2328:11: error: invalid % esca=
pe in inline assembly string
    1    drivers/clocksource/timer-vf-pit.c:194:58: error: expected '}'
    1    drivers/clocksource/timer-vf-pit.c:194: error: unterminated argume=
nt list invoking macro "BUG_ON"
    1    drivers/clocksource/timer-vf-pit.c:131:8: error: expected =E2=80=
=98;=E2=80=99 at end of input
    1    drivers/clocksource/timer-vf-pit.c:131:2: error: =E2=80=98BUG_ON=
=E2=80=99 undeclared (first use in this function)
    1    drivers/clocksource/timer-vf-pit.c:131:2: error: unterminated func=
tion-like macro invocation
    1    drivers/clocksource/timer-vf-pit.c:131:2: error: expected declarat=
ion or statement at end of input
    1    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9713.ko] undef=
ined!
    1    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9705.ko] undef=
ined!
    1    /tmp/main-f1ea14.s:1469: Error: selected processor does not suppor=
t `strh r0,[r1]' in ARM mode
    1    /tmp/main-f1ea14.s:1466: Error: selected processor does not suppor=
t `ldrh r0,[r0]' in ARM mode
    1    /tmp/elf-ecb937.s:49: Error: selected processor does not support `=
ldrh r2,[r0,#18]' in ARM mode

Warnings summary:

    281  include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_=
get_sensor_id=E2=80=99 defined but not used [-Wunused-function]
    259  1 warning generated.
    204  drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_se=
condary=E2=80=99 defined but not used [-Wunused-function]
    178  fs/io_uring.c:4897:10: warning: cast to pointer from integer of di=
fferent size [-Wint-to-pointer-cast]
    178  fs/io_uring.c:2216:17: warning: cast from pointer to integer of di=
fferent size [-Wpointer-to-int-cast]
    178  fs/io_uring.c:2209:27: warning: cast to pointer from integer of di=
fferent size [-Wint-to-pointer-cast]
    178  fs/io_uring.c:1651:27: warning: cast to pointer from integer of di=
fferent size [-Wint-to-pointer-cast]
    139  include/linux/thermal.h:382:12: warning: unused function 'thermal_=
zone_of_get_sensor_id' [-Wunused-function]
    107  drivers/char/random.c:820:13: warning: unused function 'crng_initi=
alize_secondary' [-Wunused-function]
    16   WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    14   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warn=
ing (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C addr=
ess must be less than 10-bits, got "0x40000010"
    14   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: =
Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus =
unit address format error, expected "40000010"
    14   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warn=
ing (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C addr=
ess must be less than 10-bits, got "0x40000010"
    14   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: =
Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus =
unit address format error, expected "40000010"
    12   3 warnings generated.
    11   fs/io_uring.c:3668:26: warning: =E2=80=98io_recv_buffer_select=E2=
=80=99 defined but not used [-Wunused-function]
    11   fs/io_uring.c:3656:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=
=99 defined but not used [-Wunused-function]
    11   fs/io_uring.c:3423:12: warning: =E2=80=98io_setup_async_msg=E2=80=
=99 defined but not used [-Wunused-function]
    9    fs/io_uring.c:3668:26: warning: unused function 'io_recv_buffer_se=
lect' [-Wunused-function]
    9    fs/io_uring.c:3656:12: warning: unused function 'io_recvmsg_copy_h=
dr' [-Wunused-function]
    9    fs/io_uring.c:3423:12: warning: unused function 'io_setup_async_ms=
g' [-Wunused-function]
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    4    kernel/sched/fair.c:1524:20: warning: =E2=80=98test_idle_cores=E2=
=80=99 declared =E2=80=98static=E2=80=99 but never defined [-Wunused-functi=
on]
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    4    WARNING: unmet direct dependencies detected for SND_SOC_WM9713
    4    WARNING: unmet direct dependencies detected for SND_SOC_WM9705
    4    2 warnings generated.
    3    drivers/net/wireless/ath/ath11k/debugfs_sta.c:185:7: warning: vari=
able 'rate_idx' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    3    drivers/net/wireless/ath/ath11k/debugfs_sta.c:184:13: warning: var=
iable 'rate_idx' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    3    drivers/net/wireless/ath/ath11k/debugfs_sta.c:175:7: warning: vari=
able 'rate_idx' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    3    drivers/net/wireless/ath/ath11k/debugfs_sta.c:139:13: note: initia=
lize the variable 'rate_idx' to silence this warning
    3    drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:56: wa=
rning: address of 'pipe_ctx->stream_res' will always evaluate to 'true' [-W=
pointer-bool-conversion]
    3    drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:31: wa=
rning: address of 'pipe_ctx->plane_res' will always evaluate to 'true' [-Wp=
ointer-bool-conversion]
    2    drivers/hwtracing/coresight/coresight-cti-sysfs.c:948:11: warning:=
 address of array 'grp->sig_types' will always evaluate to 'true' [-Wpointe=
r-bool-conversion]
    2    drivers/firmware/efi/libstub/file.c:123:21: warning: stack frame s=
ize of 1232 bytes in function 'handle_cmdline_files' [-Wframe-larger-than=
=3D]
    2    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    #warning This code requires at least version 4.6 of GCC
    1    {standard input}:141: Warning: macro instruction expanded into mul=
tiple instructions
    1    sound/soc/codecs/wm9712.c:93:18: warning: excess elements in struc=
t initializer
    1    sound/soc/codecs/wm9712.c:91:18: warning: excess elements in struc=
t initializer
    1    sound/soc/codecs/wm9712.c:89:16: warning: excess elements in struc=
t initializer
    1    sound/soc/codecs/wm9712.c:88:18: warning: excess elements in struc=
t initializer
    1    sound/soc/codecs/wm9712.c:87:14: warning: excess elements in struc=
t initializer
    1    sound/soc/codecs/wm9712.c:86:16: warning: excess elements in struc=
t initializer
    1    sound/soc/codecs/wm9712.c:85:14: warning: excess elements in struc=
t initializer
    1    sound/soc/codecs/wm9712.c:653:10: warning: assignment to =E2=80=98=
struct regmap *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from inte=
ger without a cast [-Wint-conversion]
    1    sound/soc/codecs/cros_ec_codec.c:776:12: warning: stack frame size=
 of 1152 bytes in function 'wov_hotword_model_put' [-Wframe-larger-than=3D]
    1    sound/soc/amd/acp3x-rt5682-max9836.c:341:23: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 3 has type =E2=80=98long int=E2=80=99 [-Wformat=3D]
    1    security/integrity/ima/ima_crypto.c:512:5: warning: stack frame si=
ze of 1152 bytes in function 'ima_calc_field_array_hash' [-Wframe-larger-th=
an=3D]
    1    net/sched/cls_flower.c:331:1: warning: the frame size of 1032 byte=
s is larger than 1024 bytes [-Wframe-larger-than=3D]
    1    mm/kasan/common.o: warning: objtool: kasan_report()+0x52: call to =
__stack_chk_fail() with UACCESS enabled
    1    include/linux/kernel.h:47:25: warning: excess elements in struct i=
nitializer
    1    drivers/staging/exfat/exfat_super.c:1686:12: warning: stack frame =
size of 1552 bytes in function 'exfat_readdir' [-Wframe-larger-than=3D]
    1    drivers/soc/fsl/dpio/qbman-portal.c:870:14: warning: cast from poi=
nter to integer of different size [-Wpointer-to-int-cast]
    1    drivers/soc/fsl/dpio/dpio-service.c:476:5: warning: stack frame si=
ze of 1072 bytes in function 'dpaa2_io_service_enqueue_multiple_desc_fq' [-=
Wframe-larger-than=3D]
    1    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size=
 of 1824 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-la=
rger-than=3D]
    1    drivers/net/phy/mdio-octeon.c:48:3: warning: cast from pointer to =
integer of different size [-Wpointer-to-int-cast]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: =
warning: stack frame size of 5648 bytes in function 'calculate_bandwidth' [=
-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3014:6:=
 warning: stack frame size of 1376 bytes in function 'bw_calcs' [-Wframe-la=
rger-than=3D]
    1    drivers/firmware/efi/libstub/file.c:123:21: warning: stack frame s=
ize of 1224 bytes in function 'handle_cmdline_files' [-Wframe-larger-than=
=3D]
    1    drivers/crypto/inside-secure/safexcel_cipher.c:404:12: warning: st=
ack frame size of 1136 bytes in function 'safexcel_aead_setkey' [-Wframe-la=
rger-than=3D]
    1    drivers/clocksource/timer-vf-pit.c:97:20: warning: =E2=80=98pit_ti=
mer_interrupt=E2=80=99 defined but not used [-Wunused-function]
    1    drivers/clocksource/timer-vf-pit.c:56:19: warning: =E2=80=98pit_cl=
ocksource_init=E2=80=99 defined but not used [-Wunused-function]
    1    drivers/clocksource/timer-vf-pit.c:131:2: warning: no return state=
ment in function returning non-void [-Wreturn-type]
    1    drivers/clocksource/timer-vf-pit.c:126:19: warning: =E2=80=98pit_c=
lockevent_init=E2=80=99 defined but not used [-Wunused-function]
    1    drivers/clocksource/timer-vf-pit.c:117:34: warning: =E2=80=98clock=
event_pit=E2=80=99 defined but not used [-Wunused-variable]
    1    cc1: some warnings being treated as errors
    1    cc1: all warnings being treated as errors
    1    arch/x86/kernel/signal.o: warning: objtool: x32_setup_rt_frame()+0=
x1fa: call to memset() with UACCESS enabled
    1    arch/x86/kernel/signal.o: warning: objtool: __setup_rt_frame()+0x1=
f8: call to memset() with UACCESS enabled
    1    /tmp/test-arm-e7f926.s:18788: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-e7f926.s:18713: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/futex-fc75d7.s:28918: Warning: source register same as write-=
back base
    1    /tmp/futex-f6b5b9.s:29023: Warning: source register same as write-=
back base
    1    /tmp/futex-f45025.s:28918: Warning: source register same as write-=
back base
    1    /tmp/futex-f07161.s:9049: Warning: source register same as write-b=
ack base
    1    /tmp/futex-e5d719.s:28617: Warning: source register same as write-=
back base
    1    /tmp/futex-e189cb.s:9057: Warning: source register same as write-b=
ack base
    1    /tmp/futex-da24b2.s:9049: Warning: source register same as write-b=
ack base
    1    /tmp/futex-d40907.s:29056: Warning: source register same as write-=
back base
    1    /tmp/futex-c7d524.s:28858: Warning: source register same as write-=
back base
    1    /tmp/futex-c7a797.s:9064: Warning: source register same as write-b=
ack base
    1    /tmp/futex-c404b3.s:29274: Warning: source register same as write-=
back base
    1    /tmp/futex-b3d6d1.s:9057: Warning: source register same as write-b=
ack base
    1    /tmp/futex-b00935.s:9021: Warning: source register same as write-b=
ack base
    1    /tmp/futex-8fd8e5.s:9036: Warning: source register same as write-b=
ack base
    1    /tmp/futex-89d908.s:9021: Warning: source register same as write-b=
ack base
    1    /tmp/futex-86c404.s:9085: Warning: source register same as write-b=
ack base
    1    /tmp/futex-625e54.s:28918: Warning: source register same as write-=
back base
    1    /tmp/futex-625020.s:8999: Warning: source register same as write-b=
ack base
    1    /tmp/futex-51f850.s:9085: Warning: source register same as write-b=
ack base
    1    /tmp/futex-4e57bd.s:9049: Warning: source register same as write-b=
ack base
    1    /tmp/futex-49f22a.s:9085: Warning: source register same as write-b=
ack base
    1    /tmp/futex-43a33b.s:9049: Warning: source register same as write-b=
ack base
    1    /tmp/futex-413667.s:9080: Warning: source register same as write-b=
ack base
    1    /tmp/futex-3fa3a4.s:9021: Warning: source register same as write-b=
ack base
    1    /tmp/futex-3daf74.s:9057: Warning: source register same as write-b=
ack base
    1    /tmp/futex-3c822e.s:9022: Warning: source register same as write-b=
ack base
    1    /tmp/futex-3c488c.s:28617: Warning: source register same as write-=
back base
    1    /tmp/futex-37dd1d.s:29243: Warning: source register same as write-=
back base
    1    /tmp/futex-349b2c.s:9021: Warning: source register same as write-b=
ack base
    1    /tmp/futex-24b847.s:9049: Warning: source register same as write-b=
ack base
    1    /tmp/futex-21ae7e.s:9250: Warning: source register same as write-b=
ack base
    1    /tmp/futex-1a1c3f.s:9085: Warning: source register same as write-b=
ack base
    1    /tmp/futex-1871d3.s:9085: Warning: source register same as write-b=
ack base
    1    /tmp/futex-167c46.s:9069: Warning: source register same as write-b=
ack base
    1    /tmp/futex-124f0c.s:28918: Warning: source register same as write-=
back base
    1    /tmp/futex-122e27.s:29056: Warning: source register same as write-=
back base
    1    /tmp/futex-09299f.s:9033: Warning: source register same as write-b=
ack base
    1    /tmp/futex-06f9a5.s:9085: Warning: source register same as write-b=
ack base
    1    /tmp/ccKyFsbN.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccKyFsbN.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1165:warning: override: UNWINDER_GUESS changes choice state
    1    ...arch/x86/ia32/ia32_signal.o: warning: objtool: ia32_setup_rt_fr=
ame()+0x1ef: call to memset() with UACCESS enabled

Section mismatches summary:

    1    WARNING: vmlinux.o(.text.unlikely+0x39dc): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    1    WARNING: vmlinux.o(.text.unlikely+0x3684): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnin=
gs, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 26 warnings, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    /tmp/ccKyFsbN.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccKyFsbN.s:18191: Warning: using r15 results in unpredictable beha=
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
    drivers/soc/fsl/dpio/qbman-portal.c:870:14: warning: cast from pointer =
to integer of different size [-Wpointer-to-int-cast]
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-9) =E2=80=94 PASS, 0 errors, 12 warnings, 0 sec=
tion mismatches

Warnings:
    ...arch/x86/ia32/ia32_signal.o: warning: objtool: ia32_setup_rt_frame()=
+0x1ef: call to memset() with UACCESS enabled
    mm/kasan/common.o: warning: objtool: kasan_report()+0x52: call to __sta=
ck_chk_fail() with UACCESS enabled
    arch/x86/kernel/signal.o: warning: objtool: x32_setup_rt_frame()+0x1fa:=
 call to memset() with UACCESS enabled
    arch/x86/kernel/signal.o: warning: objtool: __setup_rt_frame()+0x1f8: c=
all to memset() with UACCESS enabled
    drivers/net/wireless/ath/ath11k/debugfs_sta.c:185:7: warning: variable =
'rate_idx' is used uninitialized whenever 'if' condition is false [-Wsometi=
mes-uninitialized]
    drivers/net/wireless/ath/ath11k/debugfs_sta.c:184:13: warning: variable=
 'rate_idx' is used uninitialized whenever 'if' condition is false [-Wsomet=
imes-uninitialized]
    drivers/net/wireless/ath/ath11k/debugfs_sta.c:175:7: warning: variable =
'rate_idx' is used uninitialized whenever 'if' condition is false [-Wsometi=
mes-uninitialized]
    drivers/net/wireless/ath/ath11k/debugfs_sta.c:139:13: note: initialize =
the variable 'rate_idx' to silence this warning
    3 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:31: warning=
: address of 'pipe_ctx->plane_res' will always evaluate to 'true' [-Wpointe=
r-bool-conversion]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:56: warning=
: address of 'pipe_ctx->stream_res' will always evaluate to 'true' [-Wpoint=
er-bool-conversion]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 39 warnings, 0 sectio=
n mismatches

Warnings:
    security/integrity/ima/ima_crypto.c:512:5: warning: stack frame size of=
 1152 bytes in function 'ima_calc_field_array_hash' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    drivers/hwtracing/coresight/coresight-cti-sysfs.c:948:11: warning: addr=
ess of array 'grp->sig_types' will always evaluate to 'true' [-Wpointer-boo=
l-conversion]
    1 warning generated.
    /tmp/test-arm-e7f926.s:18713: Warning: using r15 results in unpredictab=
le behaviour
    /tmp/test-arm-e7f926.s:18788: Warning: using r15 results in unpredictab=
le behaviour
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    drivers/crypto/inside-secure/safexcel_cipher.c:404:12: warning: stack f=
rame size of 1136 bytes in function 'safexcel_aead_setkey' [-Wframe-larger-=
than=3D]
    1 warning generated.
    sound/soc/codecs/cros_ec_codec.c:776:12: warning: stack frame size of 1=
152 bytes in function 'wov_hotword_model_put' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/wireless/ath/ath11k/debugfs_sta.c:185:7: warning: variable =
'rate_idx' is used uninitialized whenever 'if' condition is false [-Wsometi=
mes-uninitialized]
    drivers/net/wireless/ath/ath11k/debugfs_sta.c:184:13: warning: variable=
 'rate_idx' is used uninitialized whenever 'if' condition is false [-Wsomet=
imes-uninitialized]
    drivers/net/wireless/ath/ath11k/debugfs_sta.c:175:7: warning: variable =
'rate_idx' is used uninitialized whenever 'if' condition is false [-Wsometi=
mes-uninitialized]
    drivers/net/wireless/ath/ath11k/debugfs_sta.c:139:13: note: initialize =
the variable 'rate_idx' to silence this warning
    3 warnings generated.
    drivers/soc/fsl/dpio/dpio-service.c:476:5: warning: stack frame size of=
 1072 bytes in function 'dpaa2_io_service_enqueue_multiple_desc_fq' [-Wfram=
e-larger-than=3D]
    1 warning generated.
    drivers/staging/exfat/exfat_super.c:1686:12: warning: stack frame size =
of 1552 bytes in function 'exfat_readdir' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size of 1=
824 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3014:6: warn=
ing: stack frame size of 1376 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5648 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:31: warning=
: address of 'pipe_ctx->plane_res' will always evaluate to 'true' [-Wpointe=
r-bool-conversion]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:56: warning=
: address of 'pipe_ctx->stream_res' will always evaluate to 'true' [-Wpoint=
er-bool-conversion]
    2 warnings generated.
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-9) =E2=80=94 PASS, 0 errors, 10 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/hwtracing/coresight/coresight-cti-sysfs.c:948:11: warning: addr=
ess of array 'grp->sig_types' will always evaluate to 'true' [-Wpointer-boo=
l-conversion]
    1 warning generated.
    drivers/net/wireless/ath/ath11k/debugfs_sta.c:185:7: warning: variable =
'rate_idx' is used uninitialized whenever 'if' condition is false [-Wsometi=
mes-uninitialized]
    drivers/net/wireless/ath/ath11k/debugfs_sta.c:184:13: warning: variable=
 'rate_idx' is used uninitialized whenever 'if' condition is false [-Wsomet=
imes-uninitialized]
    drivers/net/wireless/ath/ath11k/debugfs_sta.c:175:7: warning: variable =
'rate_idx' is used uninitialized whenever 'if' condition is false [-Wsometi=
mes-uninitialized]
    drivers/net/wireless/ath/ath11k/debugfs_sta.c:139:13: note: initialize =
the variable 'rate_idx' to silence this warning
    3 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:31: warning=
: address of 'pipe_ctx->plane_res' will always evaluate to 'true' [-Wpointe=
r-bool-conversion]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:56: warning=
: address of 'pipe_ctx->stream_res' will always evaluate to 'true' [-Wpoint=
er-bool-conversion]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    sound/soc/amd/acp3x-rt5682-max9836.c:341:23: warning: format =E2=80=98%=
d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 3 h=
as type =E2=80=98long int=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    arch/riscv/kernel/stacktrace.c:78:8: error: =E2=80=98sp_in_global=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98spin_loc=
k=E2=80=99?

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 11 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 11 warnings, 0=
 section mismatches

Warnings:
    /tmp/futex-c7d524.s:28858: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 10 warnings, 0=
 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 11 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 7 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-49f22a.s:9085: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 7 warnings, 0 secti=
on mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-f6b5b9.s:29023: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 7 warnings, 0 sec=
tion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 s=
ection mismatches

Warnings:
    /tmp/futex-86c404.s:9085: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-89d908.s:9021: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 9 warnings, 0 secti=
on mismatches

Errors:
    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] undefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 9 warnings, 0 sec=
tion mismatches

Errors:
    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] undefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    /tmp/futex-21ae7e.s:9250: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:3668:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3656:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3423:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    fs/io_uring.c:3423:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3656:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3668:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    3 warnings generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings,=
 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warning=
s, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings,=
 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    /tmp/futex-c404b3.s:29274: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 6 warnings, 0 secti=
on mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-8fd8e5.s:9036: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 6 warnings, 0 sectio=
n mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 10 warnings,=
 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x39dc): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings=
, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3684): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section mi=
smatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    kernel/sched/fair.c:1524:20: warning: =E2=80=98test_idle_cores=E2=80=99=
 declared =E2=80=98static=E2=80=99 but never defined [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-9) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    kernel/sched/fair.c:1524:20: warning: =E2=80=98test_idle_cores=E2=80=99=
 declared =E2=80=98static=E2=80=99 but never defined [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    kernel/sched/fair.c:1524:20: warning: =E2=80=98test_idle_cores=E2=80=99=
 declared =E2=80=98static=E2=80=99 but never defined [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    kernel/sched/fair.c:1524:20: warning: =E2=80=98test_idle_cores=E2=80=99=
 declared =E2=80=98static=E2=80=99 but never defined [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 10 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:3668:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3656:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3423:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 6 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    /tmp/futex-b3d6d1.s:9057: Warning: source register same as write-back b=
ase
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 9 warnings, 0 sec=
tion mismatches

Errors:
    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] undefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    /tmp/futex-349b2c.s:9021: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 9 warnings, 0 secti=
on mismatches

Errors:
    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] undefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-3c822e.s:9022: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 FAIL, 14 errors, 17 warnings, =
0 section mismatches

Errors:
    sound/soc/codecs/wm9712.c:80:10: error: implicit declaration of functio=
n =E2=80=98regmap_ac97_default_volatile=E2=80=99 [-Werror=3Dimplicit-functi=
on-declaration]
    sound/soc/codecs/wm9712.c:84:21: error: variable =E2=80=98wm9712_regmap=
_config=E2=80=99 has initializer but incomplete type
    sound/soc/codecs/wm9712.c:85:3: error: =E2=80=98const struct regmap_con=
fig=E2=80=99 has no member named =E2=80=98reg_bits=E2=80=99
    sound/soc/codecs/wm9712.c:86:3: error: =E2=80=98const struct regmap_con=
fig=E2=80=99 has no member named =E2=80=98reg_stride=E2=80=99
    sound/soc/codecs/wm9712.c:87:3: error: =E2=80=98const struct regmap_con=
fig=E2=80=99 has no member named =E2=80=98val_bits=E2=80=99
    sound/soc/codecs/wm9712.c:88:3: error: =E2=80=98const struct regmap_con=
fig=E2=80=99 has no member named =E2=80=98max_register=E2=80=99
    sound/soc/codecs/wm9712.c:89:3: error: =E2=80=98const struct regmap_con=
fig=E2=80=99 has no member named =E2=80=98cache_type=E2=80=99
    sound/soc/codecs/wm9712.c:91:3: error: =E2=80=98const struct regmap_con=
fig=E2=80=99 has no member named =E2=80=98volatile_reg=E2=80=99
    sound/soc/codecs/wm9712.c:93:3: error: =E2=80=98const struct regmap_con=
fig=E2=80=99 has no member named =E2=80=98reg_defaults=E2=80=99
    sound/soc/codecs/wm9712.c:94:3: error: =E2=80=98const struct regmap_con=
fig=E2=80=99 has no member named =E2=80=98num_reg_defaults=E2=80=99
    sound/soc/codecs/wm9712.c:653:12: error: implicit declaration of functi=
on =E2=80=98regmap_init_ac97=E2=80=99; did you mean =E2=80=98memmap_init_zo=
ne=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    sound/soc/codecs/wm9712.c:662:2: error: implicit declaration of functio=
n =E2=80=98snd_soc_component_init_regmap=E2=80=99; did you mean =E2=80=98sn=
d_soc_component_trigger=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    sound/soc/codecs/wm9712.c:675:3: error: implicit declaration of functio=
n =E2=80=98snd_soc_component_exit_regmap=E2=80=99; did you mean =E2=80=98sn=
d_soc_component_trigger=E2=80=99? [-Werror=3Dimplicit-function-declaration]
    sound/soc/codecs/wm9712.c:84:35: error: storage size of =E2=80=98wm9712=
_regmap_config=E2=80=99 isn=E2=80=99t known

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    sound/soc/codecs/wm9712.c:85:14: warning: excess elements in struct ini=
tializer
    sound/soc/codecs/wm9712.c:86:16: warning: excess elements in struct ini=
tializer
    sound/soc/codecs/wm9712.c:87:14: warning: excess elements in struct ini=
tializer
    sound/soc/codecs/wm9712.c:88:18: warning: excess elements in struct ini=
tializer
    sound/soc/codecs/wm9712.c:89:16: warning: excess elements in struct ini=
tializer
    sound/soc/codecs/wm9712.c:91:18: warning: excess elements in struct ini=
tializer
    sound/soc/codecs/wm9712.c:93:18: warning: excess elements in struct ini=
tializer
    include/linux/kernel.h:47:25: warning: excess elements in struct initia=
lizer
    sound/soc/codecs/wm9712.c:653:10: warning: assignment to =E2=80=98struc=
t regmap *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer w=
ithout a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, clang-9) =E2=80=94 FAIL, 5 errors, 5 warnings, =
0 section mismatches

Errors:
    sound/soc/codecs/wm9712.c:80:10: error: implicit declaration of functio=
n 'regmap_ac97_default_volatile' [-Werror,-Wimplicit-function-declaration]
    sound/soc/codecs/wm9712.c:84:35: error: variable has incomplete type 'c=
onst struct regmap_config'
    sound/soc/codecs/wm9712.c:653:12: error: implicit declaration of functi=
on 'regmap_init_ac97' [-Werror,-Wimplicit-function-declaration]
    sound/soc/codecs/wm9712.c:662:2: error: implicit declaration of functio=
n 'snd_soc_component_init_regmap' [-Werror,-Wimplicit-function-declaration]
    sound/soc/codecs/wm9712.c:675:3: error: implicit declaration of functio=
n 'snd_soc_component_exit_regmap' [-Werror,-Wimplicit-function-declaration]

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    /tmp/futex-43a33b.s:9049: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    /tmp/futex-e189cb.s:9057: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 6 warnings, 0 s=
ection mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 6 warnings, 0 sectio=
n mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    /tmp/futex-b00935.s:9021: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    /tmp/futex-3fa3a4.s:9021: Warning: source register same as write-back b=
ase
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 7 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 5 wa=
rnings, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 30 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 30 warning=
s, 0 section mismatches

Warnings:
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 10 warnings, =
0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-f07161.s:9049: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 6 warnings, 0 secti=
on mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section=
 mismatches

Errors:
    arch/mips/include/asm/sn/addrs.h:58:44: error: left shift count >=3D wi=
dth of type [-Werror=3Dshift-count-overflow]
    arch/mips/include/asm/sn/addrs.h:58:44: error: left shift count >=3D wi=
dth of type [-Werror=3Dshift-count-overflow]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-24b847.s:9049: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    /tmp/futex-1a1c3f.s:9085: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 6 warnings, 0 s=
ection mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    /tmp/futex-06f9a5.s:9085: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 7 warnings, 0 section=
 mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-f45025.s:28918: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 6 warnings, 0 secti=
on mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-fc75d7.s:28918: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 6 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 6 warnings, 0 se=
ction mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    /tmp/futex-625e54.s:28918: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warning=
s, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warning=
s, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    {standard input}:141: Warning: macro instruction expanded into multiple=
 instructions
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings,=
 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 12 warning=
s, 0 section mismatches

Warnings:
    fs/io_uring.c:3423:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3656:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3668:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    3 warnings generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    drivers/firmware/efi/libstub/file.c:123:21: warning: stack frame size o=
f 1224 bytes in function 'handle_cmdline_files' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 10 warnings,=
 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:3668:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3656:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3423:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    /tmp/futex-122e27.s:29056: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:3668:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3656:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3423:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 9 warnings, 0 =
section mismatches

Warnings:
    /tmp/futex-413667.s:9080: Warning: source register same as write-back b=
ase
    fs/io_uring.c:3423:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3656:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3668:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    3 warnings generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 8 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    drivers/firmware/efi/libstub/file.c:123:21: warning: stack frame size o=
f 1232 bytes in function 'handle_cmdline_files' [-Wframe-larger-than=3D]
    1 warning generated.
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 9 warnings, 0 section mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 9 warnings, 0 section mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 9 =
warnings, 0 section mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 10 warn=
ings, 0 section mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    net/sched/cls_flower.c:331:1: warning: the frame size of 1032 bytes is =
larger than 1024 bytes [-Wframe-larger-than=3D]
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: Warni=
ng (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus unit =
address format error, expected "40000010"
    arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warning (=
i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C address m=
ust be less than 10-bits, got "0x40000010"

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    /tmp/futex-37dd1d.s:29243: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 7 warnings, 0 sec=
tion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 s=
ection mismatches

Warnings:
    /tmp/futex-51f850.s:9085: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 6 warnings, 0 se=
ction mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    /tmp/futex-3daf74.s:9057: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings=
, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    drivers/firmware/efi/libstub/file.c:123:21: warning: stack frame size o=
f 1232 bytes in function 'handle_cmdline_files' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:3668:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3656:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3423:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 7 warnings, 0 section=
 mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    /tmp/futex-167c46.s:9069: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings=
, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:3668:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3656:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3423:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:3423:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3656:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3668:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    3 warnings generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 6 warnings, 0 s=
ection mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    /tmp/futex-124f0c.s:28918: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 20 warnings, 0 section=
 mismatches

Errors:
    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9713.ko] undefined!
    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] undefined!
    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9705.ko] undefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9705
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9713
    WARNING: unmet direct dependencies detected for SND_SOC_WM9705
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9713
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 26 warnings, 0 sectio=
n mismatches

Errors:
    drivers/usb/gadget/udc/pxa25x_udc.c:2328:11: error: invalid % escape in=
 inline assembly string

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9705
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9713
    WARNING: unmet direct dependencies detected for SND_SOC_WM9705
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9713
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 5 warnings, 0 section =
mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, clang-9) =E2=80=94 FAIL, 5 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    /tmp/elf-ecb937.s:49: Error: selected processor does not support `ldrh =
r2,[r0,#18]' in ARM mode
    clang: error: assembler command failed with exit code 1 (use -v to see =
invocation)
    /tmp/main-f1ea14.s:1466: Error: selected processor does not support `ld=
rh r0,[r0]' in ARM mode
    /tmp/main-f1ea14.s:1469: Error: selected processor does not support `st=
rh r0,[r1]' in ARM mode
    clang: error: assembler command failed with exit code 1 (use -v to see =
invocation)

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 13 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 7 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-d40907.s:29056: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 8 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3423:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3656:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3668:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    3 warnings generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:3668:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3656:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3423:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-1871d3.s:9085: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 7 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 7 warnings, 0 secti=
on mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    /tmp/futex-3c488c.s:28617: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 5 warnings, 0 sec=
tion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    /tmp/futex-e5d719.s:28617: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 5 warnings, 0 sec=
tion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 6 warnings, 0 sectio=
n mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:3668:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3656:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3423:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:3423:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3656:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3668:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    3 warnings generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 5 warnings, 0 s=
ection mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7965=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_7966=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    /tmp/futex-c7a797.s:9064: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 10 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    .config:1165:warning: override: UNWINDER_GUESS changes choice state
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    arch/riscv/kernel/stacktrace.c:78:8: error: =E2=80=98sp_in_global=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98spin_loc=
k=E2=80=99?

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:3423:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3656:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3668:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    3 warnings generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:3668:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3656:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3423:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    /tmp/futex-4e57bd.s:9049: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 14 warnings, 0 sec=
tion mismatches

Errors:
    drivers/clocksource/timer-vf-pit.c:194: error: unterminated argument li=
st invoking macro "BUG_ON"
    drivers/clocksource/timer-vf-pit.c:131:2: error: =E2=80=98BUG_ON=E2=80=
=99 undeclared (first use in this function)
    drivers/clocksource/timer-vf-pit.c:131:8: error: expected =E2=80=98;=E2=
=80=99 at end of input
    drivers/clocksource/timer-vf-pit.c:131:2: error: expected declaration o=
r statement at end of input

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    drivers/clocksource/timer-vf-pit.c:131:2: warning: no return statement =
in function returning non-void [-Wreturn-type]
    drivers/clocksource/timer-vf-pit.c:126:19: warning: =E2=80=98pit_clocke=
vent_init=E2=80=99 defined but not used [-Wunused-function]
    drivers/clocksource/timer-vf-pit.c:117:34: warning: =E2=80=98clockevent=
_pit=E2=80=99 defined but not used [-Wunused-variable]
    drivers/clocksource/timer-vf-pit.c:97:20: warning: =E2=80=98pit_timer_i=
nterrupt=E2=80=99 defined but not used [-Wunused-function]
    drivers/clocksource/timer-vf-pit.c:56:19: warning: =E2=80=98pit_clockso=
urce_init=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:3668:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3656:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3423:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, clang-9) =E2=80=94 FAIL, 2 errors, 8 warnings, 0 se=
ction mismatches

Errors:
    drivers/clocksource/timer-vf-pit.c:131:2: error: unterminated function-=
like macro invocation
    drivers/clocksource/timer-vf-pit.c:194:58: error: expected '}'

Warnings:
    fs/io_uring.c:3423:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3656:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3668:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    3 warnings generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sect=
ion mismatches

Warnings:
    /tmp/futex-09299f.s:9033: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings,=
 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0=
 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-9) =E2=80=94 PASS, 0 errors, 54 warnings, 0=
 section mismatches

Warnings:
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 27 war=
nings, 0 section mismatches

Warnings:
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, clang-9) =E2=80=94 FAIL, 0 errors, 0 wa=
rnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 27 war=
nings, 0 section mismatches

Warnings:
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    /tmp/futex-625020.s:8999: Warning: source register same as write-back b=
ase
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    include/linux/thermal.h:382:12: warning: =E2=80=98thermal_zone_of_get_s=
ensor_id=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    /tmp/futex-da24b2.s:9049: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.
    include/linux/thermal.h:382:12: warning: unused function 'thermal_zone_=
of_get_sensor_id' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:3423:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3656:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3668:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    3 warnings generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section m=
ismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:1651:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2209:27: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:2216:17: warning: cast from pointer to integer of differe=
nt size [-Wpointer-to-int-cast]
    fs/io_uring.c:4897:10: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    fs/io_uring.c:3668:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3656:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3423:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]

---
For more info write to <info@kernelci.org>
