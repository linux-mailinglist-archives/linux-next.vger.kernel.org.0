Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A2E2360A6C
	for <lists+linux-next@lfdr.de>; Thu, 15 Apr 2021 15:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbhDONW7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Apr 2021 09:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbhDONW7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Apr 2021 09:22:59 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067CCC061574
        for <linux-next@vger.kernel.org>; Thu, 15 Apr 2021 06:22:36 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id 10so7169390pfl.1
        for <linux-next@vger.kernel.org>; Thu, 15 Apr 2021 06:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=6bKCrPVdijyoxl/SQA+u8zF2KfhkHXsZpIe3k4FrPeI=;
        b=PGYHX4hnDmnYnHHEMAKZZLDdOpWwT4fKsIldz3phu4S4qpU7loLHb12gjhX0xAkeom
         AAINE+xM/V/5Ak3WEGT58dA1GAfOhThx3MNVrDNfNjnZo+mDAeeXCAEFsfvbJuH4hDj9
         NqoWfJadi0z9EMdDszqHfU7VllxjORZ2RPm4F6v0HbziMb/ymkLNCKJ/dv9kkArCY80V
         gm/3H7juBIAlBp+8jdfpSmgSq58npwCyJVbDsDzZFxl8+IUWmjkqloV79dl9CSs8vWM1
         7/lt5rnas488oSarY090iertopor4zGWYbxPn9ehSRSH28iLblVGTwaZiEvJADoR5jGJ
         jhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=6bKCrPVdijyoxl/SQA+u8zF2KfhkHXsZpIe3k4FrPeI=;
        b=k0mxMne26EJvt/oxjUlZtck+lL1cQ/5Gd2GxcQXX+pP2sts9N67TbLCTiUfDc6jbum
         wEVGJXEEbd7odx0eXJQzhUowPF14pI36ML5h0O1pFzb7c8PrTUV2YzyiWGtqM5MevXUP
         M1cOkNRWqPmK4e3xPPWYhls1W5w8ZppFh++9iJvicOZcKSZ03DmreA0HE8QeR9qfwC+h
         NL1uvU5+qMeycqqa4iuHfzlyLKIQzU2e6e5FpX61AEO+VkY7Qvm/vw2uN+0NpgyPSf5W
         pBj8LKE4M5X0c1XjqgwFGEGXDmOTZCXYzpCQZOnF4AodJjItAlD0maSbIPjLsNkzoWo9
         dtZQ==
X-Gm-Message-State: AOAM531YJtmF1DkXSI7Gv/smE92zfZR5XukTeavDdBt16Z1dAQFghn0y
        Sj57HBxnL+2GIsXqSHqcmgcpLBT5jGRX/qZo
X-Google-Smtp-Source: ABdhPJwrrN+dRVLEFZb6QViC9lrxtw/alLMaegqoPDE6/H5nzBiK+u9zeiYFBLfLp4uqYhhI04qk8A==
X-Received: by 2002:aa7:8207:0:b029:251:20c1:1861 with SMTP id k7-20020aa782070000b029025120c11861mr3135311pfi.13.1618492953820;
        Thu, 15 Apr 2021 06:22:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r127sm2326221pfr.163.2021.04.15.06.22.32
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 06:22:33 -0700 (PDT)
Message-ID: <60783e19.1c69fb81.defbb.65f9@mx.google.com>
Date:   Thu, 15 Apr 2021 06:22:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20210415
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 210 builds: 14 failed, 196 passed, 30 errors,
 284 warnings (next-20210415)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 210 builds: 14 failed, 196 passed, 30 errors, 284 warnin=
gs (next-20210415)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20210415/

Tree: next
Branch: master
Git Describe: next-20210415
Git Commit: 1216f02e46a46aad2a9c1c3bb29032f0b42eedac
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-10) FAIL
    allnoconfig: (clang-10) FAIL
    allnoconfig: (clang-11) FAIL
    allnoconfig: (gcc-8) FAIL
    tinyconfig: (gcc-8) FAIL

arm:
    allmodconfig: (clang-10) FAIL
    aspeed_g5_defconfig: (clang-10) FAIL
    allmodconfig: (clang-11) FAIL
    allmodconfig: (gcc-8) FAIL

i386:
    allmodconfig: (clang-10) FAIL

mips:
    allnoconfig: (gcc-8) FAIL
    decstation_64_defconfig: (gcc-8) FAIL
    lemote2f_defconfig: (gcc-8) FAIL

x86_64:
    allmodconfig: (clang-10) FAIL

Errors and Warnings Detected:

arc:
    axs103_defconfig (gcc-8): 1 warning
    axs103_smp_defconfig (gcc-8): 1 warning
    hsdk_defconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 2 warnings

