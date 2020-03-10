Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECB817F667
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 12:36:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgCJLg6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 07:36:58 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43910 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgCJLg6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2020 07:36:58 -0400
Received: by mail-pf1-f195.google.com with SMTP id c144so6335767pfb.10
        for <linux-next@vger.kernel.org>; Tue, 10 Mar 2020 04:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=mAQ9FFnw3w+pybaR2vQ5J9jxZ3wMurKQ3K/JuBvYoNY=;
        b=bH9os45DAX1RPkyc0iSmmTAsREav74jwivrbLGH9AHq5G5dY49BC7Y4zGSXCtebh/B
         QH3JIliIr3A0E0e/gp4+WLD6tbxbuCkxPEhWVKqHGe5zTYYj50xnYYP0SZDbZlnKSmxg
         2pw8JjIwk565xZ15kHRiI0r2pf21S5fE+EM6KCE+zjyZ7w1sPHoX3plh45fXBirMXv1m
         yxjP/jPIzM8dqOvaIurV9VS/jNLSBEYO5IMdNf3VQqCGyjEJxJ2Xw38V0B5Dp6IORuTy
         uibsFLNm5vmZh16AIa6j49YmFPhXbFE/KEFOWknKGZiwyBnN61S1XG4tFq41BwdxsjiI
         iU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=mAQ9FFnw3w+pybaR2vQ5J9jxZ3wMurKQ3K/JuBvYoNY=;
        b=kJuxIkLAcPUDfuAQoJgjosLuwT8tCQ9P8Kq8V61nMauf8aHVXvjpYP5vXfMpKIJHrY
         ZkKaxmljf7b/U/d1jhdBvUyjRz234aQgEZ30RD94FR9LrDwjKvqJQdlxxvi1hDprNUvB
         7P4i/Bvm9BKbdDRp8sH7RezupWQr7ETneoYr0BVcx7EuMEzasvIRPbE91lkUrDtCX2wU
         NPFXKhZyLDzH3he5w18l2OCW0wBGfcSnSw4tklwr0kv87siyyEmCw6p4OahuYxoFvgvX
         lysDVO1GvlpqHDDOUC8dcxJomjccU+ympqVbwiKe4kNK7Tnkx1OnTcUBYMxNIAhsl+LL
         nf4g==
X-Gm-Message-State: ANhLgQ38QNF+NgThCMJF+vcvN/PH665UnJB+iZFCJuthb0+ACarzMC1k
        bVz9Tbz/7wccBiMSWDV3ibNPSAZjD6I=
X-Google-Smtp-Source: ADFU+vsNqBfCHRgdrFpavANLuRD/t1twfMetcKihRI8KLqfvam9+JBvL7g0Set7wNWII3loMVFqrzQ==
X-Received: by 2002:a63:af52:: with SMTP id s18mr20973446pgo.281.1583840210018;
        Tue, 10 Mar 2020 04:36:50 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id mp23sm2190384pjb.42.2020.03.10.04.36.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 04:36:48 -0700 (PDT)
Message-ID: <5e677bd0.1c69fb81.c43fe.7f7d@mx.google.com>
Date:   Tue, 10 Mar 2020 04:36:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200310
X-Kernelci-Report-Type: build
Subject: next/master build: 329 builds: 25 failed, 304 passed, 65 errors,
 1359 warnings (next-20200310)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 329 builds: 25 failed, 304 passed, 65 errors, 1359 warni=
ngs (next-20200310)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200310/

Tree: next
Branch: master
Git Describe: next-20200310
Git Commit: 134546626849cd6852d6d4bf8f207b5fbc54261b
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-9) FAIL
    defconfig: (clang-9) FAIL
    allmodconfig: (gcc-8) FAIL
    defconfig: (gcc-8) FAIL
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy: (gcc-8) FAIL
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy: (gcc-8) FAIL
    defconfig+kselftest: (gcc-8) FAIL

arm:
    allmodconfig: (clang-9) FAIL
    cm_x300_defconfig: (clang-9) FAIL
    em_x270_defconfig: (clang-9) FAIL
    eseries_pxa_defconfig: (clang-9) FAIL
    pxa_defconfig: (clang-9) FAIL
    rpc_defconfig: (clang-9) FAIL
    vf610m4_defconfig: (clang-9) FAIL
    allmodconfig: (gcc-8) FAIL
    cm_x300_defconfig: (gcc-8) FAIL
    em_x270_defconfig: (gcc-8) FAIL
    eseries_pxa_defconfig: (gcc-8) FAIL
    pxa_defconfig: (gcc-8) FAIL
    vf610m4_defconfig: (gcc-8) FAIL

mips:
    ip27_defconfig: (gcc-8) FAIL
    mtx1_defconfig: (gcc-8) FAIL

riscv:
    allnoconfig: (gcc-8) FAIL
    tinyconfig: (gcc-8) FAIL

x86_64:
    x86_64_defconfig+kvm_guest: (clang-9) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 2 warnings
    axs103_defconfig (gcc-8): 1 warning
    axs103_smp_defconfig (gcc-8): 1 warning
    haps_hs_defconfig (gcc-8): 1 warning
    haps_hs_smp_defconfig (gcc-8): 1 warning
    haps_hs_smp_defconfig (gcc-8): 1 warning
    hsdk_defconfig (gcc-8): 1 warning
    nsimosci_hs_defconfig (gcc-8): 1 warning
    nsimosci_hs_smp_defconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (gcc-8): 4 errors, 5 warnings
    allmodconfig (clang-9): 1 error, 5 warnings
    allnoconfig (gcc-8): 3 warnings
    defconfig (gcc-8): 3 errors, 2 warnings
    defconfig (clang-9): 3 errors, 5 warnings
    defconfig (gcc-8): 3 errors, 2 warnings
    defconfig (gcc-8): 3 errors, 2 warnings
    defconfig (gcc-8): 3 errors, 2 warnings
    tinyconfig (gcc-8): 2 warnings

