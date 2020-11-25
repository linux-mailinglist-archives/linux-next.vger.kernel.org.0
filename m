Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B852C4029
	for <lists+linux-next@lfdr.de>; Wed, 25 Nov 2020 13:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbgKYM3o (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Nov 2020 07:29:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727669AbgKYM3o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Nov 2020 07:29:44 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA0AC0613D4
        for <linux-next@vger.kernel.org>; Wed, 25 Nov 2020 04:29:44 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id t37so2322472pga.7
        for <linux-next@vger.kernel.org>; Wed, 25 Nov 2020 04:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+vn8jrKLGmKpVaRaBk3FTRCdd9hRX46VdRQj3ViF50M=;
        b=Owstoag/xMkRcZsDhfKBx/DqmhP7clJjBl1FDkSjaQmSsQlckGLEjnYsmfIJn/3cUP
         PCTOJWYOwKiMmwg3llERNi4c4VvcWUlAQE+2GJ+PlPUO6cP/40rSISA3xGo6Cp5STC/j
         YvteAAd+ST1qk+rdD/1TGfG1I9JuM199dOkT+UL22gP3hRtQgSGdjeMKgUISJzCj6wVM
         qN1COx9RCUiJRLjSTkVCqiRSOmyM2iynYRYSddFVRDFzfoBpdCCpLqXVby/oryHD0mi1
         XhWZal0a7QEtZ1P++xdVX5C07wRirWTyfNDq9ZYILYhK3qG9OBUW80Ndrjz2sg9MpjI3
         aolA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+vn8jrKLGmKpVaRaBk3FTRCdd9hRX46VdRQj3ViF50M=;
        b=eJhbFlVarKpchMr1AmB4O1WX9ZinOwwms17ygZ1PZcP9AJK2StG0hz1hKXg10PYAXK
         j2Vw70m2QlO2zzz2kymseJtB2dgOdBKQHW3742VFSZeDl7iWbVknCi7cqbm2gO1Ig0Xa
         Y55tycBkL+PCF71cAKQCITztvFQpUUOG8Za1hLNI31jNbfL8lrXrhF7GoayHWFxr4YYp
         MXghAW3Q8B7SucojtNpP/carYS6i/MoqmvpF8Mp2DZufTkq6jd2bikcGeqXL5LfKdyzn
         k5xsy+83ZRIvtqefJfJZU3lOL8ijRhAAvmXAX2rb6tcFXljJxdPUxPkKl7vUBEGve3vG
         cctg==
X-Gm-Message-State: AOAM531TBCe9RXa0U5VklECqfkmMw2qqKoq99qBnucRObSz/6G78TrEZ
        TAsydMXijnVgzhrKpJt9+xQdnlJQmfb/cA==
X-Google-Smtp-Source: ABdhPJzO+Ksa5GT1rpCueeyl7qlIO9x4UvU1eknUlEPius34WQDpzFMQxxNA2IYk29mlc54+1orn2A==
X-Received: by 2002:a17:90a:e615:: with SMTP id j21mr3905675pjy.26.1606307382291;
        Wed, 25 Nov 2020 04:29:42 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ie17sm2876303pjb.9.2020.11.25.04.29.40
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 04:29:40 -0800 (PST)
Message-ID: <5fbe4e34.1c69fb81.74ac8.6f3b@mx.google.com>
Date:   Wed, 25 Nov 2020 04:29:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20201125
X-Kernelci-Report-Type: build
Subject: next/master build: 231 builds: 10 failed, 221 passed, 52 errors,
 116 warnings (next-20201125)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 231 builds: 10 failed, 221 passed, 52 errors, 116 warnin=
gs (next-20201125)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20201125/

Tree: next
Branch: master
Git Describe: next-20201125
Git Commit: 9d3e48f20e1159a7bb2ff5de96594b6375157fe0
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-10) FAIL
    allmodconfig: (clang-11) FAIL
    allmodconfig: (gcc-8) FAIL

arm:
    allmodconfig: (clang-10) FAIL
    aspeed_g5_defconfig: (clang-10) FAIL
    allmodconfig: (clang-11) FAIL
    allmodconfig: (gcc-8) FAIL
    milbeaut_m10v_defconfig: (gcc-8) FAIL
    mini2440_defconfig: (gcc-8) FAIL
    s3c2410_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (clang-10): 1 error, 9 warnings
    allmodconfig (clang-11): 1 error, 9 warnings
    allmodconfig (gcc-8): 1 error, 1 warning
    defconfig (clang-11): 1 warning
    defconfig (clang-10): 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-11): 1 warning