arm64:
    allmodconfig (clang-10): 1 error
    allmodconfig (gcc-8): 1 warning
    allmodconfig (clang-11): 35 warnings
    allnoconfig (clang-11): 3 errors, 2 warnings
    allnoconfig (clang-10): 3 errors, 2 warnings
    allnoconfig (gcc-8): 3 errors, 1 warning
    defconfig (gcc-8): 2 warnings
    defconfig (clang-10): 10 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-8): 2 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 10 warnings
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 2 warnings
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-8): 2 warnings
    tinyconfig (gcc-8): 3 errors, 1 warning

arm:
    allmodconfig (gcc-8): 1 error, 1 warning
    allmodconfig (clang-10): 1 error, 2 warnings
    allmodconfig (clang-11): 1 error, 55 warnings
    aspeed_g5_defconfig (clang-10): 11 errors
    axm55xx_defconfig (gcc-8): 1 warning
    keystone_defconfig (gcc-8): 1 warning
    lpc18xx_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (clang-11): 7 warnings
    multi_v7_defconfig (clang-10): 7 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 1 warning
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-8): 2 warnin=
gs
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-8): 1 warning
    mvebu_v7_defconfig (gcc-8): 1 warning
    omap1_defconfig (gcc-8): 2 warnings
    oxnas_v6_defconfig (gcc-8): 1 warning
    pxa_defconfig (gcc-8): 1 warning
    socfpga_defconfig (gcc-8): 2 warnings
    spear13xx_defconfig (gcc-8): 2 warnings
    spear3xx_defconfig (gcc-8): 1 warning
    sunxi_defconfig (gcc-8): 1 warning
    vexpress_defconfig (gcc-8): 1 warning

i386:
    allmodconfig (clang-11): 49 warnings
    allmodconfig (clang-10): 1 error

mips:
    32r2el_defconfig (gcc-8): 1 warning
    allnoconfig (gcc-8): 1 error
    cavium_octeon_defconfig (gcc-8): 1 warning
    cu1000-neo_defconfig (gcc-8): 1 warning
    cu1830-neo_defconfig (gcc-8): 1 warning
    loongson1b_defconfig (gcc-8): 1 warning
    loongson1c_defconfig (gcc-8): 1 warning
    loongson2k_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    maltaaprp_defconfig (gcc-8): 1 warning
    pistachio_defconfig (gcc-8): 1 warning
    rb532_defconfig (gcc-8): 1 warning
    sb1250_swarm_defconfig (gcc-8): 1 warning
    xway_defconfig (gcc-8): 3 warnings

riscv:
    nommu_k210_defconfig (gcc-8): 1 warning
    nommu_k210_sdcard_defconfig (gcc-8): 1 warning
    nommu_virt_defconfig (gcc-8): 1 warning
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    allmodconfig (clang-11): 37 warnings
    allmodconfig (clang-10): 1 error
    allmodconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (clang-11): 2 warnings
    x86_64_defconfig (clang-10): 2 warnings

Errors summary:

    4    kernel/gcov/clang.c:429:3: error: implicit declaration of function=
 'vfree' [-Werror,-Wimplicit-function-declaration]
    2    ld.lld: error: undefined symbol: sve_save_state
    2    ld.lld: error: undefined symbol: sve_load_state
    2    ld.lld: error: undefined symbol: sve_get_vl
    2    ERROR: modpost: "of_phandle_iterator_args" [drivers/iommu/mtk_iomm=
u_v1.ko] undefined!
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37CC4): reloca=
tion R_ARM_PREL31 out of range: 2135575668 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37C1C): reloca=
tion R_ARM_PREL31 out of range: 2135575836 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37C0C): reloca=
tion R_ARM_PREL31 out of range: 2135575852 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37BBC): reloca=
tion R_ARM_PREL31 out of range: 2135575932 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37BAC): reloca=
tion R_ARM_PREL31 out of range: 2135575948 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37B94): reloca=
tion R_ARM_PREL31 out of range: 2135575972 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37B7C): reloca=
tion R_ARM_PREL31 out of range: 2135575996 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37B4C): reloca=
tion R_ARM_PREL31 out of range: 2135576044 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37B1C): reloca=
tion R_ARM_PREL31 out of range: 2135576092 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37AD4): reloca=
tion R_ARM_PREL31 out of range: 2135576164 is not in [-1073741824, 10737418=
23]
    1    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x354A8): reloca=
