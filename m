Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 710B92DBF75
	for <lists+linux-next@lfdr.de>; Wed, 16 Dec 2020 12:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725385AbgLPLby (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 16 Dec 2020 06:31:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725274AbgLPLby (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 16 Dec 2020 06:31:54 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A2E2C061794
        for <linux-next@vger.kernel.org>; Wed, 16 Dec 2020 03:31:13 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id e2so17442140pgi.5
        for <linux-next@vger.kernel.org>; Wed, 16 Dec 2020 03:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=qXQ32jUunrSLgpVWhT5KeifRo6+Ni+D2IfzaJPQKrWA=;
        b=k0Q0OXdL33VdGhz6FTYY5AiTcGuTfX6zGFKw8fR9haLEotoHyYjiTBIiDVqk7ocQDH
         SFA56squklhmBPKAkjn+16S01MLIZbcAzKSJtonXbG8J2ww0SAhoTZg7Llt8MevyGPep
         jHwQBhbInXSBK1zifvEWQ1zYblxZp01bi242Sk/gTrjnoUu6d/4YarWjLPKRP7xfU6Sz
         3Slvr01/xatESdkfxAD178YNVvZV1fh7ydZXEyhqGSbWvo8CrYBBqTEiBGPmBoGqvpsx
         Qts7PrPLxVh8qX9vWUT14yh8av+O3lpDLSTdyqP+T56sDKhMuUXwSUqVtyKqVsfTEiYM
         GyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=qXQ32jUunrSLgpVWhT5KeifRo6+Ni+D2IfzaJPQKrWA=;
        b=ptABYFNdkY2/kT6fKbzJA4j08Qq9w6sUv0dFQoo1TyRFvciwGzPmzaQn2np3M1slJt
         QVCnfo3I2bAn5X8I0ahAvQ7sTziuTw8SGMlSRGwmMwnLAcBVxRAdQqlxXLQMh3XLnoOy
         KoCKfgAlk3pWob/Lf5aug46CFq1mq+dyNi1WHr4q9LGPbGKdSWa7u48ic0Hrnasg1fMc
         LC9AIWxztAZCLR49m1RT2QpAQpZp2ihH7Un70yNCA4JndFRaDb0rfHkeaOU5wW7MvA5m
         6nHT9R3pwBTyFehr3S8nujZCN8o/0WeNq4W/kwU5aMUWJ/sgQqBFsNdgFuTr0EGDIbGr
         BKFg==
X-Gm-Message-State: AOAM533jUggP4N2nexIGDogLWaW23fcd3zM+OykQ1EzLOZUeJwYeFFMM
        GhDIxwpqTHzvMuA/6x1xOSS9g3DtqTEdaw==
X-Google-Smtp-Source: ABdhPJxY12sO3b6H+rL1+NeAOIsggUjjxKIvbuglGiBn2ijcU6S3xYZTu4Njts2pdFcwrlf6k7vYQQ==
X-Received: by 2002:a63:5c5e:: with SMTP id n30mr12277809pgm.397.1608118270842;
        Wed, 16 Dec 2020 03:31:10 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j3sm1835655pjs.50.2020.12.16.03.31.09
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 03:31:09 -0800 (PST)
Message-ID: <5fd9effd.1c69fb81.28609.3fcb@mx.google.com>
Date:   Wed, 16 Dec 2020 03:31:09 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20201216
X-Kernelci-Report-Type: build
Subject: next/master build: 232 builds: 8 failed, 224 passed, 24 errors,
 293 warnings (next-20201216)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 232 builds: 8 failed, 224 passed, 24 errors, 293 warning=
s (next-20201216)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20201216/

Tree: next
Branch: master
Git Describe: next-20201216
Git Commit: 26aed0ea32c8f25c4538a42a8d5e9c458e79b62f
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-10) FAIL
    allmodconfig: (clang-11) FAIL

arm:
    aspeed_g5_defconfig: (clang-10) FAIL
    allmodconfig: (clang-11) FAIL

mips:
    xway_defconfig: (gcc-8) FAIL

riscv:
    nommu_virt_defconfig: (gcc-8) FAIL

x86_64:
    allmodconfig: (clang-10) FAIL
    allmodconfig: (clang-11) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (clang-11): 1 error
    allmodconfig (clang-10): 1 error
    defconfig (clang-10): 1 warning
    defconfig (clang-11): 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-11): 1 warning

