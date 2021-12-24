Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB2747EE52
	for <lists+linux-next@lfdr.de>; Fri, 24 Dec 2021 11:43:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343826AbhLXKn2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Dec 2021 05:43:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240741AbhLXKn1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Dec 2021 05:43:27 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372E4C061401
        for <linux-next@vger.kernel.org>; Fri, 24 Dec 2021 02:43:27 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 2so7314619pgb.12
        for <linux-next@vger.kernel.org>; Fri, 24 Dec 2021 02:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fGijaCkw9daAtcVWUXgzrP6MUX9o+5yLB/dU7/qNlE4=;
        b=KtNdBEQ+biMWzhMo2SELXsxDLz8xzG7ZoiCuj5BLZs+1jVWKqMV3qJO5OH59Lro0Ga
         Etk4VOWPwoIn4TKVeadkeFcnZUmGDSxLl/ovhoGw3e6X0+WyMtA8Kx+snEEO+tXSokrE
         MbeH7XzvwhK9q/VKN4GG5Y3X53XoMx1Yuc9ZmCsUYsIIYnE9R6rKEV7oueYvqDV0N91n
         7w2uHiN8uRnx1+XoA7IX6m4cVNsWeHsmehsPkHg7yHQ2OEkE7IPfFJXK8m2uWmYRbLiX
         zqrpIKBLhxl06TK81g+LCWVE/6qAKxZMzayJpbRh98mrm+XoYfN3LhDGaEjVeb/MdnaE
         8HFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fGijaCkw9daAtcVWUXgzrP6MUX9o+5yLB/dU7/qNlE4=;
        b=vK4B4TXE5eiiKf+Qs7/FYnXlKQN77VkCuRfLcDGtUp7Er+gRMzDuPhxZ70H7Ijz/kH
         g3Yce/WPaUZmarQKiGMenS0/kj8daJvrJ0Z6rrgU6vdePoFxo7ESPedP5YmsIzg2K93P
         RiNxNOaPltn9vnGR2+Y9hYm/A9WimYgY6hYNL51+VDFyszQ/PywS/8OgijLBOjzMzWC/
         YCUcnPk92TScYQaqqlxEIIHt6npmQJUWkStBMLzQ9kG+gWcULNB9ZvO4x4+Tn7aE8Pbv
         O/esQFYzLEtpCzc36JjPDlJYx+qnE677FIEkd6PCPeBae9D6Q4NU1lhY5U8Hwic6sn2V
         zmuw==
X-Gm-Message-State: AOAM532iwvdMXwTvUhLk8O5qS75/grzldkL4JFeB5Zr2HEPTwr75+rLT
        r+kCKPEv3kGLe8zF4bmbHI6pymyUq5L+FKZM
X-Google-Smtp-Source: ABdhPJx9hG2wN8xQrnkkAeZ3W7PKRBSU4Wyv25KYzVG22F+2Xmj4nIyHdU8SvqDytra6LQyRYDMDJQ==
X-Received: by 2002:a63:e651:: with SMTP id p17mr5687802pgj.233.1640342604613;
        Fri, 24 Dec 2021 02:43:24 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id v6sm7139865pgj.82.2021.12.24.02.43.23
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 02:43:24 -0800 (PST)
Message-ID: <61c5a44c.1c69fb81.7caaa.47d0@mx.google.com>
Date:   Fri, 24 Dec 2021 02:43:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211224
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 202 builds: 18 failed, 184 passed, 248 errors,
 72 warnings (next-20211224)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 202 builds: 18 failed, 184 passed, 248 errors, 72 warnin=
gs (next-20211224)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20211224/

Tree: next
Branch: master
Git Describe: next-20211224
Git Commit: ea586a076e8aa606c59b66d86660590f18354b11
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL

arm:
    allmodconfig: (clang-13) FAIL
    multi_v5_defconfig: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL
    multi_v7_defconfig+CONFIG_SMP=3Dn: (gcc-10) FAIL
    qcom_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-13) FAIL

mips:
    bigsur_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    decstation_defconfig: (gcc-10) FAIL
    decstation_r4k_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL
    ip28_defconfig: (gcc-10) FAIL
    sb1250_swarm_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 3 warnings
    tinyconfig (gcc-10): 1 warning

