Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9A949D9D3
	for <lists+linux-next@lfdr.de>; Thu, 27 Jan 2022 06:07:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbiA0FHs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Jan 2022 00:07:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbiA0FHr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Jan 2022 00:07:47 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2952AC06161C
        for <linux-next@vger.kernel.org>; Wed, 26 Jan 2022 21:07:47 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id o64so1764603pjo.2
        for <linux-next@vger.kernel.org>; Wed, 26 Jan 2022 21:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=LW3fQUnTjQfMXoR4v9Yu4a/PB8IomGhR3prmxhd6vVw=;
        b=XjPPfHFxjr76GTZKpgWWNeZzx/GR0WFnS8m67nPOQIpQlA6QLd4H/dRC29JDgl1Co+
         GcoFm6sMkP4o12IlaN1+RkLg1hFsYgrOS+7afUDleh+eL31h1SjFALDEZH/U8GA7EmI9
         KBISvWxrMgcEDwm7uNYaxxoAZSKKt6pIECcIb/FCKORfZmTYfUmLdJQy9f8lWGkdMpEp
         ve/dGK/SuvceFov1KPKY/PS/SA8Dk2mWI39oP3UYlTFdl+Z6JZcxu2DcVrf8YG16Uame
         gwbKjyeDTU3/YQyELoZ6pLNr04M7nmpPAqdnG5WpmAwHvD0oUWLvCfyEsBrVe6jNIfed
         OT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=LW3fQUnTjQfMXoR4v9Yu4a/PB8IomGhR3prmxhd6vVw=;
        b=YjKxOGkVNddgGJlsuoMb500L4pWdeACXWuTRph15PskcKRUCFSEDrYn5UasEDrWXvg
         FrEe9892r12fihZrC0+7bhpkUKIn+aGKVOWHn9F60N4r8c7Tjff48I7utrDxt5rzTOYb
         Q2f1J8eLS8SkAHsY1xzaNjWmBQ8YAJHJGq3AxLyK/sNrPjtZ8sGJhDAgI6hAf7RYNmXR
         Frss3WPFtMRikteuvjgejfDH4wbKiDME4/l1mX53ePNmddeodrz0/CpDX7Skdrqx8wZd
         ZV/CcTa/1k+gL/Hnfzd20ge1HlCUgENMvB0AC18LT3SUf5rL+8JZTN90/Ku5eqO68UZv
         143w==
X-Gm-Message-State: AOAM5333O94K1WrUwivNP7uawJN18qfTkDNzoqInULMWyICg84E6HcYD
        I51983iFPqnSPUdhiGzhLZaYFKhdx9bgDCK0o40=
X-Google-Smtp-Source: ABdhPJx1RWFI+ToEBRAU3wO4msyE9QUQHogEPmLw1HTDMR0s/Dw2Sf0Hv2x7jjp/v9kEq6KKSRTO/g==
X-Received: by 2002:a17:902:9303:: with SMTP id bc3mr2200827plb.149.1643260064849;
        Wed, 26 Jan 2022 21:07:44 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id mm24sm923643pjb.20.2022.01.26.21.07.43
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 21:07:44 -0800 (PST)
Message-ID: <61f228a0.1c69fb81.7c76d.3bae@mx.google.com>
Date:   Wed, 26 Jan 2022 21:07:44 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220127
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master build: 200 builds: 16 failed, 184 passed, 38 errors,
 332 warnings (next-20220127)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 200 builds: 16 failed, 184 passed, 38 errors, 332 warnin=
gs (next-20220127)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220127/

Tree: next
Branch: master
Git Describe: next-20220127
Git Commit: 0eb96e2c58c03e79fc2ee833ba88bf9226986564
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm64:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL

arm:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL
    multi_v7_defconfig+kselftest: (gcc-10) FAIL
    qcom_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-14) FAIL
    i386_defconfig+kselftest: (gcc-10) FAIL

mips:
    32r2el_defconfig+kselftest: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    ip27_defconfig: (gcc-10) FAIL
    ip28_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error

arm64:
    allmodconfig (clang-14): 1 error
    allmodconfig (gcc-10): 2 errors, 4 warnings
    defconfig (clang-14): 3 warnings

