Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E075D4A9414
	for <lists+linux-next@lfdr.de>; Fri,  4 Feb 2022 07:41:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbiBDGlc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Feb 2022 01:41:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232432AbiBDGlc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Feb 2022 01:41:32 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADDE5C061714
        for <linux-next@vger.kernel.org>; Thu,  3 Feb 2022 22:41:31 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id y17so4327249plg.7
        for <linux-next@vger.kernel.org>; Thu, 03 Feb 2022 22:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Gor27lIyGR7geL8MkMSsSvRguDTivinvB7u2Nx/QE2s=;
        b=YUM93cEev+X4sWGHkG5xoTqX2X49qj86DH2vVyLRamDI0X6XGcVnIwQittgvELzSap
         nOQx+lUywSD/P9ecT1PEko8ULL7uTVpj6dukMu4rHfQ63DuAC/QDV6HxGyh5yKZm42DD
         oSQstJ0JocleUtHXga3Y8XZYT1My+H92tYunx6qc+n745H1an/6lZzf5ObkpiYQaqP4S
         QwtNHC2K1/CWqS2SgDE6GTVwVnvOpwTwpm4Ez7rLa0SnroebFwUwj+bw3nt/YXzUVSPz
         DvTF8P6V6zA3RtaX7WUe73Yc8oYPcSeM/3C3ArAkrcrB53EC3n3KcwX2RED1yYbw0PHJ
         Z2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Gor27lIyGR7geL8MkMSsSvRguDTivinvB7u2Nx/QE2s=;
        b=eccBMJ7CK+ggffVHp6SHDjrtIkCOB4n/YuKbj+ox4v0oMBK37tuULwWqedirYF0/UO
         0dLfWLRtgfRpXWZYCM+VyqJfe919aTajjf4yboPQurrg/K8hDuwXFbF+RQv8ca8E0RMe
         bqhlxkb/lUPEewgsy0UchD6yRqKWPUvsHCvvQ5x/kjhnrn188EGvRyFYJOCREcYbb2WG
         MsFbD5l8Wde4R/q7nVraWieQuRtfD8b5SR/Xapn51MN1Yi6lp8+gSwrWsKFAzneZFJLT
         ywaj7Rb0tQ77eKzs9cACfyn3aoQWVnBcqXCD9XLg1fAhkIFaCVNEX4xTYe5VaFAVHfXU
         Q6zw==
X-Gm-Message-State: AOAM531zxqqQf1BszKEUwdee1I9+q5YxVBGIHpkuFF3wJTnXVfYSuodE
        ZAjskyXYdf/yvk8VUNYqY6Tuq9cqwEpo5B4o
X-Google-Smtp-Source: ABdhPJxwypbFNvADel8MEzn8VRtnXcYv6v7zTcM29R9GOqW5Nw7RkRMNrYY2oWcI3HRoENHAVh/fYg==
X-Received: by 2002:a17:902:c206:: with SMTP id 6mr1872420pll.46.1643956888588;
        Thu, 03 Feb 2022 22:41:28 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id c5sm1111010pfc.12.2022.02.03.22.41.27
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 22:41:27 -0800 (PST)
Message-ID: <61fcca97.1c69fb81.b9e4c.38ad@mx.google.com>
Date:   Thu, 03 Feb 2022 22:41:27 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20220204
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
Subject: next/master build: 205 builds: 15 failed, 190 passed, 28 errors,
 351 warnings (next-20220204)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 205 builds: 15 failed, 190 passed, 28 errors, 351 warnin=
gs (next-20220204)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220204/

Tree: next
Branch: master
Git Describe: next-20220204
Git Commit: ef6b35306dd8f15a7e5e5a2532e665917a43c5d9
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-14) FAIL

arm:
    allmodconfig: (clang-14) FAIL
    qcom_defconfig: (gcc-10) FAIL
    realview_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL
    shmobile_defconfig: (gcc-10) FAIL
    sunxi_defconfig: (gcc-10) FAIL
    versatile_defconfig: (gcc-10) FAIL
    vexpress_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-14) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL
    ip28_defconfig: (gcc-10) FAIL
    loongson3_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-14) FAIL
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (clang-14): 4 errors

