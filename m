Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1DC7179C06
	for <lists+linux-next@lfdr.de>; Wed,  4 Mar 2020 23:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgCDWzV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Mar 2020 17:55:21 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:52779 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725875AbgCDWzU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 Mar 2020 17:55:20 -0500
Received: by mail-pj1-f66.google.com with SMTP id lt1so1580110pjb.2
        for <linux-next@vger.kernel.org>; Wed, 04 Mar 2020 14:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yUVn92SDq+iONgGlx9WuNx1JS8RCmco2GucHHMWOGnY=;
        b=Ftky/jK+kcBlO9a2VcVLcy4gGPg7HuCnEc1zt7lgTirN9IeGO79l2S6upRHuQa0W49
         TDUQJBqW1B5/wQRDFkHaFiASdDK5v1Pi36V4lqYa7C3AIQu0snDK00QZhNoO1mnVYqAd
         GbYL1oIWzqWrlw5gU7zZ8t1UFoWvEJSRptufj68e3vSiPct0PrVokNQvUUWOfktxe2Gs
         stqYcbeOE8V09vSCuyJ+6czYuF2JZ/XQTlBbaOfRiRLuQRqopsGBKssbH3sQNSabFddi
         E0wJBC/FT7CKUuJ8UNCLavzEecsDXvy+nyAeptkEj++rCYjoduH0Z0A+Wx741cT4MKpD
         /1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yUVn92SDq+iONgGlx9WuNx1JS8RCmco2GucHHMWOGnY=;
        b=s5KAfbKcq+0tYB9uw2IKh3OQGlQKuw7UeJ+5ezBtJ7Miqi3gHHJ2TZYyYAYjDQU8L8
         BhN+PODbADLH5GhQLAPZ56cyBruXfgaFYEcqxuUYhgMR0pFcHGpwvZuBf6qJaeTNcCNk
         QSlFiOCQxWzh76MMh4iKbdHsMCbKNiQGphfJUY7+qLBOINjEb9+Opy5V9bBWBMM8c6V+
         Y/3rL73179r28ulT4da4mjhIWFq8wrHPlciQUgQn7WsSLDy4/SQSNCoZyZXaLGWkTFCX
         PsKMn+f2x/rYzEJgha2PodRzjDxTFQqPtXGWxZ6ptA23jrpAXjBbxWM5Qet0ogwj7Fpu
         yuiw==
X-Gm-Message-State: ANhLgQ1baxAfNKR7M0cay4bBH9u9dLsxKOAVZfjhoAjnQXcYhZeo2Ua3
        knoW+jYDWjjkq9NYGf38Cj7E/vEMVFY=
X-Google-Smtp-Source: ADFU+vtV6cNwQWo/tOQDoz/1EkrHnVnmEshDXR6kKH8r0F39pTWdRONG+Aq7c8olpDWoNOwA1nOmrA==
X-Received: by 2002:a17:902:9a42:: with SMTP id x2mr5390473plv.194.1583362507563;
        Wed, 04 Mar 2020 14:55:07 -0800 (PST)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 185sm21696354pfv.104.2020.03.04.14.55.06
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2020 14:55:06 -0800 (PST)
Message-ID: <5e6031ca.1c69fb81.e745e.8b7a@mx.google.com>
Date:   Wed, 04 Mar 2020 14:55:06 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20200304
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
Subject: next/master build: 329 builds: 44 failed, 285 passed, 99 errors,
 1060 warnings (next-20200304)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 329 builds: 44 failed, 285 passed, 99 errors, 1060 warni=
ngs (next-20200304)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200304/

Tree: next
Branch: master
Git Describe: next-20200304
Git Commit: bd78794fc00f79e6ae99e7f8f304554f399e3485
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
    allmodconfig: (clang-9) FAIL
    x86_64_defconfig: (clang-9) FAIL
    x86_64_defconfig+kvm_guest: (clang-9) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
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
    allmodconfig (gcc-8): 1 warning
    allmodconfig (clang-9): 12 warnings
    allnoconfig (gcc-8): 1 warning
    defconfig (gcc-8): 2 warnings
    defconfig (clang-9): 2 warnings
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning

