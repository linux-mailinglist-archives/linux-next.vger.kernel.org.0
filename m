Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1DFA3F4D61
	for <lists+linux-next@lfdr.de>; Mon, 23 Aug 2021 17:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbhHWPW6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Aug 2021 11:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbhHWPW5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Aug 2021 11:22:57 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F9EC061575
        for <linux-next@vger.kernel.org>; Mon, 23 Aug 2021 08:22:13 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id 2so1611957pfo.8
        for <linux-next@vger.kernel.org>; Mon, 23 Aug 2021 08:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eXjZOFYEzuEnlEcDKd/I+8ifqOpTAznZ7QXnWP+PVP0=;
        b=cP81JoyP6cWfTMorDnMstVXf8vt3aJxxQTR/z2ZfRg8HVXfYJn09RJMrWy62YsA8y6
         MF8PpfuoSu51ic6cnShvOt2U0ex29oPnETFTSkIIG/y1zqBZdvdXCX4qFNRaMTMYPOi6
         4MS7KfNiC2pyc22gBA8NkzmwDIrZ8Kmd7pCOC+2s+E/aASIuyX+K5SUhGyRwpR6j8/RC
         zfbl6K6VgOyAD6KowZpBtaNSyQSJGi0/JPL6FmJLVtCpdZzQ6jGKgbmoQ3Dckh4uXGTC
         CunTI9ln8DgvU/v/lbk0Q9m2lsmSb8XFRXBrrp4tuPhlCfn0URXE88wsFk/FNKWWmtzP
         vkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eXjZOFYEzuEnlEcDKd/I+8ifqOpTAznZ7QXnWP+PVP0=;
        b=i6OxjJt53fRXh7XcDWK0hniRWbxO7jxOxqEVfCAhOrNXap6NmTQkki8L3wwexytCdJ
         LgrnowhmhwNbv0B+T8X8LkMD0YOgSHABfItjArMx0Nyl5gB8nye5sC/TqAD9hp1t7Z9A
         I4CkCZgnjmVOf54OAN0E/r56792DFK/OvyBSNG2lCKNHsm9LuT2cv+uO44dMijruGuDg
         ZB8i6zzA5Of3kIho2ZFPyi6qI8S84IAkN0ojdb/iQRE4qschn3RMdAk75JYF/BYc1O6d
         T77p3jv1IaEwvc8YLUl0B5vCMhPVK2aGd7Ihgb6SebSjK8Smbu4XO1xxvdNMctylkEh8
         ByMA==
X-Gm-Message-State: AOAM530lnsQOp6FO36d08FCbVCM+50we/QRMOGM1ylAuwcVCM2r2FF1L
        zPBE2OIfekxXoLL4teAF3is1W/Q0UYy8IAaV
X-Google-Smtp-Source: ABdhPJwVsNoyt90aewKb27DqmKxP+0kyfRR6E0X2/fxHr2TIav+kK8mdCujqQqSXk4GMLZcXap0I0w==
X-Received: by 2002:a62:58c2:0:b0:3eb:31ee:cfb9 with SMTP id m185-20020a6258c2000000b003eb31eecfb9mr5540189pfb.31.1629732131860;
        Mon, 23 Aug 2021 08:22:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s16sm16766288pfd.95.2021.08.23.08.22.10
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 08:22:11 -0700 (PDT)
Message-ID: <6123bd23.1c69fb81.c95d2.09e8@mx.google.com>
Date:   Mon, 23 Aug 2021 08:22:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Kernel: next-20210823
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
Subject: next/master build: 212 builds: 15 failed, 197 passed, 492 errors,
 1388 warnings (next-20210823)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 212 builds: 15 failed, 197 passed, 492 errors, 1388 warn=
ings (next-20210823)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20210823/

Tree: next
Branch: master
Git Describe: next-20210823
Git Commit: 46debfec12b4e038b93c62a86bd78ae62f9ba4ea
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-12) FAIL
    defconfig: (clang-12) FAIL
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy: (clang-12) FAIL
    allmodconfig: (gcc-8) FAIL
    defconfig: (gcc-8) FAIL
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy: (gcc-8) FAIL
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy: (gcc-8) FAIL
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy: (gcc-8) FAIL
    defconfig+ima: (gcc-8) FAIL
    defconfig+kselftest: (gcc-8) FAIL

i386:
    allmodconfig: (clang-10) FAIL
    allmodconfig: (clang-12) FAIL

mips:
    decstation_64_defconfig: (gcc-8) FAIL
    lemote2f_defconfig: (gcc-8) FAIL

x86_64:
    allmodconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 4 warnings
    axs103_defconfig (gcc-8): 4 warnings
    axs103_smp_defconfig (gcc-8): 4 warnings
    haps_hs_defconfig (gcc-8): 4 warnings
    haps_hs_smp_defconfig (gcc-8): 4 warnings
    haps_hs_smp_defconfig+kselftest (gcc-8): 7 warnings
    hsdk_defconfig (gcc-8): 4 warnings
    nsimosci_hs_defconfig (gcc-8): 4 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 4 warnings
    tinyconfig (gcc-8): 2 warnings
    vdk_hs38_defconfig (gcc-8): 4 warnings
    vdk_hs38_smp_defconfig (gcc-8): 4 warnings

arm64:
    allmodconfig (gcc-8): 44 errors, 48 warnings
    allmodconfig (clang-12): 2 errors, 15 warnings
    defconfig (gcc-8): 1 error, 5 warnings
    defconfig (clang-12): 2 errors, 10 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-12): 2 errors, 10 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-8): 1 error, 5 warnings
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 1 error, 5 warnings
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-8): 1 error, 5 warnings
    defconfig+ima (gcc-8): 1 error, 5 warnings
    defconfig+kselftest (gcc-8): 41 errors, 44 warnings