arm64:
    allmodconfig (clang-13): 1 error
    allmodconfig (gcc-10): 1 error, 1 warning
    defconfig (clang-13): 3 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-13): 3 warnings

arm:
    allmodconfig (clang-13): 40 errors, 13 warnings
    allmodconfig (gcc-10): 179 errors, 2 warnings
    aspeed_g5_defconfig (clang-13): 10 warnings
    at91_dt_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (clang-13): 2 errors
    multi_v7_defconfig (clang-13): 10 warnings
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 2 errors
    qcom_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors

i386:
    allmodconfig (clang-13): 10 errors, 1 warning

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    bigsur_defconfig (gcc-10): 1 error
    decstation_64_defconfig (gcc-10): 1 error
    decstation_defconfig (gcc-10): 1 error
    decstation_r4k_defconfig (gcc-10): 1 error
    fuloong2e_defconfig (gcc-10): 1 error
    sb1250_swarm_defconfig (gcc-10): 1 error

riscv:

x86_64:
    allmodconfig (gcc-10): 2 errors
    allmodconfig (clang-13): 2 errors, 19 warnings
    x86_64_defconfig+debug (gcc-10): 2 warnings

Errors summary:

    22   arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relati=
ve fixup value
    16   arch/arm/include/asm/current.h:39:28: error: out of range pc-relat=
ive fixup value
    3    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of =
read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99
    2    fatal error: too many errors emitted, stopping now [-ferror-limit=
=3D]
    2    drivers/scsi/hisi_sas/hisi_sas_main.c:1536:21: error: variable 'sa=
s_phy' is uninitialized when used here [-Werror,-Wuninitialized]
    2    drivers/net/ethernet/broadcom/sb1250-mac.c:2187:20: error: assignm=
ent of read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99
    2    arch/arm/include/asm/current.h:53:6: error: out of range pc-relati=
ve fixup value
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
    1    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assignment disc=
ards =E2=80=98const=E2=80=99 qualifier from pointer target type [-Werror=3D=
discarded-qualifiers]
    1    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assigning to 'c=
onst char **' from 'const char *const *' discards qualifiers [-Werror,-Winc=
ompatible-pointer-types-discards-qualifiers]
    1    drivers/hv/vmbus_drv.c:2082:29: error: shift count >=3D width of t=
ype [-Werror,-Wshift-count-overflow]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_=
calc_31.c:939:13: error: stack frame size (1404) exceeds limit (1024) in fu=
nction 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_=
calc_30.c:981:13: error: stack frame size (1180) exceeds limit (1024) in fu=
nction 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_=
calc_21.c:829:13: error: stack frame size (1084) exceeds limit (1024) in fu=
nction 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3518:6: error: stack frame size (1244) exceeds limit (1024) in funct=
ion 'dml21_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-t=
han]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1466:13: error: stack frame size (1212) exceeds limit (1024) in func=
tion 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanc=
eCalculation' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: error: stack frame size (1580) exceeds limit (1024) in fun=
ction 'dml20v2_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larg=
er-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: error: stack frame size (1324) exceeds limit (1024) in fu=
nction 'dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAnd=
PerformanceCalculation' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: error: stack frame size (1548) exceeds limit (1024) in funct=
ion 'dml20_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-t=
han]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: error: stack frame size (1356) exceeds limit (1024) in func=
tion 'dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerf=
ormanceCalculation' [-Werror,-Wframe-larger-than]
    1    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    1    arm-linux-gnueabihf-ld: irq-gic-v3-its.c:(.text+0x14bc): undefined=
 reference to `cpus_booted_once_mask'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: und=
efined reference to `drm_panel_dp_aux_backlight'
    1    /tmp/ccYOX7un.s:7952: Error: invalid literal constant: pool needs =
to be closer
    1    /tmp/ccYOX7un.s:516: Error: invalid literal constant: pool needs t=