arm:
    allmodconfig (gcc-8): 23 warnings
    allmodconfig (clang-9): 41 warnings
    allnoconfig (gcc-8): 1 warning
    am200epdkit_defconfig (gcc-8): 2 warnings
    am200epdkit_defconfig (clang-9): 4 warnings
    aspeed_g4_defconfig (clang-9): 9 warnings
    aspeed_g4_defconfig (gcc-8): 6 warnings
    aspeed_g5_defconfig (clang-9): 8 warnings
    aspeed_g5_defconfig (gcc-8): 6 warnings
    assabet_defconfig (gcc-8): 2 errors, 2 warnings
    assabet_defconfig (clang-9): 5 warnings
    at91_dt_defconfig (clang-9): 4 warnings
    at91_dt_defconfig (gcc-8): 2 warnings
    axm55xx_defconfig (clang-9): 4 warnings
    axm55xx_defconfig (gcc-8): 2 warnings
    badge4_defconfig (gcc-8): 2 errors, 2 warnings
    badge4_defconfig (clang-9): 5 warnings
    bcm2835_defconfig (gcc-8): 1 warning
    bcm2835_defconfig (clang-9): 2 warnings
    cerfcube_defconfig (gcc-8): 2 errors, 2 warnings
    cerfcube_defconfig (clang-9): 5 warnings
    clps711x_defconfig (gcc-8): 2 warnings
    clps711x_defconfig (clang-9): 4 warnings
    cm_x2xx_defconfig (gcc-8): 2 warnings
    cm_x2xx_defconfig (clang-9): 5 warnings
    cm_x300_defconfig (clang-9): 1 error, 7 warnings
    cm_x300_defconfig (gcc-8): 1 error, 4 warnings
    cns3420vb_defconfig (clang-9): 6 warnings
    cns3420vb_defconfig (gcc-8): 4 warnings
    colibri_pxa270_defconfig (gcc-8): 2 warnings
    colibri_pxa270_defconfig (clang-9): 4 warnings
    colibri_pxa300_defconfig (gcc-8): 2 warnings
    colibri_pxa300_defconfig (clang-9): 5 warnings
    collie_defconfig (clang-9): 5 warnings
    collie_defconfig (gcc-8): 2 errors, 2 warnings
    corgi_defconfig (clang-9): 4 warnings
    corgi_defconfig (gcc-8): 2 errors, 2 warnings
    davinci_all_defconfig (clang-9): 4 warnings
    davinci_all_defconfig (gcc-8): 2 warnings
    dove_defconfig (gcc-8): 2 warnings
    dove_defconfig (clang-9): 4 warnings
    ebsa110_defconfig (clang-9): 5 warnings
    ebsa110_defconfig (gcc-8): 2 errors, 2 warnings
    efm32_defconfig (gcc-8): 1 warning
    efm32_defconfig (clang-9): 2 warnings
    em_x270_defconfig (clang-9): 1 error, 7 warnings
    em_x270_defconfig (gcc-8): 1 error, 4 warnings
    ep93xx_defconfig (clang-9): 5 warnings
    ep93xx_defconfig (gcc-8): 2 warnings
    eseries_pxa_defconfig (gcc-8): 14 errors, 13 warnings
    eseries_pxa_defconfig (clang-9): 5 errors, 5 warnings
    exynos_defconfig (clang-9): 4 warnings
    exynos_defconfig (gcc-8): 2 warnings
    ezx_defconfig (gcc-8): 2 warnings
    ezx_defconfig (clang-9): 4 warnings
    footbridge_defconfig (clang-9): 5 warnings
    footbridge_defconfig (gcc-8): 2 errors, 2 warnings
    gemini_defconfig (clang-9): 2 warnings
    gemini_defconfig (gcc-8): 1 warning
    h3600_defconfig (gcc-8): 2 errors, 2 warnings
    h3600_defconfig (clang-9): 4 warnings
    h5000_defconfig (gcc-8): 2 warnings
    h5000_defconfig (clang-9): 5 warnings
    hackkit_defconfig (gcc-8): 2 errors, 2 warnings
    hackkit_defconfig (clang-9): 5 warnings
    hisi_defconfig (clang-9): 4 warnings
    hisi_defconfig (gcc-8): 2 warnings
    imote2_defconfig (gcc-8): 2 warnings
    imote2_defconfig (clang-9): 4 warnings
    imx_v4_v5_defconfig (gcc-8): 2 warnings
    imx_v4_v5_defconfig (clang-9): 4 warnings
    imx_v6_v7_defconfig (clang-9): 4 warnings
    imx_v6_v7_defconfig (gcc-8): 2 warnings
    integrator_defconfig (clang-9): 4 warnings
    integrator_defconfig (gcc-8): 2 warnings
    iop32x_defconfig (clang-9): 5 warnings
    iop32x_defconfig (gcc-8): 2 errors, 2 warnings
    ixp4xx_defconfig (clang-9): 5 warnings
    ixp4xx_defconfig (gcc-8): 2 warnings
    jornada720_defconfig (gcc-8): 2 errors, 2 warnings
    jornada720_defconfig (clang-9): 5 warnings
    keystone_defconfig (clang-9): 4 warnings
    keystone_defconfig (gcc-8): 2 warnings
    lart_defconfig (clang-9): 5 warnings
    lart_defconfig (gcc-8): 2 errors, 2 warnings
    lpc18xx_defconfig (gcc-8): 1 warning
    lpc18xx_defconfig (clang-9): 2 warnings
    lpc32xx_defconfig (gcc-8): 2 warnings
    lpc32xx_defconfig (clang-9): 4 warnings
    lpd270_defconfig (clang-9): 5 warnings
    lpd270_defconfig (gcc-8): 2 errors, 2 warnings
    lubbock_defconfig (gcc-8): 2 errors, 2 warnings
    lubbock_defconfig (clang-9): 5 warnings
    magician_defconfig (clang-9): 4 warnings
    magician_defconfig (gcc-8): 2 warnings
    mainstone_defconfig (gcc-8): 2 errors, 2 warnings
    mainstone_defconfig (clang-9): 5 warnings
    milbeaut_m10v_defconfig (gcc-8): 5 warnings
    milbeaut_m10v_defconfig (clang-9): 9 warnings
    mini2440_defconfig (clang-9): 3 warnings
    mini2440_defconfig (gcc-8): 1 warning
    mmp2_defconfig (clang-9): 4 warnings
    mmp2_defconfig (gcc-8): 2 warnings
    moxart_defconfig (clang-9): 2 warnings
    moxart_defconfig (gcc-8): 1 warning
    mps2_defconfig (gcc-8): 1 warning
    mps2_defconfig (clang-9): 2 warnings
    multi_v4t_defconfig (clang-9): 8 warnings
    multi_v4t_defconfig (gcc-8): 5 warnings
    multi_v5_defconfig (gcc-8): 6 warnings
    multi_v5_defconfig (clang-9): 8 warnings
    multi_v7_defconfig (clang-9): 10 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 7 warnings
    mv78xx0_defconfig (gcc-8): 2 warnings
    mv78xx0_defconfig (clang-9): 4 warnings
    mvebu_v5_defconfig (gcc-8): 2 warnings
    mvebu_v5_defconfig (clang-9): 4 warnings
    mvebu_v7_defconfig (clang-9): 4 warnings
    mvebu_v7_defconfig (gcc-8): 2 warnings
    mxs_defconfig (gcc-8): 2 warnings
    mxs_defconfig (clang-9): 5 warnings
    neponset_defconfig (clang-9): 5 warnings
    neponset_defconfig (gcc-8): 2 errors, 2 warnings
    netwinder_defconfig (gcc-8): 2 errors, 2 warnings
    netwinder_defconfig (clang-9): 5 warnings
    nhk8815_defconfig (clang-9): 2 warnings
    nhk8815_defconfig (gcc-8): 1 warning
    omap1_defconfig (gcc-8): 1 warning
    omap1_defconfig (clang-9): 2 warnings
    omap2plus_defconfig (gcc-8): 2 warnings
    omap2plus_defconfig (clang-9): 4 warnings
    orion5x_defconfig (clang-9): 4 warnings
    orion5x_defconfig (gcc-8): 2 warnings
    oxnas_v6_defconfig (gcc-8): 2 warnings
    oxnas_v6_defconfig (clang-9): 6 warnings
    palmz72_defconfig (gcc-8): 2 warnings
    palmz72_defconfig (clang-9): 4 warnings
    pcm027_defconfig (gcc-8): 2 warnings
    pcm027_defconfig (clang-9): 4 warnings
    pleb_defconfig (clang-9): 5 warnings
    pleb_defconfig (gcc-8): 2 errors, 2 warnings
    prima2_defconfig (clang-9): 7 warnings
    prima2_defconfig (gcc-8): 5 warnings
    pxa168_defconfig (clang-9): 4 warnings
    pxa168_defconfig (gcc-8): 2 warnings
    pxa255-idp_defconfig (clang-9): 5 warnings
    pxa255-idp_defconfig (gcc-8): 2 errors, 2 warnings
    pxa3xx_defconfig (gcc-8): 2 warnings
    pxa3xx_defconfig (clang-9): 4 warnings
    pxa910_defconfig (clang-9): 4 warnings
    pxa910_defconfig (gcc-8): 2 warnings
    pxa_defconfig (gcc-8): 3 errors, 8 warnings
    pxa_defconfig (clang-9): 1 error, 10 warnings
    qcom_defconfig (clang-9): 4 warnings
    qcom_defconfig (gcc-8): 2 warnings
    realview_defconfig (clang-9): 4 warnings
    realview_defconfig (gcc-8): 2 warnings
    rpc_defconfig (clang-9): 5 errors
    rpc_defconfig (gcc-8): 2 errors, 2 warnings
    s3c2410_defconfig (gcc-8): 2 errors, 2 warnings
    s3c2410_defconfig (clang-9): 5 warnings
    s3c6400_defconfig (gcc-8): 5 warnings
    s3c6400_defconfig (clang-9): 7 warnings
    s5pv210_defconfig (clang-9): 4 warnings
    s5pv210_defconfig (gcc-8): 2 warnings
    sama5_defconfig (clang-9): 4 warnings
    sama5_defconfig (gcc-8): 2 warnings
    shannon_defconfig (clang-9): 5 warnings
    shannon_defconfig (gcc-8): 2 errors, 2 warnings
    shmobile_defconfig (clang-9): 2 warnings
    shmobile_defconfig (gcc-8): 1 warning
    simpad_defconfig (gcc-8): 2 errors, 2 warnings
    simpad_defconfig (clang-9): 4 warnings
    socfpga_defconfig (clang-9): 4 warnings
    socfpga_defconfig (gcc-8): 2 warnings
    spear13xx_defconfig (clang-9): 4 warnings
    spear13xx_defconfig (gcc-8): 2 warnings
    spear3xx_defconfig (clang-9): 5 warnings
    spear3xx_defconfig (gcc-8): 2 errors, 2 warnings
    spear6xx_defconfig (gcc-8): 2 errors, 2 warnings
    spear6xx_defconfig (clang-9): 5 warnings
    spitz_defconfig (gcc-8): 2 errors, 2 warnings
    spitz_defconfig (clang-9): 4 warnings
    stm32_defconfig (gcc-8): 4 warnings
    stm32_defconfig (clang-9): 6 warnings
    sunxi_defconfig (clang-9): 4 warnings
    sunxi_defconfig (gcc-8): 2 warnings
    tango4_defconfig (clang-9): 4 warnings
    tango4_defconfig (gcc-8): 2 warnings
    tct_hammer_defconfig (clang-9): 3 warnings
    tct_hammer_defconfig (gcc-8): 2 errors, 1 warning
    tegra_defconfig (clang-9): 4 warnings
    tegra_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    trizeps4_defconfig (clang-9): 4 warnings
    trizeps4_defconfig (gcc-8): 2 warnings
    u300_defconfig (gcc-8): 5 warnings
    u300_defconfig (clang-9): 7 warnings
    u8500_defconfig (gcc-8): 2 warnings
    u8500_defconfig (clang-9): 4 warnings
    versatile_defconfig (clang-9): 5 warnings
    versatile_defconfig (gcc-8): 2 warnings
    vexpress_defconfig (gcc-8): 2 warnings
    vexpress_defconfig (clang-9): 4 warnings
    vf610m4_defconfig (clang-9): 2 errors, 7 warnings
    vf610m4_defconfig (gcc-8): 4 errors, 10 warnings
    viper_defconfig (gcc-8): 2 warnings
    viper_defconfig (clang-9): 5 warnings
    vt8500_v6_v7_defconfig (gcc-8): 2 warnings
    vt8500_v6_v7_defconfig (clang-9): 4 warnings
    xcep_defconfig (gcc-8): 2 warnings
    xcep_defconfig (clang-9): 5 warnings
    zeus_defconfig (gcc-8): 2 warnings
    zeus_defconfig (clang-9): 5 warnings
    zx_defconfig (clang-9): 7 warnings
    zx_defconfig (gcc-8): 5 warnings