arm:
    allmodconfig (gcc-8): 168 warnings
    allmodconfig (clang-11): 43 warnings
    allmodconfig (clang-10): 49 warnings
    aspeed_g5_defconfig (clang-10): 13 errors
    omap1_defconfig (gcc-8): 2 warnings
    tegra_defconfig (gcc-8): 1 warning

i386:

mips:
    loongson3_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 1 warning
    xway_defconfig (gcc-8): 2 errors, 1 warning

riscv:
    defconfig+CONFIG_EFI=3Dn (clang-11): 1 warning
    nommu_virt_defconfig (gcc-8): 3 errors, 3 warnings
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    allmodconfig (clang-11): 2 errors, 5 warnings
    allmodconfig (clang-10): 2 errors, 2 warnings
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (clang-10): 2 warnings
    x86_64_defconfig (clang-11): 2 warnings

Errors summary:

    2    ld.lld: error: undefined symbol: __compiletime_assert_419
    2    ld.lld: error: undefined symbol: __compiletime_assert_1280
    2    ld.lld: error: undefined symbol: __compiletime_assert_1272
    1    mm/secretmem.c:83:33: error: =E2=80=98PMD_PAGE_ORDER=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MAX_ORDER=E2=80=
=99?
    1    mm/secretmem.c:353:34: error: =E2=80=98PMD_PAGE_ORDER=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98MAX_ORDER=E2=80=
=99?
    1    mm/secretmem.c:202:6: error: implicit declaration of function =E2=
=80=98mlock_future_check=E2=80=99; did you mean =E2=80=98locks_free_lock=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37264): reloca=
tion R_ARM_PREL31 out of range: 2135598804 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x371C4): reloca=
tion R_ARM_PREL31 out of range: 2135598964 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x371B4): reloca=
tion R_ARM_PREL31 out of range: 2135598980 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37164): reloca=
tion R_ARM_PREL31 out of range: 2135599060 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37154): reloca=
tion R_ARM_PREL31 out of range: 2135599076 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3713C): reloca=
tion R_ARM_PREL31 out of range: 2135599100 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37124): reloca=
tion R_ARM_PREL31 out of range: 2135599124 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x370F4): reloca=
tion R_ARM_PREL31 out of range: 2135599172 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x370C4): reloca=
tion R_ARM_PREL31 out of range: 2135599220 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x370BC): reloca=
tion R_ARM_PREL31 out of range: 2135599228 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3707C): reloca=
tion R_ARM_PREL31 out of range: 2135599292 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37064): reloca=
tion R_ARM_PREL31 out of range: 2135599316 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x34A60): reloca=
tion R_ARM_PREL31 out of range: 2135543512 is not in [-1073741824, 10737418=
23]
    1    drivers/net/ethernet/lantiq_etop.c:281:4: error: ignoring return v=
alue of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unused_=
result [-Werror=3Dunused-result]
    1    drivers/net/ethernet/lantiq_etop.c:273:4: error: ignoring return v=
alue of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unused_=
result [-Werror=3Dunused-result]

Warnings summary:

    158  ./include/vdso/bits.h:7:26: warning: left shift count >=3D width o=
f type [-Wshift-count-overflow]
    23   1 warning generated.
    9    2 warnings generated.
    4    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    4    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/mod=
ules/5.10.0-next-20201216/kernel/drivers/media/tuners/tuner-types.ko: unsup=
ported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    #warning This code requires at least version 4.6 of GCC
    2    sound/soc/fsl/imx-hdmi.c:165:6: warning: variable 'ret' is used un=
initialized whenever '||' condition is true [-Wsometimes-uninitialized]
    2    sound/soc/fsl/imx-hdmi.c:165:6: warning: variable 'ret' is used un=
initialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2    sound/soc/fsl/imx-hdmi.c:110:9: note: initialize the variable 'ret=
' to silence this warning
    2    security/integrity/ima/ima_crypto.c:582:12: warning: stack frame s=
ize of 1152 bytes in function 'ima_calc_field_array_hash_tfm' [-Wframe-larg=
er-than=3D]
    2    drivers/tee/optee/rpc.c:493:6: warning: stack frame size of 1072 b=
ytes in function 'optee_handle_rpc' [-Wframe-larger-than=3D]
    2    drivers/staging/fbtft/fbtft-core.c:903:12: warning: stack frame si=
ze of 1072 bytes in function 'fbtft_init_display_from_property' [-Wframe-la=
rger-than=3D]
    2    drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:282:9: warning: im=
plicit conversion from enumeration type 'enum mt76_mcuq_id' to different en=
umeration type 'enum mt76_txq_id' [-Wenum-conversion]
    2    drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:278:9: warning: im=
plicit conversion from enumeration type 'enum mt76_mcuq_id' to different en=
umeration type 'enum mt76_txq_id' [-Wenum-conversion]
    2    drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:271:9: warning: im=
plicit conversion from enumeration type 'enum mt76_mcuq_id' to different en=
umeration type 'enum mt76_txq_id' [-Wenum-conversion]
    2    drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:240:9: warning: im=
plicit conversion from enumeration type 'enum mt76_mcuq_id' to different en=
umeration type 'enum mt76_txq_id' [-Wenum-conversion]
    2    drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:238:9: warning: im=
plicit conversion from enumeration type 'enum mt76_mcuq_id' to different en=
umeration type 'enum mt76_txq_id' [-Wenum-conversion]
    2    drivers/net/wireless/cisco/airo.c:3076:12: warning: stack frame si=
ze of 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    2    drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c:145:6: warni=
ng: stack frame size of 1040 bytes in function 'mlx5i_get_stats' [-Wframe-l=
arger-than=3D]
    2    drivers/gpu/drm/ttm/ttm_pool.c:243:21: warning: =E2=80=98ttm_pool_=
type_count=E2=80=99 defined but not used [-Wunused-function]
    2    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack fra=
me size of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: =
warning: stack frame size of 5704 bytes in function 'calculate_bandwidth' [=
-Wframe-larger-than=3D]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3011:6:=
 warning: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-la=
rger-than=3D]
    2    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame=
 size of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    2    cc1: some warnings being treated as errors
    2    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:57.21-61.5: Warning (interr=
upts_property): /paxi/dmac@50000: Missing interrupt-parent
    2    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:51.21-55.5: Warning (interr=
upts_property): /paxi/dmac@40000: Missing interrupt-parent
    2    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:45.19-49.5: Warning (interr=
upts_property): /paxi/gem@30000: Missing interrupt-parent
    2    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:233.21-237.5: Warning (inte=
rrupts_property): /rwid-axi/axi2pico@c0000000: Missing interrupt-parent
    2    WARNING: unmet direct dependencies detected for CMA
    2    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    3 warnings generated.
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
    1    drivers/staging/wlan-ng/cfg80211.c:272:12: warning: stack frame si=
ze of 1032 bytes in function 'prism2_scan' [-Wframe-larger-than=3D]
    1    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame siz=
e of 1216 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    1    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame siz=
e of 1208 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    1    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size=
 of 1856 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-la=
rger-than=3D]
    1    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size=
 of 1848 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-la=
rger-than=3D]
    1    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame =
size of 1064 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=
=3D]
    1    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame =
size of 1056 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=
=3D]
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
    1    crypto/wp512.c:782:13: warning: stack frame size of 1272 bytes in =
function 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1    crypto/wp512.c:782:13: warning: stack frame size of 1256 bytes in =
function 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1    clang: warning: argument unused during compilation: '-no-pie' [-Wu=
nused-command-line-argument]
    1    arch/arm/mach-omap1/board-h2.c:347:34: warning: =E2=80=98isp1301_g=
piod_table=E2=80=99 defined but not used [-Wunused-variable]
    1    arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=98am=