o be closer
    1    /tmp/ccYOX7un.s:45395: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:45336: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:45274: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:45179: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:44661: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:44602: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:44540: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:44443: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:44080: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:44021: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:43961: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:43871: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:43646: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:43587: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:43520: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:43420: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:42974: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:42929: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:42682: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:42623: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:42556: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:42456: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:42011: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:41966: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:41307: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:41248: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:41188: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:41098: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:40835: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:40776: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:40714: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:40620: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:40396: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:40337: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:40270: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:40172: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:39967: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:39908: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:39846: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:39752: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:39568: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:39509: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:39442: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:39342: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:39098: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:39039: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:38979: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:38875: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:38637: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:38578: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:38511: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:38413: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:38153: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:38094: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:38027: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:37931: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:37715: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:37656: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:37594: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:37499: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:37301: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:37242: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:37175: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:37079: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:36901: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:36842: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:36780: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:36684: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:36052: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:35993: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:35931: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:35836: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:35657: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:35598: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:35531: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:35435: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:35281: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:35222: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:35156: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:35059: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:34914: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:34855: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:34789: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:34692: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:34528: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:34469: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:34402: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:34306: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:34105: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:34046: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:33984: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:33888: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:33722: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:33663: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:33596: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:33497: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:33345: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:33286: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:33220: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:33123: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:32969: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:32910: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:32848: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:32751: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:32622: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:32563: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:32501: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:32406: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:32250: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:32191: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:32128: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:32033: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:31895: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:31836: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:31774: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:31679: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:31538: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:31479: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:31419: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:31330: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:31180: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:31121: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:31059: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:30970: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:30875: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:30816: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:30756: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:30667: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:30530: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:30471: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:30409: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:30314: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:30175: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:30116: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:30054: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:29965: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:29877: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:29818: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:29758: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:29669: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:29517: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:29458: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:29396: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:29301: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:29194: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:29135: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:29075: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:28985: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:28687: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:28627: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:28567: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:28475: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:28402: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:28342: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:28282: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:28192: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:28119: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:28059: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:27999: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:27914: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:27842: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:27782: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:27722: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:27638: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:27569: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:27510: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:27450: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:27366: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:25857: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:17766: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:17705: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:13628: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:13528: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:12238: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/ccYOX7un.s:12198: Error: invalid literal constant: pool needs=
 to be closer

Warnings summary:

    22   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    4    drivers/scsi/hisi_sas/hisi_sas_main.c:1528:29: note: initialize th=
e variable 'sas_phy' to silence this warning
    3    cc1: all warnings being treated as errors
    2    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=
=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 2 has t=
ype =E2=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]
    2    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' i=
s unknown, fallback to ''
    2    1 warning generated.
    1    vmlinux.o: warning: objtool: vc_switch_off_ist()+0x8a: call to mem=
cpy() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() le=
aves .noinstr.text section
    1    vmlinux.o: warning: objtool: mce_start()+0x44: call to __kasan_che=
ck_write() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: mce_severity_amd()+0x5e: call to mce_=
severity_amd_smca() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: mce_read_aux()+0x4b: call to mca_msr_=
reg() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: in_task_stack()+0xc: call to task_sta=
ck_page() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_en=
try_stack() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: fixup_bad_iret()+0x32: call to memset=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_syscall_64()+0x44: call to memset(=
) leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_machine_check()+0x13a: call to mce=
_no_way_out() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_int80_syscall_32()+0x52: call to m=
emset() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_put_ghcb()+0x36: call to memcpy=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_get_ghcb()+0xa1: call to memcpy=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x5a: call to=
 ghcb_set_sw_exit_code() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x52: call to =
memset() leaves .noinstr.text section
    1    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x5d: call to=
 do_strnlen_user() with UACCESS enabled
    1    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8=
a: call to do_strncpy_from_user() with UACCESS enabled
    1    fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely=
()+0x734: stack state mismatch: cfa1=3D4+200 cfa2=3D4+192
    1    drivers/scsi/mpi3mr/mpi3mr_fw.o: warning: objtool: mpi3mr_op_reque=
st_post() falls through to next function mpi3mr_check_rh_fault_ioc()
    1    drivers/scsi/hisi_sas/hisi_sas_main.c:1536:21: warning: variable '=
sas_phy' is uninitialized when used here [-Wuninitialized]
    1    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls t=
hrough to next function startup_64_setup_env()
    1    arch/arc/include/asm/perf_event.h:91:27: warning: 'arc_pmu_ev_hw_m=
ap' defined but not used [-Wunused-const-variable=3D]
    1    arch/arc/include/asm/perf_event.h:126:27: warning: 'arc_pmu_cache_=