arm:
    allmodconfig (gcc-8): 1 error, 20 warnings
    allmodconfig (clang-9): 1 error, 30 warnings
    allnoconfig (gcc-8): 2 warnings
    am200epdkit_defconfig (gcc-8): 2 warnings
    am200epdkit_defconfig (clang-9): 7 warnings
    aspeed_g4_defconfig (gcc-8): 6 warnings
    aspeed_g4_defconfig (clang-9): 10 warnings
    aspeed_g5_defconfig (clang-9): 9 warnings
    aspeed_g5_defconfig (gcc-8): 6 warnings
    assabet_defconfig (gcc-8): 2 warnings
    assabet_defconfig (clang-9): 6 warnings
    at91_dt_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (clang-9): 5 warnings
    axm55xx_defconfig (clang-9): 7 warnings
    axm55xx_defconfig (gcc-8): 2 warnings
    badge4_defconfig (clang-9): 6 warnings
    badge4_defconfig (gcc-8): 2 warnings
    bcm2835_defconfig (clang-9): 5 warnings
    bcm2835_defconfig (gcc-8): 1 warning
    cerfcube_defconfig (gcc-8): 2 warnings
    cerfcube_defconfig (clang-9): 6 warnings
    clps711x_defconfig (clang-9): 5 warnings
    clps711x_defconfig (gcc-8): 2 warnings
    cm_x2xx_defconfig (gcc-8): 2 warnings
    cm_x2xx_defconfig (clang-9): 6 warnings
    cm_x300_defconfig (clang-9): 1 error, 8 warnings
    cm_x300_defconfig (gcc-8): 1 error, 4 warnings
    cns3420vb_defconfig (gcc-8): 2 warnings
    cns3420vb_defconfig (clang-9): 5 warnings
    colibri_pxa270_defconfig (gcc-8): 2 warnings
    colibri_pxa270_defconfig (clang-9): 7 warnings
    colibri_pxa300_defconfig (gcc-8): 2 warnings
    colibri_pxa300_defconfig (clang-9): 6 warnings
    collie_defconfig (clang-9): 6 warnings
    collie_defconfig (gcc-8): 2 warnings
    corgi_defconfig (clang-9): 7 warnings
    corgi_defconfig (gcc-8): 2 warnings
    davinci_all_defconfig (clang-9): 7 warnings
    davinci_all_defconfig (gcc-8): 2 warnings
    dove_defconfig (gcc-8): 2 warnings
    dove_defconfig (clang-9): 5 warnings
    ebsa110_defconfig (gcc-8): 2 warnings
    ebsa110_defconfig (clang-9): 6 warnings
    efm32_defconfig (clang-9): 7 warnings
    efm32_defconfig (gcc-8): 1 warning
    em_x270_defconfig (gcc-8): 1 error, 4 warnings
    em_x270_defconfig (clang-9): 1 error, 8 warnings
    ep93xx_defconfig (clang-9): 6 warnings
    ep93xx_defconfig (gcc-8): 2 warnings
    eseries_pxa_defconfig (gcc-8): 14 errors, 14 warnings
    eseries_pxa_defconfig (clang-9): 5 errors, 8 warnings
    exynos_defconfig (gcc-8): 2 warnings
    exynos_defconfig (clang-9): 7 warnings
    ezx_defconfig (gcc-8): 2 warnings
    ezx_defconfig (clang-9): 7 warnings
    footbridge_defconfig (gcc-8): 2 warnings
    footbridge_defconfig (clang-9): 6 warnings
    gemini_defconfig (clang-9): 7 warnings
    gemini_defconfig (gcc-8): 2 warnings
    h3600_defconfig (clang-9): 7 warnings
    h3600_defconfig (gcc-8): 2 warnings
    h5000_defconfig (gcc-8): 2 warnings
    h5000_defconfig (clang-9): 6 warnings
    hackkit_defconfig (clang-9): 6 warnings
    hackkit_defconfig (gcc-8): 2 warnings
    hisi_defconfig (clang-9): 7 warnings
    hisi_defconfig (gcc-8): 2 warnings
    imote2_defconfig (gcc-8): 2 warnings
    imote2_defconfig (clang-9): 7 warnings
    imx_v4_v5_defconfig (clang-9): 7 warnings
    imx_v4_v5_defconfig (gcc-8): 2 warnings
    imx_v6_v7_defconfig (gcc-8): 2 warnings
    imx_v6_v7_defconfig (clang-9): 5 warnings
    integrator_defconfig (clang-9): 7 warnings
    integrator_defconfig (gcc-8): 2 warnings
    iop32x_defconfig (gcc-8): 2 warnings
    iop32x_defconfig (clang-9): 6 warnings
    ixp4xx_defconfig (gcc-8): 2 warnings
    ixp4xx_defconfig (clang-9): 6 warnings
    jornada720_defconfig (gcc-8): 2 warnings
    jornada720_defconfig (clang-9): 6 warnings
    keystone_defconfig (gcc-8): 2 warnings
    keystone_defconfig (clang-9): 7 warnings
    lart_defconfig (clang-9): 6 warnings
    lart_defconfig (gcc-8): 2 warnings
    lpc18xx_defconfig (clang-9): 7 warnings
    lpc18xx_defconfig (gcc-8): 1 warning
    lpc32xx_defconfig (clang-9): 7 warnings
    lpc32xx_defconfig (gcc-8): 1 warning
    lpd270_defconfig (clang-9): 6 warnings
    lpd270_defconfig (gcc-8): 2 warnings
    lubbock_defconfig (clang-9): 6 warnings
    lubbock_defconfig (gcc-8): 2 warnings
    magician_defconfig (gcc-8): 2 warnings
    magician_defconfig (clang-9): 7 warnings
    mainstone_defconfig (gcc-8): 2 warnings
    mainstone_defconfig (clang-9): 6 warnings
    milbeaut_m10v_defconfig (gcc-8): 2 warnings
    milbeaut_m10v_defconfig (clang-9): 7 warnings
    mini2440_defconfig (gcc-8): 2 warnings
    mini2440_defconfig (clang-9): 6 warnings
    mmp2_defconfig (clang-9): 7 warnings
    mmp2_defconfig (gcc-8): 2 warnings
    moxart_defconfig (clang-9): 7 warnings
    moxart_defconfig (gcc-8): 2 warnings
    mps2_defconfig (gcc-8): 1 warning
    mps2_defconfig (clang-9): 5 warnings
    multi_v4t_defconfig (gcc-8): 2 warnings
    multi_v4t_defconfig (clang-9): 6 warnings
    multi_v5_defconfig (gcc-8): 6 warnings
    multi_v5_defconfig (clang-9): 11 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (clang-9): 11 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 7 warnings
    mv78xx0_defconfig (gcc-8): 2 warnings
    mv78xx0_defconfig (clang-9): 7 warnings
    mvebu_v5_defconfig (clang-9): 7 warnings
    mvebu_v5_defconfig (gcc-8): 2 warnings
    mvebu_v7_defconfig (clang-9): 5 warnings
    mvebu_v7_defconfig (gcc-8): 2 warnings
    mxs_defconfig (clang-9): 6 warnings
    mxs_defconfig (gcc-8): 2 warnings
    neponset_defconfig (gcc-8): 2 warnings
    neponset_defconfig (clang-9): 6 warnings
    netwinder_defconfig (clang-9): 6 warnings
    netwinder_defconfig (gcc-8): 2 warnings
    nhk8815_defconfig (clang-9): 7 warnings
    nhk8815_defconfig (gcc-8): 2 warnings
    omap1_defconfig (clang-9): 10 warnings
    omap1_defconfig (gcc-8): 2 warnings
    omap2plus_defconfig (gcc-8): 2 warnings
    omap2plus_defconfig (clang-9): 5 warnings
    orion5x_defconfig (clang-9): 7 warnings
    orion5x_defconfig (gcc-8): 2 warnings
    oxnas_v6_defconfig (clang-9): 7 warnings
    oxnas_v6_defconfig (gcc-8): 2 warnings
    palmz72_defconfig (clang-9): 7 warnings
    palmz72_defconfig (gcc-8): 2 warnings
    pcm027_defconfig (clang-9): 7 warnings
    pcm027_defconfig (gcc-8): 2 warnings
    pleb_defconfig (clang-9): 6 warnings
    pleb_defconfig (gcc-8): 2 warnings
    prima2_defconfig (clang-9): 7 warnings
    prima2_defconfig (gcc-8): 2 warnings
    pxa168_defconfig (gcc-8): 2 warnings
    pxa168_defconfig (clang-9): 7 warnings
    pxa255-idp_defconfig (clang-9): 6 warnings
    pxa255-idp_defconfig (gcc-8): 2 warnings
    pxa3xx_defconfig (gcc-8): 2 warnings
    pxa3xx_defconfig (clang-9): 7 warnings
    pxa910_defconfig (clang-9): 7 warnings
    pxa910_defconfig (gcc-8): 2 warnings
    pxa_defconfig (gcc-8): 3 errors, 8 warnings
    pxa_defconfig (clang-9): 1 error, 13 warnings
    qcom_defconfig (gcc-8): 2 warnings
    qcom_defconfig (clang-9): 7 warnings
    realview_defconfig (gcc-8): 2 warnings
    realview_defconfig (clang-9): 5 warnings
    rpc_defconfig (gcc-8): 2 warnings
    rpc_defconfig (clang-9): 5 errors
    s3c2410_defconfig (gcc-8): 2 warnings
    s3c2410_defconfig (clang-9): 6 warnings
    s3c6400_defconfig (gcc-8): 2 warnings
    s3c6400_defconfig (clang-9): 5 warnings
    s5pv210_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (clang-9): 7 warnings
    sama5_defconfig (gcc-8): 2 warnings
    sama5_defconfig (clang-9): 5 warnings
    shannon_defconfig (gcc-8): 2 warnings
    shannon_defconfig (clang-9): 6 warnings
    shmobile_defconfig (clang-9): 5 warnings
    shmobile_defconfig (gcc-8): 1 warning
    simpad_defconfig (gcc-8): 2 warnings
    simpad_defconfig (clang-9): 7 warnings
    socfpga_defconfig (clang-9): 5 warnings
    socfpga_defconfig (gcc-8): 2 warnings
    spear13xx_defconfig (gcc-8): 2 warnings
    spear13xx_defconfig (clang-9): 5 warnings
    spear3xx_defconfig (gcc-8): 2 warnings
    spear3xx_defconfig (clang-9): 6 warnings
    spear6xx_defconfig (clang-9): 6 warnings
    spear6xx_defconfig (gcc-8): 2 warnings
    spitz_defconfig (clang-9): 7 warnings
    spitz_defconfig (gcc-8): 2 warnings
    stm32_defconfig (clang-9): 7 warnings
    stm32_defconfig (gcc-8): 1 warning
    sunxi_defconfig (gcc-8): 2 warnings
    sunxi_defconfig (clang-9): 5 warnings
    tango4_defconfig (clang-9): 7 warnings
    tango4_defconfig (gcc-8): 2 warnings
    tct_hammer_defconfig (gcc-8): 2 warnings
    tct_hammer_defconfig (clang-9): 6 warnings
    tegra_defconfig (gcc-8): 2 warnings
    tegra_defconfig (clang-9): 7 warnings
    tinyconfig (gcc-8): 1 warning
    trizeps4_defconfig (gcc-8): 2 warnings
    trizeps4_defconfig (clang-9): 7 warnings
    u300_defconfig (gcc-8): 2 warnings
    u300_defconfig (clang-9): 7 warnings
    u8500_defconfig (clang-9): 5 warnings
    u8500_defconfig (gcc-8): 2 warnings
    versatile_defconfig (clang-9): 6 warnings
    versatile_defconfig (gcc-8): 2 warnings
    vexpress_defconfig (gcc-8): 2 warnings
    vexpress_defconfig (clang-9): 5 warnings
    vf610m4_defconfig (gcc-8): 4 errors, 7 warnings
    vf610m4_defconfig (clang-9): 2 errors, 5 warnings
    viper_defconfig (gcc-8): 2 warnings
    viper_defconfig (clang-9): 6 warnings
    vt8500_v6_v7_defconfig (gcc-8): 2 warnings
    vt8500_v6_v7_defconfig (clang-9): 5 warnings
    xcep_defconfig (clang-9): 6 warnings
    xcep_defconfig (gcc-8): 2 warnings
    zeus_defconfig (clang-9): 6 warnings
    zeus_defconfig (gcc-8): 2 warnings
    zx_defconfig (clang-9): 7 warnings
    zx_defconfig (gcc-8): 2 warnings