tion R_ARM_PREL31 out of range: 2135520400 is not in [-1073741824, 10737418=
23]
    1    fpsimd.c:(.text+0x1f8): undefined reference to `sve_get_vl'
    1    fpsimd.c:(.text+0x198): undefined reference to `sve_get_vl'
    1    fpsimd.c:(.text+0x144): undefined reference to `sve_load_state'
    1    fpsimd.c:(.text+0x118): undefined reference to `sve_load_state'
    1    aarch64-linux-gnu-ld: fpsimd.c:(.text+0x230): undefined reference =
to `sve_save_state'
    1    aarch64-linux-gnu-ld: fpsimd.c:(.text+0x1f4): undefined reference =
to `sve_save_state'
    1    ERROR: modpost: Section mismatches detected.

Warnings summary:

    51   1 warning generated.
    29   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning=
: =E2=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-fu=
nction]
    16   kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=
=E2=80=99 defined but not used [-Wunused-function]
    8    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning=
: unused function 'dma_recycle_rx_skbufs' [-Wunused-function]
    6    drivers/net/ethernet/renesas/ravb_main.c:2088:6: warning: variable=
 'priv' is used uninitialized whenever 'if' condition is true [-Wsometimes-=
uninitialized]
    6    drivers/net/ethernet/renesas/ravb_main.c:2048:27: note: initialize=
 the variable 'priv' to silence this warning
    6    drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:425:11: warning: v=
ariable 'parent_name' is uninitialized when used here [-Wuninitialized]
    6    drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:385:30: note: init=
ialize the variable 'parent_name' to silence this warning
    6    arch/arm64/configs/defconfig:1018:warning: override: reassigning t=
o symbol MTK_PMIC_WRAP
    6    2 warnings generated.
    4    drivers/misc/habanalabs/goya/goya.c:142:14: warning: implicit conv=
ersion from enumeration type 'enum goya_pll_index' to different enumeration=
 type 'enum pll_index' [-Wenum-conversion]
    4    drivers/misc/habanalabs/goya/goya.c:141:15: warning: implicit conv=
ersion from enumeration type 'enum goya_pll_index' to different enumeration=
 type 'enum pll_index' [-Wenum-conversion]
    4    drivers/misc/habanalabs/goya/goya.c:140:14: warning: implicit conv=
ersion from enumeration type 'enum goya_pll_index' to different enumeration=
 type 'enum pll_index' [-Wenum-conversion]
    4    drivers/misc/habanalabs/goya/goya.c:139:14: warning: implicit conv=
ersion from enumeration type 'enum goya_pll_index' to different enumeration=
 type 'enum pll_index' [-Wenum-conversion]
    4    drivers/misc/habanalabs/goya/goya.c:138:13: warning: implicit conv=
ersion from enumeration type 'enum goya_pll_index' to different enumeration=
 type 'enum pll_index' [-Wenum-conversion]
    4    drivers/misc/habanalabs/goya/goya.c:137:13: warning: implicit conv=
ersion from enumeration type 'enum goya_pll_index' to different enumeration=
 type 'enum pll_index' [-Wenum-conversion]
    4    drivers/misc/habanalabs/goya/goya.c:136:14: warning: implicit conv=
ersion from enumeration type 'enum goya_pll_index' to different enumeration=
 type 'enum pll_index' [-Wenum-conversion]
    4    drivers/misc/habanalabs/gaudi/gaudi.c:135:13: warning: implicit co=
nversion from enumeration type 'enum gaudi_pll_index' to different enumerat=
ion type 'enum pll_index' [-Wenum-conversion]
    4    drivers/misc/habanalabs/gaudi/gaudi.c:134:14: warning: implicit co=
nversion from enumeration type 'enum gaudi_pll_index' to different enumerat=
ion type 'enum pll_index' [-Wenum-conversion]
    4    drivers/misc/habanalabs/gaudi/gaudi.c:133:14: warning: implicit co=
nversion from enumeration type 'enum gaudi_pll_index' to different enumerat=
ion type 'enum pll_index' [-Wenum-conversion]
    4    drivers/misc/habanalabs/gaudi/gaudi.c:132:15: warning: implicit co=
nversion from enumeration type 'enum gaudi_pll_index' to different enumerat=
ion type 'enum pll_index' [-Wenum-conversion]
    4    drivers/misc/habanalabs/gaudi/gaudi.c:131:14: warning: implicit co=
nversion from enumeration type 'enum gaudi_pll_index' to different enumerat=
ion type 'enum pll_index' [-Wenum-conversion]
    4    drivers/misc/habanalabs/gaudi/gaudi.c:130:14: warning: implicit co=
nversion from enumeration type 'enum gaudi_pll_index' to different enumerat=
ion type 'enum pll_index' [-Wenum-conversion]
    4    drivers/misc/habanalabs/gaudi/gaudi.c:129:14: warning: implicit co=
