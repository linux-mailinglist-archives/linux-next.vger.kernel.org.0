Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 365E139C2FA
	for <lists+linux-next@lfdr.de>; Fri,  4 Jun 2021 23:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbhFDVx3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Jun 2021 17:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbhFDVx3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Jun 2021 17:53:29 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C072C061766
        for <linux-next@vger.kernel.org>; Fri,  4 Jun 2021 14:51:42 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id e7so5337812plj.7
        for <linux-next@vger.kernel.org>; Fri, 04 Jun 2021 14:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RQvkcIMmP08G0IsIgiv89Ta4syVK55tPVPvg94cGmhA=;
        b=A5UfYbNJDql/bgAKTzN1W6afIA9VIu61wTCjsCf2u8cqpMwKEodV2Y64T6EmUJzcJy
         59WkbbXIiyBzbVs6ZiA0ZoWxOV0+D+cBtzW7EEyPSVYW/D9qcknD6caQzzwSefymaiDO
         hfePKv4SUcLiipydAZXCj8qAYK5+AoIY9qUA+euL+agUz42YJvnXhxeIAM0cHT8lreeW
         J1rfFEI/9sTt1KmneWgM5/mjG+bk2fc+zsTBqSjqYk8GOeoJDZG3UtPTwIxDqQSBgo8a
         dx9HPZY8T6m17QR5FYQhN2FL5/EEIEsad0qRGmEQzQxKqhBcET5WbwTzcE38zjqpsJsH
         s9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RQvkcIMmP08G0IsIgiv89Ta4syVK55tPVPvg94cGmhA=;
        b=fpO4tck26SzW/MxQPBK1MahSt3cxHQq1BfYuuDknlD5xzNW0nY5ug0LEzhQmrc3Z65
         ZQE2ixTRSGL9uD5GdegZ6MvoniVmXsG9qqYIoJ+3wOabu94Ys1wDSsT4Kq/qUUvvC3zf
         6MdbIMaT2l0odiBKSrR4KUU840+pGNqG4+iShHx7j2FEKzgKtYTh0ryIcMKQiDLzvT1g
         DnYFOPX6JoJA7VZhGokPg8QhDLGNJu+uimXFSO3KGz3jS9nSgnyjWWtNiXhA4IOFvisT
         b2psjDRGH4mzoBFk/o2qzlntLRUrSdOYxlr5H1NUwPsnnJpFu4CFf3S0obRRtScKvBdl
         3Jmg==
X-Gm-Message-State: AOAM530sjoUUhYgDgk2Mcy+SAVEmSbwiarS+7D+sjd7WDHEWXXkhnICj
        8AbqG9sR1gC0V/LeG9gezFyDGxQkAnXkY77a
X-Google-Smtp-Source: ABdhPJzRLqe/rpKpfkzpGhtr69CR8cq1yTnjlAx6heJsi7GIpsS170qfl4ctZBRMyWL09l44ElllOA==
X-Received: by 2002:a17:90a:7c43:: with SMTP id e3mr2994483pjl.5.1622843500051;
        Fri, 04 Jun 2021 14:51:40 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x15sm2534819pfd.121.2021.06.04.14.51.39
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 14:51:39 -0700 (PDT)
Message-ID: <60baa06b.1c69fb81.b308a.83c6@mx.google.com>
Date:   Fri, 04 Jun 2021 14:51:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20210604
X-Kernelci-Report-Type: build
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master build: 211 builds: 26 failed, 185 passed, 57 errors,
 223 warnings (next-20210604)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 211 builds: 26 failed, 185 passed, 57 errors, 223 warnin=
gs (next-20210604)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20210604/

Tree: next
Branch: master
Git Describe: next-20210604
Git Commit: ccc252d2e818f6a479441119ad453c3ce7c7c461
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arc:
    allnoconfig: (gcc-8) FAIL
    nsimosci_hs_smp_defconfig: (gcc-8) FAIL

arm:
    allmodconfig: (clang-10) FAIL
    allmodconfig: (gcc-8) FAIL
    cm_x300_defconfig: (gcc-8) FAIL
    ezx_defconfig: (gcc-8) FAIL
    imote2_defconfig: (gcc-8) FAIL
    nhk8815_defconfig: (gcc-8) FAIL
    pxa_defconfig: (gcc-8) FAIL
    s3c2410_defconfig: (gcc-8) FAIL
    trizeps4_defconfig: (gcc-8) FAIL

