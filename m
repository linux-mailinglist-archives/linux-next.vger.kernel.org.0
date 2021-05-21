Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586D038C254
	for <lists+linux-next@lfdr.de>; Fri, 21 May 2021 10:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbhEUI4i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 21 May 2021 04:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbhEUI4h (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 21 May 2021 04:56:37 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23599C061574
        for <linux-next@vger.kernel.org>; Fri, 21 May 2021 01:55:14 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d78so13561465pfd.10
        for <linux-next@vger.kernel.org>; Fri, 21 May 2021 01:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VWG2Xmfqr8TDA2+NgmCMMZ+Q/rj1FhZ5r3MDebjg1+A=;
        b=crPUh7SGoHmmhDqoAObgo19mcgwBF3xVHtuaF7DQqaJ3llvJHdGs16956Bj2mxEind
         unQ8HFIG2h2aEMP2rG3B7WfctR4XeSMFNWBlTkYKyu5M+6XAJb0rScxJL5yJ3phQxVsm
         mLjrdJ5PlmF0kbSnDB8M9gpGd+6J5NaOOv9L5TMIQiXA+AsljCh74yywU4RAAE5IGn05
         CEDZm2P5lW6VR5anBXxIdQW2Grmk/rXD0r7iPjGzU3QQ/4m0IX4AKZbCqKSUSD8j6+E+
         RiVvuuHX21gukGpWxDeb673VcIRylgUve7GyaHWIN2AMjVVQaE1mA1FLcRmRzB51rk17
         0NWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VWG2Xmfqr8TDA2+NgmCMMZ+Q/rj1FhZ5r3MDebjg1+A=;
        b=hjdRIbqop+InhiLi49IYnB3MBY/7l1yevCKDXI5wOf4X/azz/iYbwnlW4RpFkplXCw
         DrpSf/VkIfO6FLQ+dDiDQneJZ0AFcifNhkQvreEdwV2m7DGBlbf2nFRIIW1DjieatUzV
         Ny01DDARVAh1cocVLobcQfIYY8FIcmEpHVFWpLHPsFBav1HU/F6rtRJWyJlUslfmF7Cl
         azXSJiX7hQocE2VWU1tCUHmXUY0DhIDmEVK76jgLmoPOpdDAGncGQ56IxMsOv2ymaJbU
         aDuxqV3PFQQ9Z5+ISO9jgCaLu6sn1g90l31lT23M2Mr632UNGkz61Wy1Ud7UmzMWj+2X
         GGDw==
X-Gm-Message-State: AOAM531xEdH0uIT7Hu3ukB3GeqejbzYmfVVagX6CiYsF+rw/tAw+whBr
        5cX0kLnNYJhToo10kQt/ikink5sdoaMebovt
X-Google-Smtp-Source: ABdhPJztZqysJLl9AysDTjtjKWFppyNa7DdhiRyBWK1Rpu9qjNeUXJRdSiybQjfdyP5/lwFgLVhxVA==
X-Received: by 2002:a63:9c7:: with SMTP id 190mr8897336pgj.149.1621587311342;
        Fri, 21 May 2021 01:55:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y14sm3969801pgl.21.2021.05.21.01.55.10
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 01:55:10 -0700 (PDT)
Message-ID: <60a7756e.1c69fb81.76fe7.db4a@mx.google.com>
Date:   Fri, 21 May 2021 01:55:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210521
X-Kernelci-Branch: master
X-Kernelci-Report-Type: build
Subject: next/master build: 215 builds: 14 failed, 201 passed, 35 errors,
 1742 warnings (next-20210521)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 215 builds: 14 failed, 201 passed, 35 errors, 1742 warni=
ngs (next-20210521)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20210521/

Tree: next
Branch: master
Git Describe: next-20210521
Git Commit: 8dca2cd055ffb78b37f52f0bf0bd20c249619c4d
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
    allmodconfig: (clang-10) FAIL
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
    axs103_defconfig (gcc-8): 1 warning
    axs103_smp_defconfig (gcc-8): 1 warning
    haps_hs_smp_defconfig+kselftest (gcc-8): 1 error, 2 warnings
    hsdk_defconfig (gcc-8): 1 warning
    nsimosci_hs_smp_defconfig (gcc-8): 8 errors
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (clang-10): 15 warnings
    allmodconfig (clang-12): 10 warnings
    defconfig (gcc-8): 1 warning
    defconfig (clang-12): 2 warnings
    defconfig (clang-10): 3 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-8): 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-12): 2 warnings
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 1 warning
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-8): 1 warning

