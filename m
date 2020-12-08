Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79FEB2D2CA8
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 15:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729618AbgLHOJX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 09:09:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729265AbgLHOJX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Dec 2020 09:09:23 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42CAC061749
        for <linux-next@vger.kernel.org>; Tue,  8 Dec 2020 06:08:42 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id d2so10112496pfq.5
        for <linux-next@vger.kernel.org>; Tue, 08 Dec 2020 06:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=yiaP5zeO4LN/hiGxfybzlDRa9TSvpXcK6U2CYfMlWzQ=;
        b=XpeZFRrKOe7oKbNV5+cl901/haj5ppGCv+B81iAY90/we7BaKuM1ZBostWPkPRkZS4
         h7qAB5BkJMr2+90UIRX7oQqMtKHGEqhlAR6N3BFH4F4bdXZT1sKBjTmPT6CCLg+OXHSe
         rekb6d40ENDHw8ReIpj/TS/p4JP9B0ro/6nCRpbEiwqF4qoTND6xeNrsqDZFd/mFbIfR
         V5/1mC749MbqYFtfgDxMGQJIZD67rz7D3M0lMNi2RQQnrmY6bMmDM/D2LcoPjga6Mhpf
         Bj+ekQF5VUJWZa5diTFj/advMsI2G9hA1+rsUcgpOpo1ZUJEfXNl4n5TgttE7U4LspFm
         yxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=yiaP5zeO4LN/hiGxfybzlDRa9TSvpXcK6U2CYfMlWzQ=;
        b=gKRTkGrFI9TvSdsYIXaDqbGpPmNQRF6gVMXuP5GL0CqtGJC5C2a555k1flgHpM145Y
         TFzGQh9iZ02AFZkdzqvsE2X3kZlt+ZaP/spT1sli+KnWufkJa2eosj9VPTXtqv6u/l5C
         9vneKL5kBUtbKRuYH50xdioLi2HtCo4rvLx59YO2KU2ySoFnqWCraTtT6+riKNZZcB+J
         Gber2k32HWNFAJXBYMRtY/5j2ck2qjYiKXQ7PAy9S/mGrfwhc8S67h83Vd7s2fi77Aur
         j5GZGRpF8kG1qOHpnc+BG+0DpzQSQ1Sf6bq28cOj5AJ2YYuUEjfqOevkqJWWzpSLkn1H
         fl8w==
X-Gm-Message-State: AOAM533kKf9N7LJEBVoP5AeQDF9fir2qMhpKZ9h2NrVDVWqzCX6VnzRu
        JJngrlnm0L6EAg6kaOPJYTj+69p7LDeSig==
X-Google-Smtp-Source: ABdhPJzBXhXaOw4uNQuUQtva6NkLti/YxdrGKv83W0v3+4gf9wdb9/+rQsHEWqUD+a/5zezJGY+99A==
X-Received: by 2002:a17:90a:6809:: with SMTP id p9mr4383457pjj.112.1607436520465;
        Tue, 08 Dec 2020 06:08:40 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id d6sm13663974pfd.69.2020.12.08.06.08.39
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 06:08:39 -0800 (PST)
Message-ID: <5fcf88e7.1c69fb81.5dc3.eca4@mx.google.com>
Date:   Tue, 08 Dec 2020 06:08:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20201208
X-Kernelci-Report-Type: build
Subject: next/master build: 231 builds: 12 failed, 219 passed, 62 errors,
 290 warnings (next-20201208)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 231 builds: 12 failed, 219 passed, 62 errors, 290 warnin=
gs (next-20201208)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20201208/

Tree: next
Branch: master
Git Describe: next-20201208
Git Commit: a9e26cb5f2615cd638f911ea96d4fff5b4d93690
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

mips:
    loongson3_defconfig: (gcc-8) FAIL

riscv:
    nommu_virt_defconfig: (gcc-8) FAIL

x86_64:
    allmodconfig: (clang-10) FAIL
    allmodconfig: (clang-11) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (clang-10): 1 error, 3 warnings
    allmodconfig (clang-11): 1 error, 3 warnings
    allmodconfig (gcc-8): 1 error, 2 warnings
    allnoconfig (gcc-8): 1 warning
    allnoconfig (clang-10): 3 warnings
    allnoconfig (clang-11): 3 warnings
    defconfig (gcc-8): 2 warnings
    defconfig (clang-10): 7 warnings
    defconfig (clang-11): 7 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-8): 2 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-11): 7 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 7 warnings
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 2 warnings
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning

arm:
    allmodconfig (clang-10): 18 errors, 17 warnings
    allmodconfig (clang-11): 19 errors
    allmodconfig (gcc-8): 1 error, 136 warnings
    aspeed_g5_defconfig (clang-10): 13 errors
    axm55xx_defconfig (gcc-8): 1 warning
    keystone_defconfig (gcc-8): 1 warning
    mmp2_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (clang-10): 3 warnings
    multi_v7_defconfig (clang-11): 3 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 3 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-8): 4 warnin=
gs
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-8): 3 warnings
    omap1_defconfig (gcc-8): 2 warnings
    pxa168_defconfig (gcc-8): 3 warnings
    pxa910_defconfig (gcc-8): 3 warnings
    tegra_defconfig (gcc-8): 1 warning

i386:

mips:
    loongson3_defconfig (gcc-8): 1 error, 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    maltaup_xpa_defconfig (gcc-8): 1 warning
    nlm_xlr_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 1 warning
    xway_defconfig (gcc-8): 2 warnings

riscv:
    allnoconfig (gcc-8): 1 warning
    allnoconfig (clang-11): 3 warnings
    defconfig (gcc-8): 2 warnings
    defconfig+CONFIG_EFI=3Dn (clang-11): 7 warnings
    nommu_k210_defconfig (gcc-8): 1 warning
    nommu_virt_defconfig (gcc-8): 3 errors, 4 warnings
    rv32_defconfig (gcc-8): 8 warnings
    tinyconfig (gcc-8): 1 warning

x86_64:
    allmodconfig (clang-10): 2 errors, 5 warnings
    allmodconfig (clang-11): 2 errors, 8 warnings
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (clang-10): 2 warnings
    x86_64_defconfig (clang-11): 2 warnings

Errors summary:

    2    ld.lld: error: unknown argument '--be8'
    2    ld.lld: error: undefined symbol: __compiletime_assert_417
    2    ld.lld: error: undefined symbol: __compiletime_assert_1278
    2    ld.lld: error: undefined symbol: __compiletime_assert_1270
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
    2    ld.lld: error: arch/arm/mm/flush.o:(.rodata.str1.1): offset is out=
side the section
    2    ld.lld: error: arch/arm/mm/dma-mapping.o:(.rodata.str1.1): offset =
is outside the section
    2    ld.lld: error: arch/arm/mach-at91/pm.o:(.rodata.str1.1): offset is=
 outside the section
    2    ld.lld: error: arch/arm/kernel/elf.o:(__ksymtab_strings): offset i=
s outside the section
    2    ld.lld: error: arch/arm/common/mcpm_entry.o:(.rodata.str1.1): offs=
et is outside the section
    2    ./include/trace/define_trace.h:95:42: fatal error: ./ufs-mediatek-=
trace.h: No such file or directory
    1    mm/secretmem.c:83:33: error: =E2=80=98PMD_PAGE_ORDER=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MAX_ORDER=E2=80=
=99?
    1    mm/secretmem.c:353:34: error: =E2=80=98PMD_PAGE_ORDER=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98MAX_ORDER=E2=80=
=99?
    1    mm/secretmem.c:202:6: error: implicit declaration of function =E2=
=80=98mlock_future_check=E2=80=99; did you mean =E2=80=98locks_free_lock=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
    1    ld.lld: error: init/version.o:(__ksymtab_strings): offset is outsi=
de the section
    1    ld.lld: error: init/version.o:(.rodata.str1.1): offset is outside =
the section
    1    ld.lld: error: arch/arm/probes/decode-arm.o:(__ksymtab_strings): o=
ffset is outside the section
    1    ld.lld: error: arch/arm/probes/decode-arm.o:(.rodata.str1.1): offs=
et is outside the section
    1    ld.lld: error: arch/arm/mm/mmu.o:(.rodata.str1.1): offset is outsi=
de the section
    1    ld.lld: error: arch/arm/mm/ioremap.o:(__ksymtab_strings): offset i=
s outside the section
    1    ld.lld: error: arch/arm/mm/ioremap.o:(.rodata.str1.1): offset is o=