arm:
    allmodconfig (clang-14): 2 errors, 13 warnings
    am200epdkit_defconfig (gcc-10): 4 warnings
    aspeed_g4_defconfig (gcc-10): 4 warnings
    aspeed_g5_defconfig (clang-14): 42 warnings
    assabet_defconfig (gcc-10): 4 warnings
    at91_dt_defconfig (gcc-10): 4 warnings
    axm55xx_defconfig (gcc-10): 4 warnings
    badge4_defconfig (gcc-10): 4 warnings
    cerfcube_defconfig (gcc-10): 4 warnings
    cm_x300_defconfig (gcc-10): 4 warnings
    colibri_pxa270_defconfig (gcc-10): 4 warnings
    colibri_pxa300_defconfig (gcc-10): 4 warnings
    collie_defconfig (gcc-10): 4 warnings
    corgi_defconfig (gcc-10): 4 warnings
    dove_defconfig (gcc-10): 4 warnings
    ep93xx_defconfig (gcc-10): 4 warnings
    eseries_pxa_defconfig (gcc-10): 4 warnings
    ezx_defconfig (gcc-10): 4 warnings
    footbridge_defconfig (gcc-10): 4 warnings
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
    multi_v7_defconfig (clang-14): 13 warnings
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 2 warnings
    mvebu_v7_defconfig (gcc-10): 4 warnings
    mxs_defconfig (gcc-10): 4 warnings
    neponset_defconfig (gcc-10): 4 warnings
    netwinder_defconfig (gcc-10): 4 warnings
    omap1_defconfig (gcc-10): 4 warnings
    palmz72_defconfig (gcc-10): 4 warnings
    pcm027_defconfig (gcc-10): 4 warnings
    pxa168_defconfig (gcc-10): 4 warnings
    pxa255-idp_defconfig (gcc-10): 4 warnings
    pxa3xx_defconfig (gcc-10): 4 warnings
    pxa910_defconfig (gcc-10): 4 warnings
    pxa_defconfig (gcc-10): 4 warnings
    qcom_defconfig (gcc-10): 1 error
    realview_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors, 4 warnings
    s3c2410_defconfig (gcc-10): 4 warnings
    s3c6400_defconfig (gcc-10): 4 warnings
    s5pv210_defconfig (gcc-10): 4 warnings
    shannon_defconfig (gcc-10): 4 warnings
    shmobile_defconfig (gcc-10): 1 error
    simpad_defconfig (gcc-10): 4 warnings
    socfpga_defconfig (gcc-10): 4 warnings
    spear13xx_defconfig (gcc-10): 4 warnings
    spear3xx_defconfig (gcc-10): 4 warnings
    spear6xx_defconfig (gcc-10): 4 warnings
    spitz_defconfig (gcc-10): 4 warnings
    sunxi_defconfig (gcc-10): 1 error
    trizeps4_defconfig (gcc-10): 4 warnings
    versatile_defconfig (gcc-10): 1 error
    vexpress_defconfig (gcc-10): 1 error
    viper_defconfig (gcc-10): 4 warnings
    vt8500_v6_v7_defconfig (gcc-10): 4 warnings
    xcep_defconfig (gcc-10): 4 warnings
    zeus_defconfig (gcc-10): 4 warnings

i386:
    allmodconfig (clang-14): 5 errors, 4 warnings

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    ci20_defconfig (gcc-10): 1 warning
    fuloong2e_defconfig (gcc-10): 1 error
    gcw0_defconfig (gcc-10): 1 warning
    lemote2f_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 2 errors

riscv:

x86_64:
    allmodconfig (clang-14): 3 errors, 21 warnings
    allmodconfig (gcc-10): 2 errors
    x86_64_defconfig (clang-14): 1 warning
    x86_64_defconfig+debug (gcc-10): 2 warnings

Errors summary:

    7    include/linux/fortify-string.h:322:4: error: call to __write_overf=
low_field declared with 'warning' attribute: detected write beyond size of =
field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warni=
ng]
    3    panel-edp.c:(.text+0xb70): undefined reference to `drm_panel_dp_au=
x_backlight'
    3    include/linux/fortify-string.h:236:4: error: call to __write_overf=
low_field declared with 'warning' attribute: detected write beyond size of =
field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warni=
ng]
    2    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    2    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h=
:2500:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or d=
irectory
    1    panel-edp.c:(.text+0xbdc): undefined reference to `drm_panel_dp_au=
x_backlight'
    1    panel-edp.c:(.text+0xb7c): undefined reference to `drm_panel_dp_au=
x_backlight'
    1    panel-edp.c:(.text+0xb28): undefined reference to `drm_panel_dp_au=