i386:
    allnoconfig (gcc-8): 1 warning
    i386_defconfig (gcc-8): 2 warnings
    i386_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning

mips:
    32r2el_defconfig (gcc-8): 2 warnings
    32r2el_defconfig (gcc-8): 3 warnings
    allnoconfig (gcc-8): 1 warning
    ar7_defconfig (gcc-8): 1 warning
    ath25_defconfig (gcc-8): 1 warning
    ath79_defconfig (gcc-8): 1 warning
    bcm47xx_defconfig (gcc-8): 2 warnings
    bcm63xx_defconfig (gcc-8): 2 warnings
    bigsur_defconfig (gcc-8): 2 warnings
    bmips_be_defconfig (gcc-8): 2 warnings
    bmips_stb_defconfig (gcc-8): 2 warnings
    capcella_defconfig (gcc-8): 2 warnings
    cavium_octeon_defconfig (gcc-8): 2 warnings
    ci20_defconfig (gcc-8): 2 warnings
    cobalt_defconfig (gcc-8): 2 warnings
    cu1000-neo_defconfig (gcc-8): 2 warnings
    db1xxx_defconfig (gcc-8): 2 warnings
    decstation_64_defconfig (gcc-8): 2 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
    e55_defconfig (gcc-8): 5 warnings
    fuloong2e_defconfig (gcc-8): 1 warning
    gcw0_defconfig (gcc-8): 2 warnings
    gpr_defconfig (gcc-8): 1 warning
    ip22_defconfig (gcc-8): 2 warnings
    ip27_defconfig (gcc-8): 2 errors, 1 warning
    ip28_defconfig (gcc-8): 2 warnings
    ip32_defconfig (gcc-8): 2 warnings
    jazz_defconfig (gcc-8): 2 warnings
    jmr3927_defconfig (gcc-8): 2 warnings
    lasat_defconfig (gcc-8): 2 warnings
    lemote2f_defconfig (gcc-8): 2 warnings
    loongson1b_defconfig (gcc-8): 1 warning
    loongson1c_defconfig (gcc-8): 1 warning
    loongson3_defconfig (gcc-8): 1 warning
    malta_defconfig (gcc-8): 2 warnings
    malta_kvm_defconfig (gcc-8): 2 warnings
    malta_kvm_guest_defconfig (gcc-8): 2 warnings
    malta_qemu_32r6_defconfig (gcc-8): 3 warnings
    maltaaprp_defconfig (gcc-8): 2 warnings
    maltasmvp_defconfig (gcc-8): 2 warnings
    maltasmvp_eva_defconfig (gcc-8): 2 warnings
    maltaup_defconfig (gcc-8): 2 warnings
    maltaup_xpa_defconfig (gcc-8): 2 warnings
    markeins_defconfig (gcc-8): 2 warnings
    mips_paravirt_defconfig (gcc-8): 2 warnings
    mpc30x_defconfig (gcc-8): 2 warnings
    msp71xx_defconfig (gcc-8): 2 warnings
    mtx1_defconfig (gcc-8): 1 warning
    nlm_xlp_defconfig (gcc-8): 1 warning
    nlm_xlr_defconfig (gcc-8): 1 warning
    omega2p_defconfig (gcc-8): 2 warnings
    pic32mzda_defconfig (gcc-8): 5 warnings
    pistachio_defconfig (gcc-8): 2 warnings
    pnx8335_stb225_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 2 warnings
    rb532_defconfig (gcc-8): 1 warning
    rbtx49xx_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 2 warnings
    rt305x_defconfig (gcc-8): 1 warning
    sb1250_swarm_defconfig (gcc-8): 2 warnings
    tb0219_defconfig (gcc-8): 2 warnings
    tb0226_defconfig (gcc-8): 2 warnings
    tb0287_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vocore2_defconfig (gcc-8): 2 warnings
    workpad_defconfig (gcc-8): 2 warnings
    xway_defconfig (gcc-8): 1 warning