arm:
    allmodconfig (gcc-8): 2 errors
    allmodconfig (clang-11): 16 errors
    allmodconfig (clang-10): 16 errors, 15 warnings
    aspeed_g5_defconfig (clang-10): 13 errors
    axm55xx_defconfig (gcc-8): 1 warning
    keystone_defconfig (gcc-8): 1 warning
    mini2440_defconfig (gcc-8): 1 error
    mmp2_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (clang-11): 3 warnings
    multi_v7_defconfig (clang-10): 3 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 3 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-8): 4 warnin=
gs
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-8): 3 warnings
    omap1_defconfig (gcc-8): 1 warning
    pxa168_defconfig (gcc-8): 3 warnings
    pxa910_defconfig (gcc-8): 3 warnings
    s3c2410_defconfig (gcc-8): 1 error
    tegra_defconfig (gcc-8): 1 warning

i386:

mips:
    loongson3_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    maltaup_xpa_defconfig (gcc-8): 1 warning
    nlm_xlr_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 1 warning

riscv:
    defconfig+CONFIG_EFI=3Dn (clang-11): 1 warning
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    allmodconfig (gcc-8): 1 warning
    allmodconfig (clang-11): 16 warnings
    allmodconfig (clang-10): 12 warnings
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (clang-11): 2 warnings
    x86_64_defconfig (clang-10): 2 warnings

Errors summary:

    3    ERROR: modpost: "device_is_bound" [drivers/clk/imx/clk-imx-scu.ko]=
 undefined!
    2    ld.lld: error: unknown argument '--be8'
    2    ld.lld: error: init/main.o:(.rodata.str1.1): offset is outside the=
 section
    2    ld.lld: error: init/init_task.o:(.rodata.str1.1): offset is outsid=
e the section
    2    ld.lld: error: init/do_mounts.o:(.rodata.str1.1): offset is outsid=
e the section
    2    ld.lld: error: arch/arm/vfp/vfpmodule.o:(.rodata.str1.1): offset i=
s outside the section
    2    ld.lld: error: arch/arm/mm/init.o:(.rodata.str1.1): offset is outs=
ide the section
    2    ld.lld: error: arch/arm/mach-at91/pm.o:(.rodata.str1.1): offset is=
 outside the section
    2    ld.lld: error: arch/arm/kernel/elf.o:(__ksymtab_strings): offset i=
s outside the section
    2    /scratch/linux/arch/arm/include/asm/kasan.h:26:11: error: expected=
 =E2=80=98;=E2=80=99 before =E2=80=98void=E2=80=99
    1    ld.lld: error: init/version.o:(__ksymtab_strings): offset is outsi=
de the section
    1    ld.lld: error: init/version.o:(.rodata.str1.1): offset is outside =
the section
    1    ld.lld: error: arch/arm/probes/decode-arm.o:(__ksymtab_strings): o=
ffset is outside the section
    1    ld.lld: error: arch/arm/probes/decode-arm.o:(.rodata.str1.1): offs=
et is outside the section
    1    ld.lld: error: arch/arm/mm/ioremap.o:(__ksymtab_strings): offset i=
s outside the section
    1    ld.lld: error: arch/arm/mm/iomap.o:(__ksymtab_strings): offset is =
outside the section
    1    ld.lld: error: arch/arm/mm/iomap.o:(.rodata.str1.1): offset is out=
side the section
    1    ld.lld: error: arch/arm/mm/flush.o:(.rodata.str1.1): offset is out=
side the section
    1    ld.lld: error: arch/arm/mm/dma-mapping.o:(.rodata.str1.1): offset =
is outside the section
    1    ld.lld: error: arch/arm/mach-mmp/sram.o:(.rodata.str1.1): offset i=
s outside the section
    1    ld.lld: error: arch/arm/mach-mmp/common.o:(__ksymtab_strings): off=
set is outside the section
    1    ld.lld: error: arch/arm/mach-cns3xxx/pm.o:(__ksymtab_strings): off=