arm:
    allmodconfig (clang-14): 6 errors, 15 warnings
    allmodconfig (gcc-10): 1 error, 4 warnings
    am200epdkit_defconfig (gcc-10): 4 warnings
    aspeed_g5_defconfig (clang-14): 10 warnings
    assabet_defconfig (gcc-10): 4 warnings
    at91_dt_defconfig (gcc-10): 4 warnings
    axm55xx_defconfig (gcc-10): 4 warnings
    badge4_defconfig (gcc-10): 4 warnings
    cm_x300_defconfig (gcc-10): 4 warnings
    colibri_pxa270_defconfig (gcc-10): 4 warnings
    colibri_pxa300_defconfig (gcc-10): 4 warnings
    collie_defconfig (gcc-10): 4 warnings
    corgi_defconfig (gcc-10): 4 warnings
    dove_defconfig (gcc-10): 4 warnings
    ep93xx_defconfig (gcc-10): 4 warnings
    eseries_pxa_defconfig (gcc-10): 4 warnings
    h3600_defconfig (gcc-10): 4 warnings
    h5000_defconfig (gcc-10): 4 warnings
    hackkit_defconfig (gcc-10): 4 warnings
    hisi_defconfig (gcc-10): 4 warnings
    imote2_defconfig (gcc-10): 4 warnings
    imx_v4_v5_defconfig (gcc-10): 4 warnings
    iop32x_defconfig (gcc-10): 4 warnings
    ixp4xx_defconfig (gcc-10): 4 warnings
    jornada720_defconfig (gcc-10): 4 warnings
    lart_defconfig (gcc-10): 4 warnings
    lpd270_defconfig (gcc-10): 4 warnings
    lubbock_defconfig (gcc-10): 4 warnings
    magician_defconfig (gcc-10): 4 warnings
    mainstone_defconfig (gcc-10): 4 warnings
    mini2440_defconfig (gcc-10): 4 warnings
    mmp2_defconfig (gcc-10): 4 warnings
    moxart_defconfig (gcc-10): 4 warnings
    multi_v7_defconfig (clang-14): 10 warnings
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 2 warnings
    multi_v7_defconfig+kselftest (gcc-10): 1 error
    mvebu_v5_defconfig (gcc-10): 4 warnings
    mvebu_v7_defconfig (gcc-10): 4 warnings
    mxs_defconfig (gcc-10): 4 warnings
    neponset_defconfig (gcc-10): 4 warnings
    netwinder_defconfig (gcc-10): 4 warnings
    omap1_defconfig (gcc-10): 4 warnings
    orion5x_defconfig (gcc-10): 4 warnings
    palmz72_defconfig (gcc-10): 4 warnings
    pcm027_defconfig (gcc-10): 4 warnings
    pleb_defconfig (gcc-10): 4 warnings
    pxa168_defconfig (gcc-10): 4 warnings
    pxa255-idp_defconfig (gcc-10): 4 warnings
    pxa3xx_defconfig (gcc-10): 4 warnings
    pxa910_defconfig (gcc-10): 4 warnings
    pxa_defconfig (gcc-10): 4 warnings
    qcom_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors
    s3c2410_defconfig (gcc-10): 4 warnings
    s3c6400_defconfig (gcc-10): 4 warnings
    s5pv210_defconfig (gcc-10): 4 warnings
    sama5_defconfig (gcc-10): 4 warnings
    shannon_defconfig (gcc-10): 4 warnings
    simpad_defconfig (gcc-10): 4 warnings
    socfpga_defconfig (gcc-10): 4 warnings
    spear13xx_defconfig (gcc-10): 4 warnings
    spear3xx_defconfig (gcc-10): 4 warnings
    spear6xx_defconfig (gcc-10): 4 warnings
    tct_hammer_defconfig (gcc-10): 4 warnings
    trizeps4_defconfig (gcc-10): 4 warnings
    viper_defconfig (gcc-10): 4 warnings
    vt8500_v6_v7_defconfig (gcc-10): 4 warnings
    xcep_defconfig (gcc-10): 4 warnings
    zeus_defconfig (gcc-10): 4 warnings

i386:
    allmodconfig (clang-14): 14 errors, 4 warnings
    i386_defconfig+kselftest (gcc-10): 1 error

mips:
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 error, 2 warnings
    ci20_defconfig (gcc-10): 1 warning
    fuloong2e_defconfig (gcc-10): 1 error
    gcw0_defconfig (gcc-10): 1 warning
    mtx1_defconfig (gcc-10): 3 warnings

