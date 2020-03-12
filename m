Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A82718309E
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 13:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgCLMsi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 08:48:38 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:51500 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgCLMsh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Mar 2020 08:48:37 -0400
Received: by mail-pj1-f67.google.com with SMTP id y7so2523669pjn.1
        for <linux-next@vger.kernel.org>; Thu, 12 Mar 2020 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=8gtrC01rqORJSNWgZKs3g2khog8yUolABoAXoMhEjco=;
        b=0uwZ0/Hsg+aEhWHivRrqwLOVQmAhx9s5Fjb/aO3PQxvk7qKWRIyCajhgeBDRl8HxR3
         GJCIrUd71iZnBpADXWLMBhjiGpesUq781JoR+5dVK5IXYmBIv23BEl1i0T/YQOyGKPc4
         aCPtj8e9XifzWUa0MQdyPIesuMXBMsB46w47WBe8by6TEzbXKhF323Qs1XIhksYtH4nm
         9j3QUvXHLK0JPxkY9vCxEbqf77iNQKcH+sAqBpTabkzA73IJkcM0ROFD8DHxwIBMW6Ki
         npCtkqZboNh5fabs5d1KpKczTYArUHMA75cuB4yo9YUgTY4hUf4zIrwiKAht2s33k5aX
         KZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=8gtrC01rqORJSNWgZKs3g2khog8yUolABoAXoMhEjco=;
        b=M4CUgurYlXcfA3fuZ9NN4WtOzaj8CRZwPTLkQ6x8wNndDQB3BFsreRjrDGj9K9e+fd
         qjkQ6ncdzPCxpoZqUtsiY1IPLoygEESQd+ngv5QU+waVAYmb+C/n4xzGjfjd/f6cQjbN
         t22xRiWWmxgXtadEq1e0k46h46Gc28lmZKrUvFVRjFs60pf2hz9yZEAAaTCuajC+QWwX
         USSPkkwGm5wHbZKKstCmJkJ96FoWL/szjdiKxhX31QPqs8KSu1fzZldctj1gpGw9IuG4
         tcIRfAOp5Hr3u+dNLJrFAxrRDTf5ebIY7sVspwnufcbUDaT7G7ZPNs94P6eA69DrySsj
         +Z4w==
X-Gm-Message-State: ANhLgQ0dcDTXSNCYlutJNUmllkllzixmNe6WL/I86452Lg1dJYGaBQWd
        CYgCmkaz3xiO7YU5Uhu4tBd77VZUlLM=
X-Google-Smtp-Source: ADFU+vsCTtJwiVe+gk4UnGRJRWKlU/2bk7gppENzi2hgOXLQrm6lUaulKYE6ciwH1WAdqnb8BHG7sg==
X-Received: by 2002:a17:902:8ec6:: with SMTP id x6mr7771419plo.163.1584017305669;
        Thu, 12 Mar 2020 05:48:25 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ce13sm9017840pjb.1.2020.03.12.05.48.23
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 05:48:24 -0700 (PDT)
Message-ID: <5e6a2f98.1c69fb81.80112.bfcc@mx.google.com>
Date:   Thu, 12 Mar 2020 05:48:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200312
X-Kernelci-Report-Type: build
Subject: next/master build: 329 builds: 23 failed, 306 passed, 69 errors,
 1191 warnings (next-20200312)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 329 builds: 23 failed, 306 passed, 69 errors, 1191 warni=
ngs (next-20200312)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200312/

