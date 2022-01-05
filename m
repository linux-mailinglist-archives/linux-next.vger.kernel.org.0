Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F29848514F
	for <lists+linux-next@lfdr.de>; Wed,  5 Jan 2022 11:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233068AbiAEKnY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Jan 2022 05:43:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234952AbiAEKnY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Jan 2022 05:43:24 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E24C061761
        for <linux-next@vger.kernel.org>; Wed,  5 Jan 2022 02:43:23 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id x15so29038338plg.1
        for <linux-next@vger.kernel.org>; Wed, 05 Jan 2022 02:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=a695gFgxztgWW3phED0mTgB9DlaBkVZiCHvpKaIurxw=;
        b=1GCGhaP86Wi5tmT2pDrLtEjGIZJwynmKRoInZTlkKgDmxv3CCPFp0WmDx6WH1ZlbSO
         RPPAuObDibD1ym5MHXebPoQgPkEOcjF1DxO/CrYJg7x6PPSvUYcRStoR/EdNEoiSoSsI
         kLd0jjWkeZDSLnU7Ftta5OE47h1cXmkZzkeVxY4u4pKK4Btzp4yZhtcp9b9C2MtvmiHF
         X0XryJImPHs8nbueFpslmb/lLJjx9XPPXF8aOG8dEiZ3GZltT6zx7+KG1IUnySiJrzuy
         RJwsVuoiYG3A8ey0PDzI9roe6URp12ghLPopBesgKlJUYfoilblVP83vWaxCElRDHzi2
         iCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=a695gFgxztgWW3phED0mTgB9DlaBkVZiCHvpKaIurxw=;
        b=CC5eV6p60VehXFdTyY0w4uibPbohj01nAE2MRmxc1LBGItag/18MDhucJfPnFmXBqg
         gFnx/MkGecljb+YYhnvR+iZmHM481uuFjdlB2m4aMQ0X74Ws4mPmoQAjHq9kDyLJAmjk
         p2H65zeDNYHcMSwczkyZPYdSweD8KNC/ZangK4WidaiyEPCeQKB9VXdTI4w1QZWVmRRl
         3GExIXoqbiQfk/10D1jQ/9o7MnJiHOIHl9uVd0/McpbyGJPDTybaH7hE9gZmfMoJVEUu
         5eevorEWBEtoXezf4xhkc2QzY6OejbqGj6nPY4aDTW2s7J0NjZptjGB/hzJQoRIQhFoh
         /Uaw==
X-Gm-Message-State: AOAM532YDlpCW/df0yw3wQntGSw/TizFcYtPHFMogIO0Lu7c4CRpWtue
        PqiYx3Y5cPvUh4TwoEZHzg3koncOIJvwdxZ7
X-Google-Smtp-Source: ABdhPJxBLIO1vZgU6U+XWDRwIWWys9Lr5ZIMIrGO7bM4GKl3NkN7cz6LqieCEBMzeN1mlSaVYUuybQ==
X-Received: by 2002:a17:902:d645:b0:149:b7bf:9932 with SMTP id y5-20020a170902d64500b00149b7bf9932mr15589811plh.48.1641379401956;
        Wed, 05 Jan 2022 02:43:21 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q19sm45735747pfk.83.2022.01.05.02.43.20
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 02:43:21 -0800 (PST)
Message-ID: <61d57649.1c69fb81.b5759.7bb8@mx.google.com>
Date:   Wed, 05 Jan 2022 02:43:21 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20220105
X-Kernelci-Branch: master
Subject: next/master build: 235 builds: 42 failed, 193 passed, 237 errors,
 62 warnings (next-20220105)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 235 builds: 42 failed, 193 passed, 237 errors, 62 warnin=
gs (next-20220105)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220105/

Tree: next
Branch: master
Git Describe: next-20220105
Git Commit: 7a769a3922d81cfc74ab4d90a9cc69485f260976
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arc:
    tinyconfig: (gcc-10) FAIL

arm64:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL
    tinyconfig: (gcc-10) FAIL