riscv:

x86_64:
    allmodconfig (gcc-10): 2 errors
    allmodconfig (clang-14): 4 errors, 26 warnings
    x86_64_defconfig+debug (gcc-10): 2 warnings

Errors summary:

    8    include/linux/fortify-string.h:316:4: error: call to __write_overf=
low_field declared with 'warning' attribute: detected write beyond size of =
field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warni=
ng]
    3    include/linux/fortify-string.h:230:4: error: call to __write_overf=
low_field declared with 'warning' attribute: detected write beyond size of =
field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warni=
ng]
    3    ERROR: modpost: "__umoddi3" [fs/btrfs/btrfs.ko] undefined!
    2    include/linux/fortify-string.h:98:19: error: initializer element i=
s not constant
    2    ERROR: modpost: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!
    2    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h=
:2500:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or d=
irectory
    1    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame=
 size (1040) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-large=
r-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_=
calc_31.c:939:13: error: stack frame size (1404) exceeds limit (1024) in 'd=
ml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_=
calc_30.c:981:13: error: stack frame size (1148) exceeds limit (1024) in 'd=
ml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_=
calc_21.c:829:13: error: stack frame size (1084) exceeds limit (1024) in 'd=
ml_rq_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:3518:6: error: stack frame size (1308) exceeds limit (1024) in 'dml2=
1_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vb=
a_21.c:1466:13: error: stack frame size (1292) exceeds limit (1024) in 'DIS=
PCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculat=
ion' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:3393:6: error: stack frame size (1564) exceeds limit (1024) in 'dm=
l20v2_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20v2.c:1145:13: error: stack frame size (1356) exceeds limit (1024) in 'd=
ml20v2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman=
ceCalculation' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:3286:6: error: stack frame size (1596) exceeds limit (1024) in 'dml2=
0_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vb=
a_20.c:1085:13: error: stack frame size (1436) exceeds limit (1024) in 'dml=
20_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCa=
lculation' [-Werror,-Wframe-larger-than]
    1    drivers/firmware/xilinx/zynqmp-debug.c:34:2: error: initializer el=
ement is not a compile-time constant
    1    crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limi=