riscv:
    allnoconfig (gcc-8): 1 error
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 2 warnings
    nommu_virt_defconfig (gcc-8): 1 warning
    rv32_defconfig (gcc-8): 8 warnings
    tinyconfig (gcc-8): 1 error

x86_64:
    allmodconfig (gcc-8): 1 warning
    allmodconfig (clang-9): 1 error, 14 warnings
    allnoconfig (clang-9): 2 warnings
    allnoconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 2 warnings
    x86_64_defconfig (gcc-8): 1 warning
    x86_64_defconfig (clang-9): 2 errors, 2 warnings
    x86_64_defconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 1 warning

Errors summary:

    27   include/linux/compiler.h:394:38: error: call to =E2=80=98__compile=
time_assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON faile=
d: sizeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)
    27   include/linux/compiler.h:394:38: error: call to =E2=80=98__compile=
time_assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON faile=
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
    1    ld: intel_workarounds.c:(.text+0x1a14): undefined reference to `__=
compiletime_assert_184'
    1    intel_workarounds.c:(.text+0x1a0f): undefined reference to `__comp=
iletime_assert_184'
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
    1    ERROR: "__compiletime_assert_184" [drivers/gpu/drm/i915/i915.ko] u=
ndefined!
    1    /tmp/main-aa2c24.s:1470: Error: selected processor does not suppor=