set is outside the section
    1    ld.lld: error: arch/arm/mach-cns3xxx/pm.o:(.rodata.str1.1): offset=
 is outside the section
    1    ld.lld: error: arch/arm/common/mcpm_entry.o:(.rodata.str1.1): offs=
et is outside the section
    1    ld.lld: error: arch/arm/common/krait-l2-accessors.o:(__ksymtab_str=
ings): offset is outside the section
    1    ld.lld: error: arch/arm/common/krait-l2-accessors.o:(.rodata.str1.=
1): offset is outside the section
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x373D4): reloca=
tion R_ARM_PREL31 out of range: 2135598436 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37334): reloca=
tion R_ARM_PREL31 out of range: 2135598596 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37324): reloca=
tion R_ARM_PREL31 out of range: 2135598612 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372D4): reloca=
tion R_ARM_PREL31 out of range: 2135598692 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372C4): reloca=
tion R_ARM_PREL31 out of range: 2135598708 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372AC): reloca=
tion R_ARM_PREL31 out of range: 2135598732 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37294): reloca=
tion R_ARM_PREL31 out of range: 2135598756 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37264): reloca=
tion R_ARM_PREL31 out of range: 2135598804 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37234): reloca=
tion R_ARM_PREL31 out of range: 2135598852 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3722C): reloca=
tion R_ARM_PREL31 out of range: 2135598860 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x371EC): reloca=
tion R_ARM_PREL31 out of range: 2135598924 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x371D4): reloca=
tion R_ARM_PREL31 out of range: 2135598948 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x34BE8): reloca=
tion R_ARM_PREL31 out of range: 2135543120 is not in [-1073741824, 10737418=
23]
    1    /scratch/linux/arch/arm/mach-s3c/mach-mini2440.c:47:10: fatal erro=
r: linux/mtd/nand_ecc.h: No such file or directory
    1    /scratch/linux/arch/arm/mach-s3c/mach-bast.c:27:10: fatal error: l=
inux/mtd/nand_ecc.h: No such file or directory

Warnings summary:

    15   ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
    12   1 warning generated.
    9    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'
    9    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (=
spi_bus_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for =
SPI bus
    9    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (=
spi_bus_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells f=
or SPI bus
    6    WARNING: modpost: missing MODULE_LICENSE() in kernel/resource_kuni=
t.o
    5    /scratch/linux/lib/cpumask.c:222:17: warning: cast from pointer to=
 integer of different size [-Wpointer-to-int-cast]
    4    aarch64-linux-gnu-strip: warning: /root/build/_modules_/lib/module=
s/5.10.0-rc5-next-20201125/kernel/drivers/media/tuners/tuner-types.ko: unsu=
pported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    /scratch/linux/kernel/dma/map_benchmark.c:195:37: warning: variabl=
e 'argp' is uninitialized when used within its own initialization [-Wuninit=
ialized]
    4    /scratch/linux/fs/nfsd/nfs3xdr.c:299:6: warning: variable 'err' is=
 used uninitialized whenever 'if' condition is false [-Wsometimes-uninitial=
ized]
    4    /scratch/linux/fs/nfsd/nfs3xdr.c:293:12: note: initialize the vari=
able 'err' to silence this warning
    4    /scratch/linux/drivers/mtd/nand/raw/r852.c:874:24: warning: variab=
le 'dev' is uninitialized when used here [-Wuninitialized]
    4    /scratch/linux/drivers/mtd/nand/raw/r852.c:847:25: note: initializ=
e the variable 'dev' to silence this warning
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    /scratch/linux/drivers/gpu/drm/ttm/ttm_pool.c:243:21: warning: =E2=
=80=98ttm_pool_type_count=E2=80=99 defined but not used [-Wunused-function]
    1    {standard input}:39: Warning: macro instruction expanded into mult=
iple instructions
    1    fs/reiserfs/do_balan.o: warning: objtool: balance_leaf()+0x6ef5: s=
tack state mismatch: cfa1=3D7+336 cfa2=3D7+352
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_prefault_relocations()+0xc6: stack state mismatch: cfa1=3D7+8 cfa2=3D-1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_prefault_relocations()+0xb8: stack state mismatch: cfa1=3D7+8 cfa2=3D-1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_copy_relocations()+0x259: stack state mismatch: cfa1=3D7+104 cfa2=3D-1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_copy_relocations()+0x249: stack state mismatch: cfa1=3D7+104 cfa2=3D-1+0
    1    clang: warning: argument unused during compilation: '-no-pie' [-Wu=
nused-command-line-argument]
    1    arch/x86/kernel/signal.o: warning: objtool: x32_setup_rt_frame()+0=
x1f7: call to memset() with UACCESS enabled
    1    arch/x86/kernel/signal.o: warning: objtool: x32_setup_rt_frame()+0=
x1b3: call to memset() with UACCESS enabled
    1    arch/x86/kernel/signal.o: warning: objtool: __setup_rt_frame()+0x1=
d1: call to memset() with UACCESS enabled
    1    arch/x86/kernel/signal.o: warning: objtool: __setup_rt_frame()+0x1=
bc: call to memset() with UACCESS enabled
    1    arch/x86/ia32/ia32_signal.o: warning: objtool: ia32_setup_rt_frame=
()+0x237: call to memset() with UACCESS enabled
    1    2 warnings generated.
    1    /scratch/linux/drivers/block/paride/bpck.c:32: warning: "PC" redef=
ined
    1    /scratch/linux/arch/arm/mach-omap1/board-ams-delta.c:462:12: warni=
ng: =E2=80=98ams_delta_camera_power=E2=80=99 defined but not used [-Wunused=
-function]
    1    .config:1180:warning: override: UNWINDER_GUESS changes choice state
    1    .arch/x86/ia32/ia32_signal.o: warning: objtool: ia32_setup_rt_fram=
e()+0x1d0: call to memset() with UACCESS enabled
    1    ./usr/include/linux/bcache.h:355:2: warning: field '' with variabl=
e sized type 'union jset::(anonymous at ./usr/include/linux/bcache.h:355:2)=
' not at the end of a struct or class is a GNU extension [-Wgnu-variable-si=
zed-type-not-at-end]
    1    ./usr/include/linux/bcache.h:354:2: warning: field '' with variabl=
e sized type 'union jset::(anonymous at ./usr/include/linux/bcache.h:354:2)=
' not at the end of a struct or class is a GNU extension [-Wgnu-variable-si=
zed-type-not-at-end]

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
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section m=
ismatches