s_delta_camera_power=E2=80=99 defined but not used [-Wunused-function]
    1    /tmp/test-arm-fab76b.s:18792: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-fab76b.s:18717: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-ea6639.s:18794: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-ea6639.s:18719: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/ccYltwIi.s:18195: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccYltwIi.s:18123: Warning: using r15 results in unpredictable=
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

    1    WARNING: modpost: vmlinux.o(.text+0x8f410): Section mismatch in re=
ference from the function init_subsystems() to the function .init.text:hyp_=
cpu_pm_init()
    1    WARNING: modpost: vmlinux.o(.text+0x8e040): Section mismatch in re=
ference from the function kvm_arch_init() to the function .init.text:hyp_cp=
u_pm_exit()
    1    WARNING: modpost: vmlinux.o(.text+0x87d10): Section mismatch in re=
ference from the function init_subsystems() to the function .init.text:hyp_=
cpu_pm_init()
    1    WARNING: modpost: vmlinux.o(.text+0x86c14): Section mismatch in re=
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
allmodconfig (arm64, clang-11) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    ld.lld: error: undefined symbol: __compiletime_assert_419

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x8e040): Section mismatch in referen=
ce from the function kvm_arch_init() to the function .init.text:hyp_cpu_pm_=
exit()
    WARNING: modpost: vmlinux.o(.text+0x8f410): Section mismatch in referen=
ce from the function init_subsystems() to the function .init.text:hyp_cpu_p=
m_init()

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    ld.lld: error: undefined symbol: __compiletime_assert_419

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x86c14): Section mismatch in referen=
ce from the function kvm_arch_init() to the function .init.text:hyp_cpu_pm_=
exit()
    WARNING: modpost: vmlinux.o(.text+0x87d10): Section mismatch in referen=
ce from the function init_subsystems() to the function .init.text:hyp_cpu_p=
m_init()

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 168 warnings, 0 section=
 mismatches

Warnings:
    /tmp/ccYltwIi.s:18123: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccYltwIi.s:18195: Warning: using r15 results in unpredictable beha=
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
    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:45.19-49.5: Warning (interrupts_=
property): /paxi/gem@30000: Missing interrupt-parent
    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:51.21-55.5: Warning (interrupts_=
property): /paxi/dmac@40000: Missing interrupt-parent
    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:57.21-61.5: Warning (interrupts_=
property): /paxi/dmac@50000: Missing interrupt-parent
    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:233.21-237.5: Warning (interrupt=
s_property): /rwid-axi/axi2pico@c0000000: Missing interrupt-parent

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-11) =E2=80=94 FAIL, 2 errors, 5 warnings, 0 sec=
tion mismatches

Errors:
    ld.lld: error: undefined symbol: __compiletime_assert_1272
    ld.lld: error: undefined symbol: __compiletime_assert_1280

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

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-11) =E2=80=94 FAIL, 0 errors, 43 warnings, 0 secti=
on mismatches

Warnings:
    security/integrity/ima/ima_crypto.c:582:12: warning: stack frame size o=
f 1152 bytes in function 'ima_calc_field_array_hash_tfm' [-Wframe-larger-th=
an=3D]
    1 warning generated.
    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame size=
 of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1 warning generated.
    /tmp/test-arm-fab76b.s:18717: Warning: using r15 results in unpredictab=
le behaviour
    /tmp/test-arm-fab76b.s:18792: Warning: using r15 results in unpredictab=
le behaviour
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    crypto/wp512.c:782:13: warning: stack frame size of 1256 bytes in funct=
ion 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1 warning generated.
    sound/soc/fsl/imx-hdmi.c:165:6: warning: variable 'ret' is used uniniti=
alized whenever 'if' condition is true [-Wsometimes-uninitialized]
    sound/soc/fsl/imx-hdmi.c:165:6: warning: variable 'ret' is used uniniti=
alized whenever '||' condition is true [-Wsometimes-uninitialized]
    sound/soc/fsl/imx-hdmi.c:110:9: note: initialize the variable 'ret' to =
