Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81AD2EED76
	for <lists+linux-next@lfdr.de>; Fri,  8 Jan 2021 07:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbhAHGc7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Jan 2021 01:32:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbhAHGc7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Jan 2021 01:32:59 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55443C0612F4
        for <linux-next@vger.kernel.org>; Thu,  7 Jan 2021 22:32:19 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id c12so5608481pfo.10
        for <linux-next@vger.kernel.org>; Thu, 07 Jan 2021 22:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=iQdfP0xW4raxMsOXmkCfFn27Nuutqla/gUMfCvlb4A0=;
        b=OD8ka/3teIB2TBXqtoX/CdYeyqujFrZ56+M5PeZVVE+WOTHJyDAlR1dHZPfBtFK/5f
         muIBTDMePKYrXqFMrr9GUOu5IRF+6DWff0kVEFw24/wIGkVNoS/0nUxJBhk9gNoDjXk8
         sG2YnVVqT5KtWvx9gyych4ie8+PeO5F273kxgd2S+prJQFqCisbg90GITDPTyw7FW13f
         ye269TrlgXTBQl/o+Le3JorrJhLbmvuoPQ5cKsJjvuNfieqlWw/AGmVx+yBEet+7Fc+K
         ly7QZORhZRPqFiMKMJ84i0byXAzlQMeDn+18BF9BRaR7ITfrtmPaPoyd/FvC+fBYWOwV
         FHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=iQdfP0xW4raxMsOXmkCfFn27Nuutqla/gUMfCvlb4A0=;
        b=OmCWJUtXdtarSScyF+7D7vKcNCk+s5qqfK6RlyEQEMe/yi4wmjeIV7tNKzCNIIvbr/
         e2GpYn57rCKVWl1ucXPcAN+w7QTipb3IfxU6f3n5gt//lgvvdoQ8u1/tl+O04t6rRRV+
         wz2hzfm9gKV4bwrG0CQg4A60SsEOi3KTd2ZzFYl9m/VOuRR6yCqg2B5poE23r7wadpmS
         oSWjeLm71o3ONrtG5UJ3GJdqQfDwq6dP+jn8FWmHpoyrapf0ODtpdCAmNMGShh9uQyl/
         xArzmpCeEC52r1WVxfJ1c/pKqo8zcfLKvCt5m5tnFEjim6dgE/ji7aaUbqfUwX1fKoSr
         pMdQ==
X-Gm-Message-State: AOAM530opHoWUdV+rYQXHU/YrsmdZYI594f9FbM9o5+ii8XeeCtoCXin
        m1gWvmDWjcnuGY/s7N/sdH+57P80AxqkYw==
X-Google-Smtp-Source: ABdhPJxGqbdtb0C6/99VYuS3C+i8Y+SrAzjV8UIyqYxly5TeD3qMYQULvKqzSgdmJNrORL+FNxgyhw==
X-Received: by 2002:a65:5bc8:: with SMTP id o8mr5562441pgr.100.1610087536998;
        Thu, 07 Jan 2021 22:32:16 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y9sm6301747pjt.37.2021.01.07.22.32.15
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jan 2021 22:32:15 -0800 (PST)
Message-ID: <5ff7fc6f.1c69fb81.20526.0321@mx.google.com>
Date:   Thu, 07 Jan 2021 22:32:15 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210108
X-Kernelci-Report-Type: build
Subject: next/master build: 231 builds: 8 failed, 223 passed, 29 errors,
 138 warnings (next-20210108)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 231 builds: 8 failed, 223 passed, 29 errors, 138 warning=
s (next-20210108)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20210108/

Tree: next
Branch: master
Git Describe: next-20210108
Git Commit: 1c925d2030afd354a02c23500386e620e662622b
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-10) FAIL
    allmodconfig: (clang-11) FAIL
    allmodconfig: (gcc-8) FAIL

arm:
    aspeed_g5_defconfig: (clang-10) FAIL
    efm32_defconfig: (gcc-8) FAIL

