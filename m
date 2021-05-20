Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 402C0389EB7
	for <lists+linux-next@lfdr.de>; Thu, 20 May 2021 09:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230495AbhETHPa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 May 2021 03:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230444AbhETHPa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 May 2021 03:15:30 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90A69C061574
        for <linux-next@vger.kernel.org>; Thu, 20 May 2021 00:14:09 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id c17so11694037pfn.6
        for <linux-next@vger.kernel.org>; Thu, 20 May 2021 00:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WIGI7d9aBGBq/HeO03DG1xNYQZrVr0ZFTpDz0/msVkM=;
        b=A56vCIBs+JEEmVE88HHzQIkhkrcpUErYUrihqDejUP21JnEtiZ08uZySQOMkivqsoV
         mVqaqGqcofdi9dtixNEQyXltbk7LY/h2JsGhx9siAs2evBPHY7ppvcau/APEadbMGsZg
         uxv/WKYlZ2e2Ctwu9Eue+k5fo2vbCedADFfgFMm7as+3cODLbcI1HKwr69zjajGHQMav
         bkO6jR0U2hIpOJJ2joPS2bwDLwV/7gPac8SrY+cWYjtCDCsdTyWrfsS8mdLDmsobJwmC
         dL2Mlt4hqKrVqGST1a/7sfJQTlKn6zB/dE/RYqew6HgXYe8wTq5F38LtGoWcGRnklVGP
         5vlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WIGI7d9aBGBq/HeO03DG1xNYQZrVr0ZFTpDz0/msVkM=;
        b=RyoeojldWuROi9XmSm6SikmL5OW2xJ0wUSgWTrwujFgF6brpp17Ziok/zJBrv/KR7U
         qGuUQGYsEda8iOkvcqtzI7MP/6zy11C4h798uq5XYRa7GYNpaGKSoo8VsZFXQnGcCqkr
         4uqeHR5CQT+8zXDeFnSHHNaRtFmxnfs4z9aGhIughMT/GZvDrKHEOPrxLctWE5ef2n6e
         8akTnsWSYm/z1MKmk6ddYk5xauricBr8V/8sGXDWw83/u2FUQlBP0FgTm4q+XP+VR0sb
         D+lLLIDdK4EhiHhT/sLDBjVI/Ct0ViNxHqqq2BzbuRELm58hPqFF+VR13p/M01+Du5lJ
         L7Aw==
X-Gm-Message-State: AOAM5318Nr6qZxgqmofN7SUySxvObiHc6Yd9uOKpzNc9H8c5gIg3fj1B
        8rYAfpDSifqU1h1HO2ecOMzPAySrLi/UNzsn
X-Google-Smtp-Source: ABdhPJxSuDMzVliB+/kR45H3Y0rL9FsYYzxK/POyDgOXal7N8J9D/AejzKe3D5k6m+bsSzFeGNSMxQ==
X-Received: by 2002:aa7:842c:0:b029:2b4:61be:7156 with SMTP id q12-20020aa7842c0000b02902b461be7156mr2955554pfn.67.1621494846971;
        Thu, 20 May 2021 00:14:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x6sm1193726pfj.24.2021.05.20.00.14.06
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 00:14:06 -0700 (PDT)
Message-ID: <60a60c3e.1c69fb81.5ed83.4d60@mx.google.com>
Date:   Thu, 20 May 2021 00:14:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210520
X-Kernelci-Branch: master
X-Kernelci-Report-Type: build
Subject: next/master build: 208 builds: 13 failed, 195 passed, 33 errors,
 1492 warnings (next-20210520)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 208 builds: 13 failed, 195 passed, 33 errors, 1492 warni=
ngs (next-20210520)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20210520/

Tree: next
Branch: master
Git Describe: next-20210520
Git Commit: 7a42b92b6d30c3f09629c7d5ada9e3de2aba01af
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arc:
    allnoconfig: (gcc-8) FAIL
    haps_hs_smp_defconfig+kselftest: (gcc-8) FAIL
    nsimosci_hs_smp_defconfig: (gcc-8) FAIL