x_backlight'
    1    mips-linux-gnu-ld: (.init.text+0x1720): undefined reference to `no=
de_data'
    1    include/net/sctp/structs.h:343:21: error: field c within 'struct s=
ctp_signed_cookie' is less aligned than 'struct sctp_cookie' and is usually=
 due to 'struct sctp_signed_cookie' being packed, which can lead to unalign=
ed accesses [-Werror,-Wunaligned-access]
    1    include/linux/tpm.h:290:2: error: field  within 'struct tpm_header=
' is less aligned than 'union tpm_header::(anonymous at ../include/linux/tp=
m.h:290:2)' and is usually due to 'struct tpm_header' being packed, which c=
an lead to unaligned accesses [-Werror,-Wunaligned-access]
    1    drivers/gpu/drm/selftests/test-drm_plane_helper.c:76:5: error: sta=
ck frame size (1084) exceeds limit (1024) in 'igt_check_plane_state' [-Werr=
or,-Wframe-larger-than]
    1    arch/x86/include/asm/checksum_32.h:149:6: error: inline assembly r=
equires more registers than available
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    (.init.text+0x16f8): undefined reference to `node_data'

Warnings summary:

    62   arch/arm/mm/dma-mapping.c:405:42: warning: array subscript i is ou=
tside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 =
[-Warray-bounds]
    62   arch/arm/mm/dma-mapping.c:404:36: warning: array subscript i is ou=
tside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=E2=80=99 =
[-Warray-bounds]
    62   arch/arm/mm/dma-mapping.c:396:15: warning: array subscript <unknow=
n> is outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=
=E2=80=99 [-Warray-bounds]
    62   arch/arm/mm/dma-mapping.c:395:15: warning: array subscript <unknow=
n> is outside array bounds of =E2=80=98struct dma_contig_early_reserve[0]=
=E2=80=99 [-Warray-bounds]
    23   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    17   1 warning generated.
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    9    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within =
'struct sockaddr_pppox' is less aligned than 'union (unnamed union at ../in=
clude/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_p=
ppox' being packed, which can lead to unaligned accesses [-Wunaligned-acces=
s]
    7    include/uapi/linux/videodev2.h:1744:2: warning: field  within 'str=
uct v4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonym=
ous at ../include/uapi/linux/videodev2.h:1744:2)' and is usually due to 'st=
ruct v4l2_ext_control' being packed, which can lead to unaligned accesses [=
-Wunaligned-access]
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
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
    1    net/core/skbuff.o: warning: objtool: skb_copy()+0x12d: unreachable=
 instruction
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
    1    drivers/soc/qcom/rpmh-rsc.o: warning: objtool: rpmh_rsc_write_ctrl=
_data() falls through to next function trace_raw_output_rpmh_tx_done()
    1    drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used =
uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
    1    drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'v=
al' to silence this warning
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

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text+0x155ad7): Section mismatch in r=
eference from the function __next_node() to the variable .init.data:numa_no=
des_parsed

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

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
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warni=
ng, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-14) =E2=80=94 FAIL, 5 errors, 4 warnings, 0 secti=
on mismatches

Errors:
    include/linux/fortify-string.h:322:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    include/linux/fortify-string.h:322:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    arch/x86/include/asm/checksum_32.h:149:6: error: inline assembly requir=
es more registers than available
    drivers/gpu/drm/selftests/test-drm_plane_helper.c:76:5: error: stack fr=
ame size (1084) exceeds limit (1024) in 'igt_check_plane_state' [-Werror,-W=
frame-larger-than]
    include/linux/fortify-string.h:236:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]

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
allmodconfig (x86_64, clang-14) =E2=80=94 FAIL, 3 errors, 21 warnings, 0 se=
ction mismatches

Errors:
    include/linux/fortify-string.h:322:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    include/linux/fortify-string.h:322:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    include/linux/fortify-string.h:236:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]

Warnings:
    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls throug=
h to next function startup_64_setup_env()
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
    drivers/soc/qcom/rpmh-rsc.o: warning: objtool: rpmh_rsc_write_ctrl_data=
() falls through to next function trace_raw_output_rpmh_tx_done()
    fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely()+0x=
7fd: stack state mismatch: cfa1=3D4+240 cfa2=3D4+232
    drivers/video/fbdev/udlfb.o: warning: objtool: dlfb_ops_write() falls t=
hrough to next function dlfb_ops_setcolreg()
    drivers/video/fbdev/smscufx.o: warning: objtool: ufx_ops_write() falls =
through to next function ufx_ops_setcolreg()
    drivers/gpu/drm/radeon/sumo_dpm.o: warning: objtool: sumo_dpm_set_power=
_state() falls through to next function sumo_dpm_post_set_power_state()

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x155ad7): Section mismatch in refere=
nce from the function __next_node() to the variable .init.data:numa_nodes_p=
arsed

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
allmodconfig (arm64, clang-14) =E2=80=94 FAIL, 4 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/fortify-string.h:236:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    include/linux/fortify-string.h:322:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    include/linux/fortify-string.h:322:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
    include/linux/fortify-string.h:322:4: error: call to __write_overflow_f=