arm:
    allmodconfig (gcc-8): 2 errors, 2 warnings
    allmodconfig (clang-10): 2 errors, 41 warnings
    allmodconfig (clang-12): 2 errors, 41 warnings
    assabet_defconfig (gcc-8): 1 warning
    axm55xx_defconfig (gcc-8): 1 warning
    badge4_defconfig (gcc-8): 1 warning
    bcm2835_defconfig (gcc-8): 1 warning
    cerfcube_defconfig (gcc-8): 1 warning
    cm_x300_defconfig (gcc-8): 1 warning
    colibri_pxa270_defconfig (gcc-8): 1 warning
    colibri_pxa300_defconfig (gcc-8): 1 warning
    corgi_defconfig (gcc-8): 1 warning
    dove_defconfig (gcc-8): 1 warning
    ep93xx_defconfig (gcc-8): 1 warning
    eseries_pxa_defconfig (gcc-8): 1 warning
    exynos_defconfig (gcc-8): 1 warning
    ezx_defconfig (gcc-8): 1 warning
    footbridge_defconfig (gcc-8): 1 warning
    gemini_defconfig (gcc-8): 1 warning
    h3600_defconfig (gcc-8): 1 warning
    h5000_defconfig (gcc-8): 1 warning
    hackkit_defconfig (gcc-8): 1 warning
    hisi_defconfig (gcc-8): 1 warning
    imote2_defconfig (gcc-8): 1 warning
    imx_v6_v7_defconfig (gcc-8): 1 warning
    integrator_defconfig (gcc-8): 1 warning
    iop32x_defconfig (gcc-8): 1 warning
    ixp4xx_defconfig (gcc-8): 1 warning
    jornada720_defconfig (gcc-8): 1 warning
    lart_defconfig (gcc-8): 1 warning
    lpc32xx_defconfig (gcc-8): 1 warning
    lpd270_defconfig (gcc-8): 1 warning
    lubbock_defconfig (gcc-8): 1 warning
    magician_defconfig (gcc-8): 1 warning
    mainstone_defconfig (gcc-8): 1 warning
    milbeaut_m10v_defconfig (gcc-8): 1 warning
    mini2440_defconfig (gcc-8): 1 warning
    mmp2_defconfig (gcc-8): 1 warning
    multi_v4t_defconfig (gcc-8): 1 warning
    multi_v5_defconfig (clang-12): 2 warnings
    multi_v5_defconfig (gcc-8): 1 warning
    multi_v5_defconfig (clang-10): 2 warnings
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (clang-10): 4 warnings
    multi_v7_defconfig (clang-12): 4 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 1 warning
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-8): 1 warning
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-8): 1 warning
    multi_v7_defconfig+kselftest (gcc-8): 2 errors, 1 warning
    mvebu_v5_defconfig (gcc-8): 1 warning
    mvebu_v7_defconfig (gcc-8): 1 warning
    mxs_defconfig (gcc-8): 1 warning
    neponset_defconfig (gcc-8): 1 warning
    netwinder_defconfig (gcc-8): 1 warning
    omap1_defconfig (gcc-8): 2 warnings
    omap2plus_defconfig (gcc-8): 1 warning
    orion5x_defconfig (gcc-8): 1 warning
    oxnas_v6_defconfig (gcc-8): 1 warning
    palmz72_defconfig (gcc-8): 1 warning
    pxa168_defconfig (gcc-8): 1 warning
    pxa255-idp_defconfig (gcc-8): 1 warning
    pxa3xx_defconfig (gcc-8): 1 warning
    pxa910_defconfig (gcc-8): 1 warning
    pxa_defconfig (gcc-8): 1 warning
    qcom_defconfig (gcc-8): 1 warning
    rpc_defconfig (gcc-8): 1 warning
    s3c2410_defconfig (gcc-8): 1 warning
    s3c6400_defconfig (gcc-8): 1 warning
    s5pv210_defconfig (gcc-8): 1 warning
    shannon_defconfig (gcc-8): 1 warning
    shmobile_defconfig (gcc-8): 1 warning
    simpad_defconfig (gcc-8): 1 warning
    socfpga_defconfig (gcc-8): 1 warning
    spear13xx_defconfig (gcc-8): 1 warning
    spear3xx_defconfig (gcc-8): 1 warning
    spear6xx_defconfig (gcc-8): 1 warning
    spitz_defconfig (gcc-8): 1 warning
    sunxi_defconfig (gcc-8): 1 warning
    tegra_defconfig (gcc-8): 1 warning
    trizeps4_defconfig (gcc-8): 1 warning
    versatile_defconfig (gcc-8): 1 warning
    vexpress_defconfig (gcc-8): 1 warning
    vt8500_v6_v7_defconfig (gcc-8): 1 warning
    zeus_defconfig (gcc-8): 1 warning