arm:
    am200epdkit_defconfig (gcc-8): 4 warnings
    aspeed_g4_defconfig (gcc-8): 37 errors, 38 warnings
    aspeed_g5_defconfig (gcc-8): 37 errors, 38 warnings
    assabet_defconfig (gcc-8): 4 warnings
    at91_dt_defconfig (gcc-8): 4 warnings
    axm55xx_defconfig (gcc-8): 4 warnings
    badge4_defconfig (gcc-8): 4 warnings
    bcm2835_defconfig (gcc-8): 4 warnings
    cerfcube_defconfig (gcc-8): 4 warnings
    cm_x300_defconfig (gcc-8): 4 warnings
    colibri_pxa270_defconfig (gcc-8): 4 warnings
    colibri_pxa300_defconfig (gcc-8): 4 warnings
    collie_defconfig (gcc-8): 4 warnings
    corgi_defconfig (gcc-8): 4 warnings
    davinci_all_defconfig (gcc-8): 4 warnings
    dove_defconfig (gcc-8): 4 warnings
    ep93xx_defconfig (gcc-8): 4 warnings
    eseries_pxa_defconfig (gcc-8): 4 warnings
    exynos_defconfig (gcc-8): 3 errors, 9 warnings
    ezx_defconfig (gcc-8): 4 warnings
    footbridge_defconfig (gcc-8): 4 warnings
    gemini_defconfig (gcc-8): 4 warnings
    h3600_defconfig (gcc-8): 4 warnings
    h5000_defconfig (gcc-8): 4 warnings
    hackkit_defconfig (gcc-8): 4 warnings
    hisi_defconfig (gcc-8): 4 warnings
    imote2_defconfig (gcc-8): 4 warnings
    imx_v4_v5_defconfig (gcc-8): 4 warnings
    imx_v6_v7_defconfig (gcc-8): 4 warnings
    integrator_defconfig (gcc-8): 4 warnings
    iop32x_defconfig (gcc-8): 4 warnings
    ixp4xx_defconfig (gcc-8): 4 warnings
    jornada720_defconfig (gcc-8): 4 warnings
    keystone_defconfig (gcc-8): 4 warnings
    lart_defconfig (gcc-8): 4 warnings
    lpc18xx_defconfig (gcc-8): 2 warnings
    lpc32xx_defconfig (gcc-8): 4 warnings
    lpd270_defconfig (gcc-8): 4 warnings
    lubbock_defconfig (gcc-8): 4 warnings
    magician_defconfig (gcc-8): 4 warnings
    mainstone_defconfig (gcc-8): 4 warnings
    milbeaut_m10v_defconfig (gcc-8): 4 warnings
    mini2440_defconfig (gcc-8): 4 warnings
    mmp2_defconfig (gcc-8): 4 warnings
    moxart_defconfig (gcc-8): 4 warnings
    mps2_defconfig (gcc-8): 4 warnings
    multi_v4t_defconfig (gcc-8): 4 warnings
    multi_v5_defconfig (gcc-8): 4 warnings
    multi_v5_defconfig (clang-10): 4 warnings
    multi_v5_defconfig (clang-12): 4 warnings
    multi_v7_defconfig (gcc-8): 3 errors, 9 warnings
    multi_v7_defconfig (clang-12): 24 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 3 errors, 9 warni=
ngs
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-8): 3 errors=
, 9 warnings
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-8): 3 errors, 9 warnings
    multi_v7_defconfig+kselftest (gcc-8): 40 errors, 43 warnings
    mvebu_v5_defconfig (gcc-8): 4 warnings
    mvebu_v7_defconfig (gcc-8): 4 warnings
    mxs_defconfig (gcc-8): 4 warnings
    neponset_defconfig (gcc-8): 4 warnings
    netwinder_defconfig (gcc-8): 4 warnings
    nhk8815_defconfig (gcc-8): 4 warnings
    omap1_defconfig (gcc-8): 4 warnings
    omap2plus_defconfig (gcc-8): 4 warnings
    orion5x_defconfig (gcc-8): 4 warnings
    oxnas_v6_defconfig (gcc-8): 4 warnings
    palmz72_defconfig (gcc-8): 4 warnings
    pcm027_defconfig (gcc-8): 4 warnings
    pleb_defconfig (gcc-8): 4 warnings
    pxa168_defconfig (gcc-8): 4 warnings
    pxa255-idp_defconfig (gcc-8): 4 warnings
    pxa3xx_defconfig (gcc-8): 4 warnings
    pxa910_defconfig (gcc-8): 4 warnings
    pxa_defconfig (gcc-8): 3 errors, 9 warnings
    qcom_defconfig (gcc-8): 4 warnings
    realview_defconfig (gcc-8): 4 warnings
    s3c2410_defconfig (gcc-8): 4 warnings
    s3c6400_defconfig (gcc-8): 4 warnings
    s5pv210_defconfig (gcc-8): 4 warnings
    sama5_defconfig (gcc-8): 4 warnings
    sama7_defconfig (gcc-8): 4 warnings
    shannon_defconfig (gcc-8): 4 warnings
    shmobile_defconfig (gcc-8): 4 warnings
    simpad_defconfig (gcc-8): 4 warnings
    socfpga_defconfig (gcc-8): 6 warnings
    spear13xx_defconfig (gcc-8): 4 warnings
    spear3xx_defconfig (gcc-8): 4 warnings
    spear6xx_defconfig (gcc-8): 4 warnings
    spitz_defconfig (gcc-8): 4 warnings
    stm32_defconfig (gcc-8): 2 warnings
    sunxi_defconfig (gcc-8): 4 warnings
    tct_hammer_defconfig (gcc-8): 4 warnings
    tegra_defconfig (gcc-8): 3 errors, 9 warnings
    trizeps4_defconfig (gcc-8): 4 warnings
    u8500_defconfig (gcc-8): 4 warnings
    versatile_defconfig (gcc-8): 4 warnings
    vexpress_defconfig (gcc-8): 6 warnings
    vf610m4_defconfig (gcc-8): 4 warnings
    viper_defconfig (gcc-8): 4 warnings
    vt8500_v6_v7_defconfig (gcc-8): 4 warnings
    xcep_defconfig (gcc-8): 4 warnings
    zeus_defconfig (gcc-8): 4 warnings

i386:
    allmodconfig (clang-12): 1 error, 41 warnings
    allmodconfig (clang-10): 1 error, 41 warnings
    allnoconfig (clang-12): 4 warnings
    allnoconfig (clang-10): 4 warnings
    allnoconfig (gcc-8): 4 warnings
    i386_defconfig (clang-12): 4 warnings
    i386_defconfig (gcc-8): 4 warnings
    i386_defconfig (clang-10): 4 warnings
    i386_defconfig+kselftest (gcc-8): 34 errors, 38 warnings
    tinyconfig (gcc-8): 2 warnings