arm:
    allmodconfig: (clang-10) FAIL
    allmodconfig: (clang-12) FAIL
    allmodconfig: (gcc-8) FAIL
    multi_v7_defconfig+kselftest: (gcc-8) FAIL

i386:
    allmodconfig: (clang-12) FAIL
    i386_defconfig+kselftest: (gcc-8) FAIL

mips:
    32r2el_defconfig+kselftest: (gcc-8) FAIL
    decstation_64_defconfig: (gcc-8) FAIL
    lemote2f_defconfig: (gcc-8) FAIL
    nlm_xlr_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 8 errors
    haps_hs_smp_defconfig+kselftest (gcc-8): 1 error, 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 8 errors

arm64:
    defconfig (clang-10): 1 warning

arm:
    allmodconfig (gcc-8): 2 errors
    allmodconfig (clang-10): 2 errors, 34 warnings
    allmodconfig (clang-12): 2 errors, 34 warnings
    multi_v7_defconfig (clang-12): 2 warnings
    multi_v7_defconfig (clang-10): 2 warnings
    multi_v7_defconfig+kselftest (gcc-8): 2 errors
    omap1_defconfig (gcc-8): 2 warnings

i386:
    allmodconfig (clang-12): 2 errors, 27 warnings
    i386_defconfig+kselftest (gcc-8): 2 errors

mips:
    32r2el_defconfig+kselftest (gcc-8): 2 errors
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    nlm_xlr_defconfig (gcc-8): 2 errors
    rm200_defconfig (gcc-8): 1 warning

riscv:
    nommu_k210_defconfig (gcc-8): 630 warnings
    nommu_k210_sdcard_defconfig (gcc-8): 750 warnings
    rv32_defconfig (gcc-8): 6 warnings

x86_64:

Errors summary:

    5    ERROR: modpost: "__divdi3" [fs/btrfs/btrfs.ko] undefined!
    4    ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!
    4    ERROR: modpost: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!
    4    ERROR: modpost: "__aeabi_ldivmod" [fs/btrfs/btrfs.ko] undefined!
    2    arc-elf32-ld: stackdepot.c:(.text+0x4e0): undefined reference to `=
__softirqentry_text_end'
    2    arc-elf32-ld: stackdepot.c:(.text+0x4d8): undefined reference to `=
__softirqentry_text_start'
    2    arc-elf32-ld: stackdepot.c:(.text+0x4cc): undefined reference to `=
__irqentry_text_end'
    2    arc-elf32-ld: stackdepot.c:(.text+0x38): undefined reference to `_=
_softirqentry_text_end'
    2    arc-elf32-ld: stackdepot.c:(.text+0x30): undefined reference to `_=
_softirqentry_text_start'
    2    arc-elf32-ld: stackdepot.c:(.text+0x24): undefined reference to `_=
_irqentry_text_end'
    1    stackdepot.c:(.text+0x4ac): undefined reference to `__irqentry_tex=
t_start'
    1    stackdepot.c:(.text+0x4): undefined reference to `__irqentry_text_=
start'
    1    arc-elf32-ld: stackdepot.c:(.text+0x4ac): undefined reference to `=
__irqentry_text_start'
    1    arc-elf32-ld: stackdepot.c:(.text+0x4): undefined reference to `__=
irqentry_text_start'

Warnings summary:

    690  include/asm-generic/uaccess.h:48:3: warning: statement with no eff=
ect [-Wunused-value]
    690  include/asm-generic/uaccess.h:48:16: warning: left-hand operand of=
 comma expression has no effect [-Wunused-value]
    28   1 warning generated.
    7    2 warnings generated.
    4    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: warning: implici=
t conversion from 'unsigned long long' to 'unsigned long' changes value fro=
m 5000000000 to 705032704 [-Wconstant-conversion]
    4    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    4    #warning This code requires at least version 4.6 of GCC
    3    sound/firewire/amdtp-stream.c:657:7: warning: variable 'err' is us=