i386:
    allmodconfig (clang-12): 2 errors, 34 warnings
    allmodconfig (clang-10): 2 errors, 32 warnings
    i386_defconfig+kselftest (gcc-8): 2 errors

mips:
    32r2el_defconfig (gcc-8): 2 warnings
    32r2el_defconfig+kselftest (gcc-8): 2 errors, 2 warnings
    ar7_defconfig (gcc-8): 1 warning
    ath25_defconfig (gcc-8): 1 warning
    ath79_defconfig (gcc-8): 1 warning
    bcm47xx_defconfig (gcc-8): 1 warning
    bigsur_defconfig (gcc-8): 1 warning
    capcella_defconfig (gcc-8): 1 warning
    cavium_octeon_defconfig (gcc-8): 1 warning
    ci20_defconfig (gcc-8): 2 warnings
    cobalt_defconfig (gcc-8): 1 warning
    cu1000-neo_defconfig (gcc-8): 2 warnings
    cu1830-neo_defconfig (gcc-8): 2 warnings
    db1xxx_defconfig (gcc-8): 2 warnings
    decstation_64_defconfig (gcc-8): 1 warning
    decstation_defconfig (gcc-8): 1 warning
    decstation_r4k_defconfig (gcc-8): 1 warning
    e55_defconfig (gcc-8): 1 warning
    gcw0_defconfig (gcc-8): 1 warning
    gpr_defconfig (gcc-8): 1 warning
    ip22_defconfig (gcc-8): 1 warning
    ip32_defconfig (gcc-8): 1 warning
    jazz_defconfig (gcc-8): 1 warning
    jmr3927_defconfig (gcc-8): 1 warning
    loongson1b_defconfig (gcc-8): 1 warning
    loongson1c_defconfig (gcc-8): 1 warning
    loongson2k_defconfig (gcc-8): 2 warnings
    loongson3_defconfig (gcc-8): 1 warning
    malta_defconfig (gcc-8): 1 warning
    malta_kvm_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 2 warnings
    maltaaprp_defconfig (gcc-8): 1 warning
    maltasmvp_defconfig (gcc-8): 1 warning
    maltasmvp_eva_defconfig (gcc-8): 1 warning
    maltaup_defconfig (gcc-8): 1 warning
    maltaup_xpa_defconfig (gcc-8): 1 warning
    mpc30x_defconfig (gcc-8): 1 warning
    mtx1_defconfig (gcc-8): 1 warning
    nlm_xlp_defconfig (gcc-8): 1 warning
    nlm_xlr_defconfig (gcc-8): 2 errors, 1 warning
    omega2p_defconfig (gcc-8): 2 warnings
    pic32mzda_defconfig (gcc-8): 1 warning
    pistachio_defconfig (gcc-8): 1 warning
    qi_lb60_defconfig (gcc-8): 1 warning
    rb532_defconfig (gcc-8): 1 warning
    rbtx49xx_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 2 warnings
    rs90_defconfig (gcc-8): 1 warning
    rt305x_defconfig (gcc-8): 1 warning
    sb1250_swarm_defconfig (gcc-8): 1 warning
    tb0219_defconfig (gcc-8): 1 warning
    tb0226_defconfig (gcc-8): 1 warning
    tb0287_defconfig (gcc-8): 1 warning
    vocore2_defconfig (gcc-8): 2 warnings
    workpad_defconfig (gcc-8): 1 warning

riscv:
    defconfig (gcc-8): 1 warning
    defconfig+CONFIG_EFI=3Dn (clang-12): 2 warnings
    defconfig+kselftest (gcc-8): 1 warning
    nommu_k210_defconfig (gcc-8): 630 warnings
    nommu_k210_sdcard_defconfig (gcc-8): 750 warnings
    rv32_defconfig (gcc-8): 7 warnings