t `strh r0,[r1]' in ARM mode
    1    /tmp/main-aa2c24.s:1467: Error: selected processor does not suppor=
t `ldrh r0,[r0]' in ARM mode
    1    /tmp/elf-89a569.s:49: Error: selected processor does not support `=
ldrh r2,[r0,#18]' in ARM mode

Warnings summary:

    209  1 warning generated.
    204  drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_se=
condary=E2=80=99 defined but not used [-Wunused-function]
    163  fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98r=
efcount_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [=
-Wunused-result]
    107  drivers/char/random.c:820:13: warning: unused function 'crng_initi=
alize_secondary' [-Wunused-function]
    96   fs/io_uring.c:3415:3: warning: ignoring return value of function d=
eclared with 'warn_unused_result' attribute [-Wunused-result]
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
    11   fs/io_uring.c:3726:26: warning: =E2=80=98io_recv_buffer_select=E2=
=80=99 defined but not used [-Wunused-function]
    11   fs/io_uring.c:3714:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=
=99 defined but not used [-Wunused-function]
    11   fs/io_uring.c:3483:12: warning: =E2=80=98io_setup_async_msg=E2=80=
=99 defined but not used [-Wunused-function]
    9    fs/io_uring.c:3726:26: warning: unused function 'io_recv_buffer_se=
lect' [-Wunused-function]
    9    fs/io_uring.c:3714:12: warning: unused function 'io_recvmsg_copy_h=
dr' [-Wunused-function]
    9    fs/io_uring.c:3483:12: warning: unused function 'io_setup_async_ms=
g' [-Wunused-function]
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    7    4 warnings generated.
    5    3 warnings generated.
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
    1    arch/x86/ia32/ia32_signal.o: warning: objtool: ia32_setup_rt_frame=
()+0x1ef: call to memset() with UACCESS enabled
    1    /tmp/test-arm-dc7c46.s:18788: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-dc7c46.s:18713: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/futex-fcbe3f.s:28617: Warning: source register same as write-=
back base
    1    /tmp/futex-fc4165.s:9049: Warning: source register same as write-b=
ack base
    1    /tmp/futex-f9a0a3.s:9036: Warning: source register same as write-b=
ack base
    1    /tmp/futex-f173b9.s:29056: Warning: source register same as write-=
back base
    1    /tmp/futex-ef6eb4.s:9085: Warning: source register same as write-b=
ack base
    1    /tmp/futex-e789c1.s:28918: Warning: source register same as write-=
back base
    1    /tmp/futex-e68e0a.s:8999: Warning: source register same as write-b=
ack base
    1    /tmp/futex-e54910.s:9057: Warning: source register same as write-b=
ack base
    1    /tmp/futex-dc1a54.s:9085: Warning: source register same as write-b=
ack base
    1    /tmp/futex-d66fa9.s:28918: Warning: source register same as write-=
back base
    1    /tmp/futex-d6230a.s:9064: Warning: source register same as write-b=
ack base
    1    /tmp/futex-cd92c6.s:28858: Warning: source register same as write-=
back base
    1    /tmp/futex-cc7a20.s:9049: Warning: source register same as write-b=
ack base
    1    /tmp/futex-beafae.s:9033: Warning: source register same as write-b=
ack base
    1    /tmp/futex-be35ea.s:29243: Warning: source register same as write-=
back base
    1    /tmp/futex-bcaea9.s:29056: Warning: source register same as write-=
back base
    1    /tmp/futex-b2f9e2.s:9021: Warning: source register same as write-b=
ack base
    1    /tmp/futex-9e2df1.s:9085: Warning: source register same as write-b=
ack base
    1    /tmp/futex-9c99c2.s:9085: Warning: source register same as write-b=
ack base
    1    /tmp/futex-986952.s:9080: Warning: source register same as write-b=
ack base
    1    /tmp/futex-88fe22.s:9021: Warning: source register same as write-b=
ack base
    1    /tmp/futex-886517.s:28918: Warning: source register same as write-=
back base
    1    /tmp/futex-75ad5c.s:9250: Warning: source register same as write-b=
ack base
    1    /tmp/futex-6cb238.s:9057: Warning: source register same as write-b=
ack base
    1    /tmp/futex-54a6f4.s:29274: Warning: source register same as write-=
back base
    1    /tmp/futex-4adaab.s:9069: Warning: source register same as write-b=
ack base
    1    /tmp/futex-3c0364.s:9057: Warning: source register same as write-b=
ack base
    1    /tmp/futex-3b10ea.s:28918: Warning: source register same as write-=
back base
    1    /tmp/futex-34efd2.s:28617: Warning: source register same as write-=
back base
    1    /tmp/futex-2f1768.s:9021: Warning: source register same as write-b=
ack base
    1    /tmp/futex-2bad26.s:29023: Warning: source register same as write-=
back base
    1    /tmp/futex-242af4.s:9049: Warning: source register same as write-b=
ack base
    1    /tmp/futex-0adaea.s:9085: Warning: source register same as write-b=
ack base
    1    /tmp/futex-0967cf.s:9049: Warning: source register same as write-b=
ack base
    1    /tmp/futex-0867d7.s:9022: Warning: source register same as write-b=
ack base
    1    /tmp/futex-045704.s:9049: Warning: source register same as write-b=
ack base
    1    /tmp/futex-03f6b9.s:9085: Warning: source register same as write-b=
ack base
    1    /tmp/futex-00ee67.s:9021: Warning: source register same as write-b=
ack base
    1    /tmp/cc2aTO60.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/cc2aTO60.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1162:warning: override: UNWINDER_GUESS changes choice state

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
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnin=
gs, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 23 warnings, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    /tmp/cc2aTO60.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/cc2aTO60.s:18191: Warning: using r15 results in unpredictable beha=
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
allmodconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 41 warnings, 0 sectio=
n mismatches

Warnings:
    security/integrity/ima/ima_crypto.c:512:5: warning: stack frame size of=
 1152 bytes in function 'ima_calc_field_array_hash' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/hwtracing/coresight/coresight-cti-sysfs.c:948:11: warning: addr=
ess of array 'grp->sig_types' will always evaluate to 'true' [-Wpointer-boo=
l-conversion]
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    /tmp/test-arm-dc7c46.s:18713: Warning: using r15 results in unpredictab=
le behaviour
    /tmp/test-arm-dc7c46.s:18788: Warning: using r15 results in unpredictab=
le behaviour
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
allmodconfig (arm64, clang-9) =E2=80=94 PASS, 0 errors, 12 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
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
allmodconfig (x86_64, clang-9) =E2=80=94 FAIL, 1 error, 14 warnings, 0 sect=
ion mismatches

Errors:
    ERROR: "__compiletime_assert_184" [drivers/gpu/drm/i915/i915.ko] undefi=
ned!

Warnings:
    arch/x86/ia32/ia32_signal.o: warning: objtool: ia32_setup_rt_frame()+0x=
1ef: call to memset() with UACCESS enabled
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
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:31: warning=
: address of 'pipe_ctx->plane_res' will always evaluate to 'true' [-Wpointe=
r-bool-conversion]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_psr.c:147:56: warning=
: address of 'pipe_ctx->stream_res' will always evaluate to 'true' [-Wpoint=
er-bool-conversion]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

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
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

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
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, =
0 section mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 9 warnings, 0 =
section mismatches

Warnings:
    /tmp/futex-cd92c6.s:28858: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
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
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
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
aspeed_g5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 8 warnings, 0 =
section mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
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
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
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
assabet_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-dc1a54.s:9085: Warning: source register same as write-back b=
ase
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

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
badge4_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 secti=
on mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-2bad26.s:29023: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
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
bcm2835_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sec=
tion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    /tmp/futex-9e2df1.s:9085: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-00ee67.s:9021: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 7 warnings, 0 sec=
tion mismatches

Errors:
    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] undefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    /tmp/futex-75ad5c.s:9250: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
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
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3483:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3714:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3726:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    3 warnings generated.

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3726:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3714:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3483:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warning=
s, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warning=
s, 0 section mismatches

Warnings:
    /tmp/futex-54a6f4.s:29274: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-f9a0a3.s:9036: Warning: source register same as write-back b=
ase
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 secti=
on mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sectio=
n mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, =
0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x39dc): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3684): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    kernel/sched/fair.c:1524:20: warning: =E2=80=98test_idle_cores=E2=80=99=
 declared =E2=80=98static=E2=80=99 but never defined [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 2 warnings, 0 section mismatches

Warnings:
    kernel/sched/fair.c:1524:20: warning: =E2=80=98test_idle_cores=E2=80=99=
 declared =E2=80=98static=E2=80=99 but never defined [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 2 warnings, 0 section mismatches

Warnings:
    kernel/sched/fair.c:1524:20: warning: =E2=80=98test_idle_cores=E2=80=99=
 declared =E2=80=98static=E2=80=99 but never defined [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    kernel/sched/fair.c:1524:20: warning: =E2=80=98test_idle_cores=E2=80=99=
 declared =E2=80=98static=E2=80=99 but never defined [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    fs/io_uring.c:3726:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3714:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3483:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    /tmp/futex-3c0364.s:9057: Warning: source register same as write-back b=
ase
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 7 warnings, 0 sec=
tion mismatches

Errors:
    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] undefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    /tmp/futex-88fe22.s:9021: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 4 warnings, 0 secti=
on mismatches

Errors:
    ERROR: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] undefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-0867d7.s:9022: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 FAIL, 14 errors, 13 warnings, =
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
    /tmp/futex-cc7a20.s:9049: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    /tmp/futex-6cb238.s:9057: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 s=
ection mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

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
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sectio=
n mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    /tmp/futex-b2f9e2.s:9021: Warning: source register same as write-back b=
ase
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-2f1768.s:9021: Warning: source register same as write-back b=
ase
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

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
hisi_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

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
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-045704.s:9049: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 secti=
on mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

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
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-242af4.s:9049: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 s=
ection mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    /tmp/futex-ef6eb4.s:9085: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    /tmp/futex-03f6b9.s:9085: Warning: source register same as write-back b=
ase
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section=
 mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-3b10ea.s:28918: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 secti=
on mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    /tmp/futex-d66fa9.s:28918: Warning: source register same as write-back =
base
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 se=
ction mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    /tmp/futex-886517.s:28918: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    {standard input}:141: Warning: macro instruction expanded into multiple=
 instructions
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, =
0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    fs/io_uring.c:3726:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3714:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3483:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 9 warnings=
, 0 section mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    fs/io_uring.c:3483:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3714:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3726:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    4 warnings generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    drivers/firmware/efi/libstub/file.c:123:21: warning: stack frame size o=
f 1224 bytes in function 'handle_cmdline_files' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    /tmp/futex-bcaea9.s:29056: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

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
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 8 warnings, 0 =
section mismatches

Warnings:
    /tmp/futex-986952.s:9080: Warning: source register same as write-back b=
ase
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    fs/io_uring.c:3483:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3714:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3726:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    4 warnings generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    fs/io_uring.c:3726:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3714:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3483:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
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
multi_v5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 8 warnings, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
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
multi_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 10 warnings, 0 =
section mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
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
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 6 warnings, 0 section mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
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
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
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
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
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
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
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
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    /tmp/futex-be35ea.s:29243: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    /tmp/futex-9c99c2.s:9085: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sec=
tion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 se=
ction mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    /tmp/futex-e54910.s:9057: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

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
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

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
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

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
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/firmware/efi/libstub/file.c:123:21: warning: stack frame size o=
f 1232 bytes in function 'handle_cmdline_files' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    fs/io_uring.c:3726:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3714:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3483:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    /tmp/futex-4adaab.s:9069: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section=
 mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    fs/io_uring.c:3483:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3714:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3726:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    4 warnings generated.

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    fs/io_uring.c:3726:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3714:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3483:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    /tmp/futex-e789c1.s:28918: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 s=
ection mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

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
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 10 warnings, 0 sectio=
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
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, clang-9) =E2=80=94 FAIL, 5 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    /tmp/elf-89a569.s:49: Error: selected processor does not support `ldrh =
r2,[r0,#18]' in ARM mode
    clang: error: assembler command failed with exit code 1 (use -v to see =
invocation)
    /tmp/main-aa2c24.s:1467: Error: selected processor does not support `ld=
rh r0,[r0]' in ARM mode
    /tmp/main-aa2c24.s:1470: Error: selected processor does not support `st=
rh r0,[r1]' in ARM mode
    clang: error: assembler command failed with exit code 1 (use -v to see =
invocation)

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section =
mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-f173b9.s:29056: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    fs/io_uring.c:3726:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3714:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3483:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    fs/io_uring.c:3483:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3714:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3726:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    4 warnings generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-0adaea.s:9085: Warning: source register same as write-back b=
ase
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

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
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 secti=
on mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    /tmp/futex-34efd2.s:28617: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sec=
tion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sec=
tion mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    /tmp/futex-fcbe3f.s:28617: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sectio=
n mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3726:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3714:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3483:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3483:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3714:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3726:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    3 warnings generated.

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    /tmp/futex-d6230a.s:9064: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 se=
ction mismatches

Errors:
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8010=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__u16) !=3D sizeof_field(struct io_uring_sqe, personality)
    include/linux/compiler.h:394:38: error: call to =E2=80=98__compiletime_=