mips:
    32r2el_defconfig (gcc-8): 4 warnings
    32r2el_defconfig+kselftest (gcc-8): 34 errors, 42 warnings
    ar7_defconfig (gcc-8): 4 warnings
    ath25_defconfig (gcc-8): 4 warnings
    ath79_defconfig (gcc-8): 4 warnings
    bcm47xx_defconfig (gcc-8): 4 warnings
    bcm63xx_defconfig (gcc-8): 2 warnings
    bigsur_defconfig (gcc-8): 2 warnings
    bmips_be_defconfig (gcc-8): 4 warnings
    bmips_stb_defconfig (gcc-8): 4 warnings
    capcella_defconfig (gcc-8): 4 warnings
    cavium_octeon_defconfig (gcc-8): 2 warnings
    ci20_defconfig (gcc-8): 4 warnings
    cobalt_defconfig (gcc-8): 4 warnings
    cu1000-neo_defconfig (gcc-8): 4 warnings
    cu1830-neo_defconfig (gcc-8): 4 warnings
    db1xxx_defconfig (gcc-8): 4 warnings
    decstation_64_defconfig (gcc-8): 2 warnings
    decstation_defconfig (gcc-8): 4 warnings
    decstation_r4k_defconfig (gcc-8): 4 warnings
    e55_defconfig (gcc-8): 4 warnings
    fuloong2e_defconfig (gcc-8): 2 warnings
    gcw0_defconfig (gcc-8): 4 warnings
    gpr_defconfig (gcc-8): 4 warnings
    ip22_defconfig (gcc-8): 4 warnings
    ip32_defconfig (gcc-8): 2 warnings
    jazz_defconfig (gcc-8): 4 warnings
    jmr3927_defconfig (gcc-8): 4 warnings
    lemote2f_defconfig (gcc-8): 2 warnings
    loongson1b_defconfig (gcc-8): 4 warnings
    loongson1c_defconfig (gcc-8): 4 warnings
    loongson2k_defconfig (gcc-8): 4 warnings
    loongson3_defconfig (gcc-8): 6 warnings
    malta_defconfig (gcc-8): 4 warnings
    malta_kvm_defconfig (gcc-8): 4 warnings
    malta_qemu_32r6_defconfig (gcc-8): 4 warnings
    maltaaprp_defconfig (gcc-8): 4 warnings
    maltasmvp_defconfig (gcc-8): 4 warnings
    maltasmvp_eva_defconfig (gcc-8): 4 warnings
    maltaup_defconfig (gcc-8): 4 warnings
    maltaup_xpa_defconfig (gcc-8): 4 warnings
    mpc30x_defconfig (gcc-8): 4 warnings
    mtx1_defconfig (gcc-8): 4 warnings
    nlm_xlp_defconfig (gcc-8): 2 warnings
    nlm_xlr_defconfig (gcc-8): 4 warnings
    omega2p_defconfig (gcc-8): 4 warnings
    pic32mzda_defconfig (gcc-8): 4 warnings
    qi_lb60_defconfig (gcc-8): 4 warnings
    rb532_defconfig (gcc-8): 4 warnings
    rbtx49xx_defconfig (gcc-8): 6 warnings
    rm200_defconfig (gcc-8): 6 warnings
    rs90_defconfig (gcc-8): 4 warnings
    rt305x_defconfig (gcc-8): 4 warnings
    sb1250_swarm_defconfig (gcc-8): 2 warnings
    tb0219_defconfig (gcc-8): 4 warnings
    tb0226_defconfig (gcc-8): 4 warnings
    tb0287_defconfig (gcc-8): 4 warnings
    vocore2_defconfig (gcc-8): 4 warnings
    workpad_defconfig (gcc-8): 4 warnings

riscv:
    defconfig (gcc-8): 4 warnings
    defconfig+CONFIG_EFI=3Dn (clang-12): 4 warnings
    defconfig+kselftest (gcc-8): 37 errors, 38 warnings
    nommu_k210_defconfig (gcc-8): 2 warnings
    nommu_k210_sdcard_defconfig (gcc-8): 2 warnings
    rv32_defconfig (gcc-8): 14 warnings

x86_64:
    allmodconfig (gcc-8): 80 errors, 48 warnings
    allnoconfig (clang-12): 2 warnings
    allnoconfig (clang-10): 5 warnings
    allnoconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 2 warnings
    x86_64_defconfig (gcc-8): 2 warnings
    x86_64_defconfig (clang-12): 2 warnings
    x86_64_defconfig+crypto (gcc-8): 2 warnings
    x86_64_defconfig+ima (gcc-8): 2 warnings
    x86_64_defconfig+kselftest (gcc-8): 37 errors, 36 warnings
    x86_64_defconfig+x86-chromebook (gcc-8): 2 warnings
    x86_64_defconfig+x86-chromebook+kselftest (gcc-8): 37 errors, 36 warnin=
gs
    x86_64_defconfig+x86_kvm_guest (gcc-8): 4 warnings

Errors summary:

    187  cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-s=
ize-larger-than=E2=80=99 [-Werror]
    33   TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %=
12lld len: %d x: %12lld y: %12lld",
    22   include/linux/fortify-string.h:56:3: error: call to =E2=80=98__wri=
te_overflow=E2=80=99 declared with attribute error: detected write beyond s=
ize of object (1st parameter)
    22   include/linux/fortify-string.h:319:3: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    22   include/linux/fortify-string.h:125:4: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    13   include/linux/fortify-string.h:219:4: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    11   include/linux/fortify-string.h:289:3: error: call to =E2=80=98__re=
ad_overflow=E2=80=99 declared with attribute error: detected read beyond si=
ze of object (1st parameter)
    11   include/linux/fortify-string.h:277:3: error: call to =E2=80=98__re=
ad_overflow=E2=80=99 declared with attribute error: detected read beyond si=
ze of object (1st parameter)
    11   include/linux/fortify-string.h:265:4: error: call to =E2=80=98__re=
ad_overflow2=E2=80=99 declared with attribute error: detected read beyond s=
ize of object (2nd parameter)
    11   include/linux/fortify-string.h:263:4: error: call to =E2=80=98__re=
ad_overflow=E2=80=99 declared with attribute error: detected read beyond si=
ze of object (1st parameter)
    11   include/linux/fortify-string.h:250:3: error: call to =E2=80=98__re=
ad_overflow=E2=80=99 declared with attribute error: detected read beyond si=
ze of object (1st parameter)
    11   include/linux/fortify-string.h:237:4: error: call to =E2=80=98__re=
ad_overflow2=E2=80=99 declared with attribute error: detected read beyond s=
ize of object (2nd parameter)
    11   include/linux/fortify-string.h:235:4: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    11   include/linux/fortify-string.h:221:4: error: call to =E2=80=98__re=
ad_overflow2=E2=80=99 declared with attribute error: detected read beyond s=
ize of object (2nd parameter)
    11   include/linux/fortify-string.h:206:3: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    11   include/linux/fortify-string.h:154:3: error: call to =E2=80=98__wr=
ite_overflow=E2=80=99 declared with attribute error: detected write beyond =
size of object (1st parameter)
    9    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement wit=
h no effect [-Werror=3Dunused-value]
    9    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with=
 no effect [-Werror=3Dunused-value]
    9    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with=
 no effect [-Werror=3Dunused-value]
    7    drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:40: error: =E2=80=98pri=
v=E2=80=99 undeclared (first use in this function); did you mean =E2=80=98p=
id=E2=80=99?
    3    drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:56: error: use of undec=
lared identifier 'priv'
    3    drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:40: error: use of undec=
lared identifier 'priv'
    2    include/linux/stddef.h:8:14: error: positional initialization of f=
ield in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_init=E2=
=80=99 attribute [-Werror=3Ddesignated-init]
    2    ERROR: modpost: "__mulodi4" [drivers/block/nbd.ko] undefined!
    1    drivers/gpu/drm/i915/i915_module.c:62:4: error: positional initial=