x86_64:
    x86_64_defconfig (clang-10): 2 warnings

Errors summary:

    6    ERROR: modpost: "__divdi3" [fs/btrfs/btrfs.ko] undefined!
    5    ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!
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
    140  mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 de=
fined but not used [-Wunused-function]
    49   1 warning generated.
    16   2 warnings generated.
    12   mm/mmap_lock.c:157:20: warning: =E2=80=98get_mm_memcg_path=E2=80=
=99 defined but not used [-Wunused-function]
    6    sound/firewire/amdtp-stream.c:672:7: warning: variable 'err' is us=
ed uninitialized whenever 'if' condition is false [-Wsometimes-uninitialize=
d]
    6    sound/firewire/amdtp-stream.c:655:9: note: initialize the variable=
 'err' to silence this warning
    6    drivers/md/persistent-data/dm-space-map-metadata.c:435:6: warning:=
 variable 'r2' is used uninitialized whenever 'if' condition is true [-Wsom=
etimes-uninitialized]
    6    drivers/md/persistent-data/dm-space-map-metadata.c:431:11: note: i=
nitialize the variable 'r2' to silence this warning
    6    drivers/md/persistent-data/dm-space-map-metadata.c:418:7: warning:=
 variable 'r2' is used uninitialized whenever 'if' condition is false [-Wso=
metimes-uninitialized]
    6    drivers/md/persistent-data/dm-space-map-metadata.c:412:11: note: i=
nitialize the variable 'r2' to silence this warning
    5    mm/swapfile.c:1039:22: warning: unused function 'scan_swap_map' [-=
Wunused-function]
    4    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: warning: implici=
t conversion from 'unsigned long long' to 'unsigned long' changes value fro=
m 5000000000 to 705032704 [-Wconstant-conversion]
    4    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:333:1: warning: unused =
label 'exit' [-Wunused-label]
    4    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    4    4 warnings generated.
    4    #warning This code requires at least version 4.6 of GCC
    3    mm/mmap_lock.c:157:20: warning: unused function 'get_mm_memcg_path=
' [-Wunused-function]
    2    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame siz=
e of 1332 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=
=3D]
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
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: warning: stack frame size of 1420 bytes in function 'dml20_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:450:13:=
 warning: stack frame size of 1564 bytes in function 'dcn_bw_calc_rq_dlg_tt=
u' [-Wframe-larger-than=3D]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3041:6:=
 warning: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-la=
rger-than=3D]
    2    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame=
 size of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    2    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.13.0-rc2-next-20210521/kernel/drivers/media/tuners/tuner-types=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
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
    1    include/uapi/linux/byteorder/big_endian.h:32:50: warning: cast fro=
m pointer to integer of different size [-Wpointer-to-int-cast]
    1    drivers/staging/rtl8723bs/core/rtw_security.c:93:6: warning: stack=
 frame size of 1084 bytes in function 'rtw_wep_decrypt' [-Wframe-larger-tha=
n=3D]
    1    drivers/staging/rtl8723bs/core/rtw_security.c:93:6: warning: stack=
 frame size of 1080 bytes in function 'rtw_wep_decrypt' [-Wframe-larger-tha=
n=3D]
    1    drivers/staging/rtl8723bs/core/rtw_security.c:535:5: warning: stac=
k frame size of 1108 bytes in function 'rtw_tkip_decrypt' [-Wframe-larger-t=
han=3D]
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
k frame size of 1116 bytes in function 'rtw_tkip_encrypt' [-Wframe-larger-t=
han=3D]
    1    drivers/staging/rtl8723bs/core/rtw_security.c:462:5: warning: stac=