assert_8011=E2=80=99 declared with attribute error: BUILD_BUG_ON failed: si=
zeof(__s32) !=3D sizeof_field(struct io_uring_sqe, splice_fd_in)

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

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
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
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
tinyconfig (riscv, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    arch/riscv/kernel/stacktrace.c:78:8: error: =E2=80=98sp_in_global=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98spin_loc=
k=E2=80=99?

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    fs/io_uring.c:3726:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3714:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3483:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    fs/io_uring.c:3483:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3714:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3726:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    4 warnings generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

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
versatile_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    /tmp/futex-0967cf.s:9049: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, clang-9) =E2=80=94 FAIL, 2 errors, 7 warnings, 0 se=
ction mismatches

Errors:
    drivers/clocksource/timer-vf-pit.c:131:2: error: unterminated function-=
like macro invocation
    drivers/clocksource/timer-vf-pit.c:194:58: error: expected '}'

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    fs/io_uring.c:3483:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3714:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3726:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    4 warnings generated.

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 10 warnings, 0 sec=
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
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    fs/io_uring.c:3726:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3714:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3483:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]
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
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    /tmp/futex-beafae.s:9033: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-9) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 =
section mismatches

Errors:
    intel_workarounds.c:(.text+0x1a0f): undefined reference to `__compileti=
me_assert_184'
    ld: intel_workarounds.c:(.text+0x1a14): undefined reference to `__compi=