i386:
    allnoconfig (gcc-8): 2 warnings
    i386_defconfig (gcc-8): 2 warnings
    i386_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning

mips:
    32r2el_defconfig (gcc-8): 5 warnings
    32r2el_defconfig (gcc-8): 7 warnings
    allnoconfig (gcc-8): 3 warnings
    ar7_defconfig (gcc-8): 4 warnings
    ath25_defconfig (gcc-8): 3 warnings
    ath79_defconfig (gcc-8): 4 warnings
    bcm47xx_defconfig (gcc-8): 3 warnings
    bcm63xx_defconfig (gcc-8): 3 warnings
    bigsur_defconfig (gcc-8): 4 warnings
    bmips_be_defconfig (gcc-8): 3 warnings
    bmips_stb_defconfig (gcc-8): 3 warnings
    capcella_defconfig (gcc-8): 4 warnings
    cavium_octeon_defconfig (gcc-8): 4 warnings
    ci20_defconfig (gcc-8): 2 warnings
    cobalt_defconfig (gcc-8): 4 warnings
    cu1000-neo_defconfig (gcc-8): 2 warnings
    db1xxx_defconfig (gcc-8): 3 warnings
    decstation_64_defconfig (gcc-8): 4 warnings
    decstation_defconfig (gcc-8): 4 warnings
    decstation_r4k_defconfig (gcc-8): 4 warnings
    e55_defconfig (gcc-8): 4 warnings
    fuloong2e_defconfig (gcc-8): 4 warnings
    gcw0_defconfig (gcc-8): 3 warnings
    gpr_defconfig (gcc-8): 4 warnings
    ip22_defconfig (gcc-8): 4 warnings
    ip27_defconfig (gcc-8): 2 errors, 3 warnings
    ip28_defconfig (gcc-8): 4 warnings
    ip32_defconfig (gcc-8): 4 warnings
    jazz_defconfig (gcc-8): 4 warnings
    jmr3927_defconfig (gcc-8): 3 warnings
    lasat_defconfig (gcc-8): 3 warnings
    lemote2f_defconfig (gcc-8): 4 warnings
    loongson1b_defconfig (gcc-8): 3 warnings
    loongson1c_defconfig (gcc-8): 3 warnings
    loongson3_defconfig (gcc-8): 3 warnings
    malta_defconfig (gcc-8): 4 warnings
    malta_kvm_defconfig (gcc-8): 4 warnings
    malta_kvm_guest_defconfig (gcc-8): 4 warnings
    malta_qemu_32r6_defconfig (gcc-8): 5 warnings
    maltaaprp_defconfig (gcc-8): 4 warnings
    maltasmvp_defconfig (gcc-8): 4 warnings
    maltasmvp_eva_defconfig (gcc-8): 4 warnings
    maltaup_defconfig (gcc-8): 4 warnings
    maltaup_xpa_defconfig (gcc-8): 4 warnings
    markeins_defconfig (gcc-8): 4 warnings
    mips_paravirt_defconfig (gcc-8): 4 warnings
    mpc30x_defconfig (gcc-8): 4 warnings
    msp71xx_defconfig (gcc-8): 4 warnings
    mtx1_defconfig (gcc-8): 1 error, 3 warnings
    nlm_xlp_defconfig (gcc-8): 4 warnings
    nlm_xlr_defconfig (gcc-8): 4 warnings
    omega2p_defconfig (gcc-8): 2 warnings
    pic32mzda_defconfig (gcc-8): 3 warnings
    pistachio_defconfig (gcc-8): 3 warnings
    pnx8335_stb225_defconfig (gcc-8): 4 warnings
    qi_lb60_defconfig (gcc-8): 4 warnings
    rb532_defconfig (gcc-8): 4 warnings
    rbtx49xx_defconfig (gcc-8): 4 warnings
    rm200_defconfig (gcc-8): 4 warnings
    rt305x_defconfig (gcc-8): 3 warnings
    sb1250_swarm_defconfig (gcc-8): 4 warnings
    tb0219_defconfig (gcc-8): 4 warnings
    tb0226_defconfig (gcc-8): 4 warnings
    tb0287_defconfig (gcc-8): 4 warnings
    tinyconfig (gcc-8): 2 warnings
    vocore2_defconfig (gcc-8): 2 warnings
    workpad_defconfig (gcc-8): 4 warnings
    xway_defconfig (gcc-8): 3 warnings