k frame size of 1112 bytes in function 'rtw_tkip_encrypt' [-Wframe-larger-t=
han=3D]
    1    drivers/staging/rtl8723bs/core/rtw_security.c:37:6: warning: stack=
 frame size of 1100 bytes in function 'rtw_wep_encrypt' [-Wframe-larger-tha=
n=3D]
    1    drivers/staging/rtl8723bs/core/rtw_security.c:37:6: warning: stack=
 frame size of 1092 bytes in function 'rtw_wep_encrypt' [-Wframe-larger-tha=
n=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 3328 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 3312 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 1828 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
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
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_relocate_parse_slow()+0x427: stack state mismatch: cfa1=3D4+120 cfa2=3D-=
1+0
    1    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: =
eb_copy_relocations()+0x1d5: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0
    1    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:333:1: warning: label =
=E2=80=98exit=E2=80=99 defined but not used [-Wunused-label]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_c=
alc.c:997:6: warning: stack frame size of 1196 bytes in function 'dml1_rq_d=
lg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_c=
alc.c:997:6: warning: stack frame size of 1180 bytes in function 'dml1_rq_d=
lg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_=
calc_30.c:981:13: warning: stack frame size of 1036 bytes in function 'dml_=
rq_dlg_get_dlg_params' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3393:6: warning: stack frame size of 1516 bytes in function 'dml21_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3393:6: warning: stack frame size of 1468 bytes in function 'dml21_M=
odeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1463:13: warning: stack frame size of 1148 bytes in function 'DISPCL=
KDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation=
' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1463:13: warning: stack frame size of 1132 bytes in function 'DISPCL=
KDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation=
' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: warning: stack frame size of 1436 bytes in function 'dml20=
v2_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: warning: stack frame size of 1420 bytes in function 'dml20=
v2_ModeSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: warning: stack frame size of 1196 bytes in function 'dml2=
0v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceC=
alculation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: warning: stack frame size of 1164 bytes in function 'dml2=
0v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceC=
alculation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: warning: stack frame size of 1196 bytes in function 'dml20_=
DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcu=
lation' [-Wframe-larger-than=3D]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: warning: stack frame size of 1180 bytes in function 'dml20_=
DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcu=
lation' [-Wframe-larger-than=3D]
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
ib/modules/5.13.0-rc2-next-20210521/kernel/sound/soc/intel/boards/snd-soc-i=
ntel-hda-dsp-common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.13.0-rc2-next-20210521/kernel/drivers/clk/keystone/pll.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.13.0-rc2-next-20210521/kernel/drivers/clk/keystone/gate.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.13.0-rc2-next-20210521/kernel/crypto/cast_common.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/build/_modules_/l=
ib/modules/5.13.0-rc2-next-20210521/kernel/crypto/chacha20poly1305.ko

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: =E2=80=98get_mm_memcg_path=E2=80=99 def=
ined but not used [-Wunused-function]
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnin=
gs, 0 section mismatches

Errors:
    ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!
    ERROR: modpost: "__divdi3" [fs/btrfs/btrfs.ko] undefined!

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section m=
ismatches

Errors:
    ERROR: modpost: "__aeabi_ldivmod" [fs/btrfs/btrfs.ko] undefined!
    ERROR: modpost: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!

Warnings:
    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:333:1: warning: label =E2=80=
=98exit=E2=80=99 defined but not used [-Wunused-label]
    include/uapi/linux/byteorder/big_endian.h:32:50: warning: cast from poi=
nter to integer of different size [-Wpointer-to-int-cast]

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-12) =E2=80=94 FAIL, 2 errors, 34 warnings, 0 sect=
ion mismatches

Errors:
    ERROR: modpost: "__divdi3" [fs/btrfs/btrfs.ko] undefined!
    ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!

Warnings:
    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame size of =
1332 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    sound/firewire/amdtp-stream.c:672:7: warning: variable 'err' is used un=
initialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    sound/firewire/amdtp-stream.c:655:9: note: initialize the variable 'err=
' to silence this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:333:1: warning: unused label=
 'exit' [-Wunused-label]
    1 warning generated.
    drivers/md/persistent-data/dm-space-map-metadata.c:418:7: warning: vari=
able 'r2' is used uninitialized whenever 'if' condition is false [-Wsometim=
es-uninitialized]
    drivers/md/persistent-data/dm-space-map-metadata.c:412:11: note: initia=
lize the variable 'r2' to silence this warning
    drivers/md/persistent-data/dm-space-map-metadata.c:435:6: warning: vari=
able 'r2' is used uninitialized whenever 'if' condition is true [-Wsometime=
s-uninitialized]
    drivers/md/persistent-data/dm-space-map-metadata.c:431:11: note: initia=
