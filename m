Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5162E38FDC6
	for <lists+linux-next@lfdr.de>; Tue, 25 May 2021 11:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbhEYJ2r (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 May 2021 05:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232132AbhEYJ2r (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 May 2021 05:28:47 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F465C061574
        for <linux-next@vger.kernel.org>; Tue, 25 May 2021 02:27:16 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id j21so755052pfj.6
        for <linux-next@vger.kernel.org>; Tue, 25 May 2021 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=swiDIthOPl05oDmOQ7xqO746bXKZ7N8TzjYLbCeZbEQ=;
        b=SGRMRbmYB3464YECpVHLvaaZv3E/ubwVNHmRfJcxYxHyfXzolvSnoUXOyLFOl9/80v
         YcSRmBLTO2yaF1Cb9Lakm+4tXt8nTqWt19ZJGPnl2yqhNeUa088xpGfmp9PXPTQuuiSu
         dC0ttfu1fvwgnTq9F7TgI0jHWnQZYSsAAtnp0SsKTiTg5JorXBgDbyif/fNZpcZQAk+1
         +L4DpODk+JDk1M2zK+lYWtFD4HJbYJW+Pe+5ILYL45P9oWcvuCne/t7Q/j3lIhLn3TZx
         kpDmGoHVpxEw3pZQK2TCQzkynX6pRPOU/QDio6d9TgWT+H3tS40Y8T4tA4Vuwsj6LbJc
         3CbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=swiDIthOPl05oDmOQ7xqO746bXKZ7N8TzjYLbCeZbEQ=;
        b=OypgoDGFPYv8FBUJ6+ndAaT73exsO0CUO/Ufa+s3obd2qsjH5s68VMGgwfZuS/UQ7B
         VfEaYWqB65qLqOMUp+iC77BFVOrDhkDQkqmFs3NQTkEVaFM/wDA7mKPpb986fV7S2nQK
         dRzG5d34As3GRYDC/PksU9iiqzOilllg4GzK66VBDat88zdig3vepkl3qYd3pexSq+wk
         32p4+cLHkDKaURZL5qEXcn84EjmlrT1biDUUSDfTU/AocuYrd56xT/CP+tm4fRSXwkRu
         kW1fCq3pNlTZoj3oBsD3aKT1uszEVq00MnuNjDajJfErI0C2QazzcXmP+AKOLnqcX44g
         imEQ==
X-Gm-Message-State: AOAM531DT1sFCWhjBy6Ib+Yejg3NawhmJbojgD8WfNrV58iLtAHfwg8h
        hNJHpjgwLdANQjxXgQlF026qfb4+6OjIyye0
X-Google-Smtp-Source: ABdhPJynvlVo4HvIqbsVdGboiAOH427wcoZ5EFcJ1eE5wTlXTq5JneAnS8G8C8SsheBZmbfK+kGBxg==
X-Received: by 2002:a63:fd44:: with SMTP id m4mr18501178pgj.396.1621934833624;
        Tue, 25 May 2021 02:27:13 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id w19sm12436569pfu.215.2021.05.25.02.27.12
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 02:27:12 -0700 (PDT)
Message-ID: <60acc2f0.1c69fb81.676fd.93b7@mx.google.com>
Date:   Tue, 25 May 2021 02:27:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210525
X-Kernelci-Branch: master
X-Kernelci-Report-Type: build
Subject: next/master build: 216 builds: 8 failed, 208 passed, 137 errors,
 329 warnings (next-20210525)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 216 builds: 8 failed, 208 passed, 137 errors, 329 warnin=
gs (next-20210525)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20210525/

Tree: next
Branch: master
Git Describe: next-20210525
Git Commit: 5d765451c2409e63563fa6a3e8005bd03ab9e82f
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arc:
    allnoconfig: (gcc-8) FAIL
    nsimosci_hs_smp_defconfig: (gcc-8) FAIL

mips:
    decstation_64_defconfig: (gcc-8) FAIL
    lemote2f_defconfig: (gcc-8) FAIL

riscv:
    defconfig+CONFIG_EFI=3Dn: (clang-12) FAIL
    defconfig: (gcc-8) FAIL
    defconfig+kselftest: (gcc-8) FAIL
    rv32_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 8 errors
    axs103_defconfig (gcc-8): 1 warning
    axs103_smp_defconfig (gcc-8): 1 warning
    haps_hs_smp_defconfig+kselftest (gcc-8): 2 warnings
    hsdk_defconfig (gcc-8): 1 warning
    nsimosci_hs_smp_defconfig (gcc-8): 8 errors
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (clang-10): 17 warnings
    allmodconfig (clang-12): 12 warnings
    defconfig (gcc-8): 1 warning
    defconfig (clang-12): 2 warnings
    defconfig (clang-10): 3 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-8): 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-10): 3 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-12): 2 warnings
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 1 warning
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-8): 1 warning