Errors:
    /scratch/linux/arch/arm/include/asm/kasan.h:26:11: error: expected =E2=
=80=98;=E2=80=99 before =E2=80=98void=E2=80=99
    /scratch/linux/arch/arm/include/asm/kasan.h:26:11: error: expected =E2=
=80=98;=E2=80=99 before =E2=80=98void=E2=80=99

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-11) =E2=80=94 FAIL, 16 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    ld.lld: error: unknown argument '--be8'
    ld.lld: error: arch/arm/common/krait-l2-accessors.o:(.rodata.str1.1): o=
ffset is outside the section
    ld.lld: error: init/version.o:(.rodata.str1.1): offset is outside the s=
ection
    ld.lld: error: arch/arm/kernel/elf.o:(__ksymtab_strings): offset is out=
side the section
    ld.lld: error: arch/arm/mach-cns3xxx/pm.o:(.rodata.str1.1): offset is o=
utside the section
    ld.lld: error: arch/arm/vfp/vfpmodule.o:(.rodata.str1.1): offset is out=
side the section
    ld.lld: error: init/init_task.o:(.rodata.str1.1): offset is outside the=
 section
    ld.lld: error: arch/arm/common/mcpm_entry.o:(.rodata.str1.1): offset is=
 outside the section
    ld.lld: error: arch/arm/mm/iomap.o:(.rodata.str1.1): offset is outside =
the section
    ld.lld: error: arch/arm/mm/init.o:(.rodata.str1.1): offset is outside t=
he section
    ld.lld: error: arch/arm/mach-mmp/common.o:(__ksymtab_strings): offset i=
s outside the section
    ld.lld: error: arch/arm/mach-at91/pm.o:(.rodata.str1.1): offset is outs=
ide the section
    ld.lld: error: init/main.o:(.rodata.str1.1): offset is outside the sect=
ion
    ld.lld: error: init/do_mounts.o:(.rodata.str1.1): offset is outside the=
 section
    ld.lld: error: arch/arm/mach-mmp/sram.o:(.rodata.str1.1): offset is out=