lize the variable 'r2' to silence this warning
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:450:13: warn=
ing: stack frame size of 1564 bytes in function 'dcn_bw_calc_rq_dlg_ttu' [-=
Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c=
:997:6: warning: stack frame size of 1196 bytes in function 'dml1_rq_dlg_ge=
t_dlg_params' [-Wframe-larger-than=3D]
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
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: warning: stack frame size of 1180 bytes in function 'dml20_DISPC=
LKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculatio=
n' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: warning: stack frame size of 1420 bytes in function 'dml20_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: warning: stack frame size of 1164 bytes in function 'dml20v2_D=
ISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcul=
ation' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1463:13: warning: stack frame size of 1132 bytes in function 'DISPCLKDPPC=
LKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-W=
frame-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: warning: stack frame size of 1420 bytes in function 'dml20v2_Mo=
deSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3393:6: warning: stack frame size of 1468 bytes in function 'dml21_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_=
30.c:981:13: warning: stack frame size of 1036 bytes in function 'dml_rq_dl=
g_get_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 1804 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-10) =E2=80=94 FAIL, 2 errors, 41 warnings, 0 secti=
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
    sound/firewire/amdtp-stream.c:672:7: warning: variable 'err' is used un=
initialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    sound/firewire/amdtp-stream.c:655:9: note: initialize the variable 'err=
' to silence this warning
    1 warning generated.
    drivers/md/persistent-data/dm-space-map-metadata.c:418:7: warning: vari=
able 'r2' is used uninitialized whenever 'if' condition is false [-Wsometim=
es-uninitialized]
    drivers/md/persistent-data/dm-space-map-metadata.c:412:11: note: initia=
lize the variable 'r2' to silence this warning
    drivers/md/persistent-data/dm-space-map-metadata.c:435:6: warning: vari=
able 'r2' is used uninitialized whenever 'if' condition is true [-Wsometime=
s-uninitialized]
    drivers/md/persistent-data/dm-space-map-metadata.c:431:11: note: initia=
lize the variable 'r2' to silence this warning
    2 warnings generated.
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/wireless/cisco/airo.c:3075:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:333:1: warning: unused label=
 'exit' [-Wunused-label]
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

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-10) =E2=80=94 FAIL, 2 errors, 32 warnings, 0 sect=
ion mismatches

Errors:
    ERROR: modpost: "__divdi3" [fs/btrfs/btrfs.ko] undefined!
    ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!

Warnings:
    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame size of =
1332 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.
    sound/firewire/amdtp-stream.c:672:7: warning: variable 'err' is used un=
initialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    sound/firewire/amdtp-stream.c:655:9: note: initialize the variable 'err=
' to silence this warning
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:333:1: warning: unused label=
 'exit' [-Wunused-label]
    1 warning generated.
    drivers/md/persistent-data/dm-space-map-metadata.c:418:7: warning: vari=
able 'r2' is used uninitialized whenever 'if' condition is false [-Wsometim=
es-uninitialized]
    drivers/md/persistent-data/dm-space-map-metadata.c:412:11: note: initia=
lize the variable 'r2' to silence this warning
    drivers/md/persistent-data/dm-space-map-metadata.c:435:6: warning: vari=
able 'r2' is used uninitialized whenever 'if' condition is true [-Wsometime=
s-uninitialized]
    drivers/md/persistent-data/dm-space-map-metadata.c:431:11: note: initia=