silence this warning
    2 warnings generated.
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size of 1=
856 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/net/wireless/cisco/airo.c:3076:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:238:9: warning: implici=
t conversion from enumeration type 'enum mt76_mcuq_id' to different enumera=
tion type 'enum mt76_txq_id' [-Wenum-conversion]
    drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:240:9: warning: implici=
t conversion from enumeration type 'enum mt76_mcuq_id' to different enumera=
tion type 'enum mt76_txq_id' [-Wenum-conversion]
    2 warnings generated.
    drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:271:9: warning: implici=
t conversion from enumeration type 'enum mt76_mcuq_id' to different enumera=
tion type 'enum mt76_txq_id' [-Wenum-conversion]
    drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:278:9: warning: implici=
t conversion from enumeration type 'enum mt76_mcuq_id' to different enumera=
tion type 'enum mt76_txq_id' [-Wenum-conversion]
    drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:282:9: warning: implici=
t conversion from enumeration type 'enum mt76_mcuq_id' to different enumera=
tion type 'enum mt76_txq_id' [-Wenum-conversion]
    3 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3011:6: warn=
ing: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5704 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.
    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame size of =
1208 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    drivers/staging/fbtft/fbtft-core.c:903:12: warning: stack frame size of=
 1072 bytes in function 'fbtft_init_display_from_property' [-Wframe-larger-=
than=3D]
    2 warnings generated.
    drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c:145:6: warning: s=
tack frame size of 1040 bytes in function 'mlx5i_get_stats' [-Wframe-larger=
-than=3D]
    1 warning generated.
    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame size =
of 1064 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/tee/optee/rpc.c:493:6: warning: stack frame size of 1072 bytes =
in function 'optee_handle_rpc' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-10) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 sec=
tion mismatches

Errors:
    ld.lld: error: undefined symbol: __compiletime_assert_1272
    ld.lld: error: undefined symbol: __compiletime_assert_1280

Warnings:
    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x3ce: c=
all to __ubsan_handle_add_overflow() with UACCESS enabled
    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x398: call to __u=
bsan_handle_add_overflow() with UACCESS enabled

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 49 warnings, 0 secti=
on mismatches

Warnings:
    security/integrity/ima/ima_crypto.c:582:12: warning: stack frame size o=
f 1152 bytes in function 'ima_calc_field_array_hash_tfm' [-Wframe-larger-th=
an=3D]
    1 warning generated.
    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame size=
 of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1 warning generated.
    /tmp/test-arm-ea6639.s:18719: Warning: using r15 results in unpredictab=
le behaviour
    /tmp/test-arm-ea6639.s:18794: Warning: using r15 results in unpredictab=