side the section
    ld.lld: error: arch/arm/probes/decode-arm.o:(.rodata.str1.1): offset is=
 outside the section

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-10) =E2=80=94 FAIL, 16 errors, 15 warnings, 0 sect=
ion mismatches

Errors:
    ld.lld: error: arch/arm/common/krait-l2-accessors.o:(__ksymtab_strings)=
: offset is outside the section
    ld.lld: error: unknown argument '--be8'
    ld.lld: error: init/version.o:(__ksymtab_strings): offset is outside th=
e section
    ld.lld: error: arch/arm/kernel/elf.o:(__ksymtab_strings): offset is out=
side the section
    ld.lld: error: arch/arm/mach-cns3xxx/pm.o:(__ksymtab_strings): offset i=
s outside the section
    ld.lld: error: arch/arm/vfp/vfpmodule.o:(.rodata.str1.1): offset is out=
side the section
    ld.lld: error: init/init_task.o:(.rodata.str1.1): offset is outside the=
 section
    ld.lld: error: arch/arm/mm/iomap.o:(__ksymtab_strings): offset is outsi=
de the section
    ld.lld: error: arch/arm/mm/init.o:(.rodata.str1.1): offset is outside t=
he section
    ld.lld: error: arch/arm/mach-at91/pm.o:(.rodata.str1.1): offset is outs=
ide the section
    ld.lld: error: init/main.o:(.rodata.str1.1): offset is outside the sect=
ion
    ld.lld: error: arch/arm/mm/flush.o:(.rodata.str1.1): offset is outside =
the section
    ld.lld: error: arch/arm/probes/decode-arm.o:(__ksymtab_strings): offset=
 is outside the section
    ld.lld: error: arch/arm/mm/dma-mapping.o:(.rodata.str1.1): offset is ou=
tside the section
    ld.lld: error: init/do_mounts.o:(.rodata.str1.1): offset is outside the=
 section
    ld.lld: error: arch/arm/mm/ioremap.o:(__ksymtab_strings): offset is out=
side the section

Warnings:
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-10) =E2=80=94 FAIL, 1 error, 9 warnings, 0 secti=
on mismatches

Errors:
    ERROR: modpost: "device_is_bound" [drivers/clk/imx/clk-imx-scu.ko] unde=
fined!

Warnings:
    /scratch/linux/kernel/dma/map_benchmark.c:195:37: warning: variable 'ar=
gp' is uninitialized when used within its own initialization [-Wuninitializ=
ed]
    1 warning generated.
    /scratch/linux/fs/nfsd/nfs3xdr.c:299:6: warning: variable 'err' is used=
 uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    /scratch/linux/fs/nfsd/nfs3xdr.c:293:12: note: initialize the variable =
'err' to silence this warning
    1 warning generated.
    /scratch/linux/drivers/mtd/nand/raw/r852.c:874:24: warning: variable 'd=
ev' is uninitialized when used here [-Wuninitialized]
    /scratch/linux/drivers/mtd/nand/raw/r852.c:847:25: note: initialize the=
 variable 'dev' to silence this warning
    1 warning generated.
    WARNING: modpost: missing MODULE_LICENSE() in kernel/resource_kunit.o

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: modpost: missing MODULE_LICENSE() in kernel/resource_kunit.o

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-11) =E2=80=94 PASS, 0 errors, 16 warnings, 0 se=
ction mismatches

Warnings:
    .arch/x86/ia32/ia32_signal.o: warning: objtool: ia32_setup_rt_frame()+0=
x1d0: call to memset() with UACCESS enabled
    /scratch/linux/kernel/dma/map_benchmark.c:195:37: warning: variable 'ar=
gp' is uninitialized when used within its own initialization [-Wuninitializ=
ed]
    1 warning generated.
    ./usr/include/linux/bcache.h:354:2: warning: field '' with variable siz=
ed type 'union jset::(anonymous at ./usr/include/linux/bcache.h:354:2)' not=
 at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-t=
ype-not-at-end]
    ./usr/include/linux/bcache.h:355:2: warning: field '' with variable siz=
ed type 'union jset::(anonymous at ./usr/include/linux/bcache.h:355:2)' not=
 at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-t=
ype-not-at-end]
    2 warnings generated.
    arch/x86/kernel/signal.o: warning: objtool: x32_setup_rt_frame()+0x1b3:=
 call to memset() with UACCESS enabled
    arch/x86/kernel/signal.o: warning: objtool: __setup_rt_frame()+0x1bc: c=