utside the section
    1    ld.lld: error: arch/arm/mm/iomap.o:(__ksymtab_strings): offset is =
outside the section
    1    ld.lld: error: arch/arm/mm/iomap.o:(.rodata.str1.1): offset is out=
side the section
    1    ld.lld: error: arch/arm/mach-mmp/common.o:(__ksymtab_strings): off=
set is outside the section
    1    ld.lld: error: arch/arm/mach-cns3xxx/pm.o:(__ksymtab_strings): off=
set is outside the section
    1    ld.lld: error: arch/arm/mach-cns3xxx/pm.o:(.rodata.str1.1): offset=
 is outside the section
    1    ld.lld: error: arch/arm/common/krait-l2-accessors.o:(__ksymtab_str=
ings): offset is outside the section
    1    ld.lld: error: arch/arm/common/krait-l2-accessors.o:(.rodata.str1.=
1): offset is outside the section
    1    ld.lld: error: arch/arm/common/bL_switcher.o:(.rodata.str1.1): off=
set is outside the section
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37374): reloca=
tion R_ARM_PREL31 out of range: 2135598532 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372D4): reloca=
tion R_ARM_PREL31 out of range: 2135598692 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372C4): reloca=
tion R_ARM_PREL31 out of range: 2135598708 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37274): reloca=
tion R_ARM_PREL31 out of range: 2135598788 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37264): reloca=
tion R_ARM_PREL31 out of range: 2135598804 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3724C): reloca=
tion R_ARM_PREL31 out of range: 2135598828 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37234): reloca=
tion R_ARM_PREL31 out of range: 2135598852 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37204): reloca=
tion R_ARM_PREL31 out of range: 2135598900 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x371D4): reloca=
tion R_ARM_PREL31 out of range: 2135598948 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x371CC): reloca=
tion R_ARM_PREL31 out of range: 2135598956 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3718C): reloca=
tion R_ARM_PREL31 out of range: 2135599020 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37174): reloca=
tion R_ARM_PREL31 out of range: 2135599044 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x34B88): reloca=
tion R_ARM_PREL31 out of range: 2135543216 is not in [-1073741824, 10737418=
23]
    1    ERROR: modpost: "__mod_lruvec_page_state" [arch/mips/kvm/kvm.ko] u=
ndefined!

Warnings summary:

    130  ./include/vdso/bits.h:7:26: warning: left shift count >=3D width o=
f type [-Wshift-count-overflow]
    20   <stdin>:1539:2: warning: #warning syscall memfd_secret not impleme=
nted [-Wcpp]
    17   ld.lld: warning: lld uses blx instruction, no object with architec=
ture supporting feature detected
    15   <stdin>:1539:2: warning: syscall memfd_secret not implemented [-W#=
warnings]
    15   1 warning generated.
    15   #warning syscall memfd_secret not implemented
    9    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
    9    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge)=
: /soc/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
    9    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Fa=
iled prerequisite 'spi_bus_bridge'
    5    lib/cpumask.c:222:17: warning: cast from pointer to integer of dif=
ferent size [-Wpointer-to-int-cast]
    4    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/mod=
ules/5.10.0-rc7-next-20201208/kernel/drivers/media/tuners/tuner-types.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    kernel/kcov.o: warning: objtool: __sanitizer_cov_trace_switch()+0x=
87: call to __ubsan_handle_add_overflow() with UACCESS enabled
    2    drivers/gpu/drm/ttm/ttm_pool.c:243:21: warning: =E2=80=98ttm_pool_=
type_count=E2=80=99 defined but not used [-Wunused-function]
    2    WARNING: unmet direct dependencies detected for CMA
    2    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:39: Warning: macro instruction expanded into mult=
iple instructions
    1    lib/strnlen_user.o: warning: objtool: strnlen_user()+0xf2: call to=
 do_strnlen_user() with UACCESS enabled
    1    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x398: call t=
o __ubsan_handle_add_overflow() with UACCESS enabled
    1    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x3=
ce: call to __ubsan_handle_add_overflow() with UACCESS enabled
    1    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x1=
3c: call to do_strncpy_from_user() with UACCESS enabled
    1    kernel/kcov.o: warning: objtool: write_comp_data()+0x132: call to =