riscv:
    allnoconfig (gcc-8): 1 error, 1 warning
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 2 warnings
    nommu_virt_defconfig (gcc-8): 1 warning
    rv32_defconfig (gcc-8): 8 warnings
    tinyconfig (gcc-8): 1 error

x86_64:
    allmodconfig (clang-9): 17 warnings
    allmodconfig (gcc-8): 6 warnings
    allnoconfig (clang-9): 5 warnings
    allnoconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 2 warnings
    x86_64_defconfig (gcc-8): 1 warning
    x86_64_defconfig (clang-9): 3 warnings
    x86_64_defconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 1 warning

Errors summary:

    5    include/linux/compiler.h:394:38: error: call to =E2=80=98__compile=
time_assert_223=E2=80=99 declared with attribute error: BUILD_BUG_ON failed=
: GSI_RING_ELEMENT_SIZE > field_max(EV_ELEMENT_SIZE_FMASK)
    5    include/linux/compiler.h:394:38: error: call to =E2=80=98__compile=
time_assert_220=E2=80=99 declared with attribute error: BUILD_BUG_ON failed=
: GSI_RING_ELEMENT_SIZE > field_max(ELEMENT_SIZE_FMASK)
    5    drivers/net/ipa/gsi.c:220:39: error: implicit declaration of funct=
ion =E2=80=98field_max=E2=80=99; did you mean =E2=80=98field_mask=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
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
    1    drivers/remoteproc/mtk_scp.c:364:14: error: initialization of =E2=