le behaviour
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least vers=
ion 4.6 of GCC [-W#warnings]
    #warning This code requires at least version 4.6 of GCC
    1 warning generated.
    crypto/wp512.c:782:13: warning: stack frame size of 1272 bytes in funct=
ion 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1 warning generated.
    sound/soc/fsl/imx-hdmi.c:165:6: warning: variable 'ret' is used uniniti=
alized whenever 'if' condition is true [-Wsometimes-uninitialized]
    sound/soc/fsl/imx-hdmi.c:165:6: warning: variable 'ret' is used uniniti=
alized whenever '||' condition is true [-Wsometimes-uninitialized]
    sound/soc/fsl/imx-hdmi.c:110:9: note: initialize the variable 'ret' to =
silence this warning
    2 warnings generated.
    drivers/net/wireless/cisco/airo.c:3076:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size of 1=
848 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:238:9: warning: implici=
t conversion from enumeration type 'enum mt76_mcuq_id' to different enumera=
tion type 'enum mt76_txq_id' [-Wenum-conversion]
    drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:240:9: warning: implici=
t conversion from enumeration type 'enum mt76_mcuq_id' to different enumera=
tion type 'enum mt76_txq_id' [-Wenum-conversion]
    2 warnings generated.
    drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:271:9: warning: implici=
t conversion from enumeration type 'enum mt76_mcuq_id' to different enumera=
tion type 'enum mt76_txq_id' [-Wenum-conversion]
    drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:278:9: warning: implici=
t conversion from enumeration type 'enum mt76_mcuq_id' to different enumera=
tion type 'enum mt76_txq_id' [-Wenum-conversion]
    drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:282:9: warning: implici=
t conversion from enumeration type 'enum mt76_mcuq_id' to different enumera=
tion type 'enum mt76_txq_id' [-Wenum-conversion]
    3 warnings generated.
    drivers/staging/wlan-ng/cfg80211.c:272:12: warning: stack frame size of=
 1032 bytes in function 'prism2_scan' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3011:6: warn=
ing: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5704 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.
    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame size =
of 1056 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame size of =
1216 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    drivers/staging/fbtft/fbtft-core.c:903:12: warning: stack frame size of=
 1072 bytes in function 'fbtft_init_display_from_property' [-Wframe-larger-=
than=3D]
    2 warnings generated.
    drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c:145:6: warning: s=
tack frame size of 1040 bytes in function 'mlx5i_get_stats' [-Wframe-larger=
-than=3D]
    1 warning generated.
    drivers/tee/optee/rpc.c:493:6: warning: stack frame size of 1072 bytes =
in function 'optee_handle_rpc' [-Wframe-larger-than=3D]
    1 warning generated.
    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:45.19-49.5: Warning (interrupts_=
property): /paxi/gem@30000: Missing interrupt-parent
    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:51.21-55.5: Warning (interrupts_=
property): /paxi/dmac@40000: Missing interrupt-parent
    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:57.21-61.5: Warning (interrupts_=
property): /paxi/dmac@50000: Missing interrupt-parent
    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:233.21-237.5: Warning (interrupt=
s_property): /rwid-axi/axi2pico@c0000000: Missing interrupt-parent

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
allnoconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
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
allnoconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
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
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-10) =E2=80=94 FAIL, 13 errors, 0 warnings, =
0 section mismatches

Errors:
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x34A60): relocation =
R_ARM_PREL31 out of range: 2135543512 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37064): relocation =
R_ARM_PREL31 out of range: 2135599316 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3707C): relocation =
R_ARM_PREL31 out of range: 2135599292 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x370BC): relocation =
R_ARM_PREL31 out of range: 2135599228 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x370C4): relocation =
R_ARM_PREL31 out of range: 2135599220 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x370F4): relocation =
R_ARM_PREL31 out of range: 2135599172 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37124): relocation =
R_ARM_PREL31 out of range: 2135599124 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3713C): relocation =
R_ARM_PREL31 out of range: 2135599100 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37154): relocation =
R_ARM_PREL31 out of range: 2135599076 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37164): relocation =
R_ARM_PREL31 out of range: 2135599060 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x371B4): relocation =
R_ARM_PREL31 out of range: 2135598980 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x371C4): relocation =
R_ARM_PREL31 out of range: 2135598964 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37264): relocation =
R_ARM_PREL31 out of range: 2135598804 is not in [-1073741824, 1073741823]

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
defconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.10.0-next-20201216/kernel/drivers/media/tuners/tuner-types.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.10.0-next-20201216/kernel/drivers/media/tuners/tuner-types.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-10) =E2=80=94 PASS, 0 er=
rors, 1 warning, 0 section mismatches

Warnings:
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.10.0-next-20201216/kernel/drivers/media/tuners/tuner-types.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-11) =E2=80=94 PASS, 0 er=
rors, 1 warning, 0 section mismatches

Warnings:
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.10.0-next-20201216/kernel/drivers/media/tuners/tuner-types.ko: unsupporte=
d GNU_PROPERTY_TYPE (5) type: 0xc0000000

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
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
multi_v5_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 FAIL, 3 errors, 3 warnings, 0=
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
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1181:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
x86_64_defconfig+x86-chromebook (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section=
 mismatches

Errors:
    drivers/net/ethernet/lantiq_etop.c:273:4: error: ignoring return value =
of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unused_resul=
t [-Werror=3Dunused-result]
    drivers/net/ethernet/lantiq_etop.c:281:4: error: ignoring return value =
of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unused_resul=
t [-Werror=3Dunused-result]

Warnings:
    cc1: some warnings being treated as errors

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