__ubsan_handle_sub_overflow() with UACCESS enabled
    1    kernel/kcov.o: warning: objtool: write_comp_data()+0x12a: call to =
__ubsan_handle_sub_overflow() with UACCESS enabled
    1    kernel/kcov.o: warning: objtool: __sanitizer_cov_trace_pc()+0x9b: =
call to __ubsan_handle_sub_overflow() with UACCESS enabled
    1    kernel/kcov.o: warning: objtool: __sanitizer_cov_trace_pc()+0x97: =
call to __ubsan_handle_sub_overflow() with UACCESS enabled
    1    drivers/net/ethernet/lantiq_etop.c:281:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unuse=
d_result [-Wunused-result]
    1    drivers/net/ethernet/lantiq_etop.c:273:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unuse=
d_result [-Wunused-result]
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_prefault_relocations()+0xc6: stack state mismatch: cfa1=3D7+8 cfa2=3D-1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_prefault_relocations()+0xb8: stack state mismatch: cfa1=3D7+8 cfa2=3D-1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_copy_relocations()+0x259: stack state mismatch: cfa1=3D7+104 cfa2=3D-1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_copy_relocations()+0x249: stack state mismatch: cfa1=3D7+104 cfa2=3D-1+0
    1    drivers/dma/qcom/gpi.c:1447:3: warning: format =E2=80=98%llx=E2=80=
=99 expects argument of type =E2=80=98long long unsigned int=E2=80=99, but =
argument 5 has type =E2=80=98phys_addr_t=E2=80=99 {aka =E2=80=98unsigned in=
t=E2=80=99} [-Wformat=3D]
    1    drivers/dma/qcom/gpi.c:1447:3: warning: format =E2=80=98%llx=E2=80=
=99 expects argument of type =E2=80=98long long unsigned int=E2=80=99, but =
argument 4 has type =E2=80=98dma_addr_t=E2=80=99 {aka =E2=80=98unsigned int=
=E2=80=99} [-Wformat=3D]
    1    drivers/dma/qcom/gpi.c:1427:31: warning: format =E2=80=98%lu=E2=80=
=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argum=
ent 3 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99=
} [-Wformat=3D]
    1    drivers/dma/qcom/gpi.c:1419:3: warning: format =E2=80=98%lu=E2=80=
=99 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argum=
ent 8 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99=
} [-Wformat=3D]
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    clang: warning: argument unused during compilation: '-no-pie' [-Wu=
nused-command-line-argument]
    1    cc1: some warnings being treated as errors
    1    arch/arm/mach-omap1/board-h2.c:347:34: warning: =E2=80=98isp1301_g=
piod_table=E2=80=99 defined but not used [-Wunused-variable]
    1    arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=98am=
s_delta_camera_power=E2=80=99 defined but not used [-Wunused-function]
    1    2 warnings generated.
    1    /tmp/ccn6CGIb.s:18195: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccn6CGIb.s:18123: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1181:warning: override: UNWINDER_GUESS changes choice state
    1    ./usr/include/linux/bcache.h:355:2: warning: field '' with variabl=
e sized type 'union jset::(anonymous at ./usr/include/linux/bcache.h:355:2)=
' not at the end of a struct or class is a GNU extension [-Wgnu-variable-si=
zed-type-not-at-end]
    1    ./usr/include/linux/bcache.h:354:2: warning: field '' with variabl=
e sized type 'union jset::(anonymous at ./usr/include/linux/bcache.h:354:2)=
' not at the end of a struct or class is a GNU extension [-Wgnu-variable-si=
zed-type-not-at-end]

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text+0x8e450): Section mismatch in re=
ference from the function init_subsystems() to the function .init.text:hyp_=
cpu_pm_init()
    1    WARNING: modpost: vmlinux.o(.text+0x8d080): Section mismatch in re=
ference from the function kvm_arch_init() to the function .init.text:hyp_cp=
u_pm_exit()
    1    WARNING: modpost: vmlinux.o(.text+0x86e70): Section mismatch in re=
ference from the function init_subsystems() to the function .init.text:hyp_=
cpu_pm_init()
    1    WARNING: modpost: vmlinux.o(.text+0x85d74): Section mismatch in re=