arm:
    allmodconfig: (clang-14) FAIL
    allnoconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL
    allnoconfig: (gcc-10) FAIL
    am200epdkit_defconfig: (gcc-10) FAIL
    lpc18xx_defconfig: (gcc-10) FAIL
    mps2_defconfig: (gcc-10) FAIL
    multi_v7_defconfig+CONFIG_SMP=3Dn: (gcc-10) FAIL
    omap1_defconfig: (gcc-10) FAIL
    pleb_defconfig: (gcc-10) FAIL
    qcom_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL
    stm32_defconfig: (gcc-10) FAIL
    tct_hammer_defconfig: (gcc-10) FAIL
    tinyconfig: (gcc-10) FAIL
    vf610m4_defconfig: (gcc-10) FAIL
    viper_defconfig: (gcc-10) FAIL
    xcep_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-14) FAIL
    tinyconfig: (gcc-10) FAIL

mips:
    bcm63xx_defconfig: (gcc-10) FAIL
    bigsur_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    decstation_defconfig: (gcc-10) FAIL
    decstation_r4k_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL
    ip28_defconfig: (gcc-10) FAIL
    sb1250_swarm_defconfig: (gcc-10) FAIL
    tinyconfig: (gcc-10) FAIL

riscv:
    allnoconfig: (clang-14) FAIL
    allnoconfig: (gcc-10) FAIL
    nommu_k210_defconfig: (gcc-10) FAIL
    nommu_k210_sdcard_defconfig: (gcc-10) FAIL
    nommu_virt_defconfig: (gcc-10) FAIL
    tinyconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL
    tinyconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+debug (gcc-10): 1 warning
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 warning
    tinyconfig (gcc-10): 1 error, 1 warning

arm64:
    allmodconfig (clang-14): 1 error
    allmodconfig (gcc-10): 1 error, 1 warning
    defconfig (clang-14): 3 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-14): 3 warnings
    tinyconfig (gcc-10): 1 error

arm:
    allmodconfig (clang-14): 5 errors, 16 warnings
    allmodconfig (gcc-10): 179 errors, 2 warnings
    allnoconfig (clang-14): 1 error, 1 warning
    allnoconfig (gcc-10): 1 error
    am200epdkit_defconfig (gcc-10): 1 error
    aspeed_g5_defconfig (clang-14): 10 warnings
    at91_dt_defconfig (gcc-10): 1 warning
    lpc18xx_defconfig (gcc-10): 1 error
    mps2_defconfig (gcc-10): 1 error
    multi_v5_defconfig (gcc-10): 1 warning
    multi_v7_defconfig (clang-14): 10 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-10): 2 warni=
ngs
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 2 errors
    omap1_defconfig (gcc-10): 1 error
    pleb_defconfig (gcc-10): 1 error
    qcom_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors
    stm32_defconfig (gcc-10): 1 error
    tct_hammer_defconfig (gcc-10): 1 error
    tinyconfig (gcc-10): 1 error
    vf610m4_defconfig (gcc-10): 1 error
    viper_defconfig (gcc-10): 1 error
    xcep_defconfig (gcc-10): 1 error

i386:
    allmodconfig (clang-14): 9 errors, 1 warning
    tinyconfig (gcc-10): 1 error

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    bcm63xx_defconfig (gcc-10): 1 error
    bigsur_defconfig (gcc-10): 1 error
    ci20_defconfig (gcc-10): 1 warning
    decstation_64_defconfig (gcc-10): 1 error
    decstation_defconfig (gcc-10): 1 error
    decstation_r4k_defconfig (gcc-10): 1 error
    fuloong2e_defconfig (gcc-10): 1 error
    lemote2f_defconfig (gcc-10): 1 error
    sb1250_swarm_defconfig (gcc-10): 1 error
    tinyconfig (gcc-10): 1 error

riscv:
    allnoconfig (gcc-10): 1 error
    allnoconfig (clang-14): 1 error
    nommu_k210_defconfig (gcc-10): 1 error
    nommu_k210_sdcard_defconfig (gcc-10): 1 error
    nommu_virt_defconfig (gcc-10): 1 error
    tinyconfig (gcc-10): 1 error

x86_64:
    allmodconfig (clang-14): 3 errors, 1 warning
    allmodconfig (gcc-10): 2 errors
    tinyconfig (gcc-10): 1 error
    x86_64_defconfig (clang-14): 1 warning
    x86_64_defconfig+debug (gcc-10): 2 warnings

Errors summary:

    22   mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unu=
se=E2=80=99
    3    mm/shmem.c:3993:5: error: conflicting types for 'shmem_unuse'
    3    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of =