mips:
    bmips_be_defconfig: (gcc-8) FAIL
    bmips_stb_defconfig: (gcc-8) FAIL
    decstation_64_defconfig: (gcc-8) FAIL
    ip22_defconfig: (gcc-8) FAIL
    jazz_defconfig: (gcc-8) FAIL
    lemote2f_defconfig: (gcc-8) FAIL
    malta_qemu_32r6_defconfig: (gcc-8) FAIL
    maltaaprp_defconfig: (gcc-8) FAIL
    maltasmvp_defconfig: (gcc-8) FAIL
    maltasmvp_eva_defconfig: (gcc-8) FAIL
    maltaup_defconfig: (gcc-8) FAIL
    mtx1_defconfig: (gcc-8) FAIL
    nlm_xlr_defconfig: (gcc-8) FAIL
    rm200_defconfig: (gcc-8) FAIL

riscv:
    rv32_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 8 errors
    haps_hs_smp_defconfig+kselftest (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 8 errors

arm64:
    allmodconfig (clang-12): 5 warnings
    defconfig (clang-12): 3 warnings
    defconfig (clang-10): 4 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-12): 3 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 4 warnings

arm:
    allmodconfig (clang-10): 1 error, 29 warnings
    allmodconfig (gcc-8): 1 error, 8 warnings
    cm_x300_defconfig (gcc-8): 1 error, 7 warnings
    ezx_defconfig (gcc-8): 1 error, 7 warnings
    imote2_defconfig (gcc-8): 1 error, 7 warnings
    multi_v7_defconfig (clang-12): 2 warnings
    multi_v7_defconfig (clang-10): 2 warnings
    nhk8815_defconfig (gcc-8): 1 error, 7 warnings
    pxa_defconfig (gcc-8): 1 error, 7 warnings
    s3c2410_defconfig (gcc-8): 1 error, 7 warnings
    trizeps4_defconfig (gcc-8): 1 error, 7 warnings

i386:
    i386_defconfig (clang-12): 3 warnings
    i386_defconfig (clang-10): 3 warnings

mips:
    bmips_be_defconfig (gcc-8): 1 error, 7 warnings
    bmips_stb_defconfig (gcc-8): 1 error, 7 warnings
    ip22_defconfig (gcc-8): 1 error, 7 warnings
    jazz_defconfig (gcc-8): 1 error, 7 warnings
    malta_qemu_32r6_defconfig (gcc-8): 1 error, 7 warnings
    maltaaprp_defconfig (gcc-8): 1 error, 7 warnings
    maltasmvp_defconfig (gcc-8): 1 error, 7 warnings
    maltasmvp_eva_defconfig (gcc-8): 1 error, 7 warnings
    maltaup_defconfig (gcc-8): 1 error, 7 warnings
    mtx1_defconfig (gcc-8): 1 error, 7 warnings
    nlm_xlr_defconfig (gcc-8): 1 error, 7 warnings
    rm200_defconfig (gcc-8): 1 error, 8 warnings

riscv:
    rv32_defconfig (gcc-8): 20 errors, 13 warnings

x86_64:
    x86_64_defconfig (clang-12): 3 warnings
    x86_64_defconfig (clang-10): 5 warnings

Errors summary:

    20   fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98t=
est_bit=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-poi=
nter-types]
    10   arch/riscv/include/asm/pgtable.h:519:9: error: incompatible types =
when returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =
=E2=80=98struct <anonymous>=E2=80=99} was expected
    10   arch/riscv/include/asm/pgtable.h:519:9: error: implicit declaratio=
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
    1    stackdepot.c:(.text+0x4ac): undefined reference to `__irqentry_tex=
t_start'
    1    stackdepot.c:(.text+0x4): undefined reference to `__irqentry_text_=
start'
    1    fs/cifs/transport.c:1065:7: error: incompatible pointer types pass=
ing 'size_t *' (aka 'unsigned int *') to parameter of type 'const volatile =
unsigned long *' [-Werror,-Wincompatible-pointer-types]
    1    arc-elf32-ld: stackdepot.c:(.text+0x4ac): undefined reference to `=
__irqentry_text_start'
    1    arc-elf32-ld: stackdepot.c:(.text+0x4): undefined reference to `__=
