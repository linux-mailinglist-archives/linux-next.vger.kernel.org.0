Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E54FC3AD06F
	for <lists+linux-next@lfdr.de>; Fri, 18 Jun 2021 18:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234072AbhFRQd6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Jun 2021 12:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231203AbhFRQd6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Jun 2021 12:33:58 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6E2C061574
        for <linux-next@vger.kernel.org>; Fri, 18 Jun 2021 09:31:47 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id o10-20020a17090aac0ab029016e92770073so6160020pjq.5
        for <linux-next@vger.kernel.org>; Fri, 18 Jun 2021 09:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MMLatR8gVHcGeF5iwK4RRRYnYYIekDdajOsxpd+Y4Fs=;
        b=uFPrkIlJu/GCfsm5vRPDwstX6GHDJSgUhrv2uu1sMOjTRQw673Awa5i1optnVNbPE9
         WSVOG4jOwhZach3Vk8MJ2HVfVKWP/JLh+EGjxDp1WVeo2MjTRx+6GtVw5Dcc+4XSr48K
         kjYdepiMdk9zR9tMtrLicPVQVKjjWthxC5RdJ6gsnONA+mm8K1gSuwrH4U1hHQ2QbAqG
         fyapk3Ep8uvUBiMU4IO29QzG/CzSsA6Ht/u5gzxZVbVwtcXXu5t7gtS/YFbkcRR9fwa2
         NJpOoitbeC81kBSCXn440YZ+p2nJFoH0ehTr2JxzCO3lscf1uoojemH+Bc3OhZ4QKBzy
         dy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MMLatR8gVHcGeF5iwK4RRRYnYYIekDdajOsxpd+Y4Fs=;
        b=ff40jCKEXCv5bTIDi1cj9ifGRzvxMNjLj60CbARlOyZW+N/7oJ3FfKwd8FrK/w/DWn
         gJPgr8o7Qk4kFmpdhSTAvRaXe/PaVG3Ymm//CoZA0+B7qpXjk9dkHf42ul7J9KgkBdOS
         gnh9vx+JbeT2/4DwMH2tr0fgWlam6VQgo2lEmmTeSE5s7d1BybiZQI8kl6pDYhEvOCMA
         qo2ZpJo8Y+r/F9jQBLoNWaX4n80s8q/bPhzshofZ3CvhRpxvIgMJULXRrO9s75G2CEYv
         e/lb+ScnRCdl+DsXaAhri+XO8vMx/tcH9OUFpbrqcZYWteIj4yWdqHggzu2MwaoVGv2E
         hJaA==
X-Gm-Message-State: AOAM532kCwpv3P9FMTKsubOxVqyn5/VzF5/1tonD3oBY3A95tFNJktnA
        C1loXQszBCjJNXF5bUHSDxK4/b3etOEVG5Vy
X-Google-Smtp-Source: ABdhPJzzJYJMezn4671ewOOdFWmK0CPvyhvCbtZuSa7rxZ3Z/JsFNS/oJV67cbLNsF3kHowPoH0lRQ==
X-Received: by 2002:a17:90a:ee85:: with SMTP id i5mr17279997pjz.156.1624033906592;
        Fri, 18 Jun 2021 09:31:46 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u24sm9054834pfm.200.2021.06.18.09.31.45
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 09:31:45 -0700 (PDT)
Message-ID: <60ccca71.1c69fb81.2d151.83de@mx.google.com>
Date:   Fri, 18 Jun 2021 09:31:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20210618
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 210 builds: 7 failed, 203 passed, 28 errors,
 95 warnings (next-20210618)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 210 builds: 7 failed, 203 passed, 28 errors, 95 warnings=
 (next-20210618)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20210618/

Tree: next
Branch: master
Git Describe: next-20210618
Git Commit: e71e3a48a7e89fa71fb70bf4602367528864d2ff
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arc:
    allnoconfig: (gcc-8) FAIL
    nsimosci_hs_smp_defconfig: (gcc-8) FAIL

arm:
    allmodconfig: (clang-10) FAIL
    allmodconfig: (gcc-8) FAIL

mips:
    decstation_64_defconfig: (gcc-8) FAIL
    lemote2f_defconfig: (gcc-8) FAIL

riscv:
    rv32_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 8 errors
    axs103_defconfig (gcc-8): 1 warning
    axs103_smp_defconfig (gcc-8): 1 warning
    haps_hs_defconfig (gcc-8): 1 warning
    haps_hs_smp_defconfig (gcc-8): 1 warning
    haps_hs_smp_defconfig+kselftest (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 1 warning
    nsimosci_hs_smp_defconfig (gcc-8): 8 errors, 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    defconfig (clang-12): 2 warnings
    defconfig (clang-10): 3 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-12): 2 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 3 warnings