Tree: next
Branch: master
Git Describe: next-20200312
Git Commit: 407b0a62b422526e943e1261c7939b2e52ee17cb
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
    cm_x300_defconfig: (clang-9) FAIL
    em_x270_defconfig: (clang-9) FAIL
    eseries_pxa_defconfig: (clang-9) FAIL
    pxa_defconfig: (clang-9) FAIL
    rpc_defconfig: (clang-9) FAIL
    vf610m4_defconfig: (clang-9) FAIL
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
    axs103_defconfig (gcc-8): 2 warnings
    axs103_smp_defconfig (gcc-8): 2 warnings
    haps_hs_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    hsdk_defconfig (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 2 warnings
    vdk_hs38_defconfig (gcc-8): 2 warnings
    vdk_hs38_smp_defconfig (gcc-8): 2 warnings

arm64:
    allmodconfig (clang-9): 3 errors, 3 warnings
    allmodconfig (gcc-8): 3 errors, 2 warnings
    allnoconfig (gcc-8): 1 warning
    defconfig (gcc-8): 3 errors, 1 warning
    defconfig (clang-9): 3 errors, 2 warnings
    defconfig (gcc-8): 3 errors, 1 warning
    defconfig (gcc-8): 3 errors, 1 warning
    defconfig (gcc-8): 3 errors, 1 warning
    tinyconfig (gcc-8): 1 warning

arm:
    allmodconfig (clang-9): 37 warnings
    allmodconfig (gcc-8): 24 warnings
    allnoconfig (gcc-8): 2 warnings
    am200epdkit_defconfig (clang-9): 6 warnings
    am200epdkit_defconfig (gcc-8): 2 warnings
    aspeed_g4_defconfig (gcc-8): 6 warnings
    aspeed_g4_defconfig (clang-9): 9 warnings
    aspeed_g5_defconfig (gcc-8): 6 warnings
    aspeed_g5_defconfig (clang-9): 8 warnings
    assabet_defconfig (gcc-8): 2 warnings
    assabet_defconfig (clang-9): 5 warnings
    at91_dt_defconfig (gcc-8): 2 warnings
    at91_dt_defconfig (clang-9): 4 warnings
    axm55xx_defconfig (gcc-8): 1 warning
    axm55xx_defconfig (clang-9): 4 warnings
    badge4_defconfig (gcc-8): 2 warnings
    badge4_defconfig (clang-9): 5 warnings
    bcm2835_defconfig (gcc-8): 2 warnings
    bcm2835_defconfig (clang-9): 4 warnings
    cerfcube_defconfig (gcc-8): 2 warnings
    cerfcube_defconfig (clang-9): 5 warnings
    clps711x_defconfig (gcc-8): 2 warnings
    clps711x_defconfig (clang-9): 4 warnings
    cm_x2xx_defconfig (gcc-8): 2 warnings
    cm_x2xx_defconfig (clang-9): 5 warnings
    cm_x300_defconfig (clang-9): 1 error, 7 warnings
    cm_x300_defconfig (gcc-8): 1 error, 4 warnings
    cns3420vb_defconfig (clang-9): 4 warnings
    cns3420vb_defconfig (gcc-8): 2 warnings
    colibri_pxa270_defconfig (gcc-8): 2 warnings
    colibri_pxa270_defconfig (clang-9): 6 warnings
    colibri_pxa300_defconfig (gcc-8): 2 warnings
    colibri_pxa300_defconfig (clang-9): 5 warnings
    collie_defconfig (clang-9): 5 warnings
    collie_defconfig (gcc-8): 2 warnings
    corgi_defconfig (gcc-8): 2 warnings
    corgi_defconfig (clang-9): 6 warnings
    davinci_all_defconfig (gcc-8): 2 warnings
    davinci_all_defconfig (clang-9): 6 warnings
    dove_defconfig (clang-9): 4 warnings
    dove_defconfig (gcc-8): 2 warnings
    ebsa110_defconfig (gcc-8): 2 warnings
    ebsa110_defconfig (clang-9): 5 warnings
    efm32_defconfig (clang-9): 6 warnings
    efm32_defconfig (gcc-8): 2 warnings
    em_x270_defconfig (gcc-8): 1 error, 4 warnings
    em_x270_defconfig (clang-9): 1 error, 7 warnings
    ep93xx_defconfig (gcc-8): 2 warnings
    ep93xx_defconfig (clang-9): 5 warnings
    eseries_pxa_defconfig (gcc-8): 14 errors, 14 warnings
    eseries_pxa_defconfig (clang-9): 5 errors, 7 warnings
    exynos_defconfig (gcc-8): 2 warnings
    exynos_defconfig (clang-9): 6 warnings
    ezx_defconfig (gcc-8): 2 warnings
    ezx_defconfig (clang-9): 6 warnings
    footbridge_defconfig (gcc-8): 2 warnings
    footbridge_defconfig (clang-9): 5 warnings
    gemini_defconfig (gcc-8): 2 warnings
    gemini_defconfig (clang-9): 6 warnings
    h3600_defconfig (gcc-8): 2 warnings
    h3600_defconfig (clang-9): 6 warnings
    h5000_defconfig (clang-9): 5 warnings
    h5000_defconfig (gcc-8): 2 warnings
    hackkit_defconfig (clang-9): 5 warnings
    hackkit_defconfig (gcc-8): 2 warnings
    hisi_defconfig (clang-9): 6 warnings
    hisi_defconfig (gcc-8): 2 warnings
    imote2_defconfig (clang-9): 6 warnings
    imote2_defconfig (gcc-8): 2 warnings
    imx_v4_v5_defconfig (clang-9): 6 warnings
    imx_v4_v5_defconfig (gcc-8): 2 warnings
    imx_v6_v7_defconfig (gcc-8): 2 warnings
    imx_v6_v7_defconfig (clang-9): 4 warnings
    integrator_defconfig (clang-9): 6 warnings
    integrator_defconfig (gcc-8): 2 warnings
    iop32x_defconfig (gcc-8): 2 warnings
    iop32x_defconfig (clang-9): 5 warnings
    ixp4xx_defconfig (gcc-8): 2 warnings
    ixp4xx_defconfig (clang-9): 5 warnings
    jornada720_defconfig (gcc-8): 2 warnings
    jornada720_defconfig (clang-9): 5 warnings
    keystone_defconfig (clang-9): 4 warnings
    keystone_defconfig (gcc-8): 1 warning
    lart_defconfig (gcc-8): 2 warnings
    lart_defconfig (clang-9): 5 warnings
    lpc18xx_defconfig (gcc-8): 2 warnings
    lpc18xx_defconfig (clang-9): 6 warnings
    lpc32xx_defconfig (gcc-8): 2 warnings
    lpc32xx_defconfig (clang-9): 6 warnings
    lpd270_defconfig (gcc-8): 2 warnings
    lpd270_defconfig (clang-9): 5 warnings
    lubbock_defconfig (clang-9): 5 warnings
    lubbock_defconfig (gcc-8): 2 warnings
    magician_defconfig (gcc-8): 2 warnings
    magician_defconfig (clang-9): 6 warnings
    mainstone_defconfig (gcc-8): 2 warnings
    mainstone_defconfig (clang-9): 5 warnings
    milbeaut_m10v_defconfig (gcc-8): 2 warnings
    milbeaut_m10v_defconfig (clang-9): 6 warnings
    mini2440_defconfig (gcc-8): 2 warnings
    mini2440_defconfig (clang-9): 5 warnings
    mmp2_defconfig (clang-9): 6 warnings
    mmp2_defconfig (gcc-8): 2 warnings
    moxart_defconfig (clang-9): 6 warnings
    moxart_defconfig (gcc-8): 2 warnings
    mps2_defconfig (gcc-8): 2 warnings
    mps2_defconfig (clang-9): 4 warnings
    multi_v4t_defconfig (clang-9): 5 warnings
    multi_v4t_defconfig (gcc-8): 2 warnings
    multi_v5_defconfig (gcc-8): 6 warnings
    multi_v5_defconfig (clang-9): 10 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (clang-9): 10 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 5 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 7 warnings
    mv78xx0_defconfig (gcc-8): 2 warnings
    mv78xx0_defconfig (clang-9): 6 warnings
    mvebu_v5_defconfig (clang-9): 6 warnings
    mvebu_v5_defconfig (gcc-8): 2 warnings
    mvebu_v7_defconfig (gcc-8): 2 warnings
    mvebu_v7_defconfig (clang-9): 4 warnings
    mxs_defconfig (clang-9): 5 warnings
    mxs_defconfig (gcc-8): 2 warnings
    neponset_defconfig (clang-9): 5 warnings
    neponset_defconfig (gcc-8): 2 warnings
    netwinder_defconfig (gcc-8): 2 warnings
    netwinder_defconfig (clang-9): 5 warnings
    nhk8815_defconfig (gcc-8): 2 warnings
    nhk8815_defconfig (clang-9): 6 warnings
    omap1_defconfig (gcc-8): 2 warnings
    omap1_defconfig (clang-9): 9 warnings
    omap2plus_defconfig (gcc-8): 2 warnings
    omap2plus_defconfig (clang-9): 4 warnings
    orion5x_defconfig (gcc-8): 2 warnings
    orion5x_defconfig (clang-9): 6 warnings
    oxnas_v6_defconfig (gcc-8): 2 warnings
    oxnas_v6_defconfig (clang-9): 6 warnings
    palmz72_defconfig (clang-9): 6 warnings
    palmz72_defconfig (gcc-8): 2 warnings
    pcm027_defconfig (clang-9): 6 warnings
    pcm027_defconfig (gcc-8): 2 warnings
    pleb_defconfig (gcc-8): 2 warnings
    pleb_defconfig (clang-9): 5 warnings
    prima2_defconfig (gcc-8): 2 warnings
    prima2_defconfig (clang-9): 6 warnings
    pxa168_defconfig (clang-9): 6 warnings
    pxa168_defconfig (gcc-8): 2 warnings
    pxa255-idp_defconfig (gcc-8): 2 warnings
    pxa255-idp_defconfig (clang-9): 5 warnings
    pxa3xx_defconfig (gcc-8): 2 warnings
    pxa3xx_defconfig (clang-9): 6 warnings
    pxa910_defconfig (clang-9): 6 warnings
    pxa910_defconfig (gcc-8): 2 warnings
    pxa_defconfig (clang-9): 1 error, 12 warnings
    pxa_defconfig (gcc-8): 3 errors, 8 warnings
    qcom_defconfig (clang-9): 6 warnings
    qcom_defconfig (gcc-8): 2 warnings
    realview_defconfig (gcc-8): 2 warnings
    realview_defconfig (clang-9): 4 warnings
    rpc_defconfig (clang-9): 10 errors
    rpc_defconfig (gcc-8): 2 warnings
    s3c2410_defconfig (gcc-8): 2 warnings
    s3c2410_defconfig (clang-9): 5 warnings
    s3c6400_defconfig (clang-9): 4 warnings
    s3c6400_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (clang-9): 6 warnings
    sama5_defconfig (clang-9): 4 warnings
    sama5_defconfig (gcc-8): 2 warnings
    shannon_defconfig (clang-9): 5 warnings
    shannon_defconfig (gcc-8): 2 warnings
    shmobile_defconfig (gcc-8): 2 warnings
    shmobile_defconfig (clang-9): 4 warnings
    simpad_defconfig (clang-9): 6 warnings
    simpad_defconfig (gcc-8): 2 warnings
    socfpga_defconfig (gcc-8): 2 warnings
    socfpga_defconfig (clang-9): 4 warnings
    spear13xx_defconfig (clang-9): 4 warnings
    spear13xx_defconfig (gcc-8): 2 warnings
    spear3xx_defconfig (gcc-8): 2 warnings
    spear3xx_defconfig (clang-9): 5 warnings
    spear6xx_defconfig (gcc-8): 2 warnings
    spear6xx_defconfig (clang-9): 5 warnings
    spitz_defconfig (gcc-8): 2 warnings
    spitz_defconfig (clang-9): 6 warnings
    stm32_defconfig (gcc-8): 2 warnings
    stm32_defconfig (clang-9): 6 warnings
    sunxi_defconfig (clang-9): 4 warnings
    sunxi_defconfig (gcc-8): 2 warnings
    tango4_defconfig (gcc-8): 2 warnings
    tango4_defconfig (clang-9): 6 warnings
    tct_hammer_defconfig (gcc-8): 2 warnings
    tct_hammer_defconfig (clang-9): 5 warnings
    tegra_defconfig (clang-9): 6 warnings
    tegra_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 2 warnings
    trizeps4_defconfig (gcc-8): 2 warnings
    trizeps4_defconfig (clang-9): 6 warnings
    u300_defconfig (gcc-8): 2 warnings
    u300_defconfig (clang-9): 6 warnings
    u8500_defconfig (gcc-8): 2 warnings
    u8500_defconfig (clang-9): 4 warnings
    versatile_defconfig (gcc-8): 2 warnings
    versatile_defconfig (clang-9): 5 warnings
    vexpress_defconfig (gcc-8): 2 warnings
    vexpress_defconfig (clang-9): 4 warnings
    vf610m4_defconfig (gcc-8): 4 errors, 7 warnings
    vf610m4_defconfig (clang-9): 2 errors, 4 warnings
    viper_defconfig (gcc-8): 2 warnings
    viper_defconfig (clang-9): 5 warnings
    vt8500_v6_v7_defconfig (gcc-8): 2 warnings
    vt8500_v6_v7_defconfig (clang-9): 4 warnings
    xcep_defconfig (clang-9): 5 warnings
    xcep_defconfig (gcc-8): 2 warnings
    zeus_defconfig (gcc-8): 2 warnings
    zeus_defconfig (clang-9): 5 warnings
    zx_defconfig (clang-9): 6 warnings
    zx_defconfig (gcc-8): 2 warnings

i386:
    allnoconfig (gcc-8): 1 warning
    i386_defconfig (gcc-8): 1 warning
    i386_defconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 1 warning

mips:
    32r2el_defconfig (gcc-8): 4 warnings
    32r2el_defconfig (gcc-8): 5 warnings
    allnoconfig (gcc-8): 2 warnings
    ar7_defconfig (gcc-8): 3 warnings
    ath25_defconfig (gcc-8): 3 warnings
    ath79_defconfig (gcc-8): 3 warnings
    bcm47xx_defconfig (gcc-8): 3 warnings
    bcm63xx_defconfig (gcc-8): 2 warnings
    bigsur_defconfig (gcc-8): 3 warnings
    bmips_be_defconfig (gcc-8): 2 warnings
    bmips_stb_defconfig (gcc-8): 2 warnings
    capcella_defconfig (gcc-8): 3 warnings
    cavium_octeon_defconfig (gcc-8): 5 warnings
    ci20_defconfig (gcc-8): 2 warnings
    cobalt_defconfig (gcc-8): 3 warnings
    cu1000-neo_defconfig (gcc-8): 2 warnings
    db1xxx_defconfig (gcc-8): 2 warnings
    decstation_64_defconfig (gcc-8): 5 warnings
    decstation_defconfig (gcc-8): 3 warnings
    decstation_r4k_defconfig (gcc-8): 3 warnings
    e55_defconfig (gcc-8): 3 warnings
    fuloong2e_defconfig (gcc-8): 3 warnings
    gcw0_defconfig (gcc-8): 2 warnings
    gpr_defconfig (gcc-8): 3 warnings
    ip22_defconfig (gcc-8): 3 warnings
    ip27_defconfig (gcc-8): 2 errors, 2 warnings
    ip28_defconfig (gcc-8): 3 warnings
    ip32_defconfig (gcc-8): 3 warnings
    jazz_defconfig (gcc-8): 3 warnings
    jmr3927_defconfig (gcc-8): 2 warnings
    lasat_defconfig (gcc-8): 2 warnings
    lemote2f_defconfig (gcc-8): 3 warnings
    loongson1b_defconfig (gcc-8): 3 warnings
    loongson1c_defconfig (gcc-8): 3 warnings
    loongson3_defconfig (gcc-8): 2 warnings
    malta_defconfig (gcc-8): 3 warnings
    malta_kvm_defconfig (gcc-8): 3 warnings
    malta_kvm_guest_defconfig (gcc-8): 3 warnings
    malta_qemu_32r6_defconfig (gcc-8): 4 warnings
    maltaaprp_defconfig (gcc-8): 3 warnings
    maltasmvp_defconfig (gcc-8): 3 warnings
    maltasmvp_eva_defconfig (gcc-8): 3 warnings
    maltaup_defconfig (gcc-8): 3 warnings
    maltaup_xpa_defconfig (gcc-8): 3 warnings
    markeins_defconfig (gcc-8): 3 warnings
    mips_paravirt_defconfig (gcc-8): 5 warnings
    mpc30x_defconfig (gcc-8): 3 warnings
    msp71xx_defconfig (gcc-8): 3 warnings
    mtx1_defconfig (gcc-8): 1 error, 2 warnings
    nlm_xlp_defconfig (gcc-8): 3 warnings
    nlm_xlr_defconfig (gcc-8): 3 warnings
    omega2p_defconfig (gcc-8): 2 warnings
    pic32mzda_defconfig (gcc-8): 3 warnings
    pistachio_defconfig (gcc-8): 3 warnings
    pnx8335_stb225_defconfig (gcc-8): 3 warnings
    qi_lb60_defconfig (gcc-8): 3 warnings
    rb532_defconfig (gcc-8): 3 warnings
    rbtx49xx_defconfig (gcc-8): 3 warnings
    rm200_defconfig (gcc-8): 3 warnings
    rt305x_defconfig (gcc-8): 3 warnings
    sb1250_swarm_defconfig (gcc-8): 3 warnings
    tb0219_defconfig (gcc-8): 3 warnings
    tb0226_defconfig (gcc-8): 3 warnings
    tb0287_defconfig (gcc-8): 3 warnings
    tinyconfig (gcc-8): 2 warnings
    vocore2_defconfig (gcc-8): 2 warnings
    workpad_defconfig (gcc-8): 3 warnings
    xway_defconfig (gcc-8): 3 warnings

riscv:
    allnoconfig (gcc-8): 1 error
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 2 warnings
    nommu_virt_defconfig (gcc-8): 2 warnings
    rv32_defconfig (gcc-8): 8 warnings
    tinyconfig (gcc-8): 1 error, 1 warning

x86_64:
    allmodconfig (gcc-8): 1 warning
    allmodconfig (clang-9): 12 warnings
    allnoconfig (gcc-8): 1 warning
    allnoconfig (clang-9): 2 warnings
    tinyconfig (gcc-8): 2 warnings

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
    5    ERROR: modpost: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.=
ko] undefined!
    3    clang: error: assembler command failed with exit code 1 (use -v to=
 see invocation)
    2    drivers/net/ipa/gsi.c:710:16: error: implicit declaration of funct=