ed uninitialized whenever 'if' condition is false [-Wsometimes-uninitialize=
d]
    3    sound/firewire/amdtp-stream.c:640:9: note: initialize the variable=
 'err' to silence this warning
    3    4 warnings generated.
    2    drivers/staging/rtl8723bs/core/rtw_security.c:93:6: warning: stack=
 frame size of 1096 bytes in function 'rtw_wep_decrypt' [-Wframe-larger-tha=
n=3D]
    2    drivers/staging/rtl8723bs/core/rtw_security.c:535:5: warning: stac=
k frame size of 1144 bytes in function 'rtw_tkip_decrypt' [-Wframe-larger-t=
han=3D]
    2    drivers/staging/rtl8723bs/core/rtw_security.c:37:6: warning: stack=
 frame size of 1144 bytes in function 'rtw_wep_encrypt' [-Wframe-larger-tha=
n=3D]
    2    drivers/staging/fbtft/fbtft-core.c:902:12: warning: stack frame si=
ze of 1080 bytes in function 'fbtft_init_display_from_property' [-Wframe-la=
rger-than=3D]
    2    drivers/net/wireless/cisco/airo.c:3075:12: warning: stack frame si=
ze of 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    2    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack fra=
me size of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3041:6:=
 warning: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-la=
rger-than=3D]
    2    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame=
 size of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    2    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:39: Warning: macro instruction expanded into mult=
iple instructions
    1    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame siz=
e of 1392 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=
=3D]
    1    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame siz=
e of 1384 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=
=3D]
    1    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame siz=
e of 1332 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=
=3D]
    1    drivers/staging/rtl8723bs/core/rtw_security.c:93:6: warning: stack=
 frame size of 1080 bytes in function 'rtw_wep_decrypt' [-Wframe-larger-tha=
n=3D]
    1    drivers/staging/rtl8723bs/core/rtw_security.c:535:5: warning: stac=
k frame size of 1100 bytes in function 'rtw_tkip_decrypt' [-Wframe-larger-t=
han=3D]
    1    drivers/staging/rtl8723bs/core/rtw_security.c:462:5: warning: stac=
k frame size of 1168 bytes in function 'rtw_tkip_encrypt' [-Wframe-larger-t=
han=3D]
    1    drivers/staging/rtl8723bs/core/rtw_security.c:462:5: warning: stac=
k frame size of 1160 bytes in function 'rtw_tkip_encrypt' [-Wframe-larger-t=
han=3D]
    1    drivers/staging/rtl8723bs/core/rtw_security.c:462:5: warning: stac=
k frame size of 1112 bytes in function 'rtw_tkip_encrypt' [-Wframe-larger-t=
han=3D]
    1    drivers/staging/rtl8723bs/core/rtw_security.c:37:6: warning: stack=
 frame size of 1092 bytes in function 'rtw_wep_encrypt' [-Wframe-larger-tha=
n=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 1804 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/staging/fbtft/fbtft-core.c:992:5: warning: stack frame siz=
e of 1216 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    1    drivers/staging/fbtft/fbtft-core.c:992:5: warning: stack frame siz=
e of 1208 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    1    drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: warning: stack frame =
size of 1064 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=
=3D]
    1    drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: warning: stack frame =
size of 1056 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=
=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_c=
alc.c:997:6: warning: stack frame size of 1196 bytes in function 'dml1_rq_d=
lg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_=
calc_30.c:981:13: warning: stack frame size of 1036 bytes in function 'dml_=
rq_dlg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3393:6: warning: stack frame size of 1468 bytes in function 'dml21_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1463:13: warning: stack frame size of 1132 bytes in function 'DISPCL=
KDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation=
' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: warning: stack frame size of 1420 bytes in function 'dml20=
v2_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: warning: stack frame size of 1164 bytes in function 'dml2=
0v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceC=
alculation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: warning: stack frame size of 1420 bytes in function 'dml20_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: warning: stack frame size of 1180 bytes in function 'dml20_=
DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcu=
lation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:450:13:=
 warning: stack frame size of 1564 bytes in function 'dcn_bw_calc_rq_dlg_tt=
u' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: =
warning: stack frame size of 5560 bytes in function 'calculate_bandwidth' [=
-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: =
warning: stack frame size of 5536 bytes in function 'calculate_bandwidth' [=
-Wframe-larger-than=3D]
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    crypto/wp512.c:782:13: warning: stack frame size of 1192 bytes in =
function 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1    crypto/wp512.c:782:13: warning: stack frame size of 1176 bytes in =
function 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1    arch/arm/mach-omap1/board-h2.c:347:34: warning: =E2=80=98isp1301_g=
piod_table=E2=80=99 defined but not used [-Wunused-variable]
    1    arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=98am=
s_delta_camera_power=E2=80=99 defined but not used [-Wunused-function]
    1    arch/arc/include/asm/perf_event.h:91:27: warning: =E2=80=98arc_pmu=
_ev_hw_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    1    arch/arc/include/asm/perf_event.h:126:23: warning: =E2=80=98arc_pm=
u_cache_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.13.0-rc2-next-20210520/kernel/drivers/media/tuners/tuner-types=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnin=
gs, 0 section mismatches

Errors:
    ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!
    ERROR: modpost: "__divdi3" [fs/btrfs/btrfs.ko] undefined!

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section m=
ismatches

Errors:
    ERROR: modpost: "__aeabi_ldivmod" [fs/btrfs/btrfs.ko] undefined!
    ERROR: modpost: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-10) =E2=80=94 FAIL, 2 errors, 34 warnings, 0 secti=
on mismatches

Errors:
    ERROR: modpost: "__aeabi_ldivmod" [fs/btrfs/btrfs.ko] undefined!
    ERROR: modpost: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!

Warnings:
    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame size of =
1392 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame size=
 of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    crypto/wp512.c:782:13: warning: stack frame size of 1192 bytes in funct=
ion 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1 warning generated.
    sound/firewire/amdtp-stream.c:657:7: warning: variable 'err' is used un=
initialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    sound/firewire/amdtp-stream.c:640:9: note: initialize the variable 'err=
' to silence this warning
    1 warning generated.
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/wireless/cisco/airo.c:3075:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/rtl8723bs/core/rtw_security.c:37:6: warning: stack fram=
e size of 1144 bytes in function 'rtw_wep_encrypt' [-Wframe-larger-than=3D]
    drivers/staging/rtl8723bs/core/rtw_security.c:93:6: warning: stack fram=
e size of 1096 bytes in function 'rtw_wep_decrypt' [-Wframe-larger-than=3D]
    drivers/staging/rtl8723bs/core/rtw_security.c:462:5: warning: stack fra=
me size of 1160 bytes in function 'rtw_tkip_encrypt' [-Wframe-larger-than=
=3D]
    drivers/staging/rtl8723bs/core/rtw_security.c:535:5: warning: stack fra=
me size of 1144 bytes in function 'rtw_tkip_decrypt' [-Wframe-larger-than=
=3D]
    4 warnings generated.
    drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: warning: stack frame size =
of 1056 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3041:6: warn=
ing: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5536 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.
    drivers/staging/fbtft/fbtft-core.c:992:5: warning: stack frame size of =
1216 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    drivers/staging/fbtft/fbtft-core.c:902:12: warning: stack frame size of=
 1080 bytes in function 'fbtft_init_display_from_property' [-Wframe-larger-=
than=3D]
    2 warnings generated.
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: warning: implicit con=
version from 'unsigned long long' to 'unsigned long' changes value from 500=
0000000 to 705032704 [-Wconstant-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-12) =E2=80=94 FAIL, 2 errors, 27 warnings, 0 sect=
ion mismatches

Errors:
    ERROR: modpost: "__divdi3" [fs/btrfs/btrfs.ko] undefined!
    ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!

Warnings:
    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame size of =