arm:
    allmodconfig (gcc-8): 1 error
    allmodconfig (clang-10): 1 error, 31 warnings
    axm55xx_defconfig (gcc-8): 3 warnings
    colibri_pxa270_defconfig (gcc-8): 1 warning
    keystone_defconfig (gcc-8): 2 warnings
    lpc18xx_defconfig (gcc-8): 1 warning
    mini2440_defconfig (gcc-8): 1 warning
    mps2_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (clang-10): 2 warnings
    multi_v7_defconfig (clang-12): 2 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-8): 2 warnin=
gs
    nhk8815_defconfig (gcc-8): 1 warning
    pxa_defconfig (gcc-8): 1 warning
    stm32_defconfig (gcc-8): 1 warning
    trizeps4_defconfig (gcc-8): 1 warning
    vf610m4_defconfig (gcc-8): 1 warning
    xcep_defconfig (gcc-8): 1 warning

i386:

mips:
    capcella_defconfig (gcc-8): 1 warning
    cobalt_defconfig (gcc-8): 1 warning
    mpc30x_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 8 warnings
    sb1250_swarm_defconfig (gcc-8): 1 warning
    workpad_defconfig (gcc-8): 1 warning

riscv:
    nommu_k210_defconfig (gcc-8): 1 warning
    nommu_k210_sdcard_defconfig (gcc-8): 1 warning
    rv32_defconfig (gcc-8): 10 errors, 8 warnings

x86_64:

Errors summary:

    5    arch/riscv/include/asm/pgtable.h:521:9: error: incompatible types =
when returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =
=E2=80=98struct <anonymous>=E2=80=99} was expected
    5    arch/riscv/include/asm/pgtable.h:521:9: error: implicit declaratio=
n of function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
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
    2    ERROR: modpost: "__bad_cmpxchg" [drivers/scsi/elx/efct.ko] undefin=
ed!
    1    stackdepot.c:(.text+0x4ac): undefined reference to `__irqentry_tex=
t_start'
    1    stackdepot.c:(.text+0x4): undefined reference to `__irqentry_text_=
start'
    1    arc-elf32-ld: stackdepot.c:(.text+0x4ac): undefined reference to `=
__irqentry_text_start'
    1    arc-elf32-ld: stackdepot.c:(.text+0x4): undefined reference to `__=
irqentry_text_start'

Warnings summary:

    20   net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=
=E2=80=99 defined but not used [-Wunused-function]
    17   1 warning generated.
    6    include/linux/rmap.h:294:34: warning: statement with no effect [-W=
unused-value]
    5    cc1: some warnings being treated as errors
    4    drivers/net/ethernet/mellanox/mlx5/core/eq.c:715:14: warning: addr=
ess of array 'param->affinity' will always evaluate to 'true' [-Wpointer-bo=
ol-conversion]
    3    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%x=E2=
=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but argumen=
t 3 has type =E2=80=98phys_addr_t=E2=80=99 {aka =E2=80=98long long unsigned=
 int=E2=80=99} [-Wformat=3D]
    3    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%x=E2=
=80=99 expects argument of type =E2=80=98unsigned int=E2=80=99, but argumen=
t 2 has type =E2=80=98phys_addr_t=E2=80=99 {aka =E2=80=98long long unsigned=
 int=E2=80=99} [-Wformat=3D]
    3    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:976:48: warning: implici=
t conversion from 'unsigned long long' to 'unsigned long' changes value fro=
m 5000000000 to 705032704 [-Wconstant-conversion]
    2    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.13.0-rc6-next-20210618/kernel/drivers/media/tuners/tuner-types=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    #warning This code requires at least version 4.6 of GCC
    1    warnings generated.
    1    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame siz=
e of 1392 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=
=3D]
    1    fs/afs/cmservice.c:34:21: warning: =E2=80=98_afs_SRXCBYFS_CallBack=
_name=E2=80=99 defined but not used [-Wunused-variable]
    1    fs/afs/cmservice.c:34:21: warning: =E2=80=98_afs_SRXCBTellMeAboutY=
ourself_name=E2=80=99 defined but not used [-Wunused-variable]
    1    fs/afs/cmservice.c:34:21: warning: =E2=80=98_afs_SRXCBProbe_name=
=E2=80=99 defined but not used [-Wunused-variable]
    1    fs/afs/cmservice.c:34:21: warning: =E2=80=98_afs_SRXCBProbeUuid_na=
me=E2=80=99 defined but not used [-Wunused-variable]
    1    fs/afs/cmservice.c:34:21: warning: =E2=80=98_afs_SRXCBInitCallBack=