ference from the function kvm_arch_init() to the function .init.text:hyp_cp=
u_pm_exit()

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
allmodconfig (arm, clang-10) =E2=80=94 FAIL, 18 errors, 17 warnings, 0 sect=
ion mismatches

Errors:
    ld.lld: error: init/version.o:(__ksymtab_strings): offset is outside th=
e section
    ld.lld: error: unknown argument '--be8'
    ld.lld: error: arch/arm/common/krait-l2-accessors.o:(__ksymtab_strings)=
: offset is outside the section
    ld.lld: error: arch/arm/kernel/elf.o:(__ksymtab_strings): offset is out=
side the section
    ld.lld: error: arch/arm/vfp/vfpmodule.o:(.rodata.str1.1): offset is out=
side the section
    ld.lld: error: init/init_task.o:(.rodata.str1.1): offset is outside the=
 section
    ld.lld: error: arch/arm/mach-cns3xxx/pm.o:(__ksymtab_strings): offset i=
s outside the section
    ld.lld: error: arch/arm/probes/decode-arm.o:(__ksymtab_strings): offset=
 is outside the section
    ld.lld: error: arch/arm/common/mcpm_entry.o:(.rodata.str1.1): offset is=
 outside the section
    ld.lld: error: arch/arm/mach-at91/pm.o:(.rodata.str1.1): offset is outs=
ide the section
    ld.lld: error: arch/arm/mm/init.o:(.rodata.str1.1): offset is outside t=
he section
    ld.lld: error: arch/arm/mm/iomap.o:(__ksymtab_strings): offset is outsi=
de the section
    ld.lld: error: init/main.o:(.rodata.str1.1): offset is outside the sect=
ion
    ld.lld: error: init/do_mounts.o:(.rodata.str1.1): offset is outside the=
 section
    ld.lld: error: arch/arm/mm/flush.o:(.rodata.str1.1): offset is outside =
the section
    ld.lld: error: arch/arm/mm/dma-mapping.o:(.rodata.str1.1): offset is ou=
tside the section
    ld.lld: error: arch/arm/mm/ioremap.o:(__ksymtab_strings): offset is out=
side the section
    ld.lld: error: arch/arm/mm/mmu.o:(.rodata.str1.1): offset is outside th=
e section

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
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected
    ld.lld: warning: lld uses blx instruction, no object with architecture =
supporting feature detected

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-10) =E2=80=94 FAIL, 1 error, 3 warnings, 0 secti=
on mismatches

Errors:
    ld.lld: error: undefined symbol: __compiletime_assert_417

Warnings:
    <stdin>:1539:2: warning: syscall memfd_secret not implemented [-W#warni=
ngs]
    #warning syscall memfd_secret not implemented
    1 warning generated.

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x85d74): Section mismatch in referen=
ce from the function kvm_arch_init() to the function .init.text:hyp_cpu_pm_=
exit()
    WARNING: modpost: vmlinux.o(.text+0x86e70): Section mismatch in referen=
ce from the function init_subsystems() to the function .init.text:hyp_cpu_p=
m_init()

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-11) =E2=80=94 FAIL, 1 error, 3 warnings, 0 secti=
on mismatches

Errors:
    ld.lld: error: undefined symbol: __compiletime_assert_417

Warnings:
    <stdin>:1539:2: warning: syscall memfd_secret not implemented [-W#warni=
ngs]
    #warning syscall memfd_secret not implemented
    1 warning generated.

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x8d080): Section mismatch in referen=
ce from the function kvm_arch_init() to the function .init.text:hyp_cpu_pm_=
exit()
    WARNING: modpost: vmlinux.o(.text+0x8e450): Section mismatch in referen=
ce from the function init_subsystems() to the function .init.text:hyp_cpu_p=
m_init()

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-11) =E2=80=94 FAIL, 19 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    ld.lld: error: arch/arm/common/krait-l2-accessors.o:(.rodata.str1.1): o=
ffset is outside the section
    ld.lld: error: unknown argument '--be8'
    ld.lld: error: init/version.o:(.rodata.str1.1): offset is outside the s=
ection
    ld.lld: error: arch/arm/kernel/elf.o:(__ksymtab_strings): offset is out=
side the section
    ld.lld: error: arch/arm/vfp/vfpmodule.o:(.rodata.str1.1): offset is out=