1332 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    sound/firewire/amdtp-stream.c:657:7: warning: variable 'err' is used un=
initialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    sound/firewire/amdtp-stream.c:640:9: note: initialize the variable 'err=
' to silence this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:450:13: warn=
ing: stack frame size of 1564 bytes in function 'dcn_bw_calc_rq_dlg_ttu' [-=
Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/rtl8723bs/core/rtw_security.c:37:6: warning: stack fram=
e size of 1092 bytes in function 'rtw_wep_encrypt' [-Wframe-larger-than=3D]
    drivers/staging/rtl8723bs/core/rtw_security.c:93:6: warning: stack fram=
e size of 1080 bytes in function 'rtw_wep_decrypt' [-Wframe-larger-than=3D]
    drivers/staging/rtl8723bs/core/rtw_security.c:462:5: warning: stack fra=
me size of 1112 bytes in function 'rtw_tkip_encrypt' [-Wframe-larger-than=
=3D]
    drivers/staging/rtl8723bs/core/rtw_security.c:535:5: warning: stack fra=
me size of 1100 bytes in function 'rtw_tkip_decrypt' [-Wframe-larger-than=
=3D]
    4 warnings generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 1804 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c=
:997:6: warning: stack frame size of 1196 bytes in function 'dml1_rq_dlg_ge=
t_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_=
30.c:981:13: warning: stack frame size of 1036 bytes in function 'dml_rq_dl=
g_get_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: warning: stack frame size of 1180 bytes in function 'dml20_DISPC=
LKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculatio=
n' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1463:13: warning: stack frame size of 1132 bytes in function 'DISPCLKDPPC=
LKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-W=
frame-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: warning: stack frame size of 1164 bytes in function 'dml20v2_D=
ISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcul=
ation' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: warning: stack frame size of 1420 bytes in function 'dml20_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3393:6: warning: stack frame size of 1468 bytes in function 'dml21_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: warning: stack frame size of 1420 bytes in function 'dml20v2_Mo=
deSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-12) =E2=80=94 FAIL, 2 errors, 34 warnings, 0 secti=
on mismatches

Errors:
    ERROR: modpost: "__aeabi_ldivmod" [fs/btrfs/btrfs.ko] undefined!
    ERROR: modpost: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!

Warnings:
    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame size of =
1384 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame size=
 of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    crypto/wp512.c:782:13: warning: stack frame size of 1176 bytes in funct=
ion 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1 warning generated.
    sound/firewire/amdtp-stream.c:657:7: warning: variable 'err' is used un=
initialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    sound/firewire/amdtp-stream.c:640:9: note: initialize the variable 'err=
' to silence this warning
    1 warning generated.
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/wireless/cisco/airo.c:3075:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3041:6: warn=
ing: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5560 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: warning: implicit con=
version from 'unsigned long long' to 'unsigned long' changes value from 500=
0000000 to 705032704 [-Wconstant-conversion]
    1 warning generated.
    drivers/staging/rtl8723bs/core/rtw_security.c:37:6: warning: stack fram=
e size of 1144 bytes in function 'rtw_wep_encrypt' [-Wframe-larger-than=3D]
    drivers/staging/rtl8723bs/core/rtw_security.c:93:6: warning: stack fram=
e size of 1096 bytes in function 'rtw_wep_decrypt' [-Wframe-larger-than=3D]
    drivers/staging/rtl8723bs/core/rtw_security.c:462:5: warning: stack fra=
me size of 1168 bytes in function 'rtw_tkip_encrypt' [-Wframe-larger-than=
=3D]
    drivers/staging/rtl8723bs/core/rtw_security.c:535:5: warning: stack fra=
me size of 1144 bytes in function 'rtw_tkip_decrypt' [-Wframe-larger-than=
=3D]
    4 warnings generated.
    drivers/staging/fbtft/fbtft-core.c:992:5: warning: stack frame size of =
1208 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    drivers/staging/fbtft/fbtft-core.c:902:12: warning: stack frame size of=
 1080 bytes in function 'fbtft_init_display_from_property' [-Wframe-larger-=
than=3D]
    2 warnings generated.
    drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: warning: stack frame size =
of 1064 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 FAIL, 8 errors, 0 warnings, 0 section mi=
smatches