arm:
    allmodconfig (clang-10): 46 warnings
    allmodconfig (gcc-8): 1 warning
    allmodconfig (clang-12): 46 warnings
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
    multi_v5_defconfig (gcc-8): 1 warning
    multi_v5_defconfig (clang-12): 2 warnings
    multi_v5_defconfig (clang-10): 2 warnings
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (clang-12): 7 warnings
    multi_v7_defconfig (clang-10): 7 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-8): 1 warning
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-8): 1 warning
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-8): 1 warning
    multi_v7_defconfig+kselftest (gcc-8): 1 warning
    mvebu_v5_defconfig (gcc-8): 1 warning
    mvebu_v7_defconfig (gcc-8): 1 warning
    mxs_defconfig (gcc-8): 1 warning
    neponset_defconfig (gcc-8): 1 warning
    netwinder_defconfig (gcc-8): 1 warning
    omap1_defconfig (gcc-8): 1 warning
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
    allmodconfig (clang-12): 2 warnings
    i386_defconfig (clang-12): 2 warnings
    i386_defconfig (clang-10): 2 warnings

mips:
    32r2el_defconfig (gcc-8): 2 warnings
    32r2el_defconfig+kselftest (gcc-8): 2 warnings
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
    nlm_xlr_defconfig (gcc-8): 1 warning
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
    defconfig (gcc-8): 5 errors
    defconfig+CONFIG_EFI=3Dn (clang-12): 9 errors
    defconfig+kselftest (gcc-8): 77 errors
    rv32_defconfig (gcc-8): 30 errors, 13 warnings

x86_64:
    x86_64_defconfig (clang-12): 2 warnings
    x86_64_defconfig (clang-10): 4 warnings

Errors summary:

    92   arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =
=E2=80=98set_pmd_at=E2=80=99
    10   arch/riscv/include/asm/pgtable.h:525:9: error: incompatible types =
when returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =
=E2=80=98struct <anonymous>=E2=80=99} was expected
    10   arch/riscv/include/asm/pgtable.h:525:9: error: implicit declaratio=
n of function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
    9    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of 's=
et_pmd_at'
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

    138  mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 de=
fined but not used [-Wunused-function]
    41   1 warning generated.
    12   mm/mmap_lock.c:157:20: warning: =E2=80=98get_mm_memcg_path=E2=80=
=99 defined but not used [-Wunused-function]
    12   2 warnings generated.
    10   cc1: some warnings being treated as errors
    4    mm/swapfile.c:1039:22: warning: unused function 'scan_swap_map' [-=
Wunused-function]
    4    mm/mmap_lock.c:157:20: warning: unused function 'get_mm_memcg_path=
' [-Wunused-function]
    4    drivers/net/phy/motorcomm.c:83:2: warning: variable 'ge' is used u=
ninitialized whenever switch default is taken [-Wsometimes-uninitialized]
    4    drivers/net/phy/motorcomm.c:58:6: warning: variable 'ret' is used =
uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    4    drivers/net/phy/motorcomm.c:54:9: note: initialize the variable 'r=
et' to silence this warning
    4    drivers/net/phy/motorcomm.c:53:17: note: initialize the variable '=
ge' to silence this warning
    4    drivers/md/persistent-data/dm-space-map-metadata.c:435:6: warning:=
 variable 'r2' is used uninitialized whenever 'if' condition is true [-Wsom=
etimes-uninitialized]
    4    drivers/md/persistent-data/dm-space-map-metadata.c:431:11: note: i=