side the section
    ld.lld: error: arch/arm/common/mcpm_entry.o:(.rodata.str1.1): offset is=
 outside the section
    ld.lld: error: arch/arm/mach-cns3xxx/pm.o:(.rodata.str1.1): offset is o=
utside the section
    ld.lld: error: init/init_task.o:(.rodata.str1.1): offset is outside the=
 section
    ld.lld: error: arch/arm/mm/init.o:(.rodata.str1.1): offset is outside t=
he section
    ld.lld: error: arch/arm/common/bL_switcher.o:(.rodata.str1.1): offset i=
s outside the section
    ld.lld: error: arch/arm/mach-mmp/common.o:(__ksymtab_strings): offset i=
s outside the section
    ld.lld: error: arch/arm/mm/iomap.o:(.rodata.str1.1): offset is outside =
the section
    ld.lld: error: init/main.o:(.rodata.str1.1): offset is outside the sect=
ion
    ld.lld: error: arch/arm/mach-at91/pm.o:(.rodata.str1.1): offset is outs=
ide the section
    ld.lld: error: init/do_mounts.o:(.rodata.str1.1): offset is outside the=
 section
    ld.lld: error: arch/arm/mm/flush.o:(.rodata.str1.1): offset is outside =
the section
    ld.lld: error: arch/arm/probes/decode-arm.o:(.rodata.str1.1): offset is=
 outside the section
    ld.lld: error: arch/arm/mm/ioremap.o:(.rodata.str1.1): offset is outsid=
e the section
    ld.lld: error: arch/arm/mm/dma-mapping.o:(.rodata.str1.1): offset is ou=
tside the section

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-10) =E2=80=94 FAIL, 2 errors, 5 warnings, 0 sec=
tion mismatches

Errors:
    ld.lld: error: undefined symbol: __compiletime_assert_1270
    ld.lld: error: undefined symbol: __compiletime_assert_1278

Warnings:
    kernel/kcov.o: warning: objtool: __sanitizer_cov_trace_pc()+0x9b: call =
to __ubsan_handle_sub_overflow() with UACCESS enabled
    kernel/kcov.o: warning: objtool: write_comp_data()+0x132: call to __ubs=
an_handle_sub_overflow() with UACCESS enabled
    kernel/kcov.o: warning: objtool: __sanitizer_cov_trace_switch()+0x87: c=
all to __ubsan_handle_add_overflow() with UACCESS enabled
    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x3ce: c=
all to __ubsan_handle_add_overflow() with UACCESS enabled
    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x398: call to __u=
bsan_handle_add_overflow() with UACCESS enabled

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-11) =E2=80=94 FAIL, 2 errors, 8 warnings, 0 sec=
tion mismatches

Errors:
    ld.lld: error: undefined symbol: __compiletime_assert_1270
    ld.lld: error: undefined symbol: __compiletime_assert_1278

Warnings:
    ./usr/include/linux/bcache.h:354:2: warning: field '' with variable siz=
ed type 'union jset::(anonymous at ./usr/include/linux/bcache.h:354:2)' not=
 at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-t=
ype-not-at-end]
    ./usr/include/linux/bcache.h:355:2: warning: field '' with variable siz=
ed type 'union jset::(anonymous at ./usr/include/linux/bcache.h:355:2)' not=
 at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-t=
ype-not-at-end]
    2 warnings generated.
    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x13c: c=
all to do_strncpy_from_user() with UACCESS enabled
    lib/strnlen_user.o: warning: objtool: strnlen_user()+0xf2: call to do_s=
trnlen_user() with UACCESS enabled
    kernel/kcov.o: warning: objtool: __sanitizer_cov_trace_pc()+0x97: call =
to __ubsan_handle_sub_overflow() with UACCESS enabled
    kernel/kcov.o: warning: objtool: write_comp_data()+0x12a: call to __ubs=
an_handle_sub_overflow() with UACCESS enabled
    kernel/kcov.o: warning: objtool: __sanitizer_cov_trace_switch()+0x87: c=
all to __ubsan_handle_add_overflow() with UACCESS enabled

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 2 warnings, 0 section =
mismatches

Errors:
    ./include/trace/define_trace.h:95:42: fatal error: ./ufs-mediatek-trace=
.h: No such file or directory

Warnings:
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 136 warnings, 0 section =
mismatches