riscv:
    nommu_virt_defconfig: (gcc-8) FAIL

x86_64:
    allmodconfig: (clang-10) FAIL
    allmodconfig: (clang-11) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (clang-10): 1 error
    allmodconfig (gcc-8): 1 error
    allmodconfig (clang-11): 1 error
    defconfig (clang-10): 1 warning
    defconfig (clang-11): 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-11): 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 1 warning

arm:
    allmodconfig (gcc-8): 7 warnings
    allmodconfig (clang-10): 47 warnings
    allmodconfig (clang-11): 45 warnings
    aspeed_g5_defconfig (clang-10): 13 errors
    axm55xx_defconfig (gcc-8): 1 warning
    efm32_defconfig (gcc-8): 6 errors
    keystone_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-8): 1 warning
    omap1_defconfig (gcc-8): 2 warnings
    socfpga_defconfig (gcc-8): 1 warning

i386:

mips:
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    maltaup_xpa_defconfig (gcc-8): 1 warning
    nlm_xlr_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 1 warning
    xway_defconfig (gcc-8): 2 warnings

riscv:
    defconfig+CONFIG_EFI=3Dn (clang-11): 1 warning
    nommu_virt_defconfig (gcc-8): 3 errors, 3 warnings
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    allmodconfig (clang-10): 2 errors, 2 warnings
    allmodconfig (clang-11): 2 errors, 5 warnings
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (clang-11): 2 warnings
    x86_64_defconfig (clang-10): 2 warnings

Errors summary:

    2    ld.lld: error: undefined symbol: __compiletime_assert_419
    2    ld.lld: error: undefined symbol: __compiletime_assert_1280
    2    ld.lld: error: undefined symbol: __compiletime_assert_1272
    2    arm-linux-gnueabihf-ld: /scratch/linux/drivers/net/ethernet/micrel=
/ks8851_common.c:1117: undefined reference to `mdiobus_unregister'
    1    mm/secretmem.c:83:33: error: =E2=80=98PMD_PAGE_ORDER=E2=80=99 unde=
clared (first use in this function); did you mean =E2=80=98MAX_ORDER=E2=80=
=99?
    1    mm/secretmem.c:353:34: error: =E2=80=98PMD_PAGE_ORDER=E2=80=99 und=
eclared (first use in this function); did you mean =E2=80=98MAX_ORDER=E2=80=
=99?
    1    mm/secretmem.c:202:6: error: implicit declaration of function =E2=
=80=98mlock_future_check=E2=80=99; did you mean =E2=80=98locks_free_lock=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37414): reloca=
tion R_ARM_PREL31 out of range: 2135594276 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37374): reloca=
tion R_ARM_PREL31 out of range: 2135594436 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37364): reloca=
tion R_ARM_PREL31 out of range: 2135594452 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37314): reloca=
tion R_ARM_PREL31 out of range: 2135594532 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37304): reloca=
tion R_ARM_PREL31 out of range: 2135594548 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372EC): reloca=
tion R_ARM_PREL31 out of range: 2135594572 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372D4): reloca=
tion R_ARM_PREL31 out of range: 2135594596 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372A4): reloca=
tion R_ARM_PREL31 out of range: 2135594644 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37274): reloca=
tion R_ARM_PREL31 out of range: 2135594692 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3726C): reloca=
tion R_ARM_PREL31 out of range: 2135594700 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3722C): reloca=
tion R_ARM_PREL31 out of range: 2135594764 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37214): reloca=
tion R_ARM_PREL31 out of range: 2135594788 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x34BF0): reloca=
tion R_ARM_PREL31 out of range: 2135539016 is not in [-1073741824, 10737418=
23]
    1    arm-linux-gnueabihf-ld: /scratch/linux/drivers/net/ethernet/micrel=
/ks8851_common.c:1118: undefined reference to `mdiobus_free'
    1    ERROR: modpost: "irq_check_status_bit" [drivers/perf/arm_spe_pmu.k=
o] undefined!
    1    /scratch/linux/drivers/net/ethernet/micrel/ks8851_common.c:1118: u=