ield declared with 'warning' attribute: detected write beyond size of field=
 (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-14) =E2=80=94 FAIL, 2 errors, 13 warnings, 0 secti=
on mismatches

Errors:
    include/linux/tpm.h:290:2: error: field  within 'struct tpm_header' is =
less aligned than 'union tpm_header::(anonymous at ../include/linux/tpm.h:2=
90:2)' and is usually due to 'struct tpm_header' being packed, which can le=
ad to unaligned accesses [-Werror,-Wunaligned-access]
    include/net/sctp/structs.h:343:21: error: field c within 'struct sctp_s=
igned_cookie' is less aligned than 'struct sctp_cookie' and is usually due =
to 'struct sctp_signed_cookie' being packed, which can lead to unaligned ac=
cesses [-Werror,-Wunaligned-access]

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

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
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
aspeed_g5_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 42 warnings, =
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
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/if_pppox.h:71:4: warning: field sa_addr within 'stru=
ct sockaddr_pppox' is less aligned than 'union (unnamed union at ../include=
/uapi/linux/if_pppox.h:68:2)' and is usually due to 'struct sockaddr_pppox'=
 being packed, which can lead to unaligned accesses [-Wunaligned-access]
    1 warning generated.
    include/uapi/linux/videodev2.h:1744:2: warning: field  within 'struct v=
4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous a=
t ../include/uapi/linux/videodev2.h:1744:2)' and is usually due to 'struct =
v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wuna=
ligned-access]
    include/uapi/linux/videodev2.h:1744:2: warning: field  within 'struct v=
4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous a=
t ../include/uapi/linux/videodev2.h:1744:2)' and is usually due to 'struct =
v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wuna=
ligned-access]
    1 warning generated.
    1 warning generated.
    include/uapi/linux/videodev2.h:1744:2: warning: field  within 'struct v=
4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous a=
t ../include/uapi/linux/videodev2.h:1744:2)' and is usually due to 'struct =
v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wuna=
ligned-access]
    1 warning generated.
    include/uapi/linux/videodev2.h:1744:2: warning: field  within 'struct v=
4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous a=
t ../include/uapi/linux/videodev2.h:1744:2)' and is usually due to 'struct =
v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wuna=
ligned-access]
    1 warning generated.
    include/uapi/linux/videodev2.h:1744:2: warning: field  within 'struct v=
4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous a=
t ../include/uapi/linux/videodev2.h:1744:2)' and is usually due to 'struct =
v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wuna=
ligned-access]
    1 warning generated.
    include/uapi/linux/videodev2.h:1744:2: warning: field  within 'struct v=
4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous a=
t ../include/uapi/linux/videodev2.h:1744:2)' and is usually due to 'struct =
v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wuna=
ligned-access]
    1 warning generated.
    include/uapi/linux/videodev2.h:1744:2: warning: field  within 'struct v=
4l2_ext_control' is less aligned than 'union v4l2_ext_control::(anonymous a=
t ../include/uapi/linux/videodev2.h:1744:2)' and is usually due to 'struct =
v4l2_ext_control' being packed, which can lead to unaligned accesses [-Wuna=
ligned-access]
    1 warning generated.
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
cerfcube_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
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
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-14) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-14) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches

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
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

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
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
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
ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
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
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
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
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

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
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

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
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

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
loongson3_defconfig (mips, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    (.init.text+0x16f8): undefined reference to `node_data'
    mips-linux-gnu-ld: (.init.text+0x1720): undefined reference to `node_da=
ta'

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
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

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
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-14) =E2=80=94 PASS, 0 errors, 13 warnings, 0=
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
    drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used unini=
tialized whenever switch default is taken [-Wsometimes-uninitialized]
    drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' t=
o silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

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
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

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
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
    panel-edp.c:(.text+0xb70): undefined reference to `drm_panel_dp_aux_bac=
klight'

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    panel-edp.c:(.text+0xb7c): undefined reference to `drm_panel_dp_aux_bac=
klight'

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 4 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

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
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
shmobile_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    panel-edp.c:(.text+0xbdc): undefined reference to `drm_panel_dp_aux_bac=
klight'

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
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
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
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    panel-edp.c:(.text+0xb70): undefined reference to `drm_panel_dp_aux_bac=
klight'

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
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
versatile_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    panel-edp.c:(.text+0xb28): undefined reference to `drm_panel_dp_aux_bac=
klight'

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    panel-edp.c:(.text+0xb70): undefined reference to `drm_panel_dp_aux_bac=
klight'

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
x86_64_defconfig (x86_64, clang-14) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    net/core/skbuff.o: warning: objtool: skb_copy()+0x12d: unreachable inst=
ruction

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
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS, =
0 errors, 0 warnings, 0 section mismatches

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