Errors:
    ./include/trace/define_trace.h:95:42: fatal error: ./ufs-mediatek-trace=
.h: No such file or directory

Warnings:
    /tmp/ccn6CGIb.s:18123: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccn6CGIb.s:18195: Warning: using r15 results in unpredictable beha=
viour
    drivers/dma/qcom/gpi.c:1419:3: warning: format =E2=80=98%lu=E2=80=99 ex=
pects argument of type =E2=80=98long unsigned int=E2=80=99, but argument 8 =
has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wf=
ormat=3D]
    drivers/dma/qcom/gpi.c:1427:31: warning: format =E2=80=98%lu=E2=80=99 e=
xpects argument of type =E2=80=98long unsigned int=E2=80=99, but argument 3=
 has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-W=
format=3D]
    drivers/dma/qcom/gpi.c:1447:3: warning: format =E2=80=98%llx=E2=80=99 e=
xpects argument of type =E2=80=98long long unsigned int=E2=80=99, but argum=
ent 4 has type =E2=80=98dma_addr_t=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    drivers/dma/qcom/gpi.c:1447:3: warning: format =E2=80=98%llx=E2=80=99 e=
xpects argument of type =E2=80=98long long unsigned int=E2=80=99, but argum=
ent 5 has type =E2=80=98phys_addr_t=E2=80=99 {aka =E2=80=98unsigned int=E2=
=80=99} [-Wformat=3D]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

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
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, clang-11) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1539:2: warning: syscall memfd_secret not implemented [-W#warni=
ngs]
    #warning syscall memfd_secret not implemented
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1539:2: warning: syscall memfd_secret not implemented [-W#warni=
ngs]
    #warning syscall memfd_secret not implemented
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1539:2: warning: syscall memfd_secret not implemented [-W#warni=
ngs]
    #warning syscall memfd_secret not implemented
    1 warning generated.

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
aspeed_g5_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-10) =E2=80=94 FAIL, 13 errors, 0 warnings, =
0 section mismatches

Errors:
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x34B88): relocation =
R_ARM_PREL31 out of range: 2135543216 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37174): relocation =
R_ARM_PREL31 out of range: 2135599044 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3718C): relocation =
R_ARM_PREL31 out of range: 2135599020 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x371CC): relocation =
R_ARM_PREL31 out of range: 2135598956 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x371D4): relocation =
R_ARM_PREL31 out of range: 2135598948 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37204): relocation =
R_ARM_PREL31 out of range: 2135598900 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37234): relocation =
R_ARM_PREL31 out of range: 2135598852 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3724C): relocation =
R_ARM_PREL31 out of range: 2135598828 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37264): relocation =
R_ARM_PREL31 out of range: 2135598804 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37274): relocation =
R_ARM_PREL31 out of range: 2135598788 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372C4): relocation =
R_ARM_PREL31 out of range: 2135598708 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372D4): relocation =
R_ARM_PREL31 out of range: 2135598692 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37374): relocation =
R_ARM_PREL31 out of range: 2135598532 is not in [-1073741824, 1073741823]

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
    lib/cpumask.c:222:17: warning: cast from pointer to integer of differen=
t size [-Wpointer-to-int-cast]

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 7 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1539:2: warning: syscall memfd_secret not implemented [-W#warni=
ngs]
    #warning syscall memfd_secret not implemented
    1 warning generated.
    <stdin>:1539:2: warning: syscall memfd_secret not implemented [-W#warni=
ngs]
    #warning syscall memfd_secret not implemented
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.10.0-rc7-next-20201208/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 7 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1539:2: warning: syscall memfd_secret not implemented [-W#warni=
ngs]
    #warning syscall memfd_secret not implemented
    1 warning generated.
    <stdin>:1539:2: warning: syscall memfd_secret not implemented [-W#warni=
ngs]
    #warning syscall memfd_secret not implemented
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.10.0-rc7-next-20201208/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 2 warnings, 0 section mismatches

Warnings:
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-11) =E2=80=94 PASS, 0 er=
rors, 7 warnings, 0 section mismatches