ndefined reference to `mdiobus_free'
    1    /scratch/linux/drivers/net/ethernet/micrel/ks8851_common.c:1102: u=
ndefined reference to `__mdiobus_register'
    1    /scratch/linux/./include/linux/phy.h:383: undefined reference to `=
mdiobus_alloc_size'

Warnings summary:

    25   1 warning generated.
    7    2 warnings generated.
    5    lib/cpumask.c:222:17: warning: cast from pointer to integer of dif=
ferent size [-Wpointer-to-int-cast]
    4    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    4    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/mod=
ules/5.11.0-rc2-next-20210108/kernel/drivers/media/tuners/tuner-types.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    4    #warning This code requires at least version 4.6 of GCC
    3    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:57.21-61.5: Warning (interr=
upts_property): /paxi/dmac@50000: Missing interrupt-parent
    3    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:51.21-55.5: Warning (interr=
upts_property): /paxi/dmac@40000: Missing interrupt-parent
    3    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:45.19-49.5: Warning (interr=
upts_property): /paxi/gem@30000: Missing interrupt-parent
    3    arch/arm/boot/dts/picoxcell-pc3x2.dtsi:233.21-237.5: Warning (inte=
rrupts_property): /rwid-axi/axi2pico@c0000000: Missing interrupt-parent
    3    ./include/linux/minmax.h:18:28: warning: comparison of distinct po=
inter types lacks a cast
    2    security/integrity/ima/ima_crypto.c:582:12: warning: stack frame s=
ize of 1152 bytes in function 'ima_calc_field_array_hash_tfm' [-Wframe-larg=
er-than=3D]
    2    drivers/tee/optee/rpc.c:493:6: warning: stack frame size of 1072 b=
ytes in function 'optee_handle_rpc' [-Wframe-larger-than=3D]
    2    drivers/staging/fbtft/fbtft-core.c:903:12: warning: stack frame si=
ze of 1072 bytes in function 'fbtft_init_display_from_property' [-Wframe-la=
rger-than=3D]
    2    drivers/spi/spi-cadence-quadspi.c:1153:24: warning: comparison of =
distinct pointer types ('typeof (len) *' (aka 'unsigned int *') and 'typeof=
 (500UL) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
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
    1    drivers/net/ethernet/lantiq_etop.c:281:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unuse=
d_result [-Wunused-result]
    1    drivers/net/ethernet/lantiq_etop.c:273:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unuse=
d_result [-Wunused-result]
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
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    crypto/wp512.c:782:13: warning: stack frame size of 1272 bytes in =
function 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1    crypto/wp512.c:782:13: warning: stack frame size of 1256 bytes in =
function 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1    clang: warning: argument unused during compilation: '-no-pie' [-Wu=
nused-command-line-argument]
    1    cc1: some warnings being treated as errors
    1    arch/arm/mach-omap1/board-h2.c:347:34: warning: =E2=80=98isp1301_g=
piod_table=E2=80=99 defined but not used [-Wunused-variable]
    1    arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=98am=
s_delta_camera_power=E2=80=99 defined but not used [-Wunused-function]
    1    /tmp/test-arm-ad72c8.s:18794: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-ad72c8.s:18719: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-8a0f74.s:18792: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/test-arm-8a0f74.s:18717: Warning: using r15 results in unpred=
ictable behaviour
    1    /tmp/ccG3icNr.s:18195: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccG3icNr.s:18123: Warning: using r15 results in unpredictable=
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

    1    WARNING: modpost: vmlinux.o(.text+0x121ffdc): Section mismatch in =
reference from the function exynos_chipid_probe() to the function .init.tex=
t:product_id_to_soc_id()
    1    WARNING: modpost: vmlinux.o(.text+0x115097c): Section mismatch in =
reference from the function exynos_chipid_probe() to the function .init.tex=
t:product_id_to_soc_id()
    1    WARNING: modpost: vmlinux.o(.text+0x11121fd): Section mismatch in =
reference from the function exynos_chipid_probe() to the function .init.tex=
t:product_id_to_soc_id()
    1    WARNING: modpost: vmlinux.o(.text+0x1100e81): Section mismatch in =
reference from the function exynos_chipid_probe() to the function .init.tex=
t:product_id_to_soc_id()

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
allmodconfig (arm64, clang-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    ld.lld: error: undefined symbol: __compiletime_assert_419

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x115097c): Section mismatch in refer=
ence from the function exynos_chipid_probe() to the function .init.text:pro=
duct_id_to_soc_id()

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x1100e81): Section mismatch in refer=
ence from the function exynos_chipid_probe() to the function .init.text:pro=
duct_id_to_soc_id()

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 section m=
ismatches

Warnings:
    /tmp/ccG3icNr.s:18123: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccG3icNr.s:18195: Warning: using r15 results in unpredictable beha=
viour
    ./include/linux/minmax.h:18:28: warning: comparison of distinct pointer=
 types lacks a cast
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

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x11121fd): Section mismatch in refer=
ence from the function exynos_chipid_probe() to the function .init.text:pro=
duct_id_to_soc_id()

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    ERROR: modpost: "irq_check_status_bit" [drivers/perf/arm_spe_pmu.ko] un=
defined!

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-11) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    ld.lld: error: undefined symbol: __compiletime_assert_419

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x121ffdc): Section mismatch in refer=
ence from the function exynos_chipid_probe() to the function .init.text:pro=
duct_id_to_soc_id()

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 47 warnings, 0 secti=
on mismatches

Warnings:
    security/integrity/ima/ima_crypto.c:582:12: warning: stack frame size o=
f 1152 bytes in function 'ima_calc_field_array_hash_tfm' [-Wframe-larger-th=
an=3D]
    1 warning generated.
    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame size=
 of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1 warning generated.
    /tmp/test-arm-ad72c8.s:18719: Warning: using r15 results in unpredictab=
le behaviour
    /tmp/test-arm-ad72c8.s:18794: Warning: using r15 results in unpredictab=
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
    drivers/spi/spi-cadence-quadspi.c:1153:24: warning: comparison of disti=
nct pointer types ('typeof (len) *' (aka 'unsigned int *') and 'typeof (500=
UL) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
    1 warning generated.
    drivers/net/wireless/cisco/airo.c:3076:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size of 1=
848 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-larger-=
than=3D]
    1 warning generated.
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
    drivers/net/ethernet/mellanox/mlx5/core/ipoib/ipoib.c:145:6: warning: s=
tack frame size of 1040 bytes in function 'mlx5i_get_stats' [-Wframe-larger=
-than=3D]
    1 warning generated.
    drivers/staging/wlan-ng/cfg80211.c:272:12: warning: stack frame size of=
 1032 bytes in function 'prism2_scan' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame size =
of 1056 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame size of =
1216 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    drivers/staging/fbtft/fbtft-core.c:903:12: warning: stack frame size of=
 1072 bytes in function 'fbtft_init_display_from_property' [-Wframe-larger-=
than=3D]
    2 warnings generated.
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
allmodconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 45 warnings, 0 secti=
on mismatches

Warnings:
    security/integrity/ima/ima_crypto.c:582:12: warning: stack frame size o=
f 1152 bytes in function 'ima_calc_field_array_hash_tfm' [-Wframe-larger-th=
an=3D]
    1 warning generated.
    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame size=
 of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1 warning generated.
    /tmp/test-arm-8a0f74.s:18717: Warning: using r15 results in unpredictab=
le behaviour
    /tmp/test-arm-8a0f74.s:18792: Warning: using r15 results in unpredictab=
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
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/spi/spi-cadence-quadspi.c:1153:24: warning: comparison of disti=
nct pointer types ('typeof (len) *' (aka 'unsigned int *') and 'typeof (500=
UL) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
    1 warning generated.
    drivers/scsi/bfa/bfa_fcs_lport.c:1900:1: warning: stack frame size of 1=
856 bytes in function 'bfa_fcs_lport_fdmi_build_rhba_pyld' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/net/wireless/cisco/airo.c:3076:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3011:6: warn=
ing: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5704 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.
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
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
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
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x34BF0): relocation =
R_ARM_PREL31 out of range: 2135539016 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37214): relocation =
R_ARM_PREL31 out of range: 2135594788 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3722C): relocation =
R_ARM_PREL31 out of range: 2135594764 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x3726C): relocation =
R_ARM_PREL31 out of range: 2135594700 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37274): relocation =
R_ARM_PREL31 out of range: 2135594692 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372A4): relocation =
R_ARM_PREL31 out of range: 2135594644 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372D4): relocation =
R_ARM_PREL31 out of range: 2135594596 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x372EC): relocation =
R_ARM_PREL31 out of range: 2135594572 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37304): relocation =
R_ARM_PREL31 out of range: 2135594548 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37314): relocation =
R_ARM_PREL31 out of range: 2135594532 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37364): relocation =
R_ARM_PREL31 out of range: 2135594452 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37374): relocation =
R_ARM_PREL31 out of range: 2135594436 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37414): relocation =
R_ARM_PREL31 out of range: 2135594276 is not in [-1073741824, 1073741823]

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.11.0-rc2-next-20210108/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.11.0-rc2-next-20210108/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-11) =E2=80=94 PASS, 0 er=
rors, 1 warning, 0 section mismatches

Warnings:
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.11.0-rc2-next-20210108/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-10) =E2=80=94 PASS, 0 er=
rors, 1 warning, 0 section mismatches

Warnings:
    aarch64-linux-gnu-strip: warning: /scratch/linux/_modules_/lib/modules/=
5.11.0-rc2-next-20210108/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

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
efm32_defconfig (arm, gcc-8) =E2=80=94 FAIL, 6 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    /scratch/linux/./include/linux/phy.h:383: undefined reference to `mdiob=
us_alloc_size'
    /scratch/linux/drivers/net/ethernet/micrel/ks8851_common.c:1102: undefi=