irqentry_text_start'

Warnings summary:

    78   include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=
=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but ar=
gument 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=
=99} [-Wformat=3D]
    38   include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=
=80=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but ar=
gument 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=
=99} [-Wformat=3D]
    30   cc1: some warnings being treated as errors
    20   1 warning generated.
    9    drivers/md/dm.c:805:43: warning: variable 'bio' is uninitialized w=
hen used here [-Wuninitialized]
    9    drivers/md/dm.c:787:17: note: initialize the variable 'bio' to sil=
ence this warning
    3    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: warning: implici=
t conversion from 'unsigned long long' to 'unsigned long' changes value fro=
m 5000000000 to 705032704 [-Wconstant-conversion]
    2    fs/cifs/cifs_debug.h:15:21: warning: format =E2=80=98%lx=E2=80=99 =
expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument =
4 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-=
Wformat=3D]
    2    fs/cifs/cifs_debug.h:15:21: warning: format =E2=80=98%lx=E2=80=99 =
expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument =
3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-=
Wformat=3D]
    2    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.13.0-rc4-next-20210604/kernel/drivers/media/tuners/tuner-types=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    2 warnings generated.
    2    #warning This code requires at least version 4.6 of GCC
    1    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame siz=
e of 1392 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=
=3D]
    1    drivers/staging/fbtft/fbtft-core.c:992:5: warning: stack frame siz=
e of 1216 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    1    drivers/staging/fbtft/fbtft-core.c:902:12: warning: stack frame si=
ze of 1080 bytes in function 'fbtft_init_display_from_property' [-Wframe-la=
rger-than=3D]
    1    drivers/net/wireless/cisco/airo.c:3075:12: warning: stack frame si=
ze of 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1    drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: warning: stack frame =
size of 1056 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=
=3D]
    1    drivers/infiniband/hw/irdma/hw.c:579:23: warning: cast to pointer =
from integer of different size [-Wint-to-pointer-cast]
    1    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack fra=
me size of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_relocate_parse_slow()+0x427: stack state mismatch: cfa1=3D4+120 cfa2=3D-=
1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_copy_relocations()+0x1d5: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0
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
allmodconfig (arm, clang-10) =E2=80=94 FAIL, 1 error, 29 warnings, 0 sectio=
n mismatches

Errors:
    fs/cifs/transport.c:1065:7: error: incompatible pointer types passing '=
size_t *' (aka 'unsigned int *') to parameter of type 'const volatile unsig=
ned long *' [-Werror,-Wincompatible-pointer-types]

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
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/md/dm.c:805:43: warning: variable 'bio' is uninitialized when u=
sed here [-Wuninitialized]
    drivers/md/dm.c:787:17: note: initialize the variable 'bio' to silence =
this warning
    1 warning generated.
    drivers/net/wireless/cisco/airo.c:3075:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: warning: implicit con=
version from 'unsigned long long' to 'unsigned long' changes value from 500=
0000000 to 705032704 [-Wconstant-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3043:6: warn=
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
    drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: warning: stack frame size =
of 1056 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 8 warnings, 0 section mi=
smatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    fs/cifs/cifs_debug.h:15:21: warning: format =E2=80=98%lx=E2=80=99 expec=
ts argument of type =E2=80=98long unsigned int=E2=80=99, but argument 4 has=
 type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wform=
at=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    fs/cifs/cifs_debug.h:15:21: warning: format =E2=80=98%lx=E2=80=99 expec=
ts argument of type =E2=80=98long unsigned int=E2=80=99, but argument 3 has=
 type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wform=
at=3D]
    cc1: some warnings being treated as errors
    drivers/infiniband/hw/irdma/hw.c:579:23: warning: cast to pointer from =
integer of different size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-12) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/md/dm.c:805:43: warning: variable 'bio' is uninitialized when u=
sed here [-Wuninitialized]
    drivers/md/dm.c:787:17: note: initialize the variable 'bio' to silence =
this warning
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 3312 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.

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
allnoconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
aspeed_g5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
bmips_be_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, 0 sec=
tion mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, 0 se=
ction mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

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
cm_x300_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, 0 secti=
on mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    drivers/md/dm.c:805:43: warning: variable 'bio' is uninitialized when u=
sed here [-Wuninitialized]
    drivers/md/dm.c:787:17: note: initialize the variable 'bio' to silence =