State_name=E2=80=99 defined but not used [-Wunused-variable]
    1    fs/afs/cmservice.c:34:21: warning: =E2=80=98_afs_SRXCBInitCallBack=
State3_name=E2=80=99 defined but not used [-Wunused-variable]
    1    fs/afs/cmservice.c:34:21: warning: =E2=80=98_afs_SRXCBCallBack_nam=
e=E2=80=99 defined but not used [-Wunused-variable]
    1    drivers/staging/fbtft/fbtft-core.c:992:5: warning: stack frame siz=
e of 1216 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    1    drivers/staging/fbtft/fbtft-core.c:902:12: warning: stack frame si=
ze of 1080 bytes in function 'fbtft_init_display_from_property' [-Wframe-la=
rger-than=3D]
    1    drivers/scsi/elx/efct/efct_lio.c:1216:24: warning: variable 'id' i=
s uninitialized when used here [-Wuninitialized]
    1    drivers/scsi/elx/efct/efct_lio.c:1183:8: note: initialize the vari=
able 'id' to silence this warning
    1    drivers/scsi/elx/efct/efct_hw.c:1523:17: warning: address of array=
 'ctx->buf' will always evaluate to 'true' [-Wpointer-bool-conversion]
    1    drivers/net/wireless/cisco/airo.c:3075:12: warning: stack frame si=
ze of 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1    drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: warning: stack frame =
size of 1056 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=
=3D]
    1    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack fra=
me size of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: =
warning: stack frame size of 5536 bytes in function 'calculate_bandwidth' [=
-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3043:6:=
 warning: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-la=
rger-than=3D]
    1    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame=
 size of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    crypto/wp512.c:782:13: warning: stack frame size of 1192 bytes in =
function 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1    arch/arc/include/asm/perf_event.h:91:27: warning: =E2=80=98arc_pmu=
_ev_hw_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    1    arch/arc/include/asm/perf_event.h:126:23: warning: =E2=80=98arc_pm=
u_cache_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    1    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    1    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    1    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    2 warnings generated.

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
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    ERROR: modpost: "__bad_cmpxchg" [drivers/scsi/elx/efct.ko] undefined!

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-10) =E2=80=94 FAIL, 1 error, 31 warnings, 0 sectio=
n mismatches

Errors:
    ERROR: modpost: "__bad_cmpxchg" [drivers/scsi/elx/efct.ko] undefined!

Warnings:
    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame size of =
1392 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame size=
 of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1 warning generated.
    crypto/wp512.c:782:13: warning: stack frame size of 1192 bytes in funct=
ion 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/wireless/cisco/airo.c:3075:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/scsi/elx/efct/efct_hw.c:1523:17: warning: address of array 'ctx=
->buf' will always evaluate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.
    drivers/scsi/elx/efct/efct_lio.c:1216:24: warning: variable 'id' is uni=
nitialized when used here [-Wuninitialized]
    drivers/scsi/elx/efct/efct_lio.c:1183:8: note: initialize the variable =