lize the variable 'r2' to silence this warning
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:450:13: warn=
ing: stack frame size of 1564 bytes in function 'dcn_bw_calc_rq_dlg_ttu' [-=
Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/rtl8723bs/core/rtw_security.c:37:6: warning: stack fram=
e size of 1100 bytes in function 'rtw_wep_encrypt' [-Wframe-larger-than=3D]
    drivers/staging/rtl8723bs/core/rtw_security.c:93:6: warning: stack fram=
e size of 1084 bytes in function 'rtw_wep_decrypt' [-Wframe-larger-than=3D]
    drivers/staging/rtl8723bs/core/rtw_security.c:462:5: warning: stack fra=
me size of 1116 bytes in function 'rtw_tkip_encrypt' [-Wframe-larger-than=
=3D]
    drivers/staging/rtl8723bs/core/rtw_security.c:535:5: warning: stack fra=
me size of 1108 bytes in function 'rtw_tkip_decrypt' [-Wframe-larger-than=
=3D]
    4 warnings generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 1828 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dml1_display_rq_dlg_calc.c=
:997:6: warning: stack frame size of 1180 bytes in function 'dml1_rq_dlg_ge=
t_dlg_params' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: warning: stack frame size of 1196 bytes in function 'dml20_DISPC=
LKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculatio=
n' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: warning: stack frame size of 1196 bytes in function 'dml20v2_D=
ISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcul=
ation' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1463:13: warning: stack frame size of 1148 bytes in function 'DISPCLKDPPC=
LKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-W=
frame-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: warning: stack frame size of 1420 bytes in function 'dml20_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: warning: stack frame size of 1436 bytes in function 'dml20v2_Mo=
deSupportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3393:6: warning: stack frame size of 1516 bytes in function 'dml21_ModeSu=
pportAndSystemConfigurationFull' [-Wframe-larger-than=3D]
    2 warnings generated.
    2 warnings generated.
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 15 warnings, 0 sec=
tion mismatches

Warnings:
    sound/firewire/amdtp-stream.c:672:7: warning: variable 'err' is used un=
initialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    sound/firewire/amdtp-stream.c:655:9: note: initialize the variable 'err=
' to silence this warning
    1 warning generated.
    drivers/md/persistent-data/dm-space-map-metadata.c:418:7: warning: vari=
able 'r2' is used uninitialized whenever 'if' condition is false [-Wsometim=
es-uninitialized]
    drivers/md/persistent-data/dm-space-map-metadata.c:412:11: note: initia=
lize the variable 'r2' to silence this warning
    drivers/md/persistent-data/dm-space-map-metadata.c:435:6: warning: vari=
able 'r2' is used uninitialized whenever 'if' condition is true [-Wsometime=
s-uninitialized]
    drivers/md/persistent-data/dm-space-map-metadata.c:431:11: note: initia=
lize the variable 'r2' to silence this warning
    2 warnings generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 3328 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc2-next-20210521/kernel/crypto/cast_common.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0x  STRIP   /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc2-next-20210521/kernel/crypto/chacha20poly1305.ko
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc2-next-20210521/kernel/drivers/clk/keystone/gate.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc2-next-20210521/kernel/drivers/clk/keystone/pll.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc2-next-20210521/kernel/drivers/media/tuners/tuner-types.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc2-next-20210521/kernel/sound/soc/intel/boards/snd-soc-intel-=
hda-dsp-common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-12) =E2=80=94 PASS, 0 errors, 10 warnings, 0 sec=
tion mismatches

Warnings:
    sound/firewire/amdtp-stream.c:672:7: warning: variable 'err' is used un=
initialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    sound/firewire/amdtp-stream.c:655:9: note: initialize the variable 'err=
' to silence this warning
    1 warning generated.
    drivers/md/persistent-data/dm-space-map-metadata.c:418:7: warning: vari=
able 'r2' is used uninitialized whenever 'if' condition is false [-Wsometim=
es-uninitialized]
    drivers/md/persistent-data/dm-space-map-metadata.c:412:11: note: initia=
lize the variable 'r2' to silence this warning
    drivers/md/persistent-data/dm-space-map-metadata.c:435:6: warning: vari=
able 'r2' is used uninitialized whenever 'if' condition is true [-Wsometime=
s-uninitialized]
    drivers/md/persistent-data/dm-space-map-metadata.c:431:11: note: initia=
lize the variable 'r2' to silence this warning
    2 warnings generated.
    drivers/staging/greybus/audio_topology.c:977:12: warning: stack frame s=
ize of 3312 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-larger-=
than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-12) =E2=80=94 FAIL, 2 errors, 41 warnings, 0 secti=
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
    crypto/wp512.c:782:13: warning: stack frame size of 1176 bytes in funct=
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
    sound/firewire/amdtp-stream.c:672:7: warning: variable 'err' is used un=
initialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    sound/firewire/amdtp-stream.c:655:9: note: initialize the variable 'err=
' to silence this warning
    1 warning generated.
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:333:1: warning: unused label=
 'exit' [-Wunused-label]
    1 warning generated.
    drivers/net/wireless/cisco/airo.c:3075:12: warning: stack frame size of=
 1056 bytes in function 'airo_thread' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/md/persistent-data/dm-space-map-metadata.c:418:7: warning: vari=
able 'r2' is used uninitialized whenever 'if' condition is false [-Wsometim=
es-uninitialized]
    drivers/md/persistent-data/dm-space-map-metadata.c:412:11: note: initia=
lize the variable 'r2' to silence this warning
    drivers/md/persistent-data/dm-space-map-metadata.c:435:6: warning: vari=