this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    drivers/md/dm.c:805:43: warning: variable 'bio' is uninitialized when u=
sed here [-Wuninitialized]
    drivers/md/dm.c:787:17: note: initialize the variable 'bio' to silence =
this warning
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc4-next-20210604/kernel/drivers/media/tuners/tuner-types.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-12) =E2=80=94 PASS, 0 er=
rors, 3 warnings, 0 section mismatches

Warnings:
    drivers/md/dm.c:805:43: warning: variable 'bio' is uninitialized when u=
sed here [-Wuninitialized]
    drivers/md/dm.c:787:17: note: initialize the variable 'bio' to silence =
this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-10) =E2=80=94 PASS, 0 er=
rors, 4 warnings, 0 section mismatches

Warnings:
    drivers/md/dm.c:805:43: warning: variable 'bio' is uninitialized when u=
sed here [-Wuninitialized]
    drivers/md/dm.c:787:17: note: initialize the variable 'bio' to silence =
this warning
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc4-next-20210604/kernel/drivers/media/tuners/tuner-types.ko: =
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
ezx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, 0 section m=
ismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

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
i386_defconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/md/dm.c:805:43: warning: variable 'bio' is uninitialized when u=
sed here [-Wuninitialized]
    drivers/md/dm.c:787:17: note: initialize the variable 'bio' to silence =
this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/md/dm.c:805:43: warning: variable 'bio' is uninitialized when u=
sed here [-Wuninitialized]
    drivers/md/dm.c:787:17: note: initialize the variable 'bio' to silence =
this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, 0 sectio=
n mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

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
ip22_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, 0 section=
 mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

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
jazz_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, 0 section=
 mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

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
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings=
, 0 section mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, 0 se=
ction mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, 0 se=
ction mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, =
0 section mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, 0 sect=
ion mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

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
mtx1_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, 0 section=
 mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

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
nhk8815_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, 0 secti=
on mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, 0 sect=
ion mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

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
pxa_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, 0 section m=
ismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    fs/cifs/cifs_debug.h:15:21: warning: format =E2=80=98%lx=E2=80=99 expec=
ts argument of type =E2=80=98long unsigned int=E2=80=99, but argument 4 has=
 type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wform=
at=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    fs/cifs/cifs_debug.h:15:21: warning: format =E2=80=98%lx=E2=80=99 expec=
ts argument of type =E2=80=98long unsigned int=E2=80=99, but argument 3 has=
 type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wform=
at=3D]
    cc1: some warnings being treated as errors

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
rm200_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 8 warnings, 0 sectio=
n mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors
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
rv32_defconfig (riscv, gcc-8) =E2=80=94 FAIL, 20 errors, 13 warnings, 0 sec=
tion mismatches

Errors:
    arch/riscv/include/asm/pgtable.h:519:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:519:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:519:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:519:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:519:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:519:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:519:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:519:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:519:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:519:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:519:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:519:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:519:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:519:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:519:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:519:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:519:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:519:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:519:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:519:9: error: incompatible types when =
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
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, 0 secti=
on mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

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
trizeps4_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 7 warnings, 0 sect=
ion mismatches

Errors:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of =E2=80=98test_b=
it=E2=80=99 from incompatible pointer type [-Werror=3Dincompatible-pointer-=
types]

Warnings:
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [=
-Wformat=3D]
    cc1: some warnings being treated as errors

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
x86_64_defconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    drivers/md/dm.c:805:43: warning: variable 'bio' is uninitialized when u=
sed here [-Wuninitialized]
    drivers/md/dm.c:787:17: note: initialize the variable 'bio' to silence =
this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 5 warnings, 0=
 section mismatches

Warnings:
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_re=
locate_parse_slow()+0x427: stack state mismatch: cfa1=3D4+120 cfa2=3D-1+0
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_co=
py_relocations()+0x1d5: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0
    drivers/md/dm.c:805:43: warning: variable 'bio' is uninitialized when u=
sed here [-Wuninitialized]
    drivers/md/dm.c:787:17: note: initialize the variable 'bio' to silence =
this warning
    1 warning generated.

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
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---
For more info write to <info@kernelci.org>