ization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designa=
ted_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:62:4: error: invalid initializer
    1    drivers/gpu/drm/i915/i915_module.c:62:31: error: positional initia=
lization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98design=
ated_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:61:4: error: positional initial=
ization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designa=
ted_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:61:4: error: invalid initializer
    1    drivers/gpu/drm/i915/i915_module.c:61:30: error: positional initia=
lization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98design=
ated_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:60:4: error: positional initial=
ization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designa=
ted_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:60:4: error: invalid initializer
    1    drivers/gpu/drm/i915/i915_module.c:60:19: error: positional initia=
lization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98design=
ated_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:59:4: error: positional initial=
ization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designa=
ted_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:59:4: error: invalid initializer
    1    drivers/gpu/drm/i915/i915_module.c:58:4: error: positional initial=
ization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designa=
ted_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:58:4: error: invalid initializer
    1    drivers/gpu/drm/i915/i915_module.c:58:26: error: positional initia=
lization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98design=
ated_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:57:4: error: positional initial=
ization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designa=
ted_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:57:4: error: invalid initializer
    1    drivers/gpu/drm/i915/i915_module.c:57:32: error: positional initia=
lization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98design=
ated_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:56:4: error: positional initial=
ization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designa=
ted_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:56:4: error: invalid initializer
    1    drivers/gpu/drm/i915/i915_module.c:56:30: error: positional initia=
lization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98design=
ated_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:55:4: error: positional initial=
ization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designa=
ted_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:55:4: error: invalid initializer
    1    drivers/gpu/drm/i915/i915_module.c:55:30: error: positional initia=
lization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98design=
ated_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:54:4: error: positional initial=
ization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designa=
ted_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:54:4: error: invalid initializer
    1    drivers/gpu/drm/i915/i915_module.c:54:34: error: positional initia=
lization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98design=
ated_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:53:4: error: positional initial=
ization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designa=
ted_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:53:4: error: invalid initializer
    1    drivers/gpu/drm/i915/i915_module.c:53:30: error: positional initia=
lization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98design=
ated_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:52:4: error: positional initial=
ization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designa=
ted_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:52:4: error: invalid initializer
    1    drivers/gpu/drm/i915/i915_module.c:52:28: error: positional initia=
lization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98design=
ated_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:51:4: error: positional initial=
ization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designa=
ted_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:51:4: error: invalid initializer
    1    drivers/gpu/drm/i915/i915_module.c:51:29: error: positional initia=
lization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98design=
ated_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:50:4: error: positional initial=
ization of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designa=
ted_init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    1    drivers/gpu/drm/i915/i915_module.c:50:4: error: invalid initializer
    1    ./../include/linux/compiler_types.h:324:38: error: call to =E2=80=
=98__compiletime_assert_1873=E2=80=99 declared with attribute error: FIELD_=
PREP: value too large for the field
    1    ./../include/linux/compiler_types.h:324:38: error: call to =E2=80=
=98__compiletime_assert_1866=E2=80=99 declared with attribute error: FIELD_=
PREP: value too large for the field

Warnings summary:

    404  cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc=
-size-larger-than=E2=80=99
    197  fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=
=E2=80=99 [-Wunused-variable]
    187  cc1: all warnings being treated as errors
    161  fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    46   1 warning generated.
    16   fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunuse=
d-variable]
    12   fs/9p/vfs_file.c:322:1: warning: label =E2=80=98out_err=E2=80=99 d=
efined but not used [-Wunused-label]
    11   warning: unsafe strscpy() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-strscpy.c
    11   warning: unsafe strncpy() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-strncpy.c
    11   warning: unsafe strncpy() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-strncpy-src.c
    11   warning: unsafe strlcpy() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-strlcpy.c
    11   warning: unsafe strlcpy() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-strlcpy-src.c
    11   warning: unsafe strcpy() usage lacked '__write_overflow' warning i=
n ../lib/test_fortify/write_overflow-strcpy.c
    11   warning: unsafe strcpy() usage lacked '__write_overflow' warning i=
n ../lib/test_fortify/write_overflow-strcpy-lit.c
    11   warning: unsafe memset() usage lacked '__write_overflow' warning i=
n ../lib/test_fortify/write_overflow-memset.c
    11   warning: unsafe memscan() usage lacked '__read_overflow' warning i=
n ../lib/test_fortify/read_overflow-memscan.c
    11   warning: unsafe memmove() usage lacked '__write_overflow' warning =
in ../lib/test_fortify/write_overflow-memmove.c
    11   warning: unsafe memmove() usage lacked '__read_overflow2' warning =
in ../lib/test_fortify/read_overflow2-memmove.c
    11   warning: unsafe memcpy() usage lacked '__write_overflow' warning i=
n ../lib/test_fortify/write_overflow-memcpy.c
    11   warning: unsafe memcpy() usage lacked '__read_overflow2' warning i=
n ../lib/test_fortify/read_overflow2-memcpy.c
    11   warning: unsafe memcmp() usage lacked '__read_overflow2' warning i=
n ../lib/test_fortify/read_overflow2-memcmp.c
    11   warning: unsafe memcmp() usage lacked '__read_overflow' warning in=
 ../lib/test_fortify/read_overflow-memcmp.c
    11   warning: unsafe memchr_inv() usage lacked '__read_overflow' warnin=
g in ../lib/test_fortify/read_overflow-memchr_inv.c
    11   warning: unsafe memchr() usage lacked '__read_overflow' warning in=
 ../lib/test_fortify/read_overflow-memchr.c
    11   drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =
=E2=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=
=80=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigne=
d int=E2=80=99} [-Wformat=3D]
    11   drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =
=E2=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=
=80=99, but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigne=
d int=E2=80=99} [-Wformat=3D]
    11   drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =
=E2=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but ar=
gument 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=
=99} [-Wformat=3D]
    11   drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =
=E2=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=
=80=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigne=
d int=E2=80=99} [-Wformat=3D]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-Wa,-march=3D=
armv7-a' [-Wunused-command-line-argument]
    9    fs/locks.c:2509:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    8    2 warnings generated.
    6    fs/9p/vfs_file.c:322:1: warning: unused label 'out_err' [-Wunused-=
label]
    5    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: war=
ning: variable 'err' is used uninitialized whenever switch case is taken [-=
Wsometimes-uninitialized]
    5    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: war=
ning: variable 'err' is used uninitialized whenever 'if' condition is false=
 [-Wsometimes-uninitialized]
    5    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: not=
e: initialize the variable 'err' to silence this warning
    5    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: wa=
rning: variable 'err' is used uninitialized whenever 'if' condition is fals=
e [-Wsometimes-uninitialized]
    5    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: not=
e: initialize the variable 'err' to silence this warning
    5    3 warnings generated.
    3    include/linux/slab.h:618:9: warning: argument 1 value =E2=80=98184=
