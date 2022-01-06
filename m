Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1D4486C86
	for <lists+linux-next@lfdr.de>; Thu,  6 Jan 2022 22:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245064AbiAFVrG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 6 Jan 2022 16:47:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244748AbiAFVqk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 6 Jan 2022 16:46:40 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B976BC033270
        for <linux-next@vger.kernel.org>; Thu,  6 Jan 2022 13:46:28 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id c2so3603316pfc.1
        for <linux-next@vger.kernel.org>; Thu, 06 Jan 2022 13:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DDnKUdqn52I/wpbtWAMqMWbm6rxRvFTtwDC+we+acwQ=;
        b=n4VflqL8MrieUTF9WmzZC1rMlmnfwVL9RYdWtAfdlT0e9m702EbdVQPFC9nHPcsm5A
         Lo9S3W8zYYP4ezsaULU4NF6aq9dRCEDbV7Hz+R9O06fKUT9ucNyodTqbvLsNS7P1ieJN
         xKLh+uzQ44T1nNW2ayseA9W1PjAvpdYYoDO13S2P0/lqbj9yH1lLZW68MKdbDbJXNt3H
         1Kyv82xcgkG8M9xOCr5UnfPuqUfSAXiRoAs1faBWgo27CVLqRQKTNfERvVLSD5/ssTqm
         ag8LXJqWb5eC/T1MIUf3oH1ZVOdbNR2DFrdZlro2qyMLEDjuRNfIDkbhdOLbmMEuB6YT
         QPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DDnKUdqn52I/wpbtWAMqMWbm6rxRvFTtwDC+we+acwQ=;
        b=tjrZIhZPH4MB1Ni5wGxh/iUDBf0NLJXINInt53ma+O0RQxUgVYU3LICKMqWG34JXrT
         vhbciYTaWtwTSQvK3dose5rQ6a2pVrdlXLlgCgrxgqwq3aBghqgofLke67PiRRoGLmk9
         SddOLhVh64xDWg6hR3sKNX+9lYiwxh/1erJLi6XAhyG2PonDB1XOmM9vBrKzk/8WCgRt
         YOIYzBwtYmYogIRxmahEFdo8r7RC50whRdRZbVlVyCi7k3uOfRWg86s7NV1mC9nDNlVj
         150jO62C4yadIqOLROideq+d0JV1nbzLBpyt3YdGq9UuckZ/knrMa4X4FgdiJXItm4ox
         Lu2w==
X-Gm-Message-State: AOAM531GUx2I+GHnuYnoyQRQRU3hEnb2Sy4q6O3muTCoXb2oIw0rAhxD
        twvMvcp+BQx7xJUwCgLD6lOTa5rppaVgKUVD
X-Google-Smtp-Source: ABdhPJwRYCQ47XW6IWzF32PyKDk2iKtrOAOctGwaqWArdVWpl7bsN4YGDjL/8LhE6ah2E1EGsKHQ7g==
X-Received: by 2002:a63:b20d:: with SMTP id x13mr8855020pge.310.1641505586770;
        Thu, 06 Jan 2022 13:46:26 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d17sm3471227pfl.125.2022.01.06.13.46.26
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 13:46:26 -0800 (PST)
Message-ID: <61d76332.1c69fb81.27da8.8db8@mx.google.com>
Date:   Thu, 06 Jan 2022 13:46:26 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20220106
X-Kernelci-Branch: master
Subject: next/master build: 226 builds: 18 failed, 208 passed, 215 errors,
 63 warnings (next-20220106)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 226 builds: 18 failed, 208 passed, 215 errors, 63 warnin=
gs (next-20220106)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220106/

Tree: next
Branch: master
Git Describe: next-20220106
Git Commit: 3770333b3f8cb7c9110889853afaa49777c26ea7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL

arm:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL
    multi_v7_defconfig+CONFIG_SMP=3Dn: (gcc-10) FAIL
    qcom_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-14) FAIL

mips:
    bigsur_defconfig: (gcc-10) FAIL
    cavium_octeon_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    decstation_defconfig: (gcc-10) FAIL
    decstation_r4k_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL
    ip28_defconfig: (gcc-10) FAIL
    sb1250_swarm_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (gcc-10): 1 error, 1 warning
    allmodconfig (clang-14): 1 error
    defconfig (clang-14): 3 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-14): 3 warnings

arm:
    allmodconfig (clang-14): 5 errors, 16 warnings
    allmodconfig (gcc-10): 179 errors, 2 warnings
    aspeed_g5_defconfig (clang-14): 10 warnings
    at91_dt_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (gcc-10): 1 warning
    multi_v7_defconfig (clang-14): 10 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-10): 2 warni=
ngs
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 2 errors
    qcom_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors

i386:
    allmodconfig (clang-14): 11 errors, 1 warning

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 2 warnings
    bigsur_defconfig (gcc-10): 1 error
    cavium_octeon_defconfig (gcc-10): 1 error, 1 warning
    ci20_defconfig (gcc-10): 1 warning
    decstation_64_defconfig (gcc-10): 1 error
    decstation_defconfig (gcc-10): 1 error
    decstation_r4k_defconfig (gcc-10): 1 error
    fuloong2e_defconfig (gcc-10): 1 error
    lemote2f_defconfig (gcc-10): 1 error
    mtx1_defconfig (gcc-10): 3 warnings
    sb1250_swarm_defconfig (gcc-10): 1 error

riscv:

x86_64:
    allmodconfig (clang-14): 3 errors, 1 warning
    allmodconfig (gcc-10): 2 errors
    x86_64_defconfig (clang-14): 1 warning
    x86_64_defconfig+debug (gcc-10): 2 warnings

Errors summary:

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
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_=
calc_31.c:939:13: error: stack frame size (1404) exceeds limit (1024) in 'd=
ml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_=
calc_30.c:981:13: error: stack frame size (1148) exceeds limit (1024) in 'd=
ml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
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
    1    drivers/ata/pata_octeon_cf.c:598:23: error: passing argument 1 of =
=E2=80=98trace_ata_bmdma_stop=E2=80=99 from incompatible pointer type [-Wer=
ror=3Dincompatible-pointer-types]
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
    1    /tmp/cccSMyIO.s:7953: Error: invalid literal constant: pool needs =
to be closer
    1    /tmp/cccSMyIO.s:516: Error: invalid literal constant: pool needs t=
o be closer
    1    /tmp/cccSMyIO.s:45396: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:45337: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:45275: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:45180: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:44662: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:44603: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:44541: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:44444: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:44081: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:44022: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:43962: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:43872: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:43647: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:43588: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:43521: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:43421: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:42975: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:42930: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:42683: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:42624: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:42557: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:42457: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:42012: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:41967: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:41308: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:41249: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:41189: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:41099: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:40836: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:40777: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:40715: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:40621: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:40397: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:40338: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:40271: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:40173: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:39968: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:39909: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:39847: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:39753: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:39569: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:39510: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:39443: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:39343: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:39099: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:39040: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:38980: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:38876: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:38638: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:38579: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:38512: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:38414: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:38154: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:38095: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:38028: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:37932: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:37716: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:37657: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:37595: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:37500: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:37302: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:37243: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:37176: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:37080: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:36902: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:36843: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:36781: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:36685: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:36053: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:35994: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:35932: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:35837: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:35658: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:35599: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:35532: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:35436: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:35282: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:35223: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:35157: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:35060: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:34915: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:34856: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:34790: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:34693: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:34529: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:34470: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:34403: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:34307: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:34106: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:34047: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:33985: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:33889: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:33723: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:33664: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:33597: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:33498: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:33346: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:33287: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:33221: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:33124: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:32970: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:32911: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:32849: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:32752: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:32623: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:32564: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:32502: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:32407: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:32251: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:32192: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:32129: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:32034: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:31896: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:31837: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:31775: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:31680: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:31539: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:31480: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:31420: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:31331: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:31181: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:31122: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:31060: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:30971: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:30876: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:30817: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:30757: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:30668: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:30531: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:30472: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:30410: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:30315: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:30176: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:30117: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:30055: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:29966: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:29878: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:29819: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:29759: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:29670: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:29518: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:29459: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:29397: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:29302: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:29195: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:29136: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:29076: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:28986: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:28688: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:28628: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:28568: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:28476: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:28403: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:28343: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:28283: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:28193: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:28120: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:28060: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:28000: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:27915: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:27843: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:27783: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:27723: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:27639: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:27570: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:27511: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:27451: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:27367: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:25858: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:17767: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:17706: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:13629: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:13529: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:12239: Error: invalid literal constant: pool needs=
 to be closer
    1    /tmp/cccSMyIO.s:12199: Error: invalid literal constant: pool needs=
 to be closer

Warnings summary:

    24   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    4    drivers/scsi/hisi_sas/hisi_sas_main.c:1528:29: note: initialize th=
e variable 'sas_phy' to silence this warning
    3    sound/pci/ca0106/ca0106.h:62: warning: "PTR" redefined
    3    cc1: all warnings being treated as errors
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=
=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 2 has t=
ype =E2=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]
    2    drivers/scsi/hisi_sas/hisi_sas_main.c:1536:21: warning: variable '=
sas_phy' is uninitialized when used here [-Wuninitialized]
    2    1 warning generated.
    1    net/core/skbuff.o: warning: objtool: skb_copy()+0x12d: unreachable=
 instruction
    1    lib/test_printf.c:247: warning: "PTR" redefined
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
    1    cc1: some warnings being treated as errors
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
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warni=
ngs, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    lib/test_printf.c:247: warning: "PTR" redefined

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-14) =E2=80=94 FAIL, 11 errors, 1 warning, 0 secti=
on mismatches

Errors:
    arch/x86/include/asm/checksum_32.h:149:6: error: inline assembly requir=
es more registers than available
    drivers/scsi/hisi_sas/hisi_sas_main.c:1536:21: error: variable 'sas_phy=