Warnings:
    <stdin>:1539:2: warning: syscall memfd_secret not implemented [-W#warni=
ngs]
    #warning syscall memfd_secret not implemented
    1 warning generated.
    <stdin>:1539:2: warning: syscall memfd_secret not implemented [-W#warni=
ngs]
    #warning syscall memfd_secret not implemented
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.10.0-rc7-next-20201208/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-10) =E2=80=94 PASS, 0 er=
rors, 7 warnings, 0 section mismatches

Warnings:
    <stdin>:1539:2: warning: syscall memfd_secret not implemented [-W#warni=
ngs]
    #warning syscall memfd_secret not implemented
    1 warning generated.
    <stdin>:1539:2: warning: syscall memfd_secret not implemented [-W#warni=
ngs]
    #warning syscall memfd_secret not implemented
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.10.0-rc7-next-20201208/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 2 warnings, 0 section mismatches

Warnings:
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-11) =E2=80=94 PASS, 0 errors, 7 warn=
ings, 0 section mismatches

Warnings:
    <stdin>:1539:2: warning: syscall memfd_secret not implemented [-W#warni=
ngs]
    #warning syscall memfd_secret not implemented
    1 warning generated.
    clang: warning: argument unused during compilation: '-no-pie' [-Wunused=
-command-line-argument]
    <stdin>:1539:2: warning: syscall memfd_secret not implemented [-W#warni=
ngs]
    #warning syscall memfd_secret not implemented
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 2 warnings, 0 section mismatches

Warnings:
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

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
    lib/cpumask.c:222:17: warning: cast from pointer to integer of differen=
t size [-Wpointer-to-int-cast]

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
loongson3_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sec=
tion mismatches

Errors:
    ERROR: modpost: "__mod_lruvec_page_state" [arch/mips/kvm/kvm.ko] undefi=
ned!

Warnings:
    drivers/gpu/drm/ttm/ttm_pool.c:243:21: warning: =E2=80=98ttm_pool_type_=
count=E2=80=99 defined but not used [-Wunused-function]

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
    lib/cpumask.c:222:17: warning: cast from pointer to integer of differen=
t size [-Wpointer-to-int-cast]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
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
multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 3 warnings, 0 section mismatches

Warnings:
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
    lib/cpumask.c:222:17: warning: cast from pointer to integer of differen=
t size [-Wpointer-to-int-cast]
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
    arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed =
prerequisite 'spi_bus_bridge'

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 =
warnings, 0 section mismatches

Warnings:
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
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
    lib/cpumask.c:222:17: warning: cast from pointer to integer of differen=
t size [-Wpointer-to-int-cast]

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 FAIL, 3 errors, 4 warnings, 0=
 section mismatches

Errors:
    mm/secretmem.c:83:33: error: =E2=80=98PMD_PAGE_ORDER=E2=80=99 undeclare=
d (first use in this function); did you mean =E2=80=98MAX_ORDER=E2=80=99?
    mm/secretmem.c:202:6: error: implicit declaration of function =E2=80=98=
mlock_future_check=E2=80=99; did you mean =E2=80=98locks_free_lock=E2=80=99=
? [-Werror=3Dimplicit-function-declaration]
    mm/secretmem.c:353:34: error: =E2=80=98PMD_PAGE_ORDER=E2=80=99 undeclar=
ed (first use in this function); did you mean =E2=80=98MAX_ORDER=E2=80=99?

Warnings:
    WARNING: unmet direct dependencies detected for CMA
    WARNING: unmet direct dependencies detected for CMA
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    cc1: some warnings being treated as errors

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
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
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
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
    arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /so=
c/apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
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
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

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
    drivers/gpu/drm/ttm/ttm_pool.c:243:21: warning: =E2=80=98ttm_pool_type_=
count=E2=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1181:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    <stdin>:1539:2: warning: #warning syscall memfd_secret not implemented =
[-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
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
x86_64_defconfig (x86_64, clang-11) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_pr=
efault_relocations()+0xb8: stack state mismatch: cfa1=3D7+8 cfa2=3D-1+0
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_co=
py_relocations()+0x259: stack state mismatch: cfa1=3D7+104 cfa2=3D-1+0

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
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/net/ethernet/lantiq_etop.c:273:4: warning: ignoring return valu=
e of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unused_res=
ult [-Wunused-result]
    drivers/net/ethernet/lantiq_etop.c:281:4: warning: ignoring return valu=
e of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unused_res=
ult [-Wunused-result]

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