nitialize the variable 'r2' to silence this warning
    4    drivers/md/persistent-data/dm-space-map-metadata.c:418:7: warning:=
 variable 'r2' is used uninitialized whenever 'if' condition is false [-Wso=
metimes-uninitialized]
    4    drivers/md/persistent-data/dm-space-map-metadata.c:412:11: note: i=
nitialize the variable 'r2' to silence this warning
    4    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: warning: implici=
t conversion from 'unsigned long long' to 'unsigned long' changes value fro=
m 5000000000 to 705032704 [-Wconstant-conversion]
    4    drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:752:47: warning=
: variable 'adlp_dkl_phy_dp_ddi_trans_hbr2_hbr3' is not needed and will not=
 be emitted [-Wunneeded-internal-declaration]
    4    drivers/bus/ti-sysc.c:1398:13: warning: variable 'error' is used u=
ninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    4    drivers/bus/ti-sysc.c:1386:11: note: initialize the variable 'erro=
r' to silence this warning
    4    arch/arm/lib/xor-neon.c:30:2: warning: This code requires at least=
 version 4.6 of GCC [-W#warnings]
    4    #warning This code requires at least version 4.6 of GCC
    3    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.13.0-rc3-next-20210525/kernel/drivers/media/tuners/tuner-types=
.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
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
    2    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:333:1: warning: unused =
label 'exit' [-Wunused-label]
    2    drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dce_calcs.c:3041:6:=
 warning: stack frame size of 1384 bytes in function 'bw_calcs' [-Wframe-la=
rger-than=3D]
    2    drivers/firmware/tegra/bpmp-debugfs.c:321:16: warning: stack frame=
 size of 1264 bytes in function 'bpmp_debug_store' [-Wframe-larger-than=3D]
    2    4 warnings generated.
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
    1    drivers/staging/rtl8723bs/core/rtw_security.c:462:5: warning: stac=
k frame size of 1168 bytes in function 'rtw_tkip_encrypt' [-Wframe-larger-t=
han=3D]
    1    drivers/staging/rtl8723bs/core/rtw_security.c:462:5: warning: stac=
k frame size of 1160 bytes in function 'rtw_tkip_encrypt' [-Wframe-larger-t=
han=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 3328 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
rger-than=3D]
    1    drivers/staging/greybus/audio_topology.c:977:12: warning: stack fr=
ame size of 3312 bytes in function 'gbaudio_tplg_create_widget' [-Wframe-la=
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
    1    arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: =E2=80=98am=
s_delta_camera_power=E2=80=99 defined but not used [-Wunused-function]
    1    arch/arc/include/asm/perf_event.h:91:27: warning: =E2=80=98arc_pmu=
_ev_hw_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    1    arch/arc/include/asm/perf_event.h:126:23: warning: =E2=80=98arc_pm=
u_cache_map=E2=80=99 defined but not used [-Wunused-const-variable=3D]
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.13.0-rc3-next-20210525/kernel/sound/soc/intel/boards/snd-soc-i=
ntel-hda-dsp-common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.13.0-rc3-next-20210525/kernel/drivers/clk/keystone/pll.ko: uns=
upported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.13.0-rc3-next-20210525/kernel/drivers/clk/keystone/gate.ko: un=
supported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    1    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/l=
ib/modules/5.13.0-rc3-next-20210525/kernel/crypto/cast_common.ko: unsupport=
ed GNU_PROPERTY_TYPE (5) type: 0xc0000000
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
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: =E2=80=98get_mm_memcg_path=E2=80=99 def=
ined but not used [-Wunused-function]
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnin=
gs, 0 section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-10) =E2=80=94 PASS, 0 errors, 46 warnings, 0 secti=
on mismatches

Warnings:
    drivers/bus/ti-sysc.c:1398:13: warning: variable 'error' is used uninit=
ialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    drivers/bus/ti-sysc.c:1386:11: note: initialize the variable 'error' to=
 silence this warning
    1 warning generated.
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
    drivers/net/phy/motorcomm.c:58:6: warning: variable 'ret' is used unini=
tialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/net/phy/motorcomm.c:54:9: note: initialize the variable 'ret' t=
o silence this warning
    drivers/net/phy/motorcomm.c:83:2: warning: variable 'ge' is used uninit=
ialized whenever switch default is taken [-Wsometimes-uninitialized]
    drivers/net/phy/motorcomm.c:53:17: note: initialize the variable 'ge' t=
o silence this warning
    2 warnings generated.
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
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
    drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: warning: stack frame size =
of 1056 bytes in function 'cfi_intelext_writev' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c:975:48: warning: implicit con=
version from 'unsigned long long' to 'unsigned long' changes value from 500=
0000000 to 705032704 [-Wconstant-conversion]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-10) =E2=80=94 PASS, 0 errors, 17 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/net/phy/motorcomm.c:58:6: warning: variable 'ret' is used unini=
tialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/net/phy/motorcomm.c:54:9: note: initialize the variable 'ret' t=
o silence this warning
    drivers/net/phy/motorcomm.c:83:2: warning: variable 'ge' is used uninit=