ned reference to `__mdiobus_register'
    /scratch/linux/drivers/net/ethernet/micrel/ks8851_common.c:1118: undefi=
ned reference to `mdiobus_free'
    arm-linux-gnueabihf-ld: /scratch/linux/drivers/net/ethernet/micrel/ks88=
51_common.c:1117: undefined reference to `mdiobus_unregister'
    arm-linux-gnueabihf-ld: /scratch/linux/drivers/net/ethernet/micrel/ks88=
51_common.c:1117: undefined reference to `mdiobus_unregister'
    arm-linux-gnueabihf-ld: /scratch/linux/drivers/net/ethernet/micrel/ks88=
51_common.c:1118: undefined reference to `mdiobus_free'

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
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    ./include/linux/minmax.h:18:28: warning: comparison of distinct pointer=
 types lacks a cast
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
multi_v5_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 1 warning, 0 section mismatches

Warnings:
    lib/cpumask.c:222:17: warning: cast from pointer to integer of differen=
t size [-Wpointer-to-int-cast]

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
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    lib/cpumask.c:222:17: warning: cast from pointer to integer of differen=
t size [-Wpointer-to-int-cast]

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
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    ./include/linux/minmax.h:18:28: warning: comparison of distinct pointer=
 types lacks a cast

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
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1181:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

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
x86_64_defconfig (x86_64, clang-11) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_pr=
efault_relocations()+0xb8: stack state mismatch: cfa1=3D7+8 cfa2=3D-1+0
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_co=
py_relocations()+0x259: stack state mismatch: cfa1=3D7+104 cfa2=3D-1+0

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
x86_64_defconfig+x86-chromebook (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

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