all to memset() with UACCESS enabled
    fs/reiserfs/do_balan.o: warning: objtool: balance_leaf()+0x6ef5: stack =
state mismatch: cfa1=3D7+336 cfa2=3D7+352
    /scratch/linux/fs/nfsd/nfs3xdr.c:299:6: warning: variable 'err' is used=
 uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    /scratch/linux/fs/nfsd/nfs3xdr.c:293:12: note: initialize the variable =
'err' to silence this warning
    1 warning generated.
    /scratch/linux/drivers/mtd/nand/raw/r852.c:874:24: warning: variable 'd=
ev' is uninitialized when used here [-Wuninitialized]
    /scratch/linux/drivers/mtd/nand/raw/r852.c:847:25: note: initialize the=
 variable 'dev' to silence this warning
    1 warning generated.
    WARNING: modpost: missing MODULE_LICENSE() in kernel/resource_kunit.o

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-11) =E2=80=94 FAIL, 1 error, 9 warnings, 0 secti=
on mismatches

Errors:
    ERROR: modpost: "device_is_bound" [drivers/clk/imx/clk-imx-scu.ko] unde=
fined!

Warnings:
    /scratch/linux/kernel/dma/map_benchmark.c:195:37: warning: variable 'ar=
gp' is uninitialized when used within its own initialization [-Wuninitializ=
ed]
    1 warning generated.
    /scratch/linux/fs/nfsd/nfs3xdr.c:299:6: warning: variable 'err' is used=
 uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    /scratch/linux/fs/nfsd/nfs3xdr.c:293:12: note: initialize the variable =
'err' to silence this warning
    1 warning generated.
    /scratch/linux/drivers/mtd/nand/raw/r852.c:874:24: warning: variable 'd=
ev' is uninitialized when used here [-Wuninitialized]
    /scratch/linux/drivers/mtd/nand/raw/r852.c:847:25: note: initialize the=
 variable 'dev' to silence this warning
    1 warning generated.
    WARNING: modpost: missing MODULE_LICENSE() in kernel/resource_kunit.o

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section m=
ismatches

Errors:
    ERROR: modpost: "device_is_bound" [drivers/clk/imx/clk-imx-scu.ko] unde=
fined!

Warnings:
    WARNING: modpost: missing MODULE_LICENSE() in kernel/resource_kunit.o

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 12 warnings, 0 se=
ction mismatches

Warnings:
    arch/x86/ia32/ia32_signal.o: warning: objtool: ia32_setup_rt_frame()+0x=
237: call to memset() with UACCESS enabled
    /scratch/linux/kernel/dma/map_benchmark.c:195:37: warning: variable 'ar=
gp' is uninitialized when used within its own initialization [-Wuninitializ=
ed]
    1 warning generated.
    arch/x86/kernel/signal.o: warning: objtool: x32_setup_rt_frame()+0x1f7:=
 call to memset() with UACCESS enabled
    arch/x86/kernel/signal.o: warning: objtool: __setup_rt_frame()+0x1d1: c=
all to memset() with UACCESS enabled
    /scratch/linux/fs/nfsd/nfs3xdr.c:299:6: warning: variable 'err' is used=
 uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    /scratch/linux/fs/nfsd/nfs3xdr.c:293:12: note: initialize the variable =
'err' to silence this warning
    1 warning generated.
    /scratch/linux/drivers/mtd/nand/raw/r852.c:874:24: warning: variable 'd=
ev' is uninitialized when used here [-Wuninitialized]
    /scratch/linux/drivers/mtd/nand/raw/r852.c:847:25: note: initialize the=
 variable 'dev' to silence this warning
    1 warning generated.
    WARNING: modpost: missing MODULE_LICENSE() in kernel/resource_kunit.o

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
aspeed_g5_defconfig (arm, clang-10) =E2=80=94 FAIL, 13 errors, 0 warnings, =
0 section mismatches