ialized whenever switch default is taken [-Wsometimes-uninitialized]
    drivers/net/phy/motorcomm.c:53:17: note: initialize the variable 'ge' t=
o silence this warning
    2 warnings generated.
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
dules/5.13.0-rc3-next-20210525/kernel/crypto/cast_common.ko: unsupported GN=
U_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc3-next-20210525/kernel/drivers/clk/keystone/gate.ko: unsuppo=
rted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc3-next-20210525/kernel/drivers/clk/keystone/pll.ko: unsuppor=
ted GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc3-next-20210525/kernel/drivers/media/tuners/tuner-types.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc3-next-20210525/kernel/sound/soc/intel/boards/snd-soc-intel-=
hda-dsp-common.ko: unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:333:1: warning: label =E2=80=
=98exit=E2=80=99 defined but not used [-Wunused-label]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 46 warnings, 0 secti=
on mismatches

Warnings:
    drivers/bus/ti-sysc.c:1398:13: warning: variable 'error' is used uninit=
ialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    drivers/bus/ti-sysc.c:1386:11: note: initialize the variable 'error' to=
 silence this warning
    1 warning generated.
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
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: warning: stack frame si=
ze of 1040 bytes in function '__igt_reserve' [-Wframe-larger-than=3D]
    1 warning generated.
    drivers/net/phy/motorcomm.c:58:6: warning: variable 'ret' is used unini=
tialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/net/phy/motorcomm.c:54:9: note: initialize the variable 'ret' t=
o silence this warning
    drivers/net/phy/motorcomm.c:83:2: warning: variable 'ge' is used uninit=
ialized whenever switch default is taken [-Wsometimes-uninitialized]
    drivers/net/phy/motorcomm.c:53:17: note: initialize the variable 'ge' t=
o silence this warning
    2 warnings generated.
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
allmodconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    kernel/trace/trace_events_hist.c:4594:13: warning: stack frame size of =
1332 bytes in function 'hist_trigger_print_key' [-Wframe-larger-than=3D]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-12) =E2=80=94 PASS, 0 errors, 12 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/net/phy/motorcomm.c:58:6: warning: variable 'ret' is used unini=
tialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/net/phy/motorcomm.c:54:9: note: initialize the variable 'ret' t=
o silence this warning
    drivers/net/phy/motorcomm.c:83:2: warning: variable 'ge' is used uninit=
ialized whenever switch default is taken [-Wsometimes-uninitialized]
    drivers/net/phy/motorcomm.c:53:17: note: initialize the variable 'ge' t=
o silence this warning
    2 warnings generated.
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
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
allnoconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
defconfig (riscv, gcc-8) =E2=80=94 FAIL, 5 errors, 0 warnings, 0 section mi=
smatches

Errors:
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99

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
dules/5.13.0-rc3-next-20210525/kernel/drivers/media/tuners/tuner-types.ko: =
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
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-10) =E2=80=94 PASS, 0 er=
rors, 3 warnings, 0 section mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: unused function 'get_mm_memcg_path' [-W=
unused-function]
    1 warning generated.
    aarch64-linux-gnu-strip: warning: /tmp/kci/linux/build/_modules_/lib/mo=
dules/5.13.0-rc3-next-20210525/kernel/drivers/media/tuners/tuner-types.ko: =
unsupported GNU_PROPERTY_TYPE (5) type: 0xc0000000

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
defconfig+CONFIG_EFI=3Dn (riscv, clang-12) =E2=80=94 FAIL, 9 errors, 0 warn=
ings, 0 section mismatches