=80=98void * (*)(struct rproc *, u64,  size_t)=E2=80=99 {aka =E2=80=98void =
* (*)(struct rproc *, long long unsigned int,  unsigned int)=E2=80=99} from=
 incompatible pointer type =E2=80=98void * (*)(struct rproc *, u64,  int)=
=E2=80=99 {aka =E2=80=98void * (*)(struct rproc *, long long unsigned int, =
 int)=E2=80=99} [-Werror=3Dincompatible-pointer-types]
    1    drivers/remoteproc/mtk_scp.c:364:14: error: initialization of =E2=
=80=98void * (*)(struct rproc *, u64,  size_t)=E2=80=99 {aka =E2=80=98void =
* (*)(struct rproc *, long long unsigned int,  long unsigned int)=E2=80=99}=
 from incompatible pointer type =E2=80=98void * (*)(struct rproc *, u64,  i=
nt)=E2=80=99 {aka =E2=80=98void * (*)(struct rproc *, long long unsigned in=
t,  int)=E2=80=99} [-Werror=3Dincompatible-pointer-types]
    1    drivers/remoteproc/mtk_scp.c:364:14: error: incompatible pointer t=
ypes initializing 'void *(*)(struct rproc *, u64, size_t)' (aka 'void *(*)(=
struct rproc *, unsigned long long, unsigned int)') with an expression of t=
ype 'void *(struct rproc *, u64, int)' (aka 'void *(struct rproc *, unsigne=
d long long, int)') [-Werror,-Wincompatible-pointer-types]
    1    drivers/net/ipa/gsi.c:710:16: error: implicit declaration of funct=
ion 'field_max' [-Werror,-Wimplicit-function-declaration]
    1    drivers/net/ipa/gsi.c:223:39: error: implicit declaration of funct=
ion 'field_max' [-Werror,-Wimplicit-function-declaration]
    1    drivers/net/ipa/gsi.c:220:39: error: implicit declaration of funct=
ion 'field_max' [-Werror,-Wimplicit-function-declaration]
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
    1    arch/arm64/kernel/entry-ftrace.S:282:34: error: too few arguments =
provided to function-like macro invocation
    1    ERROR: "sysrq_mask" [drivers/tty/serial/serial_core.ko] undefined!
    1    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9713.ko] undef=
ined!
    1    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9705.ko] undef=
ined!
    1    /tmp/main-cdfa58.s:1470: Error: selected processor does not suppor=