46744073709551615=E2=80=99 exceeds maximum object size 9223372036854775807 =
[-Walloc-size-larger-than=3D]
    3    drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c:901:6: warnin=
g: variable 'place' is used uninitialized whenever 'if' condition is false =
[-Wsometimes-uninitialized]
    3    drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c:899:10: note:=
 initialize the variable 'place' to silence this warning
    2    kernel/trace/trace_osnoise.c:1515:8: warning: =E2=80=98main=E2=80=
=99 is usually a function [-Wmain]
    2    kernel/trace/trace_events_hist.c:4713:13: warning: stack frame siz=
e of 1332 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=
=3D]
    2    drivers/gpu/drm/i915/gt/selftest_hangcheck.c:580:62: warning: vari=
able 'err' is uninitialized when used here [-Wuninitialized]
    2    drivers/gpu/drm/i915/gt/selftest_hangcheck.c:572:10: note: initial=
ize the variable 'err' to silence this warning
    2    drivers/gpu/drm/i915/gt/selftest_hangcheck.c:465:62: warning: vari=
able 'err' is uninitialized when used here [-Wuninitialized]
    2    drivers/gpu/drm/i915/gt/selftest_hangcheck.c:453:10: note: initial=
ize the variable 'err' to silence this warning
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_=
calc_31.c:939:13: warning: stack frame size of 1292 bytes in function 'dml_=
rq_dlg_get_dlg_params' [-Wframe-larger-than=3D]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:452:13:=
 warning: stack frame size of 1580 bytes in function 'dcn_bw_calc_rq_dlg_tt=
u' [-Wframe-larger-than=3D]
    2    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    include/linux/slab.h:461:9: warning: argument 1 value =E2=80=98429=
4967295=E2=80=99 exceeds maximum object size 2147483647 [-Walloc-size-large=
r-than=3D]
    1    include/linux/slab.h:461:9: warning: argument 1 value =E2=80=98184=
46744073709551615=E2=80=99 exceeds maximum object size 9223372036854775807 =
[-Walloc-size-larger-than=3D]
    1    drivers/staging/media/hantro/hantro_g2_hevc_dec.c:586:5: warning: =