nversion from enumeration type 'enum gaudi_pll_index' to different enumerat=
ion type 'enum pll_index' [-Wenum-conversion]
    4    drivers/misc/habanalabs/gaudi/gaudi.c:128:15: warning: implicit co=
nversion from enumeration type 'enum gaudi_pll_index' to different enumerat=
ion type 'enum pll_index' [-Wenum-conversion]
    4    drivers/misc/habanalabs/gaudi/gaudi.c:127:14: warning: implicit co=
nversion from enumeration type 'enum gaudi_pll_index' to different enumerat=
ion type 'enum pll_index' [-Wenum-conversion]
    4    drivers/misc/habanalabs/gaudi/gaudi.c:126:14: warning: implicit co=
nversion from enumeration type 'enum gaudi_pll_index' to different enumerat=
ion type 'enum pll_index' [-Wenum-conversion]
    4    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.=
c:3015:53: warning: address of 'aconnector->mst_port->mst_mgr' will always =
evaluate to 'true' [-Wpointer-bool-conversion]
    4    7 warnings generated.
    4    10 warnings generated.
    3    drivers/platform/surface/surface_aggregator_registry.c:478:25: war=
ning: implicit conversion from 'int' to '__u8' (aka 'unsigned char') change=
s value from 65535 to 255 [-Wconstant-conversion]
    3    drivers/hid/surface-hid/surface_hid.c:233:25: warning: implicit co=
nversion from 'int' to '__u8' (aka 'unsigned char') changes value from 6553=
5 to 255 [-Wconstant-conversion]
    3    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: warning: implici=
t conversion from 'unsigned long long' to 'unsigned long' changes value fro=
m 5000000000 to 705032704 [-Wconstant-conversion]
    2    kernel/sched/fair.c:8428:13: warning: unused function 'update_nohz=
_stats' [-Wunused-function]
    2    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame=
 size of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    2    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/_modules_/lib/mod=
ules/5.12.0-rc7-next-20210415/kernel/drivers/media/tuners/tuner-types.ko: u=
nsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    2    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    2    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    #warning This code requires at least version 4.6 of GCC
    1    {standard input}:39: Warning: macro instruction expanded into mult=
iple instructions
    1    net/rose/rose_subr.o: warning: objtool: rose_write_internal() fall=
s through to next function rose_decode()
    1    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame siz=
e of 1304 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=
=3D]
    1    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame siz=
e of 1252 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=
=3D]
    1    fs/reiserfs/do_balan.o: warning: objtool: balance_leaf_when_delete=
()+0x114d: stack state mismatch: cfa1=3D4+184 cfa2=3D4+176
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 3344 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 3304 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 1828 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame siz=
e of 1208 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    1    drivers/staging/fbtft/fbtft-core.c:903:12: warning: stack frame si=
ze of 1072 bytes in function 'fbtft_init_display_from_property' [-Wframe-la=
rger-than=3D]
    1    drivers/pci/vpd.c:289:13: warning: =E2=80=98pci_vpd_set_size=E2=80=
=99 defined but not used [-Wunused-function]
    1    drivers/net/wireless/cisco/airo.c:3075:12: warning: stack frame si=
ze of 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1    drivers/net/ethernet/lantiq_etop.c:281:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unuse=
d_result [-Wunused-result]
    1    drivers/net/ethernet/lantiq_etop.c:273:4: warning: ignoring return=
 value of =E2=80=98request_irq=E2=80=99, declared with attribute warn_unuse=
d_result [-Wunused-result]
    1    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame =
size of 1064 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=
=3D]
    1    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack fra=
me size of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_prefault_relocations()+0xc6: stack state mismatch: cfa1=3D4+8 cfa2=3D-1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_prefault_relocations()+0xb8: stack state mismatch: cfa1=3D4+8 cfa2=3D-1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_copy_relocations()+0x259: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_copy_relocations()+0x249: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_c=
alc.c:997:6: warning: stack frame size of 1228 bytes in function 'dml1_rq_d=
lg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_=
calc_30.c:981:13: warning: stack frame size of 1068 bytes in function 'dml_=
rq_dlg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3393:6: warning: stack frame size of 1532 bytes in function 'dml21_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1463:13: warning: stack frame size of 1196 bytes in function 'DISPCL=
KDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation=
' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: warning: stack frame size of 1452 bytes in function 'dml20=
v2_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: warning: stack frame size of 1212 bytes in function 'dml2=
0v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceC=
alculation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: warning: stack frame size of 1436 bytes in function 'dml20_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: warning: stack frame size of 1228 bytes in function 'dml20_=
DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcu=
lation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:450:13:=
 warning: stack frame size of 1564 bytes in function 'dcn_bw_calc_rq_dlg_tt=
u' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: =
warning: stack frame size of 5536 bytes in function 'calculate_bandwidth' [=
-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3041:6:=
 warning: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-la=
rger-than=3D]
    1    crypto/wp512.c:782:13: warning: stack frame size of 1176 bytes in =
function 'wp512_process_buffer' [-Wframe-larger-than=3D]
    1    arch/arm/mach-omap1/board-h2.c:347:34: warning: =E2=80=98isp1301_g=
piod_table=E2=80=99 defined but not used [-Wunused-variable]
    1    arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=98am=
s_delta_camera_power=E2=80=99 defined but not used [-Wunused-function]
    1    .config:1201:warning: override: UNWINDER_GUESS changes choice state
    1    ./usr/include/linux/bcache.h:355:2: warning: field '' with variabl=
e sized type 'union jset::(anonymous at ./usr/include/linux/bcache.h:355:2)=
' not at the end of a struct or class is a GNU extension [-Wgnu-variable-si=
zed-type-not-at-end]
    1    ./usr/include/linux/bcache.h:354:2: warning: field '' with variabl=
e sized type 'union jset::(anonymous at ./usr/include/linux/bcache.h:354:2)=
' not at the end of a struct or class is a GNU extension [-Wgnu-variable-si=
zed-type-not-at-end]
    1    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width o=
f type [-Wshift-count-overflow]

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text+0x9edc): Section mismatch in ref=
erence from the function reserve_exception_space() to the function .meminit=
.text:memblock_reserve()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    kernel/gcov/clang.c:429:3: error: implicit declaration of function 'vfr=
ee' [-Werror,-Wimplicit-function-declaration]

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-11) =E2=80=94 PASS, 0 errors, 49 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame size of =
1252 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/misc/habanalabs/goya/goya.c:141:15: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:138:13: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:137:13: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:142:14: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:139:14: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:140:14: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:136:14: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    7 warnings generated.
    drivers/misc/habanalabs/gaudi/gaudi.c:129:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:128:15: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:135:13: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:134:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:133:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:132:15: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:131:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:130:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:127:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:126:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    10 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:301=
5:53: warning: address of 'aconnector->mst_port->mst_mgr' will always evalu=
ate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.
    drivers/platform/surface/surface_aggregator_registry.c:478:25: warning:=
 implicit conversion from 'int' to '__u8' (aka 'unsigned char') changes val=
ue from 65535 to 255 [-Wconstant-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:450:13: warn=
ing: stack frame size of 1564 bytes in function 'dcn_bw_calc_rq_dlg_ttu' [-=
Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/ethernet/renesas/ravb_main.c:2088:6: warning: variable 'pri=
v' is used uninitialized whenever 'if' condition is true [-Wsometimes-unini=
tialized]
    drivers/net/ethernet/renesas/ravb_main.c:2048:27: note: initialize the =
variable 'priv' to silence this warning
    1 warning generated.
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: unu=
sed function 'dma_recycle_rx_skbufs' [-Wunused-function]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c=
:997:6: warning: stack frame size of 1228 bytes in function 'dml1_rq_dlg_ge=
t_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_=
30.c:981:13: warning: stack frame size of 1068 bytes in function 'dml_rq_dl=
g_get_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1463:13: warning: stack frame size of 1196 bytes in function 'DISPCLKDPPC=
LKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-W=
frame-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: warning: stack frame size of 1228 bytes in function 'dml20_DISPC=
LKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculatio=
n' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: warning: stack frame size of 1212 bytes in function 'dml20v2_D=
ISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcul=
ation' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3393:6: warning: stack frame size of 1532 bytes in function 'dml21_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: warning: stack frame size of 1436 bytes in function 'dml20_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: warning: stack frame size of 1452 bytes in function 'dml20v2_Mo=
deSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    2 warnings generated.
    2 warnings generated.
    drivers/hid/surface-hid/surface_hid.c:233:25: warning: implicit convers=
ion from 'int' to '__u8' (aka 'unsigned char') changes value from 65535 to =
255 [-Wconstant-conversion]
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 1828 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mis=
matches

Errors:
    ERROR: modpost: "of_phandle_iterator_args" [drivers/iommu/mtk_iommu_v1.=
ko] undefined!

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    kernel/gcov/clang.c:429:3: error: implicit declaration of function 'vfr=
ee' [-Werror,-Wimplicit-function-declaration]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-10) =E2=80=94 FAIL, 1 error, 2 warnings, 0 section=
 mismatches

Errors:
    kernel/gcov/clang.c:429:3: error: implicit declaration of function 'vfr=
ee' [-Werror,-Wimplicit-function-declaration]

Warnings:
    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame size=
 of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-11) =E2=80=94 PASS, 0 errors, 37 warnings, 0 se=
