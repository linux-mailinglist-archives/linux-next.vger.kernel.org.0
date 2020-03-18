Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B709189FD9
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 16:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgCRPik (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 11:38:40 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40324 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726877AbgCRPik (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Mar 2020 11:38:40 -0400
Received: by mail-pl1-f193.google.com with SMTP id h11so11339239plk.7
        for <linux-next@vger.kernel.org>; Wed, 18 Mar 2020 08:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2ucnwz/cWT1avB5+X7sV9D5ac0KeOaaG6n5CXe8S3nE=;
        b=tzJOwGcCKaYDgXYIwr0wpFS7df+//fMywI1bWHzjQK4hKdYk0tA15T5TZWunV6/uVq
         mQoq82ihC4TLch7DgjUbIxghx6M5pGxvjppl7d+E2WgfDso0MG7ppxY9nC8wYpwIs/KY
         Buv5YM1SPsTBZ8MK+qVRfgVaGskFuWAWG6Ae80M9dnPwUNg5Mv6/jR0HQHBRiFXYBezs
         iBkE2GpCugAJkeLV5FIfjzY/JTHCa3nE944MZR+CwAey9kzo3CuSKPTP7916xVwz1o1d
         +/smRZZ2U7uErxFgIQCkbKJpCD2LNVI3+pmoaRg8EhkHEzDzcqULZ6N0F4oumHICVTUg
         KXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2ucnwz/cWT1avB5+X7sV9D5ac0KeOaaG6n5CXe8S3nE=;
        b=uVcVo3o8ABqHNbjDNuThU2x/dEF2WrHAXuFe9dacfzTYOlyBe/SmFD8dQw8d1CB0Tj
         9JPqEHtJ9cUV6HR+TPm5YYWtgD7l2lBACbau+GNr7f0LJsKKnEml+TAah1mVpn66MvfA
         j4CA1LiynAgZzzZ6FfOy47WB1+CEt+ZUnHo/OAGZm053fH8RIbP0yF/X2HC9hO04ZDeG
         UvN25tC1GNE2CCF3LVxV0NfsgcC4VKhGTrf72BPhvZeK03oewy9wBjLvOwjgZVDrhPto
         rhepJ/RSORrC6tw3CKtj2ncTaHlcDSvUeghHgEoyXG+R00MfzWY101cHv5sA6Y02XNlJ
         GqEw==
X-Gm-Message-State: ANhLgQ2QE7TvGhdACzJvfmucNQfbn7ywJZno3HvwiPwDKBjodgzjTgo6
        9+PeJLgJIKQ4eh7ZC1oIkv27WwisriE=
X-Google-Smtp-Source: ADFU+vvyV1sTkBDuCi1/8D2GjeQSZgSxFsHwvU6pP4Xk6ogQlqqWjNeOx+0En3lK2NVxcyMOw7OrGw==
X-Received: by 2002:a17:90a:36c7:: with SMTP id t65mr5009615pjb.182.1584545911683;
        Wed, 18 Mar 2020 08:38:31 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d6sm2963229pjz.39.2020.03.18.08.38.30
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 08:38:30 -0700 (PDT)
Message-ID: <5e724076.1c69fb81.62c81.a8e5@mx.google.com>
Date:   Wed, 18 Mar 2020 08:38:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200318
X-Kernelci-Report-Type: build
Subject: next/master build: 329 builds: 132 failed, 197 passed, 170 errors,
 950 warnings (next-20200318)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 329 builds: 132 failed, 197 passed, 170 errors, 950 warn=
ings (next-20200318)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200318/

Tree: next
Branch: master
Git Describe: next-20200318
Git Commit: 47780d7892b77e922bbe19b5dea99cde06b2f0e5
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arc:
    axs103_defconfig: (gcc-8) FAIL
    axs103_smp_defconfig: (gcc-8) FAIL
    haps_hs_defconfig: (gcc-8) FAIL
    haps_hs_smp_defconfig: (gcc-8) FAIL
    haps_hs_smp_defconfig+kselftest: (gcc-8) FAIL
    hsdk_defconfig: (gcc-8) FAIL
    nsimosci_hs_smp_defconfig: (gcc-8) FAIL
    vdk_hs38_defconfig: (gcc-8) FAIL
    vdk_hs38_smp_defconfig: (gcc-8) FAIL

arm64:
    allmodconfig: (clang-9) FAIL
    defconfig: (clang-9) FAIL
    allmodconfig: (gcc-8) FAIL
    allnoconfig: (gcc-8) FAIL
    defconfig: (gcc-8) FAIL
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy: (gcc-8) FAIL
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy: (gcc-8) FAIL
    defconfig+kselftest: (gcc-8) FAIL
    tinyconfig: (gcc-8) FAIL

arm:
    allmodconfig: (clang-9) FAIL
    am200epdkit_defconfig: (clang-9) FAIL
    axm55xx_defconfig: (clang-9) FAIL
    cm_x300_defconfig: (clang-9) FAIL
    colibri_pxa270_defconfig: (clang-9) FAIL
    corgi_defconfig: (clang-9) FAIL
    davinci_all_defconfig: (clang-9) FAIL
    efm32_defconfig: (clang-9) FAIL
    em_x270_defconfig: (clang-9) FAIL
    eseries_pxa_defconfig: (clang-9) FAIL
    exynos_defconfig: (clang-9) FAIL
    ezx_defconfig: (clang-9) FAIL
    gemini_defconfig: (clang-9) FAIL
    h3600_defconfig: (clang-9) FAIL
    hisi_defconfig: (clang-9) FAIL
    imote2_defconfig: (clang-9) FAIL
    imx_v4_v5_defconfig: (clang-9) FAIL
    integrator_defconfig: (clang-9) FAIL
    keystone_defconfig: (clang-9) FAIL
    lpc18xx_defconfig: (clang-9) FAIL
    lpc32xx_defconfig: (clang-9) FAIL
    magician_defconfig: (clang-9) FAIL
    mmp2_defconfig: (clang-9) FAIL
    moxart_defconfig: (clang-9) FAIL
    multi_v5_defconfig: (clang-9) FAIL
    mv78xx0_defconfig: (clang-9) FAIL
    mvebu_v5_defconfig: (clang-9) FAIL
    nhk8815_defconfig: (clang-9) FAIL
    omap1_defconfig: (clang-9) FAIL
    orion5x_defconfig: (clang-9) FAIL
    palmz72_defconfig: (clang-9) FAIL
    pcm027_defconfig: (clang-9) FAIL
    prima2_defconfig: (clang-9) FAIL
    pxa168_defconfig: (clang-9) FAIL
    pxa3xx_defconfig: (clang-9) FAIL
    pxa910_defconfig: (clang-9) FAIL
    pxa_defconfig: (clang-9) FAIL
    qcom_defconfig: (clang-9) FAIL
    rpc_defconfig: (clang-9) FAIL
    s5pv210_defconfig: (clang-9) FAIL
    simpad_defconfig: (clang-9) FAIL
    spitz_defconfig: (clang-9) FAIL
    stm32_defconfig: (clang-9) FAIL
    tango4_defconfig: (clang-9) FAIL
    tegra_defconfig: (clang-9) FAIL
    trizeps4_defconfig: (clang-9) FAIL
    u300_defconfig: (clang-9) FAIL
    vf610m4_defconfig: (clang-9) FAIL
    zx_defconfig: (clang-9) FAIL
    allmodconfig: (gcc-8) FAIL
    am200epdkit_defconfig: (gcc-8) FAIL
    axm55xx_defconfig: (gcc-8) FAIL
    cm_x300_defconfig: (gcc-8) FAIL
    colibri_pxa270_defconfig: (gcc-8) FAIL
    corgi_defconfig: (gcc-8) FAIL
    davinci_all_defconfig: (gcc-8) FAIL
    efm32_defconfig: (gcc-8) FAIL
    em_x270_defconfig: (gcc-8) FAIL
    eseries_pxa_defconfig: (gcc-8) FAIL
    exynos_defconfig: (gcc-8) FAIL
    ezx_defconfig: (gcc-8) FAIL
    gemini_defconfig: (gcc-8) FAIL
    h3600_defconfig: (gcc-8) FAIL
    hisi_defconfig: (gcc-8) FAIL
    imote2_defconfig: (gcc-8) FAIL
    imx_v4_v5_defconfig: (gcc-8) FAIL
    integrator_defconfig: (gcc-8) FAIL
    keystone_defconfig: (gcc-8) FAIL
    lpc18xx_defconfig: (gcc-8) FAIL
    lpc32xx_defconfig: (gcc-8) FAIL
    magician_defconfig: (gcc-8) FAIL
    mmp2_defconfig: (gcc-8) FAIL
    moxart_defconfig: (gcc-8) FAIL
    multi_v5_defconfig: (gcc-8) FAIL
    mv78xx0_defconfig: (gcc-8) FAIL
    mvebu_v5_defconfig: (gcc-8) FAIL
    nhk8815_defconfig: (gcc-8) FAIL
    omap1_defconfig: (gcc-8) FAIL
    orion5x_defconfig: (gcc-8) FAIL
    palmz72_defconfig: (gcc-8) FAIL
    pcm027_defconfig: (gcc-8) FAIL
    prima2_defconfig: (gcc-8) FAIL
    pxa168_defconfig: (gcc-8) FAIL
    pxa3xx_defconfig: (gcc-8) FAIL
    pxa910_defconfig: (gcc-8) FAIL
    pxa_defconfig: (gcc-8) FAIL
    qcom_defconfig: (gcc-8) FAIL
    s5pv210_defconfig: (gcc-8) FAIL
    simpad_defconfig: (gcc-8) FAIL
    spitz_defconfig: (gcc-8) FAIL
    stm32_defconfig: (gcc-8) FAIL
    tango4_defconfig: (gcc-8) FAIL
    tegra_defconfig: (gcc-8) FAIL
    trizeps4_defconfig: (gcc-8) FAIL
    u300_defconfig: (gcc-8) FAIL
    vf610m4_defconfig: (gcc-8) FAIL
    zx_defconfig: (gcc-8) FAIL

mips:
    cavium_octeon_defconfig: (gcc-8) FAIL
    ci20_defconfig: (gcc-8) FAIL
    cu1000-neo_defconfig: (gcc-8) FAIL
    ip27_defconfig: (gcc-8) FAIL
    lemote2f_defconfig: (gcc-8) FAIL
    loongson1b_defconfig: (gcc-8) FAIL
    loongson1c_defconfig: (gcc-8) FAIL
    loongson3_defconfig: (gcc-8) FAIL
    markeins_defconfig: (gcc-8) FAIL
    mips_paravirt_defconfig: (gcc-8) FAIL
    msp71xx_defconfig: (gcc-8) FAIL
    mtx1_defconfig: (gcc-8) FAIL
    omega2p_defconfig: (gcc-8) FAIL
    vocore2_defconfig: (gcc-8) FAIL

riscv:
    allnoconfig: (gcc-8) FAIL
    tinyconfig: (gcc-8) FAIL

x86_64:
    x86_64_defconfig+kvm_guest: (clang-9) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 1 error
    axs103_smp_defconfig (gcc-8): 1 error
    haps_hs_defconfig (gcc-8): 1 error
    haps_hs_smp_defconfig (gcc-8): 1 error
    haps_hs_smp_defconfig (gcc-8): 1 error
    hsdk_defconfig (gcc-8): 1 error
    nsimosci_hs_defconfig (gcc-8): 1 warning
    nsimosci_hs_smp_defconfig (gcc-8): 1 error
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 error
    vdk_hs38_smp_defconfig (gcc-8): 1 error

arm64:
    allmodconfig (clang-9): 4 errors, 3 warnings
    allmodconfig (gcc-8): 4 errors
    allnoconfig (gcc-8): 1 error
    defconfig (gcc-8): 1 error
    defconfig (clang-9): 1 error
    defconfig (gcc-8): 1 error
    defconfig (gcc-8): 1 error
    defconfig (gcc-8): 1 error
    tinyconfig (gcc-8): 1 error

arm:
    allmodconfig (clang-9): 4 errors, 29 warnings
    allmodconfig (gcc-8): 4 errors, 18 warnings
    allnoconfig (gcc-8): 1 warning
    am200epdkit_defconfig (clang-9): 1 error
    am200epdkit_defconfig (gcc-8): 1 error
    aspeed_g4_defconfig (clang-9): 7 warnings
    aspeed_g4_defconfig (gcc-8): 5 warnings
    aspeed_g5_defconfig (gcc-8): 5 warnings
    aspeed_g5_defconfig (clang-9): 6 warnings
    assabet_defconfig (clang-9): 3 warnings
    assabet_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (clang-9): 2 warnings
    at91_dt_defconfig (gcc-8): 1 warning
    axm55xx_defconfig (gcc-8): 1 error
    axm55xx_defconfig (clang-9): 1 error
    badge4_defconfig (gcc-8): 1 warning
    badge4_defconfig (clang-9): 3 warnings
    bcm2835_defconfig (gcc-8): 1 warning
    bcm2835_defconfig (clang-9): 2 warnings
    cerfcube_defconfig (clang-9): 3 warnings
    cerfcube_defconfig (gcc-8): 1 warning
    clps711x_defconfig (gcc-8): 1 warning
    clps711x_defconfig (clang-9): 2 warnings
    cm_x2xx_defconfig (clang-9): 3 warnings
    cm_x2xx_defconfig (gcc-8): 1 warning
    cm_x300_defconfig (clang-9): 1 error, 5 warnings
    cm_x300_defconfig (gcc-8): 1 error, 3 warnings
    cns3420vb_defconfig (gcc-8): 1 warning
    cns3420vb_defconfig (clang-9): 2 warnings
    colibri_pxa270_defconfig (clang-9): 1 error
    colibri_pxa270_defconfig (gcc-8): 1 error
    colibri_pxa300_defconfig (clang-9): 3 warnings
    colibri_pxa300_defconfig (gcc-8): 1 warning
    collie_defconfig (gcc-8): 1 warning
    collie_defconfig (clang-9): 3 warnings
    corgi_defconfig (gcc-8): 1 error
    corgi_defconfig (clang-9): 1 error
    davinci_all_defconfig (clang-9): 1 error
    davinci_all_defconfig (gcc-8): 1 error
    dove_defconfig (clang-9): 2 warnings
    dove_defconfig (gcc-8): 1 warning
    ebsa110_defconfig (gcc-8): 1 warning
    ebsa110_defconfig (clang-9): 3 warnings
    efm32_defconfig (gcc-8): 1 error
    efm32_defconfig (clang-9): 1 error
    em_x270_defconfig (clang-9): 1 error, 5 warnings
    em_x270_defconfig (gcc-8): 1 error, 3 warnings
    ep93xx_defconfig (gcc-8): 1 warning
    ep93xx_defconfig (clang-9): 3 warnings
    eseries_pxa_defconfig (clang-9): 5 errors, 5 warnings
    eseries_pxa_defconfig (gcc-8): 14 errors, 13 warnings
    exynos_defconfig (gcc-8): 1 error
    exynos_defconfig (clang-9): 1 error
    ezx_defconfig (clang-9): 1 error
    ezx_defconfig (gcc-8): 1 error
    footbridge_defconfig (gcc-8): 1 warning
    footbridge_defconfig (clang-9): 3 warnings
    gemini_defconfig (gcc-8): 1 error
    gemini_defconfig (clang-9): 1 error
    h3600_defconfig (clang-9): 1 error
    h3600_defconfig (gcc-8): 1 error
    h5000_defconfig (gcc-8): 1 warning
    h5000_defconfig (clang-9): 3 warnings
    hackkit_defconfig (gcc-8): 1 warning
    hackkit_defconfig (clang-9): 3 warnings
    hisi_defconfig (gcc-8): 1 error
    hisi_defconfig (clang-9): 1 error
    imote2_defconfig (gcc-8): 1 error
    imote2_defconfig (clang-9): 1 error
    imx_v4_v5_defconfig (gcc-8): 1 error
    imx_v4_v5_defconfig (clang-9): 1 error
    imx_v6_v7_defconfig (clang-9): 2 warnings
    imx_v6_v7_defconfig (gcc-8): 1 warning
    integrator_defconfig (gcc-8): 1 error
    integrator_defconfig (clang-9): 1 error
    iop32x_defconfig (clang-9): 3 warnings
    iop32x_defconfig (gcc-8): 1 warning
    ixp4xx_defconfig (gcc-8): 1 warning
    ixp4xx_defconfig (clang-9): 3 warnings
    jornada720_defconfig (gcc-8): 1 warning
    jornada720_defconfig (clang-9): 3 warnings
    keystone_defconfig (gcc-8): 1 error
    keystone_defconfig (clang-9): 1 error
    lart_defconfig (gcc-8): 1 warning
    lart_defconfig (clang-9): 3 warnings
    lpc18xx_defconfig (gcc-8): 1 error
    lpc18xx_defconfig (clang-9): 1 error
    lpc32xx_defconfig (gcc-8): 1 error
    lpc32xx_defconfig (clang-9): 1 error
    lpd270_defconfig (gcc-8): 1 warning
    lpd270_defconfig (clang-9): 3 warnings
    lubbock_defconfig (gcc-8): 1 warning
    lubbock_defconfig (clang-9): 3 warnings
    magician_defconfig (gcc-8): 1 error
    magician_defconfig (clang-9): 1 error
    mainstone_defconfig (gcc-8): 1 warning
    mainstone_defconfig (clang-9): 3 warnings
    milbeaut_m10v_defconfig (clang-9): 4 warnings
    milbeaut_m10v_defconfig (gcc-8): 1 warning
    mini2440_defconfig (clang-9): 3 warnings
    mini2440_defconfig (gcc-8): 1 warning
    mmp2_defconfig (gcc-8): 1 error
    mmp2_defconfig (clang-9): 1 error
    moxart_defconfig (clang-9): 1 error
    moxart_defconfig (gcc-8): 1 error
    mps2_defconfig (clang-9): 2 warnings
    mps2_defconfig (gcc-8): 1 warning
    multi_v4t_defconfig (gcc-8): 2 warnings
    multi_v4t_defconfig (clang-9): 4 warnings
    multi_v5_defconfig (clang-9): 1 error
    multi_v5_defconfig (gcc-8): 1 error
    multi_v7_defconfig (gcc-8): 52 warnings
    multi_v7_defconfig (clang-9): 55 warnings
    multi_v7_defconfig (gcc-8): 52 warnings
    multi_v7_defconfig (gcc-8): 52 warnings
    multi_v7_defconfig (gcc-8): 52 warnings
    multi_v7_defconfig (gcc-8): 53 warnings
    mv78xx0_defconfig (gcc-8): 1 error
    mv78xx0_defconfig (clang-9): 1 error
    mvebu_v5_defconfig (gcc-8): 1 error
    mvebu_v5_defconfig (clang-9): 1 error
    mvebu_v7_defconfig (clang-9): 2 warnings
    mvebu_v7_defconfig (gcc-8): 1 warning
    mxs_defconfig (gcc-8): 1 warning
    mxs_defconfig (clang-9): 3 warnings
    neponset_defconfig (gcc-8): 1 warning
    neponset_defconfig (clang-9): 3 warnings
    netwinder_defconfig (gcc-8): 1 warning
    netwinder_defconfig (clang-9): 3 warnings
    nhk8815_defconfig (clang-9): 1 error
    nhk8815_defconfig (gcc-8): 1 error
    omap1_defconfig (gcc-8): 1 error
    omap1_defconfig (clang-9): 1 error, 3 warnings
    omap2plus_defconfig (gcc-8): 1 warning
    omap2plus_defconfig (clang-9): 2 warnings
    orion5x_defconfig (clang-9): 1 error
    orion5x_defconfig (gcc-8): 1 error
    oxnas_v6_defconfig (gcc-8): 1 warning
    oxnas_v6_defconfig (clang-9): 4 warnings
    palmz72_defconfig (gcc-8): 1 error
    palmz72_defconfig (clang-9): 1 error
    pcm027_defconfig (gcc-8): 1 error
    pcm027_defconfig (clang-9): 1 error
    pleb_defconfig (gcc-8): 1 warning
    pleb_defconfig (clang-9): 3 warnings
    prima2_defconfig (gcc-8): 1 error
    prima2_defconfig (clang-9): 1 error
    pxa168_defconfig (gcc-8): 1 error
    pxa168_defconfig (clang-9): 1 error
    pxa255-idp_defconfig (gcc-8): 1 warning
    pxa255-idp_defconfig (clang-9): 3 warnings
    pxa3xx_defconfig (gcc-8): 1 error
    pxa3xx_defconfig (clang-9): 1 error
    pxa910_defconfig (clang-9): 1 error
    pxa910_defconfig (gcc-8): 1 error
    pxa_defconfig (gcc-8): 1 error, 6 warnings
    pxa_defconfig (clang-9): 1 error, 6 warnings
    qcom_defconfig (clang-9): 1 error
    qcom_defconfig (gcc-8): 1 error
    realview_defconfig (gcc-8): 1 warning
    realview_defconfig (clang-9): 2 warnings
    rpc_defconfig (clang-9): 5 errors
    rpc_defconfig (gcc-8): 1 warning
    s3c2410_defconfig (clang-9): 3 warnings
    s3c2410_defconfig (gcc-8): 1 warning
    s3c6400_defconfig (clang-9): 2 warnings
    s3c6400_defconfig (gcc-8): 1 warning
    s5pv210_defconfig (gcc-8): 1 error
    s5pv210_defconfig (clang-9): 1 error
    sama5_defconfig (gcc-8): 1 warning
    sama5_defconfig (clang-9): 2 warnings
    shannon_defconfig (clang-9): 3 warnings
    shannon_defconfig (gcc-8): 1 warning
    shmobile_defconfig (gcc-8): 1 warning
    shmobile_defconfig (clang-9): 2 warnings
    simpad_defconfig (gcc-8): 1 error
    simpad_defconfig (clang-9): 1 error
    socfpga_defconfig (clang-9): 2 warnings
    socfpga_defconfig (gcc-8): 1 warning
    spear13xx_defconfig (clang-9): 2 warnings
    spear13xx_defconfig (gcc-8): 1 warning
    spear3xx_defconfig (clang-9): 3 warnings
    spear3xx_defconfig (gcc-8): 1 warning
    spear6xx_defconfig (clang-9): 3 warnings
    spear6xx_defconfig (gcc-8): 1 warning
    spitz_defconfig (gcc-8): 1 error
    spitz_defconfig (clang-9): 1 error
    stm32_defconfig (clang-9): 1 error
    stm32_defconfig (gcc-8): 1 error
    sunxi_defconfig (clang-9): 49 warnings
    sunxi_defconfig (gcc-8): 48 warnings
    tango4_defconfig (clang-9): 1 error
    tango4_defconfig (gcc-8): 1 error
    tct_hammer_defconfig (clang-9): 3 warnings
    tct_hammer_defconfig (gcc-8): 1 warning
    tegra_defconfig (clang-9): 1 error
    tegra_defconfig (gcc-8): 1 error
    tinyconfig (gcc-8): 1 warning
    trizeps4_defconfig (gcc-8): 1 error
    trizeps4_defconfig (clang-9): 1 error
    u300_defconfig (clang-9): 1 error
    u300_defconfig (gcc-8): 1 error
    u8500_defconfig (clang-9): 2 warnings
    u8500_defconfig (gcc-8): 1 warning
    versatile_defconfig (gcc-8): 1 warning
    versatile_defconfig (clang-9): 3 warnings
    vexpress_defconfig (clang-9): 2 warnings
    vexpress_defconfig (gcc-8): 1 warning
    vf610m4_defconfig (gcc-8): 4 errors, 6 warnings
    vf610m4_defconfig (clang-9): 2 errors, 2 warnings
    viper_defconfig (gcc-8): 1 warning
    viper_defconfig (clang-9): 3 warnings
    vt8500_v6_v7_defconfig (gcc-8): 1 warning
    vt8500_v6_v7_defconfig (clang-9): 2 warnings
    xcep_defconfig (gcc-8): 1 warning
    xcep_defconfig (clang-9): 3 warnings
    zeus_defconfig (gcc-8): 1 warning
    zeus_defconfig (clang-9): 3 warnings
    zx_defconfig (clang-9): 1 error
    zx_defconfig (gcc-8): 1 error

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
    cavium_octeon_defconfig (gcc-8): 1 error, 1 warning
    ci20_defconfig (gcc-8): 1 error, 1 warning
    cobalt_defconfig (gcc-8): 3 warnings
    cu1000-neo_defconfig (gcc-8): 1 error, 1 warning
    db1xxx_defconfig (gcc-8): 2 warnings
    decstation_64_defconfig (gcc-8): 3 warnings
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
    lemote2f_defconfig (gcc-8): 1 error, 1 warning
    loongson1b_defconfig (gcc-8): 1 error, 1 warning
    loongson1c_defconfig (gcc-8): 1 error, 1 warning
    loongson3_defconfig (gcc-8): 1 error, 1 warning
    malta_defconfig (gcc-8): 3 warnings
    malta_kvm_defconfig (gcc-8): 3 warnings
    malta_kvm_guest_defconfig (gcc-8): 3 warnings
    malta_qemu_32r6_defconfig (gcc-8): 4 warnings
    maltaaprp_defconfig (gcc-8): 3 warnings
    maltasmvp_defconfig (gcc-8): 3 warnings
    maltasmvp_eva_defconfig (gcc-8): 3 warnings
    maltaup_defconfig (gcc-8): 3 warnings
    maltaup_xpa_defconfig (gcc-8): 3 warnings
    markeins_defconfig (gcc-8): 1 error, 1 warning
    mips_paravirt_defconfig (gcc-8): 1 error, 1 warning
    mpc30x_defconfig (gcc-8): 3 warnings
    msp71xx_defconfig (gcc-8): 1 error, 1 warning
    mtx1_defconfig (gcc-8): 2 errors, 2 warnings
    nlm_xlp_defconfig (gcc-8): 3 warnings
    nlm_xlr_defconfig (gcc-8): 3 warnings
    omega2p_defconfig (gcc-8): 1 error, 1 warning
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
    vocore2_defconfig (gcc-8): 1 error, 1 warning
    workpad_defconfig (gcc-8): 3 warnings
    xway_defconfig (gcc-8): 3 warnings

riscv:
    allnoconfig (gcc-8): 1 error
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    nommu_virt_defconfig (gcc-8): 1 warning
    rv32_defconfig (gcc-8): 7 warnings
    tinyconfig (gcc-8): 1 error

x86_64:
    allmodconfig (clang-9): 7 warnings
    allnoconfig (clang-9): 2 warnings
    allnoconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 2 warnings

Errors summary:

    68   kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=
=99 undeclared (first use in this function); did you mean =E2=80=98rcu_task=
s_qs=E2=80=99?
    44   kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'r=
cu_tasks_rude'
    4    ERROR: modpost: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.=
ko] undefined!
    4    ERROR: modpost: "dw_pcie_ep_linkup" [drivers/pci/controller/dwc/pc=
ie-tegra194.ko] undefined!
    4    ERROR: modpost: "dw_pcie_ep_init_notify" [drivers/pci/controller/d=
wc/pcie-tegra194.ko] undefined!
    4    ERROR: modpost: "dw_pcie_ep_init_complete" [drivers/pci/controller=
/dwc/pcie-tegra194.ko] undefined!
    4    ERROR: modpost: "dw_pcie_ep_init" [drivers/pci/controller/dwc/pcie=
-tegra194.ko] undefined!
    2    include/linux/elf.h:79:19: error: redefinition of =E2=80=98arch_pa=
rse_elf_property=E2=80=99
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
    1    ERROR: modpost: "sysrq_toggle_support" [drivers/tty/serial/serial_=
core.ko] undefined!
    1    ERROR: modpost: "sysrq_mask" [drivers/tty/serial/serial_core.ko] u=
ndefined!
    1    /tmp/main-47af2c.s:1469: Error: selected processor does not suppor=
t `strh r0,[r1]' in ARM mode
    1    /tmp/main-47af2c.s:1466: Error: selected processor does not suppor=
t `ldrh r0,[r0]' in ARM mode
    1    /tmp/elf-2f3651.s:49: Error: selected processor does not support `=
ldrh r2,[r0,#18]' in ARM mode

Warnings summary:

    192  arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_f=
ormat): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has =
invalid length (12 bytes) (parent #address-cells =3D=3D 1, child #address-c=
ells =3D=3D 2, #size-cells =3D=3D 1)
    160  arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format)=
: /soc/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invali=
d length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    139  drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_se=
condary=E2=80=99 defined but not used [-Wunused-function]
    115  <stdin>:1520:2: warning: #warning syscall process_madvise not impl=
emented [-Wcpp]
    78   1 warning generated.
    64   drivers/char/random.c:820:13: warning: unused function 'crng_initi=
alize_secondary' [-Wunused-function]
    24   arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_for=
mat): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has in=
valid length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cel=
ls =3D=3D 2, #size-cells =3D=3D 1)
    16   WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    10   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30: Warn=
ing (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg: I2C addr=
ess must be less than 10-bits, got "0x40000010"
    10   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4: =
Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C bus =
unit address format error, expected "40000010"
    10   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:437.3-30: Warn=
ing (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10:reg: I2C addr=
ess must be less than 10-bits, got "0x40000010"
    10   arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:435.11-439.4: =
Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@140/ipmb0@10: I2C bus =
unit address format error, expected "40000010"
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    4    WARNING: unmet direct dependencies detected for SND_SOC_WM9713
    4    WARNING: unmet direct dependencies detected for SND_SOC_WM9705
    3    drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:754:6: warning: variable 'sh=
adow' is used uninitialized whenever 'if' condition is false [-Wsometimes-u=
ninitialized]
    3    drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:738:13: note: initialize the=
 variable 'shadow' to silence this warning
    2    drivers/firmware/efi/libstub/file.c:123:21: warning: stack frame s=
ize of 1232 bytes in function 'handle_cmdline_files' [-Wframe-larger-than=
=3D]
    2    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    2    arch/arm/boot/dts/integratorap.dts:12.2-43: Warning (dma_ranges_fo=
rmat): /:dma-ranges: Root node has a "dma-ranges" property
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    2 warnings generated.
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
    1    drivers/net/ethernet/mellanox/mlx5/core/en/tc_ct.c:879:1: warning:=
 stack frame size of 1168 bytes in function '__mlx5_tc_ct_flow_offload' [-W=
frame-larger-than=3D]
    1    drivers/net/ethernet/mellanox/mlx5/core/en/tc_ct.c:479:1: warning:=
 stack frame size of 1128 bytes in function 'mlx5_tc_ct_entry_add_rule' [-W=
frame-larger-than=3D]
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
    1    arch/x86/kernel/signal.o: warning: objtool: __setup_rt_frame()+0x1=
f8: call to memset() with UACCESS enabled
    1    arch/arm/mach-omap1/pm.c:656:11: warning: variable 'irq' is used u=
ninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1    arch/arm/mach-omap1/pm.c:611:9: note: initialize the variable 'irq=
' to silence this warning
    1    /tmp/test-arm-f2fc0c.s:18788: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-f2fc0c.s:18713: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/futex-fea480.s:7446: Warning: source register same as write-b=
ack base
    1    /tmp/futex-f816a0.s:7476: Warning: source register same as write-b=
ack base
    1    /tmp/futex-f65d3a.s:23064: Warning: source register same as write-=
back base
    1    /tmp/futex-ed4dce.s:7474: Warning: source register same as write-b=
ack base
    1    /tmp/futex-e0f642.s:7504: Warning: source register same as write-b=
ack base
    1    /tmp/futex-de8de9.s:7446: Warning: source register same as write-b=
ack base
    1    /tmp/futex-dcf321.s:7455: Warning: source register same as write-b=
ack base
    1    /tmp/futex-d8448a.s:7504: Warning: source register same as write-b=
ack base
    1    /tmp/futex-d77c7d.s:7483: Warning: source register same as write-b=
ack base
    1    /tmp/futex-d69cd9.s:7504: Warning: source register same as write-b=
ack base
    1    /tmp/futex-d4aa14.s:7433: Warning: source register same as write-b=
ack base
    1    /tmp/futex-cdc166.s:23064: Warning: source register same as write-=
back base
    1    /tmp/futex-c465a8.s:7637: Warning: source register same as write-b=
ack base
    1    /tmp/futex-bf9320.s:23004: Warning: source register same as write-=
back base
    1    /tmp/futex-b4364a.s:23137: Warning: source register same as write-=
back base
    1    /tmp/futex-b2c447.s:23245: Warning: source register same as write-=
back base
    1    /tmp/futex-adc1fb.s:7458: Warning: source register same as write-b=
ack base
    1    /tmp/futex-aa0df7.s:23064: Warning: source register same as write-=
back base
    1    /tmp/futex-a57d75.s:7474: Warning: source register same as write-b=
ack base
    1    /tmp/futex-a11313.s:7424: Warning: source register same as write-b=
ack base
    1    /tmp/futex-9e2600.s:7434: Warning: source register same as write-b=
ack base
    1    /tmp/futex-9e008a.s:23546: Warning: source register same as write-=
back base
    1    /tmp/futex-98c33d.s:7474: Warning: source register same as write-b=
ack base
    1    /tmp/futex-94ed65.s:23137: Warning: source register same as write-=
back base
    1    /tmp/futex-920de7.s:7499: Warning: source register same as write-b=
ack base
    1    /tmp/futex-91048b.s:7474: Warning: source register same as write-b=
ack base
    1    /tmp/futex-8a1c2f.s:7475: Warning: source register same as write-b=
ack base
    1    /tmp/futex-8888fd.s:23064: Warning: source register same as write-=
back base
    1    /tmp/futex-680342.s:7476: Warning: source register same as write-b=
ack base
    1    /tmp/futex-5c993a.s:7504: Warning: source register same as write-b=
ack base
    1    /tmp/futex-4a3f06.s:7504: Warning: source register same as write-b=
ack base
    1    /tmp/futex-4a2892.s:22782: Warning: source register same as write-=
back base
    1    /tmp/futex-2e7c68.s:7504: Warning: source register same as write-b=
ack base
    1    /tmp/futex-16aac3.s:7476: Warning: source register same as write-b=
ack base
    1    /tmp/futex-155ffb.s:23104: Warning: source register same as write-=
back base
    1    /tmp/futex-056859.s:22782: Warning: source register same as write-=
back base
    1    /tmp/futex-044638.s:7488: Warning: source register same as write-b=
ack base
    1    /tmp/futex-01bba8.s:7446: Warning: source register same as write-b=
ack base
    1    /tmp/ccbvPW7q.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccbvPW7q.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1161:warning: override: UNWINDER_GUESS changes choice state
    1    .arch/x86/kernel/signal.o: warning: objtool: x32_setup_rt_frame()+=
0x1fa: call to memset() with UACCESS enabled
    1    ...mm/kasan/common.o: warning: objtool: kasan_report()+0x87: call =
to __stack_chk_fail() with UACCESS enabled
    1    ....................arch/x86/ia32/ia32_signal.o: warning: objtool:=
 ia32_setup_rt_frame()+0x1ef: call to memset() with UACCESS enabled

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
allmodconfig (arm64, clang-9) =E2=80=94 FAIL, 4 errors, 3 warnings, 0 secti=
on mismatches

Errors:
    ERROR: modpost: "dw_pcie_ep_init_notify" [drivers/pci/controller/dwc/pc=
ie-tegra194.ko] undefined!
    ERROR: modpost: "dw_pcie_ep_init_complete" [drivers/pci/controller/dwc/=
pcie-tegra194.ko] undefined!
    ERROR: modpost: "dw_pcie_ep_linkup" [drivers/pci/controller/dwc/pcie-te=
gra194.ko] undefined!
    ERROR: modpost: "dw_pcie_ep_init" [drivers/pci/controller/dwc/pcie-tegr=
a194.ko] undefined!

Warnings:
    drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:754:6: warning: variable 'shadow'=
 is used uninitialized whenever 'if' condition is false [-Wsometimes-uninit=
ialized]
    drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:738:13: note: initialize the vari=
able 'shadow' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-9) =E2=80=94 FAIL, 4 errors, 29 warnings, 0 sectio=
n mismatches

Errors:
    ERROR: modpost: "dw_pcie_ep_init_notify" [drivers/pci/controller/dwc/pc=
ie-tegra194.ko] undefined!
    ERROR: modpost: "dw_pcie_ep_init_complete" [drivers/pci/controller/dwc/=
pcie-tegra194.ko] undefined!
    ERROR: modpost: "dw_pcie_ep_linkup" [drivers/pci/controller/dwc/pcie-te=
gra194.ko] undefined!
    ERROR: modpost: "dw_pcie_ep_init" [drivers/pci/controller/dwc/pcie-tegr=
a194.ko] undefined!

Warnings:
    security/integrity/ima/ima_crypto.c:512:5: warning: stack frame size of=
 1152 bytes in function 'ima_calc_field_array_hash' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    /tmp/test-arm-f2fc0c.s:18713: Warning: using r15 results in unpredictab=
le behaviour
    /tmp/test-arm-f2fc0c.s:18788: Warning: using r15 results in unpredictab=
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
    drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:754:6: warning: variable 'shadow'=
 is used uninitialized whenever 'if' condition is false [-Wsometimes-uninit=
ialized]
    drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:738:13: note: initialize the vari=
able 'shadow' to silence this warning
    1 warning generated.
    drivers/soc/fsl/dpio/dpio-service.c:476:5: warning: stack frame size of=
 1072 bytes in function 'dpaa2_io_service_enqueue_multiple_desc_fq' [-Wfram=
e-larger-than=3D]
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
    drivers/net/ethernet/mellanox/mlx5/core/en/tc_ct.c:879:1: warning: stac=
k frame size of 1168 bytes in function '__mlx5_tc_ct_flow_offload' [-Wframe=
-larger-than=3D]
    drivers/net/ethernet/mellanox/mlx5/core/en/tc_ct.c:479:1: warning: stac=
k frame size of 1128 bytes in function 'mlx5_tc_ct_entry_add_rule' [-Wframe=
-larger-than=3D]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 18 warnings, 0 section =
mismatches

Errors:
    ERROR: modpost: "dw_pcie_ep_init" [drivers/pci/controller/dwc/pcie-tegr=
a194.ko] undefined!
    ERROR: modpost: "dw_pcie_ep_init_notify" [drivers/pci/controller/dwc/pc=
ie-tegra194.ko] undefined!
    ERROR: modpost: "dw_pcie_ep_init_complete" [drivers/pci/controller/dwc/=
pcie-tegra194.ko] undefined!
    ERROR: modpost: "dw_pcie_ep_linkup" [drivers/pci/controller/dwc/pcie-te=
gra194.ko] undefined!

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    /tmp/ccbvPW7q.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccbvPW7q.s:18191: Warning: using r15 results in unpredictable beha=
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

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 4 errors, 0 warnings, 0 section=
 mismatches

Errors:
    ERROR: modpost: "dw_pcie_ep_init" [drivers/pci/controller/dwc/pcie-tegr=
a194.ko] undefined!
    ERROR: modpost: "dw_pcie_ep_linkup" [drivers/pci/controller/dwc/pcie-te=
gra194.ko] undefined!
    ERROR: modpost: "dw_pcie_ep_init_notify" [drivers/pci/controller/dwc/pc=
ie-tegra194.ko] undefined!
    ERROR: modpost: "dw_pcie_ep_init_complete" [drivers/pci/controller/dwc/=
pcie-tegra194.ko] undefined!

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sect=
ion mismatches

Warnings:
    ....................arch/x86/ia32/ia32_signal.o: warning: objtool: ia32=
_setup_rt_frame()+0x1ef: call to memset() with UACCESS enabled
    ...mm/kasan/common.o: warning: objtool: kasan_report()+0x87: call to __=
stack_chk_fail() with UACCESS enabled
    .arch/x86/kernel/signal.o: warning: objtool: x32_setup_rt_frame()+0x1fa=
: call to memset() with UACCESS enabled
    arch/x86/kernel/signal.o: warning: objtool: __setup_rt_frame()+0x1f8: c=
all to memset() with UACCESS enabled
    drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:754:6: warning: variable 'shadow'=
 is used uninitialized whenever 'if' condition is false [-Wsometimes-uninit=
ialized]
    drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:738:13: note: initialize the vari=
able 'shadow' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

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
allnoconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    include/linux/elf.h:79:19: error: redefinition of =E2=80=98arch_parse_e=
lf_property=E2=80=99

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
am200epdkit_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0=
 section mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

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
aspeed_g4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 7 warnings, 0 =
section mismatches

Warnings:
    /tmp/futex-bf9320.s:23004: Warning: source register same as write-back =
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
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

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
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

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
aspeed_g5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

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
assabet_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-4a3f06.s:7504: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
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
axm55xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-155ffb.s:23104: Warning: source register same as write-back =
base
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
bcm2835_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
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
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    /tmp/futex-2e7c68.s:7504: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

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
cm_x2xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-01bba8.s:7446: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 5 warnings, 0 sec=
tion mismatches

Errors:
    ERROR: modpost: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] u=
ndefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    /tmp/futex-c465a8.s:7637: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 3 warnings, 0 secti=
on mismatches

Errors:
    ERROR: modpost: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] u=
ndefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

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
colibri_pxa270_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings=
, 0 section mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, =
0 section mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    /tmp/futex-b2c447.s:23245: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-dcf321.s:7455: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0=
 section mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

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
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings,=
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
defconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mis=
matches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 FAIL, 1 error,=
 0 warnings, 0 section mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 FAIL, 1 error,=
 0 warnings, 0 section mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
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
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-f816a0.s:7476: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 5 warnings, 0 sec=
tion mismatches

Errors:
    ERROR: modpost: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] u=
ndefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    /tmp/futex-fea480.s:7446: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 3 warnings, 0 secti=
on mismatches

Errors:
    ERROR: modpost: "snd_ac97_reset" [sound/soc/codecs/snd-soc-wm9712.ko] u=
ndefined!

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-9e2600.s:7434: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

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
    /tmp/futex-ed4dce.s:7474: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

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
exynos_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    /tmp/futex-680342.s:7476: Warning: source register same as write-back b=
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
gemini_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

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
h3600_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    /tmp/futex-de8de9.s:7446: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-d4aa14.s:7433: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 FAIL, 1 error, 0 war=
nings, 0 section mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

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
imote2_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

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
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-a57d75.s:7474: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

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
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-8a1c2f.s:7475: Warning: source register same as write-back b=
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
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    /tmp/futex-d8448a.s:7504: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    /tmp/futex-5c993a.s:7504: Warning: source register same as write-back b=
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
lemote2f_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 se=
ction mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    /tmp/futex-cdc166.s:23064: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-aa0df7.s:23064: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    /tmp/futex-8888fd.s:23064: Warning: source register same as write-back =
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
    {standard input}:141: Warning: macro instruction expanded into multiple=
 instructions
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
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
markeins_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    drivers/firmware/efi/libstub/file.c:123:21: warning: stack frame size o=
f 1224 bytes in function 'handle_cmdline_files' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    /tmp/futex-94ed65.s:23137: Warning: source register same as write-back =
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
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

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
mps2_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sectio=
n mismatches

Errors:
    ERROR: modpost: "sysrq_toggle_support" [drivers/tty/serial/serial_core.=
ko] undefined!
    ERROR: modpost: "sysrq_mask" [drivers/tty/serial/serial_core.ko] undefi=
ned!

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    arch/arm/boot/dts/integratorap.dts:12.2-43: Warning (dma_ranges_format)=
: /:dma-ranges: Root node has a "dma-ranges" property

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    /tmp/futex-920de7.s:7499: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    arch/arm/boot/dts/integratorap.dts:12.2-43: Warning (dma_ranges_format)=
: /:dma-ranges: Root node has a "dma-ranges" property

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 52 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
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
multi_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 55 warnings, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    drivers/firmware/efi/libstub/file.c:123:21: warning: stack frame size o=
f 1232 bytes in function 'handle_cmdline_files' [-Wframe-larger-than=3D]
    1 warning generated.
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
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
 errors, 52 warnings, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
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
=94 PASS, 0 errors, 52 warnings, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
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
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 52=
 warnings, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
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
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 53 warn=
ings, 0 section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    net/sched/cls_flower.c:331:1: warning: the frame size of 1032 bytes is =
larger than 1024 bytes [-Wframe-larger-than=3D]
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
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
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

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
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    /tmp/futex-9e008a.s:23546: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    /tmp/futex-d69cd9.s:7504: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    /tmp/futex-16aac3.s:7476: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

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
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings,=
 0 section mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 3 warnings, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

Warnings:
    arch/arm/mach-omap1/pm.c:656:11: warning: variable 'irq' is used uninit=
ialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    arch/arm/mach-omap1/pm.c:611:9: note: initialize the variable 'irq' to =
silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

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
omega2p_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    drivers/firmware/efi/libstub/file.c:123:21: warning: stack frame size o=
f 1232 bytes in function 'handle_cmdline_files' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

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
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    /tmp/futex-044638.s:7488: Warning: source register same as write-back b=
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
prima2_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    /tmp/futex-f65d3a.s:23064: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 6 warnings, 0 section m=
ismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9705
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9713
    WARNING: unmet direct dependencies detected for SND_SOC_WM9705
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9713

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 6 warnings, 0 section=
 mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

Warnings:
    WARNING: unmet direct dependencies detected for SND_SOC_WM9705
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9713
    WARNING: unmet direct dependencies detected for SND_SOC_WM9705
    WARNING: unmet direct dependencies detected for SND_SOC_WM9712
    WARNING: unmet direct dependencies detected for SND_SOC_WM9713

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

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
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
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
rpc_defconfig (arm, clang-9) =E2=80=94 FAIL, 5 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    /tmp/elf-2f3651.s:49: Error: selected processor does not support `ldrh =
r2,[r0,#18]' in ARM mode
    clang: error: assembler command failed with exit code 1 (use -v to see =
invocation)
    /tmp/main-47af2c.s:1466: Error: selected processor does not support `ld=
rh r0,[r0]' in ARM mode
    /tmp/main-47af2c.s:1469: Error: selected processor does not support `st=
rh r0,[r1]' in ARM mode
    clang: error: assembler command failed with exit code 1 (use -v to see =
invocation)

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
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
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-b4364a.s:23137: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

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
shannon_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    /tmp/futex-e0f642.s:7504: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
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
simpad_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

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
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    /tmp/futex-056859.s:22782: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    /tmp/futex-4a2892.s:22782: Warning: source register same as write-back =
base
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 49 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 48 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun5i.dtsi:189.4-52: Warning (dma_ranges_format): /so=
c/dram-controller@1c01000:dma-ranges: "dma-ranges" property has invalid len=
gth (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =3D=3D=
 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sunxi-h3-h5.dtsi:563.4-52: Warning (dma_ranges_format=
): /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has inval=
id length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)
    arch/arm/boot/dts/sun8i-r40.dtsi:769.4-52: Warning (dma_ranges_format):=
 /soc/dram-controller@1c62000:dma-ranges: "dma-ranges" property has invalid=
 length (12 bytes) (parent #address-cells =3D=3D 1, child #address-cells =
=3D=3D 2, #size-cells =3D=3D 1)

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

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
tct_hammer_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    /tmp/futex-d77c7d.s:7483: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    include/linux/elf.h:79:19: error: redefinition of =E2=80=98arch_parse_e=
lf_property=E2=80=99

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
    .config:1161:warning: override: UNWINDER_GUESS changes choice state
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
trizeps4_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

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
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    /tmp/futex-98c33d.s:7474: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 FAIL, 4 errors, 6 warnings, 0 sect=
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
vf610m4_defconfig (arm, clang-9) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 se=
ction mismatches

Errors:
    drivers/clocksource/timer-vf-pit.c:131:2: error: unterminated function-=
like macro invocation
    drivers/clocksource/timer-vf-pit.c:194:58: error: expected '}'

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    /tmp/futex-adc1fb.s:7458: Warning: source register same as write-back b=
ase

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

Warnings:
    <stdin>:1520:2: warning: #warning syscall process_madvise not implement=
ed [-Wcpp]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
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
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.
    /tmp/futex-a11313.s:7424: Warning: source register same as write-back b=
ase

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
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/char/random.c:820:13: warning: =E2=80=98crng_initialize_seconda=
ry=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, clang-9) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    /tmp/futex-91048b.s:7474: Warning: source register same as write-back b=
ase
    drivers/char/random.c:820:13: warning: unused function 'crng_initialize=
_secondary' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, clang-9) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: use of undeclared identifier 'rcu_ta=
sks_rude'

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    kernel/rcu/tasks.h:1070:37: error: =E2=80=98rcu_tasks_rude=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98rcu_tasks_qs=E2=
=80=99?

---
For more info write to <info@kernelci.org>