read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99
    2    drivers/scsi/hisi_sas/hisi_sas_main.c:1536:21: error: variable 'sa=
s_phy' is uninitialized when used here [-Werror,-Wuninitialized]
    2    drivers/net/ethernet/broadcom/sb1250-mac.c:2187:20: error: assignm=
ent of read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99
    2    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    2    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h=
:2500:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or d=
irectory
    1    irq-gic-v3-its.c:(.text+0x14b8): undefined reference to `cpus_boot=
ed_once_mask'
    1    include/asm-generic/div64.h:222:28: error: comparison of distinct =
pointer types lacks a cast [-Werror]
    1    drivers/usb/gadget/udc/at91_udc.h:174:33: error: format =E2=80=98%=
d=E2=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 3 h=
as type =E2=80=98struct gpio_desc *=E2=80=99 [-Werror=3Dformat=3D]
    1    drivers/power/reset/ltc2952-poweroff.c:163:41: error: expression r=
equires  'long double' type support, but target 'x86_64-unknown-linux-gnu' =
does not support it
    1    drivers/power/reset/ltc2952-poweroff.c:162:28: error: expression r=
equires  'long double' type support, but target 'x86_64-unknown-linux-gnu' =
does not support it
    1    drivers/power/reset/ltc2952-poweroff.c:162:21: error: expression r=
equires  'long double' type support, but target 'x86_64-unknown-linux-gnu' =
does not support it
    1    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assignment disc=
ards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=3D=
discarded-qualifiers]
    1    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assigning to 'c=
onst char **' from 'const char *const *' discards qualifiers [-Werror,-Winc=
ompatible-pointer-types-discards-qualifiers]
    1    drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c:1070:2: err=
or: comparison of distinct pointer types ('typeof ((rtt_avg)) *' (aka 'long=
 long *') and 'uint64_t *' (aka 'unsigned long long *')) [-Werror,-Wcompare=
-distinct-pointer-types]
    1    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame=
 size (1040) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-large=
r-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_=
calc_21.c:829:13: error: stack frame size (1084) exceeds limit (1024) in 'd=
ml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3518:6: error: stack frame size (1260) exceeds limit (1024) in 'dml2=
1_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1466:13: error: stack frame size (1212) exceeds limit (1024) in 'DIS=
PCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculat=
ion' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: error: stack frame size (1580) exceeds limit (1024) in 'dm=
l20v2_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: error: stack frame size (1356) exceeds limit (1024) in 'd=
ml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman=
ceCalculation' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: error: stack frame size (1564) exceeds limit (1024) in 'dml2=
0_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: error: stack frame size (1388) exceeds limit (1024) in 'dml=
20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation' [-Werror,-Wframe-larger-than]
    1    crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limi=
t (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
    1    arm-linux-gnueabihf-ld: irq-gic-v3-its.c:(.text+0x14bc): undefined=
 reference to `cpus_booted_once_mask'
    1    arch/x86/include/asm/checksum_32.h:149:6: error: inline assembly r=
equires more registers than available
    1    arch/arm/lib/xor-neon.c:30:2: error: This code requires at least v=