ction mismatches

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
    fs/reiserfs/do_balan.o: warning: objtool: balance_leaf_when_delete()+0x=
114d: stack state mismatch: cfa1=3D4+184 cfa2=3D4+176
    net/rose/rose_subr.o: warning: objtool: rose_write_internal() falls thr=
ough to next function rose_decode()
    drivers/misc/habanalabs/goya/goya.c:141:15: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:138:13: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:137:13: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:142:14: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:139:14: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:140:14: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:136:14: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    7 warnings generated.
    drivers/misc/habanalabs/gaudi/gaudi.c:129:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:128:15: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:135:13: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:134:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:133:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:132:15: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:131:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:130:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:127:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:126:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    10 warnings generated.
    drivers/platform/surface/surface_aggregator_registry.c:478:25: warning:=
 implicit conversion from 'int' to '__u8' (aka 'unsigned char') changes val=
ue from 65535 to 255 [-Wconstant-conversion]
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 3304 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/net/ethernet/renesas/ravb_main.c:2088:6: warning: variable 'pri=
v' is used uninitialized whenever 'if' condition is true [-Wsometimes-unini=
tialized]
    drivers/net/ethernet/renesas/ravb_main.c:2048:27: note: initialize the =
variable 'priv' to silence this warning
    1 warning generated.
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: unu=
sed function 'dma_recycle_rx_skbufs' [-Wunused-function]
    1 warning generated.
    drivers/hid/surface-hid/surface_hid.c:233:25: warning: implicit convers=
ion from 'int' to '__u8' (aka 'unsigned char') changes value from 65535 to =
255 [-Wconstant-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:301=
5:53: warning: address of 'aconnector->mst_port->mst_mgr' will always evalu=
ate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    kernel/gcov/clang.c:429:3: error: implicit declaration of function 'vfr=
ee' [-Werror,-Wimplicit-function-declaration]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-11) =E2=80=94 FAIL, 1 error, 55 warnings, 0 sectio=
n mismatches

Errors:
    ERROR: modpost: "of_phandle_iterator_args" [drivers/iommu/mtk_iommu_v1.=
ko] undefined!

Warnings:
    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame size of =
1304 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
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
    drivers/misc/habanalabs/goya/goya.c:141:15: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:138:13: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:137:13: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:142:14: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:139:14: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:140:14: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:136:14: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    7 warnings generated.
    drivers/misc/habanalabs/gaudi/gaudi.c:129:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:128:15: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:135:13: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:134:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:133:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:132:15: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:131:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:130:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:127:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:126:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    10 warnings generated.
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/wireless/cisco/airo.c:3075:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:425:11: warning: variab=
le 'parent_name' is uninitialized when used here [-Wuninitialized]
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:385:30: note: initializ=
e the variable 'parent_name' to silence this warning
    1 warning generated.
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: warning: implicit con=
version from 'unsigned long long' to 'unsigned long' changes value from 500=
0000000 to 705032704 [-Wconstant-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:301=
5:53: warning: address of 'aconnector->mst_port->mst_mgr' will always evalu=
ate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3041:6: warn=
ing: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5536 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.
    drivers/staging/fbtft/fbtft-core.c:995:5: warning: stack frame size of =
1208 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    drivers/staging/fbtft/fbtft-core.c:903:12: warning: stack frame size of=
 1072 bytes in function 'fbtft_init_display_from_property' [-Wframe-larger-=
than=3D]
    2 warnings generated.
    drivers/net/ethernet/renesas/ravb_main.c:2088:6: warning: variable 'pri=
v' is used uninitialized whenever 'if' condition is true [-Wsometimes-unini=
tialized]
    drivers/net/ethernet/renesas/ravb_main.c:2048:27: note: initialize the =
variable 'priv' to silence this warning
    1 warning generated.
    drivers/mtd/chips/cfi_cmdset_0001.c:1871:12: warning: stack frame size =
of 1064 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: unu=
sed function 'dma_recycle_rx_skbufs' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-11) =E2=80=94 PASS, 0 errors, 35 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/misc/habanalabs/goya/goya.c:141:15: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:138:13: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:137:13: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:142:14: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:139:14: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:140:14: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/goya/goya.c:136:14: warning: implicit conversio=
n from enumeration type 'enum goya_pll_index' to different enumeration type=
 'enum pll_index' [-Wenum-conversion]
    7 warnings generated.
    drivers/misc/habanalabs/gaudi/gaudi.c:129:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:128:15: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:135:13: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:134:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:133:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:132:15: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:131:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:130:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:127:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    drivers/misc/habanalabs/gaudi/gaudi.c:126:14: warning: implicit convers=