'id' to silence this warning
    1 warning generated.
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:976:48: warning: implicit con=
version from 'unsigned long long' to 'unsigned long' changes value from 500=
0000000 to 705032704 [-Wconstant-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3043:6: warn=
ing: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5536 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    warnings generated.
    drivers/staging/fbtft/fbtft-core.c:992:5: warning: stack frame size of =
1216 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    drivers/staging/fbtft/fbtft-core.c:902:12: warning: stack frame size of=
 1080 bytes in function 'fbtft_init_display_from_property' [-Wframe-larger-=
than=3D]
    2 warnings generated.
    drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: warning: stack frame size =
of 1056 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
aspeed_g5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
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
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%x=E2=80=99 =
expects argument of type =E2=80=98unsigned int=E2=80=99, but argument 2 has=
 type =E2=80=98phys_addr_t=E2=80=99 {aka =E2=80=98long long unsigned int=E2=
=80=99} [-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%x=E2=80=99 =
expects argument of type =E2=80=98unsigned int=E2=80=99, but argument 3 has=
 type =E2=80=98phys_addr_t=E2=80=99 {aka =E2=80=98long long unsigned int=E2=
=80=99} [-Wformat=3D]
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

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
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

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
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

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
defconfig (arm64, clang-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/net/ethernet/mellanox/mlx5/core/eq.c:715:14: warning: address o=
f array 'param->affinity' will always evaluate to 'true' [-Wpointer-bool-co=
nversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    drivers/net/ethernet/mellanox/mlx5/core/eq.c:715:14: warning: address o=
f array 'param->affinity' will always evaluate to 'true' [-Wpointer-bool-co=
nversion]
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc6-next-20210618/kernel/drivers/media/tuners/tuner-types.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-12) =E2=80=94 PASS, 0 er=
rors, 2 warnings, 0 section mismatches

Warnings:
    drivers/net/ethernet/mellanox/mlx5/core/eq.c:715:14: warning: address o=
f array 'param->affinity' will always evaluate to 'true' [-Wpointer-bool-co=
nversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-10) =E2=80=94 PASS, 0 er=
rors, 3 warnings, 0 section mismatches

Warnings:
    drivers/net/ethernet/mellanox/mlx5/core/eq.c:715:14: warning: address o=
f array 'param->affinity' will always evaluate to 'true' [-Wpointer-bool-co=
nversion]
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc6-next-20210618/kernel/drivers/media/tuners/tuner-types.ko: =
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
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
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
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 wa=
rnings, 0 section mismatches

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
i386_defconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

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
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%x=E2=80=99 =
expects argument of type =E2=80=98unsigned int=E2=80=99, but argument 2 has=
 type =E2=80=98phys_addr_t=E2=80=99 {aka =E2=80=98long long unsigned int=E2=
=80=99} [-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%x=E2=80=99 =
expects argument of type =E2=80=98unsigned int=E2=80=99, but argument 3 has=
 type =E2=80=98phys_addr_t=E2=80=99 {aka =E2=80=98long long unsigned int=E2=
=80=99} [-Wformat=3D]

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
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/rmap.h:294:34: warning: statement with no effect [-Wunuse=
d-value]

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
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

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
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

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
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    include/linux/rmap.h:294:34: warning: statement with no effect [-Wunuse=
d-value]

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
multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
multi_v7_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:976:48: warning: implicit con=
version from 'unsigned long long' to 'unsigned long' changes value from 500=
0000000 to 705032704 [-Wconstant-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:976:48: warning: implicit con=
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
=94 PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%x=E2=80=99 =
expects argument of type =E2=80=98unsigned int=E2=80=99, but argument 2 has=
 type =E2=80=98phys_addr_t=E2=80=99 {aka =E2=80=98long long unsigned int=E2=
=80=99} [-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%x=E2=80=99 =
expects argument of type =E2=80=98unsigned int=E2=80=99, but argument 3 has=
 type =E2=80=98phys_addr_t=E2=80=99 {aka =E2=80=98long long unsigned int=E2=
=80=99} [-Wformat=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

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
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    include/linux/rmap.h:294:34: warning: statement with no effect [-Wunuse=
d-value]

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    include/linux/rmap.h:294:34: warning: statement with no effect [-Wunuse=
d-value]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 FAIL, 8 errors, 1 warning,=
 0 section mismatches

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

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

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
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 secti=
on mismatches

Warnings:
    fs/afs/cmservice.c:34:21: warning: =E2=80=98_afs_SRXCBYFS_CallBack_name=
=E2=80=99 defined but not used [-Wunused-variable]
    fs/afs/cmservice.c:34:21: warning: =E2=80=98_afs_SRXCBTellMeAboutYourse=
lf_name=E2=80=99 defined but not used [-Wunused-variable]
    fs/afs/cmservice.c:34:21: warning: =E2=80=98_afs_SRXCBProbeUuid_name=E2=
=80=99 defined but not used [-Wunused-variable]
    fs/afs/cmservice.c:34:21: warning: =E2=80=98_afs_SRXCBProbe_name=E2=80=
=99 defined but not used [-Wunused-variable]
    fs/afs/cmservice.c:34:21: warning: =E2=80=98_afs_SRXCBInitCallBackState=
3_name=E2=80=99 defined but not used [-Wunused-variable]
    fs/afs/cmservice.c:34:21: warning: =E2=80=98_afs_SRXCBInitCallBackState=
_name=E2=80=99 defined but not used [-Wunused-variable]
    fs/afs/cmservice.c:34:21: warning: =E2=80=98_afs_SRXCBCallBack_name=E2=
=80=99 defined but not used [-Wunused-variable]
    drivers/block/paride/bpck.c:32: warning: "PC" redefined

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
rv32_defconfig (riscv, gcc-8) =E2=80=94 FAIL, 10 errors, 8 warnings, 0 sect=
ion mismatches

Errors:
    arch/riscv/include/asm/pgtable.h:521:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:521:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:521:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:521:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:521:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:521:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:521:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:521:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:521:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:521:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected

Warnings:
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

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
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

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
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/rmap.h:294:34: warning: statement with no effect [-Wunuse=
d-value]

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
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

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
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/rmap.h:294:34: warning: statement with no effect [-Wunuse=
d-value]

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
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

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
x86_64_defconfig+x86-chromebook (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    net/xfrm/xfrm_output.c:140:12: warning: =E2=80=98xfrm6_hdr_offset=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---
For more info write to <info@kernelci.org>