map' defined but not used [-Wunused-const-variable=3D]
    1    :1536:21: warning: variable 'sas_phy' is uninitialized when used h=
ere [-Wuninitialized]
    1    : warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text+0x15c697): Section mismatch in r=
eference from the function __next_node() to the variable .init.data:numa_no=
des_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x15c622): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x15c60e): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed

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
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assigning to 'const =
char **' from 'const char *const *' discards qualifiers [-Werror,-Wincompat=
ible-pointer-types-discards-qualifiers]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-13) =E2=80=94 FAIL, 40 errors, 13 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    fatal error: too many errors emitted, stopping now [-ferror-limit=3D]

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    : warning: argument unused during compilation: '-march=3Darmv6k' [-Wunu=
sed-command-line-argument]
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
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 179 errors, 2 warnings, 0 sectio=
n mismatches

Errors:
    /tmp/ccYOX7un.s:516: Error: invalid literal constant: pool needs to be =
closer
    /tmp/ccYOX7un.s:7952: Error: invalid literal constant: pool needs to be=
 closer
    /tmp/ccYOX7un.s:12198: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:12238: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:13528: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:13628: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:17705: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:17766: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:25857: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:27366: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:27450: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:27510: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:27569: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:27638: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:27722: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:27782: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:27842: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:27914: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:27999: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:28059: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:28119: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:28192: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:28282: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:28342: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:28402: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:28475: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:28567: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:28627: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:28687: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:28985: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:29075: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:29135: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:29194: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:29301: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:29396: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:29458: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:29517: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:29669: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:29758: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:29818: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:29877: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:29965: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:30054: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:30116: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:30175: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:30314: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:30409: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:30471: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:30530: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:30667: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:30756: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:30816: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:30875: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:30970: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:31059: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:31121: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:31180: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:31330: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:31419: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:31479: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:31538: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:31679: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:31774: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:31836: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:31895: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:32033: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:32128: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:32191: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:32250: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:32406: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:32501: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:32563: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:32622: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:32751: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:32848: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:32910: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:32969: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:33123: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:33220: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:33286: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:33345: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:33497: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:33596: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:33663: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:33722: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:33888: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:33984: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:34046: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:34105: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:34306: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:34402: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:34469: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:34528: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:34692: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:34789: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:34855: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:34914: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:35059: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:35156: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:35222: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:35281: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:35435: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:35531: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:35598: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:35657: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:35836: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:35931: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:35993: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:36052: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:36684: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:36780: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:36842: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:36901: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:37079: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:37175: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:37242: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:37301: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:37499: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:37594: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:37656: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:37715: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:37931: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:38027: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:38094: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:38153: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:38413: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:38511: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:38578: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:38637: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:38875: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:38979: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:39039: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:39098: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:39342: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:39442: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:39509: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:39568: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:39752: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:39846: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:39908: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:39967: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:40172: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:40270: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:40337: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:40396: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:40620: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:40714: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:40776: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:40835: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:41098: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:41188: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:41248: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:41307: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:41966: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:42011: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:42456: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:42556: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:42623: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:42682: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:42929: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:42974: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:43420: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:43520: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:43587: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:43646: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:43871: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:43961: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:44021: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:44080: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:44443: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:44540: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:44602: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:44661: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:45179: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:45274: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:45336: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/ccYOX7un.s:45395: Error: invalid literal constant: pool needs to b=
e closer
    include/asm-generic/div64.h:222:28: error: comparison of distinct point=
er types lacks a cast [-Werror]
    drivers/usb/gadget/udc/at91_udc.h:174:33: error: format =E2=80=98%d=E2=
=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 3 has t=
ype =E2=80=98struct gpio_desc *=E2=80=99 [-Werror=3Dformat=3D]

Warnings:
    cc1: all warnings being treated as errors
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 19 warnings, 0 se=
ction mismatches

Errors:
    drivers/hv/vmbus_drv.c:2082:29: error: shift count >=3D width of type [=
-Werror,-Wshift-count-overflow]
    drivers/scsi/hisi_sas/hisi_sas_main.c:1536:21: error: variable 'sas_phy=
' is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls throug=
h to next function startup_64_setup_env()
    vmlinux.o: warning: objtool: do_syscall_64()+0x44: call to memset() lea=