Errors:
    stackdepot.c:(.text+0x4ac): undefined reference to `__irqentry_text_sta=
rt'
    arc-elf32-ld: stackdepot.c:(.text+0x4ac): undefined reference to `__irq=
entry_text_start'
    arc-elf32-ld: stackdepot.c:(.text+0x4cc): undefined reference to `__irq=
entry_text_end'
    arc-elf32-ld: stackdepot.c:(.text+0x4cc): undefined reference to `__irq=
entry_text_end'
    arc-elf32-ld: stackdepot.c:(.text+0x4d8): undefined reference to `__sof=
tirqentry_text_start'
    arc-elf32-ld: stackdepot.c:(.text+0x4d8): undefined reference to `__sof=
tirqentry_text_start'
    arc-elf32-ld: stackdepot.c:(.text+0x4e0): undefined reference to `__sof=
tirqentry_text_end'
    arc-elf32-ld: stackdepot.c:(.text+0x4e0): undefined reference to `__sof=
tirqentry_text_end'

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc2-next-20210520/kernel/drivers/media/tuners/tuner-types.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-12) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 FAIL, 1 error, 2 war=
nings, 0 section mismatches

Errors:
    ERROR: modpost: "__divdi3" [fs/btrfs/btrfs.ko] undefined!

Warnings:
    arch/arc/include/asm/perf_event.h:126:23: warning: =E2=80=98arc_pmu_cac=
he_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    arch/arc/include/asm/perf_event.h:91:27: warning: =E2=80=98arc_pmu_ev_h=
w_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings=
, 0 section mismatches

Errors:
    ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!
    ERROR: modpost: "__divdi3" [fs/btrfs/btrfs.ko] undefined!

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    {standard input}:39: Warning: macro instruction expanded into multiple =
instructions

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: warning: implicit con=
version from 'unsigned long long' to 'unsigned long' changes value from 500=
0000000 to 705032704 [-Wconstant-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: warning: implicit con=
version from 'unsigned long long' to 'unsigned long' changes value from 500=
0000000 to 705032704 [-Wconstant-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warni=
ngs, 0 section mismatches

Errors:
    ERROR: modpost: "__aeabi_ldivmod" [fs/btrfs/btrfs.ko] undefined!
    ERROR: modpost: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sec=
tion mismatches

Errors:
    ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!
    ERROR: modpost: "__divdi3" [fs/btrfs/btrfs.ko] undefined!

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 630 warnings,=
 0 section mismatches

Warnings:
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 750 wa=
rnings, 0 section mismatches

Warnings:
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]
    include/asm-generic/uaccess.h:48:16: warning: left-hand operand of comm=
a expression has no effect [-Wunused-value]
    include/asm-generic/uaccess.h:48:3: warning: statement with no effect [=
-Wunused-value]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 8 errors, 0 warnings=
, 0 section mismatches

Errors:
    stackdepot.c:(.text+0x4): undefined reference to `__irqentry_text_start'
    arc-elf32-ld: stackdepot.c:(.text+0x4): undefined reference to `__irqen=
try_text_start'
    arc-elf32-ld: stackdepot.c:(.text+0x24): undefined reference to `__irqe=
ntry_text_end'
    arc-elf32-ld: stackdepot.c:(.text+0x24): undefined reference to `__irqe=
ntry_text_end'
    arc-elf32-ld: stackdepot.c:(.text+0x30): undefined reference to `__soft=
irqentry_text_start'
    arc-elf32-ld: stackdepot.c:(.text+0x30): undefined reference to `__soft=
irqentry_text_start'
    arc-elf32-ld: stackdepot.c:(.text+0x38): undefined reference to `__soft=
irqentry_text_end'
    arc-elf32-ld: stackdepot.c:(.text+0x38): undefined reference to `__soft=
irqentry_text_end'

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mach-omap1/board-h2.c:347:34: warning: =E2=80=98isp1301_gpiod_=
table=E2=80=99 defined but not used [-Wunused-variable]
    arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=98ams_del=
ta_camera_power=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/block/paride/bpck.c:32: warning: "PC" redefined

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_chromebook (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---
For more info write to <info@kernelci.org>