t (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
    1    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    1    arch/x86/include/asm/checksum_32.h:149:6: error: inline assembly r=
equires more registers than available
    1    arch/arm/lib/xor-neon.c:30:2: error: This code requires at least v=
ersion 4.6 of GCC [-Werror,-W#warnings]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: und=
efined reference to `drm_panel_dp_aux_backlight'

Warnings summary:

    61   arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is ou=
tside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 =
[-Warray-bounds]
    61   arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is ou=
tside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 =
[-Warray-bounds]
    61   arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknow=
n> is outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=
=E2=80=99 [-Warray-bounds]
    61   arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknow=
n> is outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=
=E2=80=99 [-Warray-bounds]
    24   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    3    sound/pci/ca0106/ca0106.h:62: warning: "PTR" redefined
    2    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    7 | #warning "Please consider updating your code"
    2    6 | #warning "Support for features provided by this header has bee=
n removed"
    2    ./usr/include/linux/cyclades.h:7:2: warning: #warning "Please cons=
ider updating your code" [-Wcpp]
    2    ./usr/include/linux/cyclades.h:6:2: warning: #warning "Support for=
 features provided by this header has been removed" [-Wcpp]
    1    warning: unsafe strlcpy() usage lacked '__write_overflow' symbol i=
n ../lib/test_fortify/write_overflow-strlcpy.c
    1    warning: unsafe strlcpy() usage lacked '__write_overflow' symbol i=
n ../lib/test_fortify/write_overflow-strlcpy-src.c
    1    warning: unsafe strcpy() usage lacked '__write_overflow' symbol in=
 ../lib/test_fortify/write_overflow-strcpy.c
    1    warning: unsafe strcpy() usage lacked '__write_overflow' symbol in=
 ../lib/test_fortify/write_overflow-strcpy-lit.c
    1    vmlinux.o: warning: objtool: vc_switch_off_ist()+0x8a: call to mem=
cpy() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() le=
aves .noinstr.text section
    1    vmlinux.o: warning: objtool: mce_start()+0x44: call to __kasan_che=
ck_write() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: mce_severity_amd()+0x5e: call to mce_=
severity_amd_smca() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: mce_read_aux()+0x4b: call to mca_msr_=
reg() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: in_task_stack()+0xc: call to task_sta=
ck_page() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_en=
try_stack() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: fixup_bad_iret()+0x32: call to memset=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_syscall_64()+0x44: call to memset(=
) leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_machine_check()+0x137: call to mce=
_no_way_out() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_int80_syscall_32()+0x52: call to m=
emset() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_put_ghcb()+0x35: call to memcpy=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_get_ghcb()+0xa0: call to memcpy=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x5a: call to=
 ghcb_set_sw_exit_code() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x52: call to =
memset() leaves .noinstr.text section
    1    lib/test_printf.c:247: warning: "PTR" redefined
    1    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x5d: call to=
 do_strnlen_user() with UACCESS enabled
    1    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8=
a: call to do_strncpy_from_user() with UACCESS enabled
    1    include/asm-generic/unaligned.h:14:8: warning: array subscript -1 =
is outside array bounds of =E2=80=98unsigned char[1]=E2=80=99 [-Warray-boun=
ds]
    1    fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely=
()+0x7fd: stack state mismatch: cfa1=3D4+240 cfa2=3D4+232
    1    drivers/video/fbdev/udlfb.o: warning: objtool: dlfb_ops_write() fa=
lls through to next function dlfb_ops_setcolreg()
    1    drivers/video/fbdev/smscufx.o: warning: objtool: ufx_ops_write() f=
alls through to next function ufx_ops_setcolreg()
    1    drivers/usb/dwc3/dwc3-xilinx.c:122:6: warning: variable 'ret' is u=
sed uninitialized whenever 'if' condition is true [-Wsometimes-uninitialize=
d]
    1    drivers/usb/dwc3/dwc3-xilinx.c:102:11: note: initialize the variab=
le 'ret' to silence this warning
    1    drivers/soc/qcom/rpmh-rsc.o: warning: objtool: rpmh_rsc_write_ctrl=
_data() falls through to next function trace_raw_output_rpmh_tx_done()
    1    drivers/gpu/drm/radeon/sumo_dpm.o: warning: objtool: sumo_dpm_set_=
power_state() falls through to next function sumo_dpm_post_set_power_state()
    1    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls t=
hrough to next function startup_64_setup_env()
    1    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit=
_address_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name shou=
ld not have leading "0x"
    1    arch/arm/mach-vexpress/spc.c:592:18: warning: array subscript -1 i=
s below array bounds of =E2=80=98bool[2]=E2=80=99 {aka =E2=80=98_Bool[2]=E2=
=80=99} [-Warray-bounds]
    1    arch/arm/mach-vexpress/spc.c:583:21: warning: array subscript -1 i=
s below array bounds of =E2=80=98bool[2]=E2=80=99 {aka =E2=80=98_Bool[2]=E2=
=80=99} [-Warray-bounds]
    1    2 warnings generated.
    1    1 warning generated.
    1    ./usr/include/linux/cyclades.h:7:2: warning: "Please consider upda=
ting your code" [-W#warnings]
    1    ./usr/include/linux/cyclades.h:6:2: warning: "Support for features=
 provided by this header has been removed" [-W#warnings]
    1    #warning This code requires at least version 4.6 of GCC
    1    #warning "Support for features provided by this header has been re=
moved"
    1    #warning "Please consider updating your code"

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text+0x156157): Section mismatch in r=
eference from the function __next_node() to the variable .init.data:numa_no=
des_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x1560e2): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x1560ce): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 FAIL, 1 error, 2 warnin=
gs, 0 section mismatches

Errors:
    ERROR: modpost: "__umoddi3" [fs/btrfs/btrfs.ko] undefined!

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    lib/test_printf.c:247: warning: "PTR" redefined

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h:2500=
:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or direct=
ory
    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h:2500=
:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or direct=
ory

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-14) =E2=80=94 FAIL, 6 errors, 15 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/lib/xor-neon.c:30:2: error: This code requires at least versio=
n 4.6 of GCC [-Werror,-W#warnings]
    crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (10=
24) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size=
 (1040) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-tha=
n]
    include/linux/fortify-string.h:230:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    include/linux/fortify-string.h:316:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    include/linux/fortify-string.h:316:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    #warning This code requires at least version 4.6 of GCC

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-14) =E2=80=94 FAIL, 14 errors, 4 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/fortify-string.h:230:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    include/linux/fortify-string.h:316:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    include/linux/fortify-string.h:316:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    arch/x86/include/asm/checksum_32.h:149:6: error: inline assembly requir=
es more registers than available
    include/linux/fortify-string.h:316:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_=
21.c:829:13: error: stack frame size (1084) exceeds limit (1024) in 'dml_rq=
_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_=
30.c:981:13: error: stack frame size (1148) exceeds limit (1024) in 'dml_rq=
_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_=
31.c:939:13: error: stack frame size (1404) exceeds limit (1024) in 'dml_rq=
_dlg_get_dlg_params' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:1085:13: error: stack frame size (1436) exceeds limit (1024) in 'dml20_DI=
SPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalcula=
tion' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:1145:13: error: stack frame size (1356) exceeds limit (1024) in 'dml20v=
2_DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCal=
culation' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:1466:13: error: stack frame size (1292) exceeds limit (1024) in 'DISPCLKD=
PPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' =
[-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20.=
c:3286:6: error: stack frame size (1596) exceeds limit (1024) in 'dml20_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn20/display_mode_vba_20v=
2.c:3393:6: error: stack frame size (1564) exceeds limit (1024) in 'dml20v2=
_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_mode_vba_21.=
c:3518:6: error: stack frame size (1308) exceeds limit (1024) in 'dml21_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]

Warnings:
    warning: unsafe strcpy() usage lacked '__write_overflow' symbol in ../l=
ib/test_fortify/write_overflow-strcpy-lit.c
    warning: unsafe strcpy() usage lacked '__write_overflow' symbol in ../l=
ib/test_fortify/write_overflow-strcpy.c
    warning: unsafe strlcpy() usage lacked '__write_overflow' symbol in ../=
lib/test_fortify/write_overflow-strlcpy-src.c
    warning: unsafe strlcpy() usage lacked '__write_overflow' symbol in ../=
lib/test_fortify/write_overflow-strlcpy.c

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-14) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/firmware/xilinx/zynqmp-debug.c:34:2: error: initializer element=
 is not a compile-time constant

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-14) =E2=80=94 FAIL, 4 errors, 26 warnings, 0 se=
ction mismatches

Errors:
    include/linux/fortify-string.h:316:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    include/linux/fortify-string.h:316:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    include/linux/fortify-string.h:230:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    include/linux/fortify-string.h:316:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]

Warnings:
    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls throug=
h to next function startup_64_setup_env()
    ./usr/include/linux/cyclades.h:6:2: warning: "Support for features prov=
ided by this header has been removed" [-W#warnings]
    #warning "Support for features provided by this header has been removed"
    ./usr/include/linux/cyclades.h:7:2: warning: "Please consider updating =
your code" [-W#warnings]
    #warning "Please consider updating your code"
    2 warnings generated.
    vmlinux.o: warning: objtool: do_syscall_64()+0x44: call to memset() lea=
ves .noinstr.text section
    vmlinux.o: warning: objtool: do_int80_syscall_32()+0x52: call to memset=
() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x52: call to memse=
t() leaves .noinstr.text section
    vmlinux.o: warning: objtool: sync_regs()+0x20: call to memcpy() leaves =
.noinstr.text section
    vmlinux.o: warning: objtool: vc_switch_off_ist()+0x8a: call to memcpy()=
 leaves .noinstr.text section
    vmlinux.o: warning: objtool: fixup_bad_iret()+0x32: call to memset() le=
aves .noinstr.text section
    vmlinux.o: warning: objtool: in_task_stack()+0xc: call to task_stack_pa=
ge() leaves .noinstr.text section
    vmlinux.o: warning: objtool: in_entry_stack()+0x10: call to cpu_entry_s=
tack() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_read_aux()+0x4b: call to mca_msr_reg()=
 leaves .noinstr.text section
    vmlinux.o: warning: objtool: do_machine_check()+0x137: call to mce_no_w=
ay_out() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_start()+0x44: call to __kasan_check_wr=
ite() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_severity_amd()+0x5e: call to mce_sever=
ity_amd_smca() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x5a: call to ghcb=
_set_sw_exit_code() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_get_ghcb()+0xa0: call to memcpy() le=
aves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_put_ghcb()+0x35: call to memcpy() le=
aves .noinstr.text section
    fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely()+0x=
7fd: stack state mismatch: cfa1=3D4+240 cfa2=3D4+232
    drivers/soc/qcom/rpmh-rsc.o: warning: objtool: rpmh_rsc_write_ctrl_data=
() falls through to next function trace_raw_output_rpmh_tx_done()
    drivers/video/fbdev/udlfb.o: warning: objtool: dlfb_ops_write() falls t=
hrough to next function dlfb_ops_setcolreg()
    drivers/video/fbdev/smscufx.o: warning: objtool: ufx_ops_write() falls =
through to next function ufx_ops_setcolreg()
    drivers/gpu/drm/radeon/sumo_dpm.o: warning: objtool: sumo_dpm_set_power=
_state() falls through to next function sumo_dpm_post_set_power_state()

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x1560ce): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x1560e2): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x156157): Section mismatch in refere=
nce from the function __next_node() to the variable .init.data:numa_nodes_p=
arsed

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 FAIL, 2 errors, 4 warnings, 0 sectio=
n mismatches

Errors:
    include/linux/fortify-string.h:98:19: error: initializer element is not=
 constant
    include/linux/fortify-string.h:98:19: error: initializer element is not=
 constant

Warnings:
    ./usr/include/linux/cyclades.h:6:2: warning: #warning "Support for feat=
ures provided by this header has been removed" [-Wcpp]
    6 | #warning "Support for features provided by this header has been rem=
oved"
    ./usr/include/linux/cyclades.h:7:2: warning: #warning "Please consider =
updating your code" [-Wcpp]
    7 | #warning "Please consider updating your code"

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 4 warnings, 0 section m=
ismatches

Errors:
    ERROR: modpost: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!

Warnings:
    ./usr/include/linux/cyclades.h:6:2: warning: #warning "Support for feat=
ures provided by this header has been removed" [-Wcpp]
    6 | #warning "Support for features provided by this header has been rem=
oved"
    ./usr/include/linux/cyclades.h:7:2: warning: #warning "Please consider =
updating your code" [-Wcpp]
    7 | #warning "Please consider updating your code"

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 10 warnings, =
0 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit_addr=
ess_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name should no=
t have leading "0x"

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-14) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    drivers/usb/dwc3/dwc3-xilinx.c:122:6: warning: variable 'ret' is used u=
ninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    drivers/usb/dwc3/dwc3-xilinx.c:102:11: note: initialize the variable 'r=
et' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-14) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/asm-generic/unaligned.h:14:8: warning: array subscript -1 is ou=
tside array bounds of =E2=80=98unsigned char[1]=E2=80=99 [-Warray-bounds]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 FAIL, 1 error, 0 wa=
rnings, 0 section mismatches

Errors:
    ERROR: modpost: "__umoddi3" [fs/btrfs/btrfs.ko] undefined!

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings=
, 0 section mismatches

Errors:
    ERROR: modpost: "__umoddi3" [fs/btrfs/btrfs.ko] undefined!

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    sound/pci/ca0106/ca0106.h:62: warning: "PTR" redefined
    sound/pci/ca0106/ca0106.h:62: warning: "PTR" redefined
    sound/pci/ca0106/ca0106.h:62: warning: "PTR" redefined

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 10 warnings, 0=
 section mismatches

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2=
 warnings, 0 section mismatches

Warnings:
    arch/arm/mach-vexpress/spc.c:583:21: warning: array subscript -1 is bel=
ow array bounds of =E2=80=98bool[2]=E2=80=99 {aka =E2=80=98_Bool[2]=E2=80=
=99} [-Warray-bounds]
    arch/arm/mach-vexpress/spc.c:592:18: warning: array subscript -1 is bel=
ow array bounds of =E2=80=98bool[2]=E2=80=99 {aka =E2=80=98_Bool[2]=E2=80=
=99} [-Warray-bounds]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warni=
ngs, 0 section mismatches

Errors:
    ERROR: modpost: "__aeabi_uldivmod" [fs/btrfs/btrfs.ko] undefined!

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: undefine=
d reference to `drm_panel_dp_aux_backlight'

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, =
0 section mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8a: ca=
ll to do_strncpy_from_user() with UACCESS enabled
    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x5d: call to do_s=
trnlen_user() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknown> is=
 outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=
=99 [-Warray-bounds]
    arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]
    arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is outside=
 array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 [-War=
ray-bounds]

---
For more info write to <info@kernelci.org>