Errors:
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x34BE8): relocation =
R_ARM_PREL31 out of range: 2135543120 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x371D4): relocation =
R_ARM_PREL31 out of range: 2135598948 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x371EC): relocation =
R_ARM_PREL31 out of range: 2135598924 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3722C): relocation =
R_ARM_PREL31 out of range: 2135598860 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37234): relocation =
R_ARM_PREL31 out of range: 2135598852 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37264): relocation =
R_ARM_PREL31 out of range: 2135598804 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37294): relocation =
R_ARM_PREL31 out of range: 2135598756 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372AC): relocation =
R_ARM_PREL31 out of range: 2135598732 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372C4): relocation =
R_ARM_PREL31 out of range: 2135598708 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372D4): relocation =
R_ARM_PREL31 out of range: 2135598692 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37324): relocation =
R_ARM_PREL31 out of range: 2135598612 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37334): relocation =
R_ARM_PREL31 out of range: 2135598596 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x373D4): relocation =
R_ARM_PREL31 out of range: 2135598436 is not in [-1073741824, 1073741823]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
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
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    /scratch/linux/lib/cpumask.c:222:17: warning: cast from pointer to inte=
ger of different size [-Wpointer-to-int-cast]

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
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
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
defconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    aarch64-linux-gnu-strip: warning: /root/build/_modules_/lib/modules/5.1=
0.0-rc5-next-20201125/kernel/drivers/media/tuners/tuner-types.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    aarch64-linux-gnu-strip: warning: /root/build/_modules_/lib/modules/5.1=
0.0-rc5-next-20201125/kernel/drivers/media/tuners/tuner-types.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-10) =E2=80=94 PASS, 0 er=
rors, 1 warning, 0 section mismatches

Warnings:
    aarch64-linux-gnu-strip: warning: /root/build/_modules_/lib/modules/5.1=
0.0-rc5-next-20201125/kernel/drivers/media/tuners/tuner-types.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-11) =E2=80=94 PASS, 0 er=
rors, 1 warning, 0 section mismatches

Warnings:
    aarch64-linux-gnu-strip: warning: /root/build/_modules_/lib/modules/5.1=
0.0-rc5-next-20201125/kernel/drivers/media/tuners/tuner-types.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-11) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-no-pie' [-Wunused=
-command-line-argument]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

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
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
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
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    /scratch/linux/lib/cpumask.c:222:17: warning: cast from pointer to inte=
ger of different size [-Wpointer-to-int-cast]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
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
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    /scratch/linux/drivers/gpu/drm/ttm/ttm_pool.c:243:21: warning: =E2=80=
=98ttm_pool_type_count=E2=80=99 defined but not used [-Wunused-function]

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
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

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
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    /scratch/linux/lib/cpumask.c:222:17: warning: cast from pointer to inte=
ger of different size [-Wpointer-to-int-cast]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    /scratch/linux/arch/arm/mach-s3c/mach-mini2440.c:47:10: fatal error: li=
nux/mtd/nand_ecc.h: No such file or directory

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

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
multi_v5_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 3 warnings, 0 section mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
    /scratch/linux/lib/cpumask.c:222:17: warning: cast from pointer to inte=
ger of different size [-Wpointer-to-int-cast]
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 =
warnings, 0 section mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    /scratch/linux/lib/cpumask.c:222:17: warning: cast from pointer to inte=
ger of different size [-Wpointer-to-int-cast]

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    /scratch/linux/arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =
=E2=80=98ams_delta_camera_power=E2=80=99 defined but not used [-Wunused-fun=
ction]

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
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

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
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SP=
I bus
    /scratch/linux/arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_b=
us_bridge): /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI b=
us
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

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
    /scratch/linux/drivers/block/paride/bpck.c:32: warning: "PC" redefined

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
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    /scratch/linux/arch/arm/mach-s3c/mach-bast.c:27:10: fatal error: linux/=
mtd/nand_ecc.h: No such file or directory

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
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    /scratch/linux/drivers/gpu/drm/ttm/ttm_pool.c:243:21: warning: =E2=80=
=98ttm_pool_type_count=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1180:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
x86_64_defconfig (x86_64, clang-11) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_pr=
efault_relocations()+0xb8: stack state mismatch: cfa1=3D7+8 cfa2=3D-1+0
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_co=
py_relocations()+0x259: stack state mismatch: cfa1=3D7+104 cfa2=3D-1+0

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_pr=
efault_relocations()+0xc6: stack state mismatch: cfa1=3D7+8 cfa2=3D-1+0
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_co=
py_relocations()+0x249: stack state mismatch: cfa1=3D7+104 cfa2=3D-1+0

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