stack frame size of 1236 bytes in function 'hantro_g2_hevc_dec_run' [-Wfram=
e-larger-than=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 3312 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 1828 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 1804 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/net/ethernet/8390/ne.c:909:20: warning: =E2=80=98ne_add_de=
vices=E2=80=99 defined but not used [-Wunused-function]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_c=
alc.c:997:6: warning: stack frame size of 1196 bytes in function 'dml1_rq_d=
lg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_c=
alc.c:997:6: warning: stack frame size of 1164 bytes in function 'dml1_rq_d=
lg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_=
calc_30.c:981:13: warning: stack frame size of 1052 bytes in function 'dml_=
rq_dlg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3397:6: warning: stack frame size of 1516 bytes in function 'dml21_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3397:6: warning: stack frame size of 1468 bytes in function 'dml21_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1466:13: warning: stack frame size of 1148 bytes in function 'DISPCL=
KDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation=
' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1466:13: warning: stack frame size of 1132 bytes in function 'DISPCL=
KDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation=
' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: warning: stack frame size of 1436 bytes in function 'dml20=
v2_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: warning: stack frame size of 1420 bytes in function 'dml20=
v2_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: warning: stack frame size of 1196 bytes in function 'dml2=
0v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceC=
alculation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: warning: stack frame size of 1164 bytes in function 'dml2=
0v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceC=
alculation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: warning: stack frame size of 1436 bytes in function 'dml20_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: warning: stack frame size of 1404 bytes in function 'dml20_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: warning: stack frame size of 1196 bytes in function 'dml20_=
DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcu=
lation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: warning: stack frame size of 1180 bytes in function 'dml20_=
DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcu=
lation' [-Wframe-larger-than=3D]
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    cc1: some warnings being treated as errors
    1    arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't f=
ind starting instruction
    1    arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't f=
ind starting instruction
    1    arch/x86/entry/entry_64.o: warning: objtool: asm_load_gs_index(): =
can't find starting instruction
    1    arch/arc/include/asm/perf_event.h:91:27: warning: =E2=80=98arc_pmu=
_ev_hw_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    1    arch/arc/include/asm/perf_event.h:126:27: warning: =E2=80=98arc_pm=
u_cache_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    1    1 warning generated  CC [M]  drivers/hwmon/hwmon-vid.o

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
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 34 errors, 42 warn=
ings, 0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 44 errors, 48 warnings, 0 secti=
on mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:40: error: =E2=80=98priv=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98pid=
=E2=80=99?
    ./../include/linux/compiler_types.h:324:38: error: call to =E2=80=98__c=
ompiletime_assert_1866=E2=80=99 declared with attribute error: FIELD_PREP: =
value too large for the field
    ./../include/linux/compiler_types.h:324:38: error: call to =E2=80=98__c=
ompiletime_assert_1873=E2=80=99 declared with attribute error: FIELD_PREP: =
value too large for the field

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    kernel/trace/trace_osnoise.c:1515:8: warning: =E2=80=98main=E2=80=99 is=
 usually a function [-Wmain]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    include/linux/slab.h:618:9: warning: argument 1 value =E2=80=9818446744=
073709551615=E2=80=99 exceeds maximum object size 9223372036854775807 [-Wal=
loc-size-larger-than=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-12) =E2=80=94 FAIL, 1 error, 41 warnings, 0 secti=
on mismatches

Errors:
    ERROR: modpost: "__mulodi4" [drivers/block/nbd.ko] undefined!

Warnings:
    kernel/trace/trace_events_hist.c:4713:13: warning: stack frame size of =
1332 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.
    fs/locks.c:2509:16: warning: unused variable 'inode' [-Wunused-variable]
    1 warning generated.
    fs/9p/vfs_file.c:322:1: warning: unused label 'out_err' [-Wunused-label]
    1 warning generated.
    drivers/gpu/drm/i915/gt/selftest_hangcheck.c:465:62: warning: variable =
'err' is uninitialized when used here [-Wuninitialized]
    drivers/gpu/drm/i915/gt/selftest_hangcheck.c:453:10: note: initialize t=
he variable 'err' to silence this warning
    drivers/gpu/drm/i915/gt/selftest_hangcheck.c:580:62: warning: variable =
'err' is uninitialized when used here [-Wuninitialized]
    drivers/gpu/drm/i915/gt/selftest_hangcheck.c:572:10: note: initialize t=
he variable 'err' to silence this warning
    2 warnings generated.
    drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c:901:6: warning: va=
riable 'place' is used uninitialized whenever 'if' condition is false [-Wso=
metimes-uninitialized]
    drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c:899:10: note: init=
ialize the variable 'place' to silence this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:452:13: warn=
ing: stack frame size of 1580 bytes in function 'dcn_bw_calc_rq_dlg_ttu' [-=
Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: warning=
: variable 'err' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: note: in=
itialize the variable 'err' to silence this warning
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: warning:=
 variable 'err' is used uninitialized whenever switch case is taken [-Wsome=
times-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: warning:=
 variable 'err' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: note: in=
itialize the variable 'err' to silence this warning
    3 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c=
:997:6: warning: stack frame size of 1196 bytes in function 'dml1_rq_dlg_ge=
t_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 1804 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: warning: stack frame size of 1180 bytes in function 'dml20_DISPC=
LKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculatio=
n' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: warning: stack frame size of 1404 bytes in function 'dml20_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: warning: stack frame size of 1164 bytes in function 'dml20v2_D=
ISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcul=
ation' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_=
30.c:981:13: warning: stack frame size of 1052 bytes in function 'dml_rq_dl=
g_get_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: warning: stack frame size of 1420 bytes in function 'dml20v2_Mo=
deSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_=
31.c:939:13: warning: stack frame size of 1292 bytes in function 'dml_rq_dl=
g_get_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated  CC [M]  drivers/hwmon/hwmon-vid.o
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1466:13: warning: stack frame size of 1132 bytes in function 'DISPCLKDPPC=
LKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-W=
frame-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3397:6: warning: stack frame size of 1468 bytes in function 'dml21_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-10) =E2=80=94 FAIL, 1 error, 41 warnings, 0 secti=
on mismatches

Errors:
    ERROR: modpost: "__mulodi4" [drivers/block/nbd.ko] undefined!

Warnings:
    kernel/trace/trace_events_hist.c:4713:13: warning: stack frame size of =
1332 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.
    fs/locks.c:2509:16: warning: unused variable 'inode' [-Wunused-variable]
    1 warning generated.
    drivers/gpu/drm/i915/gt/selftest_hangcheck.c:465:62: warning: variable =
'err' is uninitialized when used here [-Wuninitialized]
    drivers/gpu/drm/i915/gt/selftest_hangcheck.c:453:10: note: initialize t=
he variable 'err' to silence this warning
    drivers/gpu/drm/i915/gt/selftest_hangcheck.c:580:62: warning: variable =
'err' is uninitialized when used here [-Wuninitialized]
    drivers/gpu/drm/i915/gt/selftest_hangcheck.c:572:10: note: initialize t=
he variable 'err' to silence this warning
    2 warnings generated.
    drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c:901:6: warning: va=
riable 'place' is used uninitialized whenever 'if' condition is false [-Wso=
metimes-uninitialized]
    drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c:899:10: note: init=
ialize the variable 'place' to silence this warning
    1 warning generated.
    fs/9p/vfs_file.c:322:1: warning: unused label 'out_err' [-Wunused-label]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:452:13: warn=
ing: stack frame size of 1580 bytes in function 'dcn_bw_calc_rq_dlg_ttu' [-=
Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: warning=
: variable 'err' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: note: in=
itialize the variable 'err' to silence this warning
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: warning:=
 variable 'err' is used uninitialized whenever switch case is taken [-Wsome=
times-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: warning:=
 variable 'err' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: note: in=
itialize the variable 'err' to silence this warning
    3 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c=
:997:6: warning: stack frame size of 1164 bytes in function 'dml1_rq_dlg_ge=
t_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: warning: stack frame size of 1196 bytes in function 'dml20_DISPC=
LKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculatio=
n' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: warning: stack frame size of 1436 bytes in function 'dml20_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1466:13: warning: stack frame size of 1148 bytes in function 'DISPCLKDPPC=
LKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-W=
frame-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: warning: stack frame size of 1196 bytes in function 'dml20v2_D=
ISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcul=
ation' [-Wframe-larger-than=3D]
    drivers/staging/media/hantro/hantro_g2_hevc_dec.c:586:5: warning: stack=
 frame size of 1236 bytes in function 'hantro_g2_hevc_dec_run' [-Wframe-lar=
ger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3397:6: warning: stack frame size of 1516 bytes in function 'dml21_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: warning: stack frame size of 1436 bytes in function 'dml20v2_Mo=
deSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_=
31.c:939:13: warning: stack frame size of 1292 bytes in function 'dml_rq_dl=
g_get_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 1828 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-12) =E2=80=94 FAIL, 2 errors, 15 warnings, 0 sec=
tion mismatches

Errors:
    drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:40: error: use of undeclared=
 identifier 'priv'
    drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:56: error: use of undeclared=
 identifier 'priv'

Warnings:
    fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.
    fs/9p/vfs_file.c:322:1: warning: unused label 'out_err' [-Wunused-label]
    1 warning generated.
    drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c:901:6: warning: va=
riable 'place' is used uninitialized whenever 'if' condition is false [-Wso=
metimes-uninitialized]
    drivers/net/wireless/realtek/rtlwifi/rtl8192de/phy.c:899:10: note: init=
ialize the variable 'place' to silence this warning
    1 warning generated.
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: warning=
: variable 'err' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: note: in=
itialize the variable 'err' to silence this warning
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: warning:=
 variable 'err' is used uninitialized whenever switch case is taken [-Wsome=
times-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: warning:=
 variable 'err' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: note: in=
itialize the variable 'err' to silence this warning
    3 warnings generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 3312 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 FAIL, 80 errors, 48 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    drivers/gpu/drm/i915/i915_module.c:50:4: error: positional initializati=
on of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_i=
nit=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:50:4: error: invalid initializer
    include/linux/stddef.h:8:14: error: positional initialization of field =
in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_init=E2=80=99=
 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:51:4: error: positional initializati=
on of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_i=
nit=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:51:4: error: invalid initializer
    drivers/gpu/drm/i915/i915_module.c:51:29: error: positional initializat=
ion of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_=
init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:52:4: error: positional initializati=
on of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_i=
nit=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:52:4: error: invalid initializer
    drivers/gpu/drm/i915/i915_module.c:52:28: error: positional initializat=
ion of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_=
init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:53:4: error: positional initializati=
on of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_i=
nit=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:53:4: error: invalid initializer
    drivers/gpu/drm/i915/i915_module.c:53:30: error: positional initializat=
ion of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_=
init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:54:4: error: positional initializati=
on of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_i=
nit=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:54:4: error: invalid initializer
    drivers/gpu/drm/i915/i915_module.c:54:34: error: positional initializat=
ion of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_=
init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:55:4: error: positional initializati=
on of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_i=
nit=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:55:4: error: invalid initializer
    drivers/gpu/drm/i915/i915_module.c:55:30: error: positional initializat=
ion of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_=
init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:56:4: error: positional initializati=
on of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_i=
nit=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:56:4: error: invalid initializer
    drivers/gpu/drm/i915/i915_module.c:56:30: error: positional initializat=
ion of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_=
init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:57:4: error: positional initializati=
on of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_i=
nit=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:57:4: error: invalid initializer
    drivers/gpu/drm/i915/i915_module.c:57:32: error: positional initializat=
ion of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_=
init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:58:4: error: positional initializati=
on of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_i=
nit=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:58:4: error: invalid initializer
    drivers/gpu/drm/i915/i915_module.c:58:26: error: positional initializat=
ion of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_=
init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:59:4: error: positional initializati=
on of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_i=
nit=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:59:4: error: invalid initializer
    include/linux/stddef.h:8:14: error: positional initialization of field =
in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_init=E2=80=99=
 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:60:4: error: positional initializati=
on of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_i=
nit=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:60:4: error: invalid initializer
    drivers/gpu/drm/i915/i915_module.c:60:19: error: positional initializat=
ion of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_=
init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:61:4: error: positional initializati=
on of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_i=
nit=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:61:4: error: invalid initializer
    drivers/gpu/drm/i915/i915_module.c:61:30: error: positional initializat=
ion of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_=
init=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:62:4: error: positional initializati=
on of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_i=
nit=E2=80=99 attribute [-Werror=3Ddesignated-init]
    drivers/gpu/drm/i915/i915_module.c:62:4: error: invalid initializer
    drivers/gpu/drm/i915/i915_module.c:62:31: error: positional initializat=
ion of field in =E2=80=98struct=E2=80=99 declared with =E2=80=98designated_=
init=E2=80=99 attribute [-Werror=3Ddesignated-init]

Warnings:
    kernel/trace/trace_osnoise.c:1515:8: warning: =E2=80=98main=E2=80=99 is=
 usually a function [-Wmain]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    cc1: some warnings being treated as errors
    include/linux/slab.h:618:9: warning: argument 1 value =E2=80=9818446744=
073709551615=E2=80=99 exceeds maximum object size 9223372036854775807 [-Wal=
loc-size-larger-than=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.
    fs/locks.c:2509:16: warning: unused variable 'inode' [-Wunused-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    arch/x86/entry/entry_64.o: warning: objtool: asm_load_gs_index(): can't=
 find starting instruction
    fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.
    arch/x86/lib/memcpy_64.o: warning: objtool: memcpy_erms(): can't find s=
tarting instruction
    arch/x86/lib/memset_64.o: warning: objtool: memset_erms(): can't find s=
tarting instruction

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section mi=
smatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.
    fs/locks.c:2509:16: warning: unused variable 'inode' [-Wunused-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section m=
ismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 37 errors, 38 warnings, 0 =
section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 37 errors, 38 warnings, 0 =
section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 FAIL, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 5 warnings, 0 section mis=
matches

Errors:
    drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:40: error: =E2=80=98priv=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98pid=
=E2=80=99?

Warnings:
    fs/9p/vfs_file.c:322:1: warning: label =E2=80=98out_err=E2=80=99 define=
d but not used [-Wunused-label]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section mi=
smatches

Warnings:
    fs/9p/vfs_file.c:322:1: warning: label =E2=80=98out_err=E2=80=99 define=
d but not used [-Wunused-label]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-12) =E2=80=94 FAIL, 2 errors, 10 warnings, 0 sectio=
n mismatches

Errors:
    drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:40: error: use of undeclared=
 identifier 'priv'
    drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:56: error: use of undeclared=
 identifier 'priv'

Warnings:
    fs/9p/vfs_file.c:322:1: warning: unused label 'out_err' [-Wunused-label]
    1 warning generated.
    fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: warning=
: variable 'err' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: note: in=
itialize the variable 'err' to silence this warning
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: warning:=
 variable 'err' is used uninitialized whenever switch case is taken [-Wsome=
times-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: warning:=
 variable 'err' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: note: in=
itialize the variable 'err' to silence this warning
    3 warnings generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-12) =E2=80=94 FAIL, 2 er=
rors, 10 warnings, 0 section mismatches

Errors:
    drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:40: error: use of undeclared=
 identifier 'priv'
    drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:56: error: use of undeclared=
 identifier 'priv'

Warnings:
    fs/9p/vfs_file.c:322:1: warning: unused label 'out_err' [-Wunused-label]
    1 warning generated.
    fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:157:11: warning=
: variable 'err' is used uninitialized whenever 'if' condition is false [-W=
sometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:140:9: note: in=
itialize the variable 'err' to silence this warning
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:262:7: warning:=
 variable 'err' is used uninitialized whenever switch case is taken [-Wsome=
times-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:257:7: warning:=
 variable 'err' is used uninitialized whenever 'if' condition is false [-Ws=
ometimes-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en/rep/bridge.c:247:9: note: in=
itialize the variable 'err' to silence this warning
    3 warnings generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 FAIL, 1 error=
, 5 warnings, 0 section mismatches

Errors:
    drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:40: error: =E2=80=98priv=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98pid=
=E2=80=99?

Warnings:
    fs/9p/vfs_file.c:322:1: warning: label =E2=80=98out_err=E2=80=99 define=
d but not used [-Wunused-label]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 FAIL, 1 error,=
 5 warnings, 0 section mismatches

Errors:
    drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:40: error: =E2=80=98priv=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98pid=
=E2=80=99?

Warnings:
    fs/9p/vfs_file.c:322:1: warning: label =E2=80=98out_err=E2=80=99 define=
d but not used [-Wunused-label]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-12) =E2=80=94 PASS, 0 errors, 4 warn=
ings, 0 section mismatches

Warnings:
    fs/9p/vfs_file.c:322:1: warning: unused label 'out_err' [-Wunused-label]
    1 warning generated.
    fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 FAIL, 1 error,=
 5 warnings, 0 section mismatches

Errors:
    drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:40: error: =E2=80=98priv=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98pid=
=E2=80=99?

Warnings:
    fs/9p/vfs_file.c:322:1: warning: label =E2=80=98out_err=E2=80=99 define=
d but not used [-Wunused-label]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 5 warnings, 0 section=
 mismatches

Errors:
    drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:40: error: =E2=80=98priv=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98pid=
=E2=80=99?

Warnings:
    fs/9p/vfs_file.c:322:1: warning: label =E2=80=98out_err=E2=80=99 define=
d but not used [-Wunused-label]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 37 errors, 38 warnings, =
0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]

Warnings:
    fs/9p/vfs_file.c:322:1: warning: label =E2=80=98out_err=E2=80=99 define=
d but not used [-Wunused-label]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 FAIL, 41 errors, 44 warnings, =
0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    drivers/gpu/drm/mediatek/mtk_disp_aal.c:60:40: error: =E2=80=98priv=E2=
=80=99 undeclared (first use in this function); did you mean =E2=80=98pid=
=E2=80=99?

Warnings:
    fs/9p/vfs_file.c:322:1: warning: label =E2=80=98out_err=E2=80=99 define=
d but not used [-Wunused-label]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 3 errors, 9 warnings, 0 secti=
on mismatches

Errors:
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section =
mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 7 wa=
rnings, 0 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    arch/arc/include/asm/perf_event.h:126:27: warning: =E2=80=98arc_pmu_cac=
he_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    arch/arc/include/asm/perf_event.h:91:27: warning: =E2=80=98arc_pmu_ev_h=
w_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.
    fs/locks.c:2509:16: warning: unused variable 'inode' [-Wunused-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.
    fs/locks.c:2509:16: warning: unused variable 'inode' [-Wunused-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 34 errors, 38 warnin=
gs, 0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 FAIL, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    include/linux/slab.h:461:9: warning: argument 1 value =E2=80=9818446744=
073709551615=E2=80=99 exceeds maximum object size 9223372036854775807 [-Wal=
loc-size-larger-than=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    include/linux/slab.h:618:9: warning: argument 1 value =E2=80=9818446744=
073709551615=E2=80=99 exceeds maximum object size 9223372036854775807 [-Wal=
loc-size-larger-than=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/9p/vfs_file.c:322:1: warning: label =E2=80=98out_err=E2=80=99 define=
d but not used [-Wunused-label]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warning=
s, 0 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, =
0 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.
    fs/locks.c:2509:16: warning: unused variable 'inode' [-Wunused-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.
    fs/locks.c:2509:16: warning: unused variable 'inode' [-Wunused-variable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 3 errors, 9 warnings, 0 sec=
tion mismatches

Errors:
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 24 warnings, 0=
 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]
    fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.
    fs/locks.c:2509:16: warning: unused variable 'inode' [-Wunused-variable]
    1 warning generated.
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-Wa,-march=3Darmv7=
-a' [-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 3=
 errors, 9 warnings, 0 section mismatches

Errors:
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 3 errors, 9 warnings, 0 section mismatches

Errors:
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 3 errors, 9 =
warnings, 0 section mismatches

Errors:
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 40 errors, 43 war=
nings, 0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section =
mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warn=
ings, 0 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 3 errors, 9 warnings, 0 section =
mismatches

Errors:
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    drivers/net/ethernet/8390/ne.c:909:20: warning: =E2=80=98ne_add_devices=
=E2=80=99 defined but not used [-Wunused-function]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 14 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/9p/vfs_file.c:322:1: warning: label =E2=80=98out_err=E2=80=99 define=
d but not used [-Wunused-label]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    include/linux/slab.h:461:9: warning: argument 1 value =E2=80=9842949672=
95=E2=80=99 exceeds maximum object size 2147483647 [-Walloc-size-larger-tha=
n=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 3 errors, 9 warnings, 0 sectio=
n mismatches

Errors:
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",
    TP_printk("dx: %12lld. dy: %12lld median_m: %12lld median_error: %12lld=
 len: %d x: %12lld y: %12lld",

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 3 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:95:12: warning: format =E2=80=
=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=99, =
but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:125:12: warning: format =E2=
=80=98%lld=E2=80=99 expects argument of type =E2=80=98long long int=E2=80=
=99, but argument 4 has type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned i=
nt=E2=80=99} [-Wformat=3D]
    drivers/platform/chrome/./cros_ec_trace.h:156:12: warning: format =E2=
=80=98%d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argum=
ent 7 has type =E2=80=98s64=E2=80=99 {aka =E2=80=98long long int=E2=80=99} =
[-Wformat=3D]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mis=
matches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    fs/9p/vfs_file.c:322:1: warning: label =E2=80=98out_err=E2=80=99 define=
d but not used [-Wunused-label]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-var=
iable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 37 errors, 36 wa=
rnings, 0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2=
 warnings, 0 section mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 3=
7 errors, 36 warnings, 0 section mismatches

Errors:
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:237:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memcmp.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:263:4: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:235:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:250:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow2-memcmp.c:3:2: error: statement with no =
effect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:265:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:221:4: error: call to =E2=80=98__read_ov=
erflow2=E2=80=99 declared with attribute error: detected read beyond size o=
f object (2nd parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:154:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:125:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    lib/test_fortify/read_overflow-memchr.c:3:2: error: statement with no e=
ffect [-Werror=3Dunused-value]
    include/linux/fortify-string.h:277:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:289:3: error: call to =E2=80=98__read_ov=
erflow=E2=80=99 declared with attribute error: detected read beyond size of=
 object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:319:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:206:3: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:56:3: error: call to =E2=80=98__write_ov=
erflow=E2=80=99 declared with attribute error: detected write beyond size o=
f object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]
    include/linux/fortify-string.h:219:4: error: call to =E2=80=98__write_o=
verflow=E2=80=99 declared with attribute error: detected write beyond size =
of object (1st parameter)
    cc1: error: unrecognized command line option =E2=80=98-Wno-alloc-size-l=
arger-than=E2=80=99 [-Werror]

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__read_overflow2' warning in ..=
/lib/test_fortify/read_overflow2-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memmove() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-memmove.c
    cc1: all warnings being treated as errors
    warning: unsafe memscan() usage lacked '__read_overflow' warning in ../=
lib/test_fortify/read_overflow-memscan.c
    cc1: all warnings being treated as errors
    warning: unsafe memcmp() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcmp.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__read_overflow2' warning in ../=
lib/test_fortify/read_overflow2-memcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strscpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strscpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strlcpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strlcpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy-lit.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr() usage lacked '__read_overflow' warning in ../l=
ib/test_fortify/read_overflow-memchr.c
    cc1: all warnings being treated as errors
    warning: unsafe memchr_inv() usage lacked '__read_overflow' warning in =
../lib/test_fortify/read_overflow-memchr_inv.c
    cc1: all warnings being treated as errors
    warning: unsafe strcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-strcpy.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy.c
    cc1: all warnings being treated as errors
    warning: unsafe memset() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memset.c
    cc1: all warnings being treated as errors
    warning: unsafe strncpy() usage lacked '__write_overflow' warning in ..=
/lib/test_fortify/write_overflow-strncpy-src.c
    cc1: all warnings being treated as errors
    warning: unsafe memcpy() usage lacked '__write_overflow' warning in ../=
lib/test_fortify/write_overflow-memcpy.c
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 4 =
warnings, 0 section mismatches

Warnings:
    fs/9p/vfs_file.c:322:1: warning: label =E2=80=98out_err=E2=80=99 define=
d but not used [-Wunused-label]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    fs/remap_range.c:102:16: warning: unused variable =E2=80=98inode=E2=80=
=99 [-Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99
    fs/locks.c:2509:16: warning: unused variable =E2=80=98inode=E2=80=99 [-=
Wunused-variable]
    cc1: warning: unrecognized command line option =E2=80=98-Wno-alloc-size=
-larger-than=E2=80=99

---
For more info write to <info@kernelci.org>