able 'r2' is used uninitialized whenever 'if' condition is true [-Wsometime=
s-uninitialized]
    drivers/md/persistent-data/dm-space-map-metadata.c:431:11: note: initia=
lize the variable 'r2' to silence this warning
    2 warnings generated.
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
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: warning: implicit con=
version from 'unsigned long long' to 'unsigned long' changes value from 500=
0000000 to 705032704 [-Wconstant-conversion]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3041:6: warn=
ing: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-larger-=
than=3D]
    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:77:13: warni=
ng: stack frame size of 5560 bytes in function 'calculate_bandwidth' [-Wfra=
me-larger-than=3D]
    2 warnings generated.
    drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: warning: stack frame size =
of 1064 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/staging/fbtft/fbtft-core.c:992:5: warning: stack frame size of =
1208 bytes in function 'fbtft_init_display' [-Wframe-larger-than=3D]
    drivers/staging/fbtft/fbtft-core.c:902:12: warning: stack frame size of=
 1080 bytes in function 'fbtft_init_display_from_property' [-Wframe-larger-=
than=3D]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
allnoconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

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
aspeed_g5_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

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
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: =E2=80=98get_mm_memcg_path=E2=80=99 def=
ined but not used [-Wunused-function]
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: =E2=80=98get_mm_memcg_path=E2=80=99 def=
ined but not used [-Wunused-function]
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: =E2=80=98get_mm_memcg_path=E2=80=99 def=
ined but not used [-Wunused-function]
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: =E2=80=98get_mm_memcg_path=E2=80=99 def=
ined but not used [-Wunused-function]
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 FAIL, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    mm/mmap_lock.c:157:20: warning: =E2=80=98get_mm_memcg_path=E2=80=99 def=
ined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: unused function 'get_mm_memcg_path' [-W=
unused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: unused function 'get_mm_memcg_path' [-W=
unused-function]
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc2-next-20210521/kernel/drivers/media/tuners/tuner-types.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 error=
s, 1 warning, 0 section mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: =E2=80=98get_mm_memcg_path=E2=80=99 def=
ined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-12) =E2=80=94 PASS, 0 er=
rors, 2 warnings, 0 section mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: unused function 'get_mm_memcg_path' [-W=
unused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: =E2=80=98get_mm_memcg_path=E2=80=99 def=
ined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-12) =E2=80=94 PASS, 0 errors, 2 warn=
ings, 0 section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: unused function 'scan_swap_map' [-Wunus=
ed-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: =E2=80=98get_mm_memcg_path=E2=80=99 def=
ined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

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
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

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
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: =E2=80=98get_mm_memcg_path=E2=80=99 def=
ined but not used [-Wunused-function]
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]
    {standard input}:39: Warning: macro instruction expanded into multiple =
instructions

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: unused function 'scan_swap_map' [-Wunus=
ed-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: unused function 'scan_swap_map' [-Wunus=
ed-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: unused function 'scan_swap_map' [-Wunus=
ed-function]
    1 warning generated.
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: warning: implicit con=
version from 'unsigned long long' to 'unsigned long' changes value from 500=
0000000 to 705032704 [-Wconstant-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: unused function 'scan_swap_map' [-Wunus=
ed-function]
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
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 1 warning, 0 section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 =
warning, 0 section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warni=
ng, 0 section mismatches

Errors:
    ERROR: modpost: "__aeabi_ldivmod" [fs/btrfs/btrfs.ko] undefined!
    ERROR: modpost: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sect=
ion mismatches

Errors:
    ERROR: modpost: "__udivdi3" [fs/btrfs/btrfs.ko] undefined!
    ERROR: modpost: "__divdi3" [fs/btrfs/btrfs.ko] undefined!

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

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
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: =E2=80=98get_mm_memcg_path=E2=80=99 def=
ined but not used [-Wunused-function]
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]
    drivers/block/paride/bpck.c:32: warning: "PC" redefined

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]
    <stdin>:834:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1131:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1515:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

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
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: =E2=80=98get_mm_memcg_path=E2=80=99 def=
ined but not used [-Wunused-function]
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_re=
locate_parse_slow()+0x427: stack state mismatch: cfa1=3D4+120 cfa2=3D-1+0
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_co=
py_relocations()+0x1d5: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0

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
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---
For more info write to <info@kernelci.org>