letime_assert_184'

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, clang-9) =E2=80=94 FAIL, 0 errors, 0 wa=
rnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.
    /tmp/futex-e68e0a.s:8999: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    /tmp/futex-fc4165.s:9049: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    1 warning generated.

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:3415:3: warning: ignoring return value of function declar=
ed with 'warn_unused_result' attribute [-Wunused-result]
    fs/io_uring.c:3483:12: warning: unused function 'io_setup_async_msg' [-=
Wunused-function]
    fs/io_uring.c:3714:12: warning: unused function 'io_recvmsg_copy_hdr' [=
-Wunused-function]
    fs/io_uring.c:3726:26: warning: unused function 'io_recv_buffer_select'=
 [-Wunused-function]
    4 warnings generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section m=
ismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    fs/io_uring.c:3415:3: warning: ignoring return value of =E2=80=98refcou=
nt_inc_not_zero=E2=80=99, declared with attribute warn_unused_result [-Wunu=
sed-result]
    fs/io_uring.c:3726:26: warning: =E2=80=98io_recv_buffer_select=E2=80=99=
 defined but not used [-Wunused-function]
    fs/io_uring.c:3714:12: warning: =E2=80=98io_recvmsg_copy_hdr=E2=80=99 d=
efined but not used [-Wunused-function]
    fs/io_uring.c:3483:12: warning: =E2=80=98io_setup_async_msg=E2=80=99 de=
fined but not used [-Wunused-function]

---
For more info write to <info@kernelci.org>