ves .noinstr.text section
    vmlinux.o: warning: objtool: do_int80_syscall_32()+0x52: call to memset=
() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x52: call to memse=
t() leaves .noinstr.text section
    vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() leaves =
.noinstr.text section
    vmlinux.o: warning: objtool: vc_switch_off_ist()+0x8a: call to memcpy()=
 leaves .noinstr.text section
    vmlinux.o: warning: objtool: fixup_bad_iret()+0x32: call to memset() le=
aves .noinstr.text section
    vmlinux.o: warning: objtool: in_task_stack()+0xc: call to task_stack_pa=
ge() leaves .noinstr.text section
    vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_entry_s=
tack() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_read_aux()+0x4b: call to mca_msr_reg()=
 leaves .noinstr.text section
    vmlinux.o: warning: objtool: do_machine_check()+0x13a: call to mce_no_w=
ay_out() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_start()+0x44: call to __kasan_check_wr=
ite() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_severity_amd()+0x5e: call to mce_sever=
ity_amd_smca() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x5a: call to ghcb=
_set_sw_exit_code() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_get_ghcb()+0xa1: call to memcpy() le=
aves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_put_ghcb()+0x36: call to memcpy() le=
aves .noinstr.text section
    fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely()+0x=
734: stack state mismatch: cfa1=3D4+200 cfa2=3D4+192
    drivers/scsi/mpi3mr/mpi3mr_fw.o: warning: objtool: mpi3mr_op_request_po=
st() falls through to next function mpi3mr_check_rh_fault_ioc()
    drivers/scsi/hisi_sas/hisi_sas_main.c:1528:29: note: initialize the var=
iable 'sas_phy' to silence this warning

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x15c60e): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x15c622): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x15c697): Section mismatch in refere=
nce from the function __next_node() to the variable .init.data:numa_nodes_p=
arsed

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-13) =E2=80=94 FAIL, 10 errors, 1 warning, 0 secti=
on mismatches

Errors:
    drivers/scsi/hisi_sas/hisi_sas_main.c:1536:21: error: variable 'sas_phy=
' is uninitialized when used here [-Werror,-Wuninitialized]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_=
21.c:829:13: error: stack frame size (1084) exceeds limit (1024) in functio=
n 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_=
30.c:981:13: error: stack frame size (1180) exceeds limit (1024) in functio=
n 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_=
31.c:939:13: error: stack frame size (1404) exceeds limit (1024) in functio=
n 'dml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: error: stack frame size (1324) exceeds limit (1024) in functio=
n 'dml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerfo=
rmanceCalculation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: error: stack frame size (1356) exceeds limit (1024) in function =
'dml20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman=
ceCalculation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1466:13: error: stack frame size (1212) exceeds limit (1024) in function =
'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalc=
ulation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: error: stack frame size (1580) exceeds limit (1024) in function=
 'dml20v2_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-th=
an]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3518:6: error: stack frame size (1244) exceeds limit (1024) in function '=
dml21_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: error: stack frame size (1548) exceeds limit (1024) in function '=
dml20_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]

Warnings:
    drivers/scsi/hisi_sas/hisi_sas_main.c:1528:29: note: initialize the var=
iable 'sas_phy' to silence this warning

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
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
aspeed_g5_defconfig (arm, clang-13) =E2=80=94 PASS, 0 errors, 10 warnings, =
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
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
defconfig (arm64, clang-13) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    :1536:21: warning: variable 'sas_phy' is uninitialized when used here [=
-Wuninitialized]
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
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-13) =E2=80=94 PASS, 0 er=
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
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 3 w=
arnings, 0 section mismatches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''
    arch/arc/include/asm/perf_event.h:126:27: warning: 'arc_pmu_cache_map' =
defined but not used [-Wunused-const-variable=3D]
    arch/arc/include/asm/perf_event.h:91:27: warning: 'arc_pmu_ev_hw_map' d=
efined but not used [-Wunused-const-variable=3D]

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
i386_defconfig (i386, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
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
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
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
mini2440_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
multi_v5_defconfig (arm, clang-13) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-13) =E2=80=94 PASS, 0 errors, 10 warnings, 0=
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
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

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
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

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
omap1_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
xcep_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---
For more info write to <info@kernelci.org>