ion from enumeration type 'enum gaudi_pll_index' to different enumeration t=
ype 'enum pll_index' [-Wenum-conversion]
    10 warnings generated.
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:425:11: warning: variab=
le 'parent_name' is uninitialized when used here [-Wuninitialized]
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:385:30: note: initializ=
e the variable 'parent_name' to silence this warning
    1 warning generated.
    drivers/platform/surface/surface_aggregator_registry.c:478:25: warning:=
 implicit conversion from 'int' to '__u8' (aka 'unsigned char') changes val=
ue from 65535 to 255 [-Wconstant-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_debugfs.c:301=
5:53: warning: address of 'aconnector->mst_port->mst_mgr' will always evalu=
ate to 'true' [-Wpointer-bool-conversion]
    1 warning generated.
    drivers/net/ethernet/renesas/ravb_main.c:2088:6: warning: variable 'pri=
v' is used uninitialized whenever 'if' condition is true [-Wsometimes-unini=
tialized]
    drivers/net/ethernet/renesas/ravb_main.c:2048:27: note: initialize the =
variable 'priv' to silence this warning
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 3344 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/hid/surface-hid/surface_hid.c:233:25: warning: implicit convers=
ion from 'int' to '__u8' (aka 'unsigned char') changes value from 65535 to =
255 [-Wconstant-conversion]
    1 warning generated.
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: unu=
sed function 'dma_recycle_rx_skbufs' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-11) =E2=80=94 FAIL, 3 errors, 2 warnings, 0 secti=
on mismatches

Errors:
    ld.lld: error: undefined symbol: sve_get_vl
    ld.lld: error: undefined symbol: sve_save_state
    ld.lld: error: undefined symbol: sve_load_state

Warnings:
    kernel/sched/fair.c:8428:13: warning: unused function 'update_nohz_stat=
s' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-10) =E2=80=94 FAIL, 3 errors, 2 warnings, 0 secti=
on mismatches

Errors:
    ld.lld: error: undefined symbol: sve_get_vl
    ld.lld: error: undefined symbol: sve_save_state
    ld.lld: error: undefined symbol: sve_load_state

Warnings:
    kernel/sched/fair.c:8428:13: warning: unused function 'update_nohz_stat=
s' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
allnoconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x9edc): Section mismatch in referenc=
e from the function reserve_exception_space() to the function .meminit.text=
:memblock_reserve()

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 FAIL, 3 errors, 1 warning, 0 section m=
ismatches