ersion 4.6 of GCC [-Werror,-W#warnings]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: und=
efined reference to `drm_panel_dp_aux_backlight'
    1    /tmp/ccDvL5iy.s:7958: Error: invalid literal constant: pool needs =
to be closer
    1    /tmp/ccDvL5iy.s:516: Error: invalid literal constant: pool needs t=
o be closer
    1    /tmp/ccDvL5iy.s:45416: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:45357: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:45295: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:45200: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:44681: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:44622: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:44560: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:44463: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:44099: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:44040: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:43980: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:43890: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:43664: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:43605: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:43538: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:43438: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:42992: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:42947: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:42699: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:42640: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:42573: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:42473: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:42028: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:41983: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:41324: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:41265: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:41205: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:41115: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:40852: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:40793: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:40731: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:40637: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:40413: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:40354: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:40287: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:40189: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:39984: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:39925: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:39863: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:39769: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:39585: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:39526: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:39459: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:39359: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:39115: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:39056: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:38996: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:38892: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:38654: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:38595: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:38528: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:38430: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:38170: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:38111: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:38044: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:37948: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:37732: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:37673: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:37611: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:37516: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:37318: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:37259: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:37192: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:37096: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:36918: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:36859: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:36797: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:36701: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:36069: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:36010: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:35948: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:35853: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:35674: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:35615: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:35548: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:35452: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:35298: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:35239: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:35173: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:35076: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:34931: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:34872: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:34806: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:34709: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:34545: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:34486: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:34419: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:34323: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:34122: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:34063: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:34001: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:33905: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:33739: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:33680: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:33613: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:33514: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:33362: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:33303: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:33237: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:33140: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:32986: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:32927: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:32865: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:32768: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:32639: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:32580: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:32518: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:32423: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:32267: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:32208: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:32145: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:32050: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:31912: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:31853: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:31791: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:31696: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:31555: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:31496: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:31436: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:31347: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:31197: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:31138: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:31076: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:30987: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:30892: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:30833: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:30773: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:30684: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:30547: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:30488: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:30426: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:30331: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:30192: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:30133: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:30071: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:29982: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:29894: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:29835: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:29775: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:29686: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:29534: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:29475: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:29413: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:29318: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:29211: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:29152: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:29092: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:29002: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:28703: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:28643: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:28583: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:28491: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:28418: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:28358: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:28298: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:28208: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:28135: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:28075: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:28015: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:27930: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:27858: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:27798: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:27738: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:27654: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:27585: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:27526: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:27466: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:27382: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:25872: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:17774: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:17713: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:13634: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:13534: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:12244: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccDvL5iy.s:12204: Error: invalid literal constant: pool needs=
 to be closer

Warnings summary:

    24   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    4    drivers/scsi/hisi_sas/hisi_sas_main.c:1528:29: note: initialize th=
e variable 'sas_phy' to silence this warning
    3    cc1: all warnings being treated as errors
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    3    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' i=
s unknown, fallback to ''
    2    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=
=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 2 has t=
ype =E2=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]
    2    drivers/scsi/hisi_sas/hisi_sas_main.c:1536:21: warning: variable '=
sas_phy' is uninitialized when used here [-Wuninitialized]
    2    1 warning generated.
    1    net/core/skbuff.o: warning: objtool: skb_copy()+0x12d: unreachable=
 instruction
    1    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x5d: call to=
 do_strnlen_user() with UACCESS enabled
    1    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8=
a: call to do_strncpy_from_user() with UACCESS enabled
    1    drivers/net/ethernet/allwinner/sun4i-emac.c:922:64: warning: forma=
t =E2=80=98%u=E2=80=99 expects argument of type =E2=80=98unsigned int=E2=80=
=99, but argument 4 has type =E2=80=98resource_size_t=E2=80=99 {aka =E2=80=
=98long long unsigned int=E2=80=99} [-Wformat=3D]
    1    drivers/net/ethernet/allwinner/sun4i-emac.c:922:53: warning: forma=
t =E2=80=98%x=E2=80=99 expects argument of type =E2=80=98unsigned int=E2=80=
=99, but argument 3 has type =E2=80=98resource_size_t=E2=80=99 {aka =E2=80=
=98long long unsigned int=E2=80=99} [-Wformat=3D]
    1    clang: warning: argument unused during compilation: '-march=3Darmv=
7-m' [-Wunused-command-line-argument]
    1    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls t=
hrough to next function startup_64_setup_env()
    1    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit=
_address_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name shou=
ld not have leading "0x"
    1    #warning This code requires at least version 4.6 of GCC

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
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-14) =E2=80=94 FAIL, 9 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    arch/x86/include/asm/checksum_32.h:149:6: error: inline assembly requir=
es more registers than available
    drivers/scsi/hisi_sas/hisi_sas_main.c:1536:21: error: variable 'sas_phy=
' is uninitialized when used here [-Werror,-Wuninitialized]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: error: stack frame size (1388) exceeds limit (1024) in 'dml20_DI=
SPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcula=
tion' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_=
21.c:829:13: error: stack frame size (1084) exceeds limit (1024) in 'dml_rq=
_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: error: stack frame size (1564) exceeds limit (1024) in 'dml20_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: error: stack frame size (1356) exceeds limit (1024) in 'dml20v=
2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCal=
culation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1466:13: error: stack frame size (1212) exceeds limit (1024) in 'DISPCLKD=
PPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' =
[-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3518:6: error: stack frame size (1260) exceeds limit (1024) in 'dml21_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: error: stack frame size (1580) exceeds limit (1024) in 'dml20v2=
_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]

Warnings:
    drivers/scsi/hisi_sas/hisi_sas_main.c:1528:29: note: initialize the var=
iable 'sas_phy' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-14) =E2=80=94 FAIL, 3 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    drivers/power/reset/ltc2952-poweroff.c:162:28: error: expression requir=
es  'long double' type support, but target 'x86_64-unknown-linux-gnu' does =
not support it
    drivers/power/reset/ltc2952-poweroff.c:162:21: error: expression requir=
es  'long double' type support, but target 'x86_64-unknown-linux-gnu' does =
not support it
    drivers/power/reset/ltc2952-poweroff.c:163:41: error: expression requir=
es  'long double' type support, but target 'x86_64-unknown-linux-gnu' does =
not support it

Warnings:
    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls throug=
h to next function startup_64_setup_env()

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-14) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assigning to 'const =
char **' from 'const char *const *' discards qualifiers [-Werror,-Wincompat=
ible-pointer-types-discards-qualifiers]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assignment discards =
=E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=3Ddisca=
rded-qualifiers]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h:2500=
:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or direct=
ory
    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h:2500=
:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or direct=
ory

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-14) =E2=80=94 FAIL, 5 errors, 16 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/lib/xor-neon.c:30:2: error: This code requires at least versio=
n 4.6 of GCC [-Werror,-W#warnings]
    crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (10=
24) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size=
 (1040) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-tha=
n]
    drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c:1070:2: error: c=
omparison of distinct pointer types ('typeof ((rtt_avg)) *' (aka 'long long=
 *') and 'uint64_t *' (aka 'unsigned long long *')) [-Werror,-Wcompare-dist=
inct-pointer-types]
    drivers/scsi/hisi_sas/hisi_sas_main.c:1536:21: error: variable 'sas_phy=
' is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    #warning This code requires at least version 4.6 of GCC
    drivers/scsi/hisi_sas/hisi_sas_main.c:1528:29: note: initialize the var=
iable 'sas_phy' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 179 errors, 2 warnings, 0 sectio=
n mismatches

Errors:
    /tmp/ccDvL5iy.s:516: Error: invalid literal constant: pool needs to be =
closer
    /tmp/ccDvL5iy.s:7958: Error: invalid literal constant: pool needs to be=
 closer
    /tmp/ccDvL5iy.s:12204: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:12244: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:13534: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:13634: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:17713: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:17774: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:25872: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:27382: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:27466: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:27526: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:27585: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:27654: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:27738: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:27798: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:27858: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:27930: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:28015: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:28075: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:28135: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:28208: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:28298: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:28358: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:28418: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:28491: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:28583: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:28643: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:28703: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:29002: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:29092: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:29152: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:29211: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:29318: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:29413: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:29475: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:29534: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:29686: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:29775: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:29835: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:29894: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:29982: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:30071: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:30133: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:30192: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:30331: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:30426: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:30488: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:30547: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:30684: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:30773: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:30833: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:30892: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:30987: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:31076: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:31138: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:31197: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:31347: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:31436: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:31496: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:31555: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:31696: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:31791: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:31853: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:31912: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:32050: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:32145: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:32208: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:32267: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:32423: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:32518: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:32580: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:32639: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:32768: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:32865: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:32927: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:32986: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:33140: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:33237: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:33303: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:33362: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:33514: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:33613: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:33680: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:33739: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:33905: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:34001: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:34063: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:34122: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:34323: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:34419: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:34486: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:34545: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:34709: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:34806: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:34872: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:34931: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:35076: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:35173: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:35239: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:35298: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:35452: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:35548: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:35615: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:35674: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:35853: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:35948: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:36010: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:36069: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:36701: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:36797: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:36859: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:36918: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:37096: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:37192: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:37259: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:37318: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:37516: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:37611: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:37673: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:37732: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:37948: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:38044: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:38111: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:38170: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:38430: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:38528: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:38595: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:38654: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:38892: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:38996: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:39056: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:39115: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:39359: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:39459: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:39526: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:39585: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:39769: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:39863: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:39925: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:39984: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:40189: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:40287: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:40354: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:40413: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:40637: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:40731: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:40793: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:40852: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:41115: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:41205: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:41265: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:41324: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:41983: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:42028: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:42473: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:42573: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:42640: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:42699: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:42947: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:42992: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:43438: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:43538: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:43605: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:43664: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:43890: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:43980: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:44040: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:44099: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:44463: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:44560: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:44622: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:44681: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:45200: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:45295: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:45357: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccDvL5iy.s:45416: Error: invalid literal constant: pool needs to b=
e closer
    drivers/usb/gadget/udc/at91_udc.h:174:33: error: format =E2=80=98%d=E2=
=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 3 has t=
ype =E2=80=98struct gpio_desc *=E2=80=99 [-Werror=3Dformat=3D]
    include/asm-generic/div64.h:222:28: error: comparison of distinct point=
er types lacks a cast [-Werror]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, clang-14) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for 'shmem_unuse'

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-14) =E2=80=94 FAIL, 1 error, 1 warning, 0 section m=
ismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for 'shmem_unuse'

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-m' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

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
aspeed_g5_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 10 warnings, =
0 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=80=99 =
expects argument of type =E2=80=98int=E2=80=99, but argument 2 has type =E2=
=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]

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
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    drivers/net/ethernet/broadcom/sb1250-mac.c:2187:20: error: assignment o=
f read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit_addr=
ess_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name should no=
t have leading "0x"

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings,=
 0 section mismatches

Errors:
    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of read-=
only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of read-=
only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings=
, 0 section mismatches

Errors:
    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of read-=
only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-14) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    drivers/scsi/hisi_sas/hisi_sas_main.c:1536:21: warning: variable 'sas_p=
hy' is uninitialized when used here [-Wuninitialized]
    drivers/scsi/hisi_sas/hisi_sas_main.c:1528:29: note: initialize the var=
iable 'sas_phy' to silence this warning
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
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-14) =E2=80=94 PASS, 0 er=
rors, 3 warnings, 0 section mismatches

Warnings:
    drivers/scsi/hisi_sas/hisi_sas_main.c:1536:21: warning: variable 'sas_p=
hy' is uninitialized when used here [-Wuninitialized]
    drivers/scsi/hisi_sas/hisi_sas_main.c:1528:29: note: initialize the var=
iable 'sas_phy' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-14) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

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
defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
h5000_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 w=
arning, 0 section mismatches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
imote2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

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
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=80=99 =
expects argument of type =E2=80=98int=E2=80=99, but argument 2 has type =E2=
=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 10 warnings, 0=
 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
    drivers/net/ethernet/allwinner/sun4i-emac.c:922:53: warning: format =E2=
=80=98%x=E2=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, =
but argument 3 has type =E2=80=98resource_size_t=E2=80=99 {aka =E2=80=98lon=
g long unsigned int=E2=80=99} [-Wformat=3D]
    drivers/net/ethernet/allwinner/sun4i-emac.c:922:64: warning: format =E2=
=80=98%u=E2=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, =
but argument 4 has type =E2=80=98resource_size_t=E2=80=99 {aka =E2=80=98lon=
g long unsigned int=E2=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0=
 warnings, 0 section mismatches

Errors:
    irq-gic-v3-its.c:(.text+0x14b8): undefined reference to `cpus_booted_on=
ce_mask'
    arm-linux-gnueabihf-ld: irq-gic-v3-its.c:(.text+0x14bc): undefined refe=
rence to `cpus_booted_once_mask'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0=
 section mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warn=
ings, 0 section mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0=
 section mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

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
omap1_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

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
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: undefine=
d reference to `drm_panel_dp_aux_backlight'

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, =
0 section mismatches

Errors:
    drivers/net/ethernet/broadcom/sb1250-mac.c:2187:20: error: assignment o=
f read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mis=
matches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mism=
atches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for 'shmem_unuse'

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-14) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    net/core/skbuff.o: warning: objtool: skb_copy()+0x12d: unreachable inst=
ruction

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
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8a: ca=
ll to do_strncpy_from_user() with UACCESS enabled
    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x5d: call to do_s=
trnlen_user() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

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

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    mm/shmem.c:3993:5: error: conflicting types for =E2=80=98shmem_unuse=E2=
=80=99

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---
For more info write to <info@kernelci.org>