ion 'field_max' [-Werror,-Wimplicit-function-declaration]
    2    drivers/net/ipa/gsi.c:223:39: error: implicit declaration of funct=
ion 'field_max' [-Werror,-Wimplicit-function-declaration]
    2    drivers/net/ipa/gsi.c:220:39: error: implicit declaration of funct=
ion 'field_max' [-Werror,-Wimplicit-function-declaration]
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
    1    ERROR: modpost: "sysrq_mask" [drivers/tty/serial/serial_core.ko] u=
ndefined!
    1    ERROR: modpost: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9713.=
ko] undefined!
    1    ERROR: modpost: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9705.=
ko] undefined!
    1    /tmp/main-6967ba.s:1469: Error: selected processor does not suppor=
t `strh r0,[r1]' in ARM mode
    1    /tmp/main-6967ba.s:1466: Error: selected processor does not suppor=
t `ldrh r0,[r0]' in ARM mode
    1    /tmp/elf-f61197.s:49: Error: selected processor does not support `=
ldrh r2,[r0,#18]' in ARM mode
    1    /tmp/do_mounts_rd-381c73.s:529: Error: selected processor does not=
 support `ldrh r0,[r5,#56]' in ARM mode
    1    /tmp/do_mounts_rd-381c73.s:525: Error: selected processor does not=
 support `ldrh r1,[r5,#2]' in ARM mode
    1    /tmp/do_mounts_rd-381c73.s:524: Error: selected processor does not=
 support `ldrh r0,[r5,#10]' in ARM mode
    1    /tmp/do_mounts_rd-381c73.s:510: Error: selected processor does not=
 support `ldrh r0,[r5,#16]' in ARM mode

Warnings summary:

    269  1 warning generated.
    204  drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_se=
condary=E2=80=99 defined but not used [-Wunused-function]
    127  mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defi=
ned but not used [-Wunused-function]
    123  <stdin>:1520:2: warning: #warning syscall process_madvise not impl=
emented [-Wcpp]
    107  drivers/char/random.c:820:13: warning: unused function 'crng_initi=
alize_secondary' [-Wunused-function]
    104  mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wu=
nused-function]
    47   kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_ta=
sks_gp_func_t' is a C11 feature [-Wtypedef-redefinition]
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
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    6    cc1: some warnings being treated as errors
    6    WARNING: modpost: "rcu_tasks_rude_wait_gp" [vmlinux] is a static E=
XPORT_SYMBOL_GPL
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    4    WARNING: unmet direct dependencies detected for SND_SOC_WM9713
    4    WARNING: unmet direct dependencies detected for SND_SOC_WM9705
    3    fs/hugetlbfs/inode.c:463:5: warning: =E2=80=98index=E2=80=99 may b=
e used uninitialized in this function [-Wmaybe-uninitialized]
    3    fs/hugetlbfs/inode.c:460:44: warning: =E2=80=98hash=E2=80=99 may b=
e used uninitialized in this function [-Wmaybe-uninitialized]
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
    1    mm/kasan/common.o: warning: objtool: kasan_report()+0x87: call to =
__stack_chk_fail() with UACCESS enabled
    1    include/linux/kernel.h:47:25: warning: excess elements in struct i=
nitializer
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
    1    cc1: all warnings being treated as errors
    1    arch/x86/kernel/signal.o: warning: objtool: x32_setup_rt_frame()+0=
x1fa: call to memset() with UACCESS enabled
    1    arch/x86/kernel/signal.o: warning: objtool: __setup_rt_frame()+0x1=
f8: call to memset() with UACCESS enabled
    1    arch/x86/ia32/ia32_signal.o: warning: objtool: ia32_setup_rt_frame=
()+0x1ef: call to memset() with UACCESS enabled
    1    arch/arm/mach-omap1/pm.c:656:11: warning: variable 'irq' is used u=
ninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1    arch/arm/mach-omap1/pm.c:611:9: note: initialize the variable 'irq=
' to silence this warning
    1    2 warnings generated.
    1    /tmp/test-arm-229bf8.s:18788: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-229bf8.s:18713: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/futex-fd51ad.s:23093: Warning: source register same as write-=
back base
    1    /tmp/futex-f08fa3.s:7500: Warning: source register same as write-b=
ack base
    1    /tmp/futex-eb9962.s:23032: Warning: source register same as write-=
back base
    1    /tmp/futex-eb29bb.s:22674: Warning: source register same as write-=
back base
    1    /tmp/futex-e7e72b.s:7479: Warning: source register same as write-b=
ack base
    1    /tmp/futex-e2bfda.s:7424: Warning: source register same as write-b=
ack base
    1    /tmp/futex-d30997.s:23093: Warning: source register same as write-=
back base
    1    /tmp/futex-c4aaa4.s:23060: Warning: source register same as write-=
back base
    1    /tmp/futex-c1b853.s:7632: Warning: source register same as write-b=
ack base
    1    /tmp/futex-bd78bf.s:22674: Warning: source register same as write-=
back base
    1    /tmp/futex-b46f3e.s:7458: Warning: source register same as write-b=
ack base
    1    /tmp/futex-a89b95.s:23032: Warning: source register same as write-=
back base
    1    /tmp/futex-9d7fe5.s:7474: Warning: source register same as write-b=
ack base
    1    /tmp/futex-973333.s:7390: Warning: source register same as write-b=
ack base
    1    /tmp/futex-936f0b.s:7500: Warning: source register same as write-b=
ack base
    1    /tmp/futex-8b3358.s:7446: Warning: source register same as write-b=
ack base
    1    /tmp/futex-84cc0b.s:7500: Warning: source register same as write-b=
ack base
    1    /tmp/futex-82a2a1.s:7472: Warning: source register same as write-b=
ack base
    1    /tmp/futex-6796b0.s:7389: Warning: source register same as write-b=
ack base
    1    /tmp/futex-632b72.s:23032: Warning: source register same as write-=
back base
    1    /tmp/futex-60a24f.s:7451: Warning: source register same as write-b=
ack base
    1    /tmp/futex-5f6db1.s:7500: Warning: source register same as write-b=
ack base
    1    /tmp/futex-5f55e7.s:7500: Warning: source register same as write-b=
ack base
    1    /tmp/futex-5b7694.s:7500: Warning: source register same as write-b=
ack base
    1    /tmp/futex-5381ff.s:7472: Warning: source register same as write-b=
ack base
    1    /tmp/futex-531259.s:7474: Warning: source register same as write-b=
ack base
    1    /tmp/futex-4b1001.s:7474: Warning: source register same as write-b=
ack base
    1    /tmp/futex-47f9d3.s:7495: Warning: source register same as write-b=
ack base
    1    /tmp/futex-471371.s:7474: Warning: source register same as write-b=
ack base
    1    /tmp/futex-4473c9.s:7446: Warning: source register same as write-b=
ack base
    1    /tmp/futex-3c0e4b.s:23638: Warning: source register same as write-=
back base
    1    /tmp/futex-1b7a57.s:23032: Warning: source register same as write-=
back base
    1    /tmp/futex-13b431.s:7484: Warning: source register same as write-b=
ack base
    1    /tmp/futex-11b7af.s:7446: Warning: source register same as write-b=
ack base
    1    /tmp/futex-114fc5.s:7472: Warning: source register same as write-b=
ack base
    1    /tmp/futex-0e19d7.s:7475: Warning: source register same as write-b=
ack base
    1    /tmp/futex-0c4be9.s:23208: Warning: source register same as write-=
back base
    1    /tmp/futex-036f80.s:22972: Warning: source register same as write-=
back base
    1    /tmp/ccdE93dw.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccdE93dw.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1164:warning: override: UNWINDER_GUESS changes choice state

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text.unlikely+0x39dc): Section mismat=
ch in reference from the function pmax_setup_memory_region() to the functio=
n .init.text:add_memory_region()
    1    WARNING: modpost: vmlinux.o(.text.unlikely+0x3684): Section mismat=
ch in reference from the function pmax_setup_memory_region() to the functio=
n .init.text:add_memory_region()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnin=
gs, 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: modpost: "rcu_tasks_rude_wait_gp" [vmlinux] is a static EXPORT=
_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-9) =E2=80=94 FAIL, 3 errors, 3 warnings, 0 secti=
on mismatches

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
    WARNING: modpost: "rcu_tasks_rude_wait_gp" [vmlinux] is a static EXPORT=
_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 37 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    security/integrity/ima/ima_crypto.c:512:5: warning: stack frame size of=
 1152 bytes in function 'ima_calc_field_array_hash' [-Wframe-larger-than=3D]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    WARNING: modpost: "rcu_tasks_rude_wait_gp" [vmlinux] is a static EXPORT=
_SYMBOL_GPL
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    /tmp/test-arm-229bf8.s:18713: Warning: using r15 results in unpredictab=
le behaviour
    /tmp/test-arm-229bf8.s:18788: Warning: using r15 results in unpredictab=
le behaviour
    drivers/crypto/inside-secure/safexcel_cipher.c:404:12: warning: stack f=
rame size of 1136 bytes in function 'safexcel_aead_setkey' [-Wframe-larger-=
than=3D]
    1 warning generated.
    sound/soc/codecs/cros_ec_codec.c:776:12: warning: stack frame size of 1=
152 bytes in function 'wov_hotword_model_put' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/soc/fsl/dpio/dpio-service.c:476:5: warning: stack frame size of=
 1072 bytes in function 'dpaa2_io_service_enqueue_multiple_desc_fq' [-Wfram=
e-larger-than=3D]
    1 warning generated.
    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size of 1=
824 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-larger-=
than=3D]
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
    arch/x86/ia32/ia32_signal.o: warning: objtool: ia32_setup_rt_frame()+0x=
1ef: call to memset() with UACCESS enabled
    mm/kasan/common.o: warning: objtool: kasan_report()+0x87: call to __sta=
ck_chk_fail() with UACCESS enabled
    arch/x86/kernel/signal.o: warning: objtool: x32_setup_rt_frame()+0x1fa:=
 call to memset() with UACCESS enabled
    arch/x86/kernel/signal.o: warning: objtool: __setup_rt_frame()+0x1f8: c=
all to memset() with UACCESS enabled
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
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
    WARNING: modpost: "rcu_tasks_rude_wait_gp" [vmlinux] is a static EXPORT=
_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 3 errors, 2 warnings, 0 section=
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

Warnings:
    WARNING: modpost: "rcu_tasks_rude_wait_gp" [vmlinux] is a static EXPORT=
_SYMBOL_GPL
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 24 warnings, 0 section =
mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    WARNING: modpost: "rcu_tasks_rude_wait_gp" [vmlinux] is a static EXPORT=
_SYMBOL_GPL
    /tmp/ccdE93dw.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccdE93dw.s:18191: Warning: using r15 results in unpredictable beha=
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
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
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
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
am200epdkit_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, =
0 section mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
aspeed_g4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 9 warnings, 0 =
section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-036f80.s:22972: Warning: source register same as write-back =
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
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
aspeed_g5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 8 warnings, 0 =
section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
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
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-5f6db1.s:7500: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
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
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
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
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    /tmp/futex-c4aaa4.s:23060: Warning: source register same as write-back =
base

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

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
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
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
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    fs/hugetlbfs/inode.c:460:44: warning: =E2=80=98hash=E2=80=99 may be use=
d uninitialized in this function [-Wmaybe-uninitialized]
    fs/hugetlbfs/inode.c:463:5: warning: =E2=80=98index=E2=80=99 may be use=
d uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-936f0b.s:7500: Warning: source register same as write-back b=
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
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-8b3358.s:7446: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 7 warnings, 0 sec=
tion mismatches

Errors:
    ERROR: modpost: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] u=
ndefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-c1b853.s:7632: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 4 warnings, 0 secti=
on mismatches

Errors:
    ERROR: modpost: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] u=
ndefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
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
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warning=
s, 0 section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warning=
s, 0 section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-0c4be9.s:23208: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-60a24f.s:7451: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

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
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, =
0 section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    fs/hugetlbfs/inode.c:460:44: warning: =E2=80=98hash=E2=80=99 may be use=
d uninitialized in this function [-Wmaybe-uninitialized]
    fs/hugetlbfs/inode.c:463:5: warning: =E2=80=98index=E2=80=99 may be use=
d uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

Section mismatches:
    WARNING: modpost: vmlinux.o(.text.unlikely+0x39dc): Section mismatch in=
 reference from the function pmax_setup_memory_region() to the function .in=
it.text:add_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

Section mismatches:
    WARNING: modpost: vmlinux.o(.text.unlikely+0x3684): Section mismatch in=
 reference from the function pmax_setup_memory_region() to the function .in=
it.text:add_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 FAIL, 3 errors, 1 warning, 0 section mis=
matches

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
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-9) =E2=80=94 FAIL, 3 errors, 2 warnings, 0 section =
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

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 FAIL, 3 errors=
, 1 warning, 0 section mismatches

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
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 FAIL, 3 errors=
, 1 warning, 0 section mismatches

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
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 FAIL, 3 errors, 1 warning, 0 s=
ection mismatches

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
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-114fc5.s:7472: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 4 warnings, 0 secti=
on mismatches

Errors:
    ERROR: modpost: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] u=
ndefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 7 warnings, 0 sec=
tion mismatches

Errors:
    ERROR: modpost: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] u=
ndefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-11b7af.s:7446: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-973333.s:7390: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

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
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
eseries_pxa_defconfig (arm, clang-9) =E2=80=94 FAIL, 5 errors, 7 warnings, =
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
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-471371.s:7474: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-5381ff.s:7472: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
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
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-4473c9.s:7446: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-6796b0.s:7389: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 wa=
rnings, 0 section mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0=
 section mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-4b1001.s:7474: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
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
ip27_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sectio=
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

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
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
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
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
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-0e19d7.s:7475: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
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
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-5b7694.s:7500: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-84cc0b.s:7500: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
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
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-a89b95.s:23032: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-632b72.s:23032: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-eb9962.s:23032: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
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
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
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
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    {standard input}:141: Warning: macro instruction expanded into multiple=
 instructions
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
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
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
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
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
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
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
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
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings=
, 0 section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
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
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-d30997.s:23093: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    fs/hugetlbfs/inode.c:460:44: warning: =E2=80=98hash=E2=80=99 may be use=
d uninitialized in this function [-Wmaybe-uninitialized]
    fs/hugetlbfs/inode.c:463:5: warning: =E2=80=98index=E2=80=99 may be use=
d uninitialized in this function [-Wmaybe-uninitialized]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
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
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
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
mtx1_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 2 warnings, 0 section=
 mismatches

Errors:
    ERROR: modpost: "sysrq_mask" [drivers/tty/serial/serial_core.ko] undefi=
ned!

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-47f9d3.s:7495: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
multi_v5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 10 warnings, 0 =
section mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
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
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
multi_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 10 warnings, 0 =
section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
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
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
=94 PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
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
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-3c0e4b.s:23638: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-5f55e7.s:7500: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-82a2a1.s:7472: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
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
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
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
nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 9 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mach-omap1/pm.c:656:11: warning: variable 'irq' is used uninit=
ialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    arch/arm/mach-omap1/pm.c:611:9: note: initialize the variable 'irq' to =
silence this warning
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
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
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    drivers/firmware/efi/libstub/file.c:123:21: warning: stack frame size o=
f 1232 bytes in function 'handle_cmdline_files' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-13b431.s:7484: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-1b7a57.s:23032: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 12 warnings, 0 sectio=
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
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 8 warnings, 0 section =
mismatches

Errors:
    ERROR: modpost: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9713.ko] u=
ndefined!
    ERROR: modpost: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] u=
ndefined!
    ERROR: modpost: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9705.ko] u=
ndefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9705
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9713
    WARNING: unmet direct dependencies detected for SND_SOC_WM9705
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9713
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
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
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
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
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
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
rpc_defconfig (arm, clang-9) =E2=80=94 FAIL, 10 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    /tmp/elf-f61197.s:49: Error: selected processor does not support `ldrh =
r2,[r0,#18]' in ARM mode
    clang: error: assembler command failed with exit code 1 (use -v to see =
invocation)
    /tmp/main-6967ba.s:1466: Error: selected processor does not support `ld=
rh r0,[r0]' in ARM mode
    /tmp/main-6967ba.s:1469: Error: selected processor does not support `st=
rh r0,[r1]' in ARM mode
    clang: error: assembler command failed with exit code 1 (use -v to see =
invocation)
    /tmp/do_mounts_rd-381c73.s:510: Error: selected processor does not supp=
ort `ldrh r0,[r5,#16]' in ARM mode
    /tmp/do_mounts_rd-381c73.s:524: Error: selected processor does not supp=
ort `ldrh r0,[r5,#10]' in ARM mode
    /tmp/do_mounts_rd-381c73.s:525: Error: selected processor does not supp=
ort `ldrh r1,[r5,#2]' in ARM mode
    /tmp/do_mounts_rd-381c73.s:529: Error: selected processor does not supp=
ort `ldrh r0,[r5,#56]' in ARM mode
    clang: error: assembler command failed with exit code 1 (use -v to see =
invocation)

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

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
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-fd51ad.s:23093: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, =
0 section mismatches

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-f08fa3.s:7500: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-eb29bb.s:22674: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-bd78bf.s:22674: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
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
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
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
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
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
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-e7e72b.s:7479: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mis=
matches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
tinyconfig (riscv, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mis=
matches

Errors:
    arch/riscv/kernel/stacktrace.c:78:8: error: =E2=80=98sp_in_global=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98spin_loc=
k=E2=80=99?

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mis=
matches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    .config:1164:warning: override: UNWINDER_GUESS changes choice state
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-9d7fe5.s:7474: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
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
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
vf610m4_defconfig (arm, clang-9) =E2=80=94 FAIL, 2 errors, 4 warnings, 0 se=
ction mismatches

Errors:
    drivers/clocksource/timer-vf-pit.c:131:2: error: unterminated function-=
like macro invocation
    drivers/clocksource/timer-vf-pit.c:194:58: error: expected '}'

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-b46f3e.s:7458: Warning: source register same as write-back b=
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
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
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
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-9) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, clang-9) =E2=80=94 FAIL, 0 errors, 0 wa=
rnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-e2bfda.s:7424: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
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
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    /tmp/futex-531259.s:7474: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 section=
 mismatches

Warnings:
    mm/gup.c:119:13: warning: unused function 'put_compound_head' [-Wunused=
-function]
    1 warning generated.
    kernel/rcu/tasks.h:24:16: warning: redefinition of typedef 'rcu_tasks_g=
p_func_t' is a C11 feature [-Wtypedef-redefinition]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    mm/gup.c:119:13: warning: =E2=80=98put_compound_head=E2=80=99 defined b=
ut not used [-Wunused-function]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---
For more info write to <info@kernelci.org>