Errors:
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of 'set_pm=
d_at'
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of 'set_pm=
d_at'
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of 'set_pm=
d_at'
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of 'set_pm=
d_at'
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of 'set_pm=
d_at'
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of 'set_pm=
d_at'
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of 'set_pm=
d_at'
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of 'set_pm=
d_at'
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of 'set_pm=
d_at'

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    mm/mmap_lock.c:157:20: warning: =E2=80=98get_mm_memcg_path=E2=80=99 def=
ined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 FAIL, 77 errors, 0 warnings, 0=
 section mismatches

Errors:
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99

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
haps_hs_smp_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 wa=
rnings, 0 section mismatches

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
i386_defconfig (i386, clang-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:752:47: warning: var=
iable 'adlp_dkl_phy_dp_ddi_trans_hbr2_hbr3' is not needed and will not be e=
mitted [-Wunneeded-internal-declaration]
    1 warning generated.

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:752:47: warning: var=
iable 'adlp_dkl_phy_dp_ddi_trans_hbr2_hbr3' is not needed and will not be e=
mitted [-Wunneeded-internal-declaration]
    1 warning generated.

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

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
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

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
multi_v7_defconfig (arm, clang-12) =E2=80=94 PASS, 0 errors, 7 warnings, 0 =
section mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: unused function 'scan_swap_map' [-Wunus=
ed-function]
    1 warning generated.
    drivers/bus/ti-sysc.c:1398:13: warning: variable 'error' is used uninit=
ialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    drivers/bus/ti-sysc.c:1386:11: note: initialize the variable 'error' to=
 silence this warning
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
    mm/swapfile.c:1039:22: warning: unused function 'scan_swap_map' [-Wunus=
ed-function]
    1 warning generated.
    drivers/bus/ti-sysc.c:1398:13: warning: variable 'error' is used uninit=
ialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    drivers/bus/ti-sysc.c:1386:11: note: initialize the variable 'error' to=
 silence this warning
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
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

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
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    mm/swapfile.c:1039:22: warning: =E2=80=98scan_swap_map=E2=80=99 defined=
 but not used [-Wunused-function]

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
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
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
rv32_defconfig (riscv, gcc-8) =E2=80=94 FAIL, 30 errors, 13 warnings, 0 sec=
tion mismatches

Errors:
    arch/riscv/include/asm/pgtable.h:525:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:525:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:525:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:525:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:525:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:525:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:525:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:525:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:525:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:525:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:525:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:525:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:525:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:525:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:525:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:525:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:525:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:525:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99
    arch/riscv/include/asm/pgtable.h:525:9: error: implicit declaration of =
function =E2=80=98pfn_pmd=E2=80=99; did you mean =E2=80=98pfn_pgd=E2=80=99?=
 [-Werror=3Dimplicit-function-declaration]
    arch/riscv/include/asm/pgtable.h:525:9: error: incompatible types when =
returning type =E2=80=98int=E2=80=99 but =E2=80=98pmd_t=E2=80=99 {aka =E2=
=80=98struct <anonymous>=E2=80=99} was expected
    arch/riscv/include/asm/pgtable.h:579:20: error: redefinition of =E2=80=
=98set_pmd_at=E2=80=99

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
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
x86_64_defconfig (x86_64, clang-12) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:752:47: warning: var=
iable 'adlp_dkl_phy_dp_ddi_trans_hbr2_hbr3' is not needed and will not be e=
mitted [-Wunneeded-internal-declaration]
    1 warning generated.

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_re=
locate_parse_slow()+0x427: stack state mismatch: cfa1=3D4+120 cfa2=3D-1+0
    drivers/gpu/drm/i915/gem/i915_gem_execbuffer.o: warning: objtool: eb_co=
py_relocations()+0x1d5: stack state mismatch: cfa1=3D4+104 cfa2=3D-1+0
    drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:752:47: warning: var=
iable 'adlp_dkl_phy_dp_ddi_trans_hbr2_hbr3' is not needed and will not be e=
mitted [-Wunneeded-internal-declaration]
    1 warning generated.

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