' is uninitialized when used here [-Werror,-Wuninitialized]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_=
21.c:829:13: error: stack frame size (1084) exceeds limit (1024) in 'dml_rq=
_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_=
30.c:981:13: error: stack frame size (1148) exceeds limit (1024) in 'dml_rq=
_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_=
31.c:939:13: error: stack frame size (1404) exceeds limit (1024) in 'dml_rq=
_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: error: stack frame size (1388) exceeds limit (1024) in 'dml20_DI=
SPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcula=
tion' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: error: stack frame size (1356) exceeds limit (1024) in 'dml20v=
2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCal=
culation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1466:13: error: stack frame size (1212) exceeds limit (1024) in 'DISPCLKD=
PPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' =
[-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: error: stack frame size (1564) exceeds limit (1024) in 'dml20_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
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
    drivers/scsi/hisi_sas/hisi_sas_main.c:1536:21: error: variable 'sas_phy=
' is uninitialized when used here [-Werror,-Wuninitialized]
    drivers/net/wireless/intel/iwlwifi/mvm/ftm-initiator.c:1070:2: error: c=
omparison of distinct pointer types ('typeof ((rtt_avg)) *' (aka 'long long=
 *') and 'uint64_t *' (aka 'unsigned long long *')) [-Werror,-Wcompare-dist=
inct-pointer-types]

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
allmodconfig (arm64, clang-14) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/pinctrl/pinctrl-thunderbay.c:815:8: error: assigning to 'const =
char **' from 'const char *const *' discards qualifiers [-Werror,-Wincompat=
ible-pointer-types-discards-qualifiers]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 179 errors, 2 warnings, 0 sectio=
n mismatches

Errors:
    /tmp/cccSMyIO.s:516: Error: invalid literal constant: pool needs to be =
closer
    /tmp/cccSMyIO.s:7953: Error: invalid literal constant: pool needs to be=
 closer
    /tmp/cccSMyIO.s:12199: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:12239: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:13529: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:13629: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:17706: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:17767: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:25858: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:27367: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:27451: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:27511: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:27570: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:27639: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:27723: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:27783: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:27843: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:27915: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:28000: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:28060: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:28120: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:28193: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:28283: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:28343: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:28403: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:28476: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:28568: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:28628: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:28688: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:28986: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:29076: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:29136: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:29195: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:29302: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:29397: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:29459: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:29518: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:29670: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:29759: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:29819: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:29878: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:29966: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:30055: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:30117: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:30176: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:30315: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:30410: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:30472: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:30531: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:30668: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:30757: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:30817: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:30876: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:30971: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:31060: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:31122: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:31181: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:31331: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:31420: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:31480: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:31539: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:31680: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:31775: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:31837: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:31896: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:32034: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:32129: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:32192: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:32251: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:32407: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:32502: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:32564: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:32623: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:32752: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:32849: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:32911: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:32970: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:33124: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:33221: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:33287: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:33346: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:33498: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:33597: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:33664: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:33723: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:33889: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:33985: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:34047: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:34106: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:34307: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:34403: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:34470: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:34529: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:34693: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:34790: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:34856: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:34915: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:35060: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:35157: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:35223: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:35282: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:35436: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:35532: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:35599: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:35658: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:35837: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:35932: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:35994: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:36053: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:36685: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:36781: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:36843: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:36902: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:37080: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:37176: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:37243: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:37302: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:37500: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:37595: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:37657: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:37716: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:37932: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:38028: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:38095: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:38154: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:38414: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:38512: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:38579: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:38638: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:38876: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:38980: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:39040: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:39099: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:39343: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:39443: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:39510: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:39569: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:39753: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:39847: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:39909: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:39968: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:40173: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:40271: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:40338: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:40397: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:40621: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:40715: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:40777: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:40836: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:41099: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:41189: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:41249: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:41308: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:41967: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:42012: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:42457: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:42557: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:42624: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:42683: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:42930: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:42975: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:43421: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:43521: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:43588: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:43647: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:43872: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:43962: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:44022: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:44081: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:44444: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:44541: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:44603: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:44662: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:45180: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:45275: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:45337: Error: invalid literal constant: pool needs to b=
e closer
    /tmp/cccSMyIO.s:45396: Error: invalid literal constant: pool needs to b=
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
allnoconfig (i386, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
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
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section mismatches

Errors:
    drivers/ata/pata_octeon_cf.c:598:23: error: passing argument 1 of =E2=
=80=98trace_ata_bmdma_stop=E2=80=99 from incompatible pointer type [-Werror=
=3Dincompatible-pointer-types]

Warnings:
    cc1: some warnings being treated as errors

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
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
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
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

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
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
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
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

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
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    sound/pci/ca0106/ca0106.h:62: warning: "PTR" redefined
    sound/pci/ca0106/ca0106.h:62: warning: "PTR" redefined
    sound/pci/ca0106/ca0106.h:62: warning: "PTR" redefined

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
pcm027_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
x86_64_defconfig (x86_64, clang-14) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    net/core/skbuff.o: warning: objtool: skb_copy()+0x12d: unreachable inst=
ruction

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
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

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