Errors:
    fpsimd.c:(.text+0x144): undefined reference to `sve_load_state'
    fpsimd.c:(.text+0x1f8): undefined reference to `sve_get_vl'
    aarch64-linux-gnu-ld: fpsimd.c:(.text+0x230): undefined reference to `s=
ve_save_state'

Warnings:
    kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

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
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-10) =E2=80=94 FAIL, 11 errors, 0 warnings, =
0 section mismatches

Errors:
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x354A8): relocation =
R_ARM_PREL31 out of range: 2135520400 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37AD4): relocation =
R_ARM_PREL31 out of range: 2135576164 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37B1C): relocation =
R_ARM_PREL31 out of range: 2135576092 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37B4C): relocation =
R_ARM_PREL31 out of range: 2135576044 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37B7C): relocation =
R_ARM_PREL31 out of range: 2135575996 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37B94): relocation =
R_ARM_PREL31 out of range: 2135575972 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37BAC): relocation =
R_ARM_PREL31 out of range: 2135575948 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37BBC): relocation =
R_ARM_PREL31 out of range: 2135575932 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37C0C): relocation =
R_ARM_PREL31 out of range: 2135575852 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37C1C): relocation =
R_ARM_PREL31 out of range: 2135575836 is not in [-1073741824, 1073741823]
    ld.lld: error: .tmp_vmlinux.kallsyms1:(.ARM.exidx+0x37CC4): relocation =
R_ARM_PREL31 out of range: 2135575668 is not in [-1073741824, 1073741823]

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
    kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

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
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

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
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    arch/arm64/configs/defconfig:1018:warning: override: reassigning to sym=
bol MTK_PMIC_WRAP
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 10 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm64/configs/defconfig:1018:warning: override: reassigning to sym=
bol MTK_PMIC_WRAP
    drivers/net/ethernet/renesas/ravb_main.c:2088:6: warning: variable 'pri=
v' is used uninitialized whenever 'if' condition is true [-Wsometimes-unini=
tialized]
    drivers/net/ethernet/renesas/ravb_main.c:2048:27: note: initialize the =
variable 'priv' to silence this warning
    1 warning generated.
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:425:11: warning: variab=
le 'parent_name' is uninitialized when used here [-Wuninitialized]
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:385:30: note: initializ=
e the variable 'parent_name' to silence this warning
    1 warning generated.
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: unu=
sed function 'dma_recycle_rx_skbufs' [-Wunused-function]
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/_modules_/lib/modules/=
5.12.0-rc7-next-20210415/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 2 warnings, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:1018:warning: override: reassigning to sym=
bol MTK_PMIC_WRAP
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-10) =E2=80=94 PASS, 0 er=
rors, 10 warnings, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:1018:warning: override: reassigning to sym=
bol MTK_PMIC_WRAP
    drivers/net/ethernet/renesas/ravb_main.c:2088:6: warning: variable 'pri=
v' is used uninitialized whenever 'if' condition is true [-Wsometimes-unini=
tialized]
    drivers/net/ethernet/renesas/ravb_main.c:2048:27: note: initialize the =
variable 'priv' to silence this warning
    1 warning generated.
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: unu=
sed function 'dma_recycle_rx_skbufs' [-Wunused-function]
    1 warning generated.
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:425:11: warning: variab=
le 'parent_name' is uninitialized when used here [-Wuninitialized]
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:385:30: note: initializ=
e the variable 'parent_name' to silence this warning
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/_modules_/lib/modules/=
5.12.0-rc7-next-20210415/kernel/drivers/media/tuners/tuner-types.ko: unsupp=
orted GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 2 warnings, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:1018:warning: override: reassigning to sym=
bol MTK_PMIC_WRAP
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 2 warnings, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:1018:warning: override: reassigning to sym=
bol MTK_PMIC_WRAP
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

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
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

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
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

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
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    {standard input}:39: Warning: macro instruction expanded into multiple =
instructions

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
multi_v5_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-11) =E2=80=94 PASS, 0 errors, 7 warnings, 0 =
section mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: unu=
sed function 'dma_recycle_rx_skbufs' [-Wunused-function]
    1 warning generated.
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:425:11: warning: variab=
le 'parent_name' is uninitialized when used here [-Wuninitialized]
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:385:30: note: initializ=
e the variable 'parent_name' to silence this warning
    1 warning generated.
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: warning: implicit con=
version from 'unsigned long long' to 'unsigned long' changes value from 500=
0000000 to 705032704 [-Wconstant-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 7 warnings, 0 =
section mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: unu=
sed function 'dma_recycle_rx_skbufs' [-Wunused-function]
    1 warning generated.
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:425:11: warning: variab=
le 'parent_name' is uninitialized when used here [-Wuninitialized]
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c:385:30: note: initializ=
e the variable 'parent_name' to silence this warning
    1 warning generated.
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: warning: implicit con=
version from 'unsigned long long' to 'unsigned long' changes value from 500=
0000000 to 705032704 [-Wconstant-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 1 warning, 0 section mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
    ./include/vdso/bits.h:7:26: warning: left shift count >=3D width of typ=
e [-Wshift-count-overflow]
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 =
warning, 0 section mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

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
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

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
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

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
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

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
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

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
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/pci/vpd.c:289:13: warning: =E2=80=98pci_vpd_set_size=E2=80=99 d=
efined but not used [-Wunused-function]

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
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

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
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
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
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1201:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
tinyconfig (arm64, gcc-8) =E2=80=94 FAIL, 3 errors, 1 warning, 0 section mi=
smatches

Errors:
    fpsimd.c:(.text+0x118): undefined reference to `sve_load_state'
    fpsimd.c:(.text+0x198): undefined reference to `sve_get_vl'
    aarch64-linux-gnu-ld: fpsimd.c:(.text+0x1f4): undefined reference to `s=
ve_save_state'

Warnings:
    kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

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
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]
    drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:1565:13: warning: =E2=
=80=98dma_recycle_rx_skbufs=E2=80=99 defined but not used [-Wunused-functio=
n]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]

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
efault_relocations()+0xb8: stack state mismatch: cfa1=3D4+8 cfa2=3D-1+0
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_co=
py_relocations()+0x259: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_pr=
efault_relocations()+0xc6: stack state mismatch: cfa1=3D4+8 cfa2=3D-1+0
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_co=
py_relocations()+0x249: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0

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
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/sched/fair.c:8428:13: warning: =E2=80=98update_nohz_stats=E2=80=
=99 defined but not used [-Wunused-function]
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

---
For more info write to <info@kernelci.org>