t `strh r0,[r1]' in ARM mode
    1    /tmp/main-cdfa58.s:1467: Error: selected processor does not suppor=
t `ldrh r0,[r0]' in ARM mode
    1    /tmp/elf-4a631c.s:49: Error: selected processor does not support `=
ldrh r2,[r0,#18]' in ARM mode

Warnings summary:

    274  1 warning generated.
    204  drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_se=
condary=E2=80=99 defined but not used [-Wunused-function]
    153  include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be=
 used uninitialized in this function [-Wmaybe-uninitialized]
    123  <stdin>:1520:2: warning: #warning syscall process_madvise not impl=
emented [-Wcpp]
    111  kernel/pid.c:180:18: warning: variable 'retval' is uninitialized w=
hen used here [-Wuninitialized]
    111  kernel/pid.c:165:12: note: initialize the variable 'retval' to sil=
ence this warning
    107  drivers/char/random.c:820:13: warning: unused function 'crng_initi=
alize_secondary' [-Wunused-function]
    47   kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_ta=
sks_gp_func_t' is a C11 feature [-Wtypedef-redefinition]
    26   kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    16   WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    12   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warn=
ing (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C addr=
ess must be less than 10-bits, got "0x40000010"
    12   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: =
Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus =
unit address format error, expected "40000010"
    12   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warn=
ing (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C addr=
ess must be less than 10-bits, got "0x40000010"
    12   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: =
Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus =
unit address format error, expected "40000010"
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    8    cc1: some warnings being treated as errors
    5    WARNING: "rcu_tasks_rude_wait_gp" [vmlinux] is a static EXPORT_SYM=
BOL_GPL
    4    warning: same module names found:
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    4    WARNING: unmet direct dependencies detected for SND_SOC_WM9713
    4    WARNING: unmet direct dependencies detected for SND_SOC_WM9705
    2    include/linux/string.h:441:9: warning: =E2=80=98__builtin_memmove=
=E2=80=99 pointer overflow between offset 0 and size [-2, 92233720368547758=
07] [-Warray-bounds]
    2    drivers/net/wireless/ath/ath11k/debugfs_sta.c:185:7: warning: vari=
able 'rate_idx' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    2    drivers/net/wireless/ath/ath11k/debugfs_sta.c:184:13: warning: var=
iable 'rate_idx' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    2    drivers/net/wireless/ath/ath11k/debugfs_sta.c:175:7: warning: vari=
able 'rate_idx' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    2    drivers/net/wireless/ath/ath11k/debugfs_sta.c:139:13: note: initia=
lize the variable 'rate_idx' to silence this warning
    2    drivers/firmware/efi/libstub/file.c:123:21: warning: stack frame s=
ize of 1232 bytes in function 'handle_cmdline_files' [-Wframe-larger-than=
=3D]
    2    arch/arm64/kernel/cpu_errata.c:174:13: warning: =E2=80=98call_smc_=
arch_workaround_1=E2=80=99 defined but not used [-Wunused-function]
    2    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    3 warnings generated.
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
    1    security/integrity/ima/ima_crypto.c:512:5: warning: stack frame si=
ze of 1152 bytes in function 'ima_calc_field_array_hash' [-Wframe-larger-th=
an=3D]
    1    net/sched/cls_flower.c:331:1: warning: the frame size of 1032 byte=
s is larger than 1024 bytes [-Wframe-larger-than=3D]
    1    mm/kasan/common.o: warning: objtool: kasan_report()+0x25: call to =
report_enabled() with UACCESS enabled
    1    include/linux/kernel.h:47:25: warning: excess elements in struct i=
nitializer
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
    1    cc1: all warnings being treated as errors
    1    arch/x86/kernel/signal.o: warning: objtool: x32_setup_rt_frame()+0=
x1fa: call to memset() with UACCESS enabled
    1    arch/x86/kernel/signal.o: warning: objtool: __setup_rt_frame()+0x1=
f8: call to memset() with UACCESS enabled
    1    arch/arm/mach-omap1/pm.c:656:11: warning: variable 'irq' is used u=
ninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1    arch/arm/mach-omap1/pm.c:611:9: note: initialize the variable 'irq=
' to silence this warning
    1    2 warnings generated.
    1    /tmp/test-arm-40d27a.s:18788: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-40d27a.s:18713: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/futex-faea3f.s:7476: Warning: source register same as write-b=
ack base
    1    /tmp/futex-f80c9b.s:7483: Warning: source register same as write-b=
ack base
    1    /tmp/futex-f42665.s:22847: Warning: source register same as write-=
back base
    1    /tmp/futex-f2db3e.s:7457: Warning: source register same as write-b=
ack base
    1    /tmp/futex-e64e54.s:22753: Warning: source register same as write-=
back base
    1    /tmp/futex-e37d52.s:23351: Warning: source register same as write-=
back base
    1    /tmp/futex-e01752.s:7476: Warning: source register same as write-b=
ack base
    1    /tmp/futex-de3627.s:7513: Warning: source register same as write-b=
ack base
    1    /tmp/futex-dcfe61.s:7476: Warning: source register same as write-b=
ack base
    1    /tmp/futex-d5572e.s:7563: Warning: source register same as write-b=
ack base
    1    /tmp/futex-d19eaf.s:22732: Warning: source register same as write-=
back base
    1    /tmp/futex-cbc525.s:7448: Warning: source register same as write-b=
ack base
    1    /tmp/futex-a9e39a.s:22554: Warning: source register same as write-=
back base
    1    /tmp/futex-a51627.s:22554: Warning: source register same as write-=
back base
    1    /tmp/futex-9ff5e8.s:7535: Warning: source register same as write-b=
ack base
    1    /tmp/futex-9dcd5d.s:7476: Warning: source register same as write-b=
ack base
    1    /tmp/futex-9c38d4.s:7456: Warning: source register same as write-b=
ack base
    1    /tmp/futex-921080.s:7563: Warning: source register same as write-b=
ack base
    1    /tmp/futex-8ddbb6.s:7634: Warning: source register same as write-b=
ack base
    1    /tmp/futex-85b5a9.s:7547: Warning: source register same as write-b=
ack base
    1    /tmp/futex-70df23.s:7535: Warning: source register same as write-b=
ack base
    1    /tmp/futex-6c9fdf.s:7563: Warning: source register same as write-b=
ack base
    1    /tmp/futex-681cba.s:7448: Warning: source register same as write-b=
ack base
    1    /tmp/futex-6677dd.s:7563: Warning: source register same as write-b=
ack base
    1    /tmp/futex-633f78.s:22847: Warning: source register same as write-=
back base
    1    /tmp/futex-61b327.s:22811: Warning: source register same as write-=
back base
    1    /tmp/futex-517c3b.s:22494: Warning: source register same as write-=
back base
    1    /tmp/futex-4bc0c5.s:7426: Warning: source register same as write-b=
ack base
    1    /tmp/futex-498eb7.s:7563: Warning: source register same as write-b=
ack base
    1    /tmp/futex-485bec.s:7460: Warning: source register same as write-b=
ack base
    1    /tmp/futex-3b2318.s:7542: Warning: source register same as write-b=
ack base
    1    /tmp/futex-34cfaa.s:22753: Warning: source register same as write-=
back base
    1    /tmp/futex-321ad1.s:7563: Warning: source register same as write-b=
ack base
    1    /tmp/futex-1abb50.s:7448: Warning: source register same as write-b=
ack base
    1    /tmp/futex-16ce13.s:22554: Warning: source register same as write-=
back base
    1    /tmp/futex-0f717b.s:22554: Warning: source register same as write-=
back base
    1    /tmp/futex-0b4398.s:7558: Warning: source register same as write-b=
ack base
    1    /tmp/futex-095a06.s:7535: Warning: source register same as write-b=
ack base
    1    /tmp/ccPbLjgQ.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccPbLjgQ.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .mm/kasan/common.o: warning: objtool: kasan_report()+0x17: call to=
 report_enabled() with UACCESS enabled
    1    .config:1162:warning: override: UNWINDER_GUESS changes choice state
    1    ....arch/x86/ia32/ia32_signal.o: warning: objtool: ia32_setup_rt_f=
rame()+0x1ef: call to memset() with UACCESS enabled

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
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnin=
gs, 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 4 errors, 5 warnings, 0 section=
 mismatches

Errors:
    drivers/net/ipa/gsi.c:220:39: error: implicit declaration of function =
=E2=80=98field_max=E2=80=99; did you mean =E2=80=98field_mask=E2=80=99? [-W=
error=3Dimplicit-function-declaration]
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_220=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: GSI=
_RING_ELEMENT_SIZE > field_max(ELEMENT_SIZE_FMASK)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_223=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: GSI=
_RING_ELEMENT_SIZE > field_max(EV_ELEMENT_SIZE_FMASK)
    drivers/remoteproc/mtk_scp.c:364:14: error: initialization of =E2=80=98=
void * (*)(struct rproc *, u64,  size_t)=E2=80=99 {aka =E2=80=98void * (*)(=
struct rproc *, long long unsigned int,  long unsigned int)=E2=80=99} from =
incompatible pointer type =E2=80=98void * (*)(struct rproc *, u64,  int)=E2=
=80=99 {aka =E2=80=98void * (*)(struct rproc *, long long unsigned int,  in=
t)=E2=80=99} [-Werror=3Dincompatible-pointer-types]

Warnings:
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    WARNING: "rcu_tasks_rude_wait_gp" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    include/linux/string.h:441:9: warning: =E2=80=98__builtin_memmove=E2=80=
=99 pointer overflow between offset 0 and size [-2, 9223372036854775807] [-=
Warray-bounds]
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 20 warnings, 0 section m=
ismatches

Errors:
    drivers/remoteproc/mtk_scp.c:364:14: error: initialization of =E2=80=98=
void * (*)(struct rproc *, u64,  size_t)=E2=80=99 {aka =E2=80=98void * (*)(=
struct rproc *, long long unsigned int,  unsigned int)=E2=80=99} from incom=
patible pointer type =E2=80=98void * (*)(struct rproc *, u64,  int)=E2=80=
=99 {aka =E2=80=98void * (*)(struct rproc *, long long unsigned int,  int)=
=E2=80=99} [-Werror=3Dincompatible-pointer-types]

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    WARNING: "rcu_tasks_rude_wait_gp" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    /tmp/ccPbLjgQ.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccPbLjgQ.s:18191: Warning: using r15 results in unpredictable beha=
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
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 30 warnings, 0 section=
 mismatches

Errors:
    drivers/remoteproc/mtk_scp.c:364:14: error: incompatible pointer types =
initializing 'void *(*)(struct rproc *, u64, size_t)' (aka 'void *(*)(struc=
t rproc *, unsigned long long, unsigned int)') with an expression of type '=
void *(struct rproc *, u64, int)' (aka 'void *(struct rproc *, unsigned lon=
g long, int)') [-Werror,-Wincompatible-pointer-types]

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    security/integrity/ima/ima_crypto.c:512:5: warning: stack frame size of=
 1152 bytes in function 'ima_calc_field_array_hash' [-Wframe-larger-than=3D]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    WARNING: "rcu_tasks_rude_wait_gp" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    /tmp/test-arm-40d27a.s:18713: Warning: using r15 results in unpredictab=
le behaviour
    /tmp/test-arm-40d27a.s:18788: Warning: using r15 results in unpredictab=
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
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3014:6: warn=
ing: stack frame size of 1376 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5648 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-9) =E2=80=94 FAIL, 1 error, 5 warnings, 0 sectio=
n mismatches

Errors:
    arch/arm64/kernel/entry-ftrace.S:282:34: error: too few arguments provi=
ded to function-like macro invocation

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-9) =E2=80=94 PASS, 0 errors, 17 warnings, 0 sec=
tion mismatches

Warnings:
    ....arch/x86/ia32/ia32_signal.o: warning: objtool: ia32_setup_rt_frame(=
)+0x1ef: call to memset() with UACCESS enabled
    mm/kasan/common.o: warning: objtool: kasan_report()+0x25: call to repor=
t_enabled() with UACCESS enabled
    arch/x86/kernel/signal.o: warning: objtool: x32_setup_rt_frame()+0x1fa:=
 call to memset() with UACCESS enabled
    arch/x86/kernel/signal.o: warning: objtool: __setup_rt_frame()+0x1f8: c=
all to memset() with UACCESS enabled
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
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
    WARNING: "rcu_tasks_rude_wait_gp" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    warning: same module names found:
    warning: same module names found:

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    .mm/kasan/common.o: warning: objtool: kasan_report()+0x17: call to repo=
rt_enabled() with UACCESS enabled
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    include/linux/string.h:441:9: warning: =E2=80=98__builtin_memmove=E2=80=
=99 pointer overflow between offset 0 and size [-2, 9223372036854775807] [-=
Warray-bounds]
    WARNING: "rcu_tasks_rude_wait_gp" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    warning: same module names found:
    warning: same module names found:

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    arch/arm64/kernel/cpu_errata.c:174:13: warning: =E2=80=98call_smc_arch_=
workaround_1=E2=80=99 defined but not used [-Wunused-function]
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section m=
ismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    arch/riscv/kernel/stacktrace.c:78:8: error: =E2=80=98sp_in_global=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98spin_loc=
k=E2=80=99?

Warnings:
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, =
0 section mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
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
aspeed_g4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 10 warnings, 0=
 section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-517c3b.s:22494: Warning: source register same as write-back =
base
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
aspeed_g5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 9 warnings, 0 =
section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
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
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
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
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-6c9fdf.s:7563: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 se=
ction mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-61b327.s:22811: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-321ad1.s:7563: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-cbc525.s:7448: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 8 warnings, 0 sec=
tion mismatches

Errors:
    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] undefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-8ddbb6.s:7634: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 4 warnings, 0 secti=
on mismatches

Errors:
    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] undefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warning=
s, 0 section mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warning=
s, 0 section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-d19eaf.s:22732: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-de3627.s:7513: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, =
0 section mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x39dc): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3684): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 FAIL, 3 errors, 2 warnings, 0 section mi=
smatches

Errors:
    drivers/net/ipa/gsi.c:220:39: error: implicit declaration of function =
=E2=80=98field_max=E2=80=99; did you mean =E2=80=98field_mask=E2=80=99? [-W=
error=3Dimplicit-function-declaration]
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_220=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: GSI=
_RING_ELEMENT_SIZE > field_max(ELEMENT_SIZE_FMASK)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_223=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: GSI=
_RING_ELEMENT_SIZE > field_max(EV_ELEMENT_SIZE_FMASK)

Warnings:
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-9) =E2=80=94 FAIL, 3 errors, 5 warnings, 0 section =
mismatches

Errors:
    drivers/net/ipa/gsi.c:220:39: error: implicit declaration of function '=
field_max' [-Werror,-Wimplicit-function-declaration]
    drivers/net/ipa/gsi.c:223:39: error: implicit declaration of function '=
field_max' [-Werror,-Wimplicit-function-declaration]
    drivers/net/ipa/gsi.c:710:16: error: implicit declaration of function '=
field_max' [-Werror,-Wimplicit-function-declaration]

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 FAIL, 3 errors=
, 2 warnings, 0 section mismatches

Errors:
    drivers/net/ipa/gsi.c:220:39: error: implicit declaration of function =
=E2=80=98field_max=E2=80=99; did you mean =E2=80=98field_mask=E2=80=99? [-W=
error=3Dimplicit-function-declaration]
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_220=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: GSI=
_RING_ELEMENT_SIZE > field_max(ELEMENT_SIZE_FMASK)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_223=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: GSI=
_RING_ELEMENT_SIZE > field_max(EV_ELEMENT_SIZE_FMASK)

Warnings:
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 FAIL, 3 errors=
, 2 warnings, 0 section mismatches

Errors:
    drivers/net/ipa/gsi.c:220:39: error: implicit declaration of function =
=E2=80=98field_max=E2=80=99; did you mean =E2=80=98field_mask=E2=80=99? [-W=
error=3Dimplicit-function-declaration]
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_220=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: GSI=
_RING_ELEMENT_SIZE > field_max(ELEMENT_SIZE_FMASK)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_223=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: GSI=
_RING_ELEMENT_SIZE > field_max(EV_ELEMENT_SIZE_FMASK)

Warnings:
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 FAIL, 3 errors, 2 warnings, 0 =
section mismatches

Errors:
    drivers/net/ipa/gsi.c:220:39: error: implicit declaration of function =
=E2=80=98field_max=E2=80=99; did you mean =E2=80=98field_mask=E2=80=99? [-W=
error=3Dimplicit-function-declaration]
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_220=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: GSI=
_RING_ELEMENT_SIZE > field_max(ELEMENT_SIZE_FMASK)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_223=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: GSI=
_RING_ELEMENT_SIZE > field_max(EV_ELEMENT_SIZE_FMASK)

Warnings:
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-9ff5e8.s:7535: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 4 warnings, 0 secti=
on mismatches

Errors:
    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] undefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 8 warnings, 0 sec=
tion mismatches

Errors:
    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] undefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-1abb50.s:7448: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    /tmp/futex-f2db3e.s:7457: Warning: source register same as write-back b=
ase

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 FAIL, 14 errors, 14 warnings, =
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
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
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
eseries_pxa_defconfig (arm, clang-9) =E2=80=94 FAIL, 5 errors, 8 warnings, =
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
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-faea3f.s:7476: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0=
 section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-095a06.s:7535: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-681cba.s:7448: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-9c38d4.s:7456: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 wa=
rning, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 =
section mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0=
 section mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-9dcd5d.s:7476: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 3 warnings, 0 sectio=
n mismatches

Errors:
    arch/mips/include/asm/sn/addrs.h:58:44: error: left shift count >=3D wi=
dth of type [-Werror=3Dshift-count-overflow]
    arch/mips/include/asm/sn/addrs.h:58:44: error: left shift count >=3D wi=
dth of type [-Werror=3Dshift-count-overflow]

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    cc1: all warnings being treated as errors
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-f80c9b.s:7483: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0=
 section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-921080.s:7563: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 s=
ection mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-498eb7.s:7563: Warning: source register same as write-back b=
ase

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 se=
ction mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 se=
ction mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-0f717b.s:22554: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-16ce13.s:22554: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 s=
ection mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-a9e39a.s:22554: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    {standard input}:141: Warning: macro instruction expanded into multiple=
 instructions
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings=
, 0 section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    drivers/firmware/efi/libstub/file.c:123:21: warning: stack frame size o=
f 1224 bytes in function 'handle_cmdline_files' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-633f78.s:22847: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 3 warnings, 0 section=
 mismatches

Errors:
    ERROR: "sysrq_mask" [drivers/tty/serial/serial_core.ko] undefined!

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-0b4398.s:7558: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
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
multi_v5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 11 warnings, 0 =
section mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
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
multi_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 11 warnings, 0 =
section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
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
 errors, 6 warnings, 0 section mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
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
=94 PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
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
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 =
warnings, 0 section mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
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
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warni=
ngs, 0 section mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
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
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 se=
ction mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 s=
ection mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-e37d52.s:23351: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-d5572e.s:7563: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-70df23.s:7535: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 se=
ction mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 10 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mach-omap1/pm.c:656:11: warning: variable 'irq' is used uninit=
ialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    arch/arm/mach-omap1/pm.c:611:9: note: initialize the variable 'irq' to =
silence this warning
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 se=
ction mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 s=
ection mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    drivers/firmware/efi/libstub/file.c:123:21: warning: stack frame size o=
f 1232 bytes in function 'handle_cmdline_files' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 se=
ction mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    /tmp/futex-85b5a9.s:7547: Warning: source register same as write-back b=
ase

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0=
 section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-a51627.s:22554: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 8 warnings, 0 section =
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
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 13 warnings, 0 sectio=
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
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, clang-9) =E2=80=94 FAIL, 5 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    /tmp/elf-4a631c.s:49: Error: selected processor does not support `ldrh =
r2,[r0,#18]' in ARM mode
    clang: error: assembler command failed with exit code 1 (use -v to see =
invocation)
    /tmp/main-cdfa58.s:1467: Error: selected processor does not support `ld=
rh r0,[r0]' in ARM mode
    /tmp/main-cdfa58.s:1470: Error: selected processor does not support `st=
rh r0,[r1]' in ARM mode
    clang: error: assembler command failed with exit code 1 (use -v to see =
invocation)

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-f42665.s:22847: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 se=
ction mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, =
0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-6677dd.s:7563: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-34cfaa.s:22753: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-e64e54.s:22753: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0=
 section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-3b2318.s:7542: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

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
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    .config:1162:warning: override: UNWINDER_GUESS changes choice state
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    arch/arm64/kernel/cpu_errata.c:174:13: warning: =E2=80=98call_smc_arch_=
workaround_1=E2=80=99 defined but not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
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
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 s=
ection mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-e01752.s:7476: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 7 warnings, 0 sect=
ion mismatches

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
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
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

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, clang-9) =E2=80=94 FAIL, 2 errors, 5 warnings, 0 se=
ction mismatches

Errors:
    drivers/clocksource/timer-vf-pit.c:131:2: error: unterminated function-=
like macro invocation
    drivers/clocksource/timer-vf-pit.c:194:58: error: expected '}'

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-485bec.s:7460: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings,=
 0 section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, clang-9) =E2=80=94 FAIL, 0 errors, 0 wa=
rnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    kernel/pid.c:180:10: warning: =E2=80=98retval=E2=80=99 may be used unin=
itialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-4bc0c5.s:7426: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    /tmp/futex-dcfe61.s:7476: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 section=
 mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    kernel/pid.c:180:18: warning: variable 'retval' is uninitialized when u=
sed here [-Wuninitialized]
    kernel/pid.c:165:12: note: initialize the variable 'retval' to silence =
this warning
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    include/linux/err.h:26:9: warning: =E2=80=98retval=E2=80=99 may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---
For more info write to <info@kernelci.org>
