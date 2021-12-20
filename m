Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70F4D47B293
	for <lists+linux-next@lfdr.de>; Mon, 20 Dec 2021 19:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233618AbhLTSIi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Dec 2021 13:08:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbhLTSIi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Dec 2021 13:08:38 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DDAC061574
        for <linux-next@vger.kernel.org>; Mon, 20 Dec 2021 10:08:37 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id 205so5243620pfu.0
        for <linux-next@vger.kernel.org>; Mon, 20 Dec 2021 10:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=b9ZV3Oh4aEOmHBm2F42MRdcZYTTRAG3iOpZNrH8rkmE=;
        b=sNECs9GJpGtmH2eNOFhzBGAAZINRsh801dV1PxIUuHD/Fa7WI9thsZycNVgHQ8F/js
         XSS/oM5/II6vBnQelXlkNwu6nrNHCmNgL4vzQViGdJNYCywcjti7QwVBcRlanTZkSTAu
         A7NaN3Fh5te2QktPttHK//kC4sFQa2WNGX9MKdg7AYqxnMg2yUIn7gK6pokgTSTD/aF/
         0BoD7BKd7sxzoQSn37vMcQB2OXtdRu6S0FIenigncqx//Jf/sFMLptDPmEkv4f8QTqwt
         pZmjejHxTHDeAubfJjJHWKEz7+rXkBKioknpCSs6sZictF2gsbow2Ru3AJoldGd8Ip3s
         +mlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=b9ZV3Oh4aEOmHBm2F42MRdcZYTTRAG3iOpZNrH8rkmE=;
        b=u2QXf11Y1t5A9nJPC8ga0NSXSH2ONbAp3qDYCC1QS0MZp/4a+r9Pi7Yv9A461Yzzii
         vPtY02UG0bQ/NlbF5HlFWlvBnpXaJXK1OPZnDif+h5MBm43mCPj+JHsNhzvPC1TYcZKC
         r3qgDIr9/TR/LEsPGiF1WS0xNB3Das9p8WFzfJgO5z2tT5fNgtUquE27N9fzj+dVeq7Y
         a9s4Bbet2IYTWYMcaX6sGyvj8nyJlNCUOzgPpyLiC1rbnRcA+Kd1t9Brizc1H0bld5cW
         /smuGgEwOIwxiTwFzku+DBREj3TnpJaGB3VJNedgdjo9JnCf8dFNkvA7iA0TWWUvvfbp
         3e2A==
X-Gm-Message-State: AOAM532ZTpkdSHGwNpOMRWaHlj4a4jEn1zcvGH2gipJioavk2jyREq2L
        5sgPcL86OTxWvs0TpcxgR9FKIvrj2G/Kjen9
X-Google-Smtp-Source: ABdhPJyLzL5Xy2GYN0wCC2afz7qp+5Ll9vclLbNLPOtCK3oXZq9Hx5cHaOZ7QLlRyTYP/Da/e//wNg==
X-Received: by 2002:a05:6a00:2134:b0:4b0:bf74:a64d with SMTP id n20-20020a056a00213400b004b0bf74a64dmr838178pfj.56.1640023715524;
        Mon, 20 Dec 2021 10:08:35 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a11sm3400815pgd.87.2021.12.20.10.08.34
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 10:08:35 -0800 (PST)
Message-ID: <61c0c6a3.1c69fb81.a28d2.8df5@mx.google.com>
Date:   Mon, 20 Dec 2021 10:08:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20211220
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 203 builds: 15 failed, 188 passed, 65 errors,
 218 warnings (next-20211220)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 203 builds: 15 failed, 188 passed, 65 errors, 218 warnin=
gs (next-20211220)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20211220/

Tree: next
Branch: master
Git Describe: next-20211220
Git Commit: 07f8c60fe60f84977dc815ec8a6b1100827c34dd
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-13) FAIL

arm:
    allmodconfig: (clang-13) FAIL
    multi_v5_defconfig: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL
    multi_v7_defconfig+CONFIG_SMP=3Dn: (gcc-10) FAIL
    qcom_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-13) FAIL

mips:
    bigsur_defconfig: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    decstation_defconfig: (gcc-10) FAIL
    decstation_r4k_defconfig: (gcc-10) FAIL
    sb1250_swarm_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    axs103_defconfig (gcc-10): 1 warning
    axs103_smp_defconfig (gcc-10): 1 warning
    haps_hs_defconfig (gcc-10): 1 warning
    haps_hs_smp_defconfig (gcc-10): 1 warning
    haps_hs_smp_defconfig+debug (gcc-10): 2 warnings
    haps_hs_smp_defconfig+kselftest (gcc-10): 4 warnings
    hsdk_defconfig (gcc-10): 1 warning
    nsimosci_hs_defconfig (gcc-10): 1 warning
    nsimosci_hs_smp_defconfig (gcc-10): 1 warning
    tinyconfig (gcc-10): 1 warning
    vdk_hs38_smp_defconfig (gcc-10): 1 warning

arm64:
    allmodconfig (clang-13): 1 error, 1 warning
    allmodconfig (gcc-10): 1 warning
    defconfig (gcc-10): 1 warning
    defconfig (clang-13): 2 warnings
    defconfig+CONFIG_ARM64_16K_PAGES=3Dy (gcc-10): 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-13): 2 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (gcc-10): 1 warning
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy (gcc-10): 1 warning
    defconfig+arm64-chromebook (gcc-10): 1 warning
    defconfig+arm64-chromebook+kselftest (gcc-10): 1 warning
    defconfig+crypto (gcc-10): 1 warning
    defconfig+debug (gcc-10): 1 warning
    defconfig+ima (gcc-10): 1 warning
    defconfig+kselftest (gcc-10): 1 warning

arm:
    allmodconfig (clang-13): 43 errors, 13 warnings
    allmodconfig (gcc-10): 2 errors, 1 warning
    assabet_defconfig (gcc-10): 1 warning
    at91_dt_defconfig (gcc-10): 2 warnings
    badge4_defconfig (gcc-10): 1 warning
    bcm2835_defconfig (gcc-10): 1 warning
    cerfcube_defconfig (gcc-10): 1 warning
    cm_x300_defconfig (gcc-10): 1 warning
    colibri_pxa270_defconfig (gcc-10): 1 warning
    colibri_pxa300_defconfig (gcc-10): 1 warning
    corgi_defconfig (gcc-10): 1 warning
    davinci_all_defconfig (gcc-10): 1 warning
    dove_defconfig (gcc-10): 1 warning
    ep93xx_defconfig (gcc-10): 1 warning
    eseries_pxa_defconfig (gcc-10): 1 warning
    exynos_defconfig (gcc-10): 1 warning
    ezx_defconfig (gcc-10): 1 warning
    h3600_defconfig (gcc-10): 1 warning
    hisi_defconfig (gcc-10): 1 warning
    imote2_defconfig (gcc-10): 1 warning
    imx_v4_v5_defconfig (gcc-10): 1 warning
    imx_v6_v7_defconfig (gcc-10): 1 warning
    integrator_defconfig (gcc-10): 1 warning
    iop32x_defconfig (gcc-10): 1 warning
    ixp4xx_defconfig (gcc-10): 1 warning
    keystone_defconfig (gcc-10): 1 warning
    lart_defconfig (gcc-10): 1 warning
    lpc32xx_defconfig (gcc-10): 1 warning
    lpd270_defconfig (gcc-10): 1 warning
    lubbock_defconfig (gcc-10): 1 warning
    magician_defconfig (gcc-10): 1 warning
    mainstone_defconfig (gcc-10): 1 warning
    mini2440_defconfig (gcc-10): 1 warning
    mmp2_defconfig (gcc-10): 1 warning
    mps2_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (clang-13): 2 errors
    multi_v5_defconfig (gcc-10): 2 warnings
    multi_v7_defconfig (clang-13): 12 warnings
    multi_v7_defconfig (gcc-10): 1 warning
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-10): 1 warning
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-10): 1 warni=
ng
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 2 errors, 1 warning
    multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (gcc-10): 1 warning
    multi_v7_defconfig+debug (gcc-10): 1 warning
    multi_v7_defconfig+kselftest (gcc-10): 1 warning
    mvebu_v5_defconfig (gcc-10): 1 warning
    mvebu_v7_defconfig (gcc-10): 1 warning
    mxs_defconfig (gcc-10): 1 warning
    neponset_defconfig (gcc-10): 1 warning
    netwinder_defconfig (gcc-10): 1 warning
    omap1_defconfig (gcc-10): 1 warning
    omap2plus_defconfig (gcc-10): 1 warning
    orion5x_defconfig (gcc-10): 1 warning
    pcm027_defconfig (gcc-10): 1 warning
    pxa168_defconfig (gcc-10): 1 warning
    pxa3xx_defconfig (gcc-10): 1 warning
    pxa910_defconfig (gcc-10): 1 warning
    pxa_defconfig (gcc-10): 1 warning
    qcom_defconfig (gcc-10): 1 error, 1 warning
    realview_defconfig (gcc-10): 1 warning
    rpc_defconfig (gcc-10): 2 errors
    sama5_defconfig (gcc-10): 1 warning
    shannon_defconfig (gcc-10): 1 warning
    shmobile_defconfig (gcc-10): 1 warning
    simpad_defconfig (gcc-10): 1 warning
    socfpga_defconfig (gcc-10): 1 warning
    spear13xx_defconfig (gcc-10): 1 warning
    spitz_defconfig (gcc-10): 1 warning
    sunxi_defconfig (gcc-10): 1 warning
    tegra_defconfig (gcc-10): 1 warning
    trizeps4_defconfig (gcc-10): 1 warning
    u8500_defconfig (gcc-10): 1 warning
    vexpress_defconfig (gcc-10): 1 warning
    viper_defconfig (gcc-10): 1 warning
    vt8500_v6_v7_defconfig (gcc-10): 1 warning
    xcep_defconfig (gcc-10): 1 warning
    zeus_defconfig (gcc-10): 1 warning

i386:
    allmodconfig (clang-13): 3 errors
    i386_defconfig (gcc-10): 1 warning
    i386_defconfig (clang-13): 2 warnings
    i386_defconfig+debug (gcc-10): 1 warning
    i386_defconfig+kselftest (gcc-10): 1 warning

mips:
    32r2el_defconfig (gcc-10): 2 warnings
    32r2el_defconfig+debug (gcc-10): 2 warnings
    32r2el_defconfig+kselftest (gcc-10): 2 warnings
    bigsur_defconfig (gcc-10): 1 error, 1 warning
    bmips_be_defconfig (gcc-10): 1 warning
    bmips_stb_defconfig (gcc-10): 1 warning
    capcella_defconfig (gcc-10): 1 warning
    ci20_defconfig (gcc-10): 2 warnings
    cobalt_defconfig (gcc-10): 1 warning
    cu1000-neo_defconfig (gcc-10): 1 warning
    cu1830-neo_defconfig (gcc-10): 1 warning
    db1xxx_defconfig (gcc-10): 1 warning
    decstation_64_defconfig (gcc-10): 1 error, 1 warning
    decstation_defconfig (gcc-10): 1 error, 1 warning
    decstation_r4k_defconfig (gcc-10): 1 error, 1 warning
    fuloong2e_defconfig (gcc-10): 1 error, 1 warning
    gpr_defconfig (gcc-10): 1 warning
    ip22_defconfig (gcc-10): 1 warning
    ip32_defconfig (gcc-10): 1 warning
    jazz_defconfig (gcc-10): 1 warning
    jmr3927_defconfig (gcc-10): 1 warning
    loongson1b_defconfig (gcc-10): 1 warning
    loongson1c_defconfig (gcc-10): 1 warning
    loongson3_defconfig (gcc-10): 1 warning
    malta_defconfig (gcc-10): 1 warning
    malta_kvm_defconfig (gcc-10): 1 warning
    malta_qemu_32r6_defconfig (gcc-10): 1 warning
    maltaaprp_defconfig (gcc-10): 1 warning
    maltasmvp_defconfig (gcc-10): 1 warning
    maltasmvp_eva_defconfig (gcc-10): 1 warning
    maltaup_defconfig (gcc-10): 1 warning
    maltaup_xpa_defconfig (gcc-10): 1 warning
    rbtx49xx_defconfig (gcc-10): 1 warning
    rm200_defconfig (gcc-10): 2 warnings
    sb1250_swarm_defconfig (gcc-10): 1 error, 1 warning
    tb0219_defconfig (gcc-10): 1 warning
    tb0226_defconfig (gcc-10): 1 warning
    tb0287_defconfig (gcc-10): 1 warning
    workpad_defconfig (gcc-10): 1 warning

riscv:
    defconfig (gcc-10): 1 warning
    defconfig+CONFIG_EFI=3Dn (clang-13): 2 warnings
    defconfig+debug (gcc-10): 1 warning
    defconfig+kselftest (gcc-10): 1 warning
    rv32_defconfig (gcc-10): 1 warning

x86_64:
    allmodconfig (gcc-10): 2 errors
    allmodconfig (clang-13): 1 error, 18 warnings
    x86_64_defconfig (clang-13): 2 warnings
    x86_64_defconfig (gcc-10): 1 warning
    x86_64_defconfig+amdgpu (gcc-10): 1 warning
    x86_64_defconfig+crypto (gcc-10): 1 warning
    x86_64_defconfig+debug (gcc-10): 3 warnings
    x86_64_defconfig+ima (gcc-10): 1 warning
    x86_64_defconfig+kselftest (gcc-10): 1 warning
    x86_64_defconfig+x86-chromebook (gcc-10): 1 warning
    x86_64_defconfig+x86-chromebook+amdgpu (gcc-10): 1 warning
    x86_64_defconfig+x86-chromebook+kselftest (gcc-10): 1 warning
    x86_64_defconfig+x86_kvm_guest (gcc-10): 1 warning

Errors summary:

    25   arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relati=
ve fixup value
    13   arch/arm/include/asm/current.h:39:28: error: out of range pc-relat=
ive fixup value
    3    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of =
read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99
    2    fatal error: too many errors emitted, stopping now [-ferror-limit=
=3D]
    2    drivers/reset/reset-starfive-jh7100.c:86:2: error: implicit declar=
ation of function 'writeq' [-Werror,-Wimplicit-function-declaration]
    2    drivers/reset/reset-starfive-jh7100.c:81:10: error: implicit decla=
ration of function 'readq' [-Werror,-Wimplicit-function-declaration]
    2    drivers/reset/reset-starfive-jh7100.c:126:14: error: implicit decl=
aration of function 'readq' [-Werror,-Wimplicit-function-declaration]
    2    drivers/net/ethernet/broadcom/sb1250-mac.c:2187:20: error: assignm=
ent of read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99
    2    drivers/gpio/gpio-sim.c:889:7: error: variable 'ret' is uninitiali=
zed when used here [-Werror,-Wuninitialized]
    2    arch/arm/include/asm/current.h:53:6: error: out of range pc-relati=
ve fixup value
    2    /usr/lib/gcc/x86_64-linux-gnu/10/plugin/include/config/i386/i386.h=
:2500:10: fatal error: common/config/i386/i386-cpuinfo.h: No such file or d=
irectory
    1    irq-gic-v3-its.c:(.text+0x14b8): undefined reference to `cpus_boot=
ed_once_mask'
    1    drivers/reset/reset-starfive-jh7100.c:86:2: error: implicit declar=
ation of function =E2=80=98writeq=E2=80=99; did you mean =E2=80=98writeb=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
    1    drivers/reset/reset-starfive-jh7100.c:81:10: error: implicit decla=
ration of function =E2=80=98readq=E2=80=99; did you mean =E2=80=98readb=E2=
=80=99? [-Werror=3Dimplicit-function-declaration]
    1    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    1    arm-linux-gnueabihf-ld: irq-gic-v3-its.c:(.text+0x14bc): undefined=
 reference to `cpus_booted_once_mask'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: und=
efined reference to `drm_panel_dp_aux_backlight'

Warnings summary:

    138  fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=
=E2=80=99 [-Wunused-variable]
    16   fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunu=
sed-variable]
    12   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    6    1 warning generated.
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    3    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' i=
s unknown, fallback to ''
    2    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=
=80=99 expects argument of type =E2=80=98int=E2=80=99, but argument 2 has t=
ype =E2=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]
    2    drivers/gpio/gpio-sim.c:868:9: note: initialize the variable 'ret'=
 to silence this warning
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
    1    vmlinux.o: warning: objtool: do_machine_check()+0x13a: call to mce=
_no_way_out() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: do_int80_syscall_32()+0x52: call to m=
emset() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_put_ghcb()+0x36: call to memcpy=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_get_ghcb()+0xa1: call to memcpy=
() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x5a: call to=
 ghcb_set_sw_exit_code() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __do_fast_syscall_32()+0x52: call to =
memset() leaves .noinstr.text section
    1    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x5d: call to=
 do_strnlen_user() with UACCESS enabled
    1    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8=
a: call to do_strncpy_from_user() with UACCESS enabled
    1    fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely=
()+0x734: stack state mismatch: cfa1=3D4+200 cfa2=3D4+192
    1    drivers/block/paride/bpck.c:32: warning: "PC" redefined
    1    clang: warning:   CC      arch/arm/mach-omap2/id.o
    1    cc1: all warnings being treated as errors
    1    arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls t=
hrough to next function startup_64_setup_env()
    1    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit=
_address_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name shou=
ld not have leading "0x"
    1    arch/arc/include/asm/perf_event.h:91:27: warning: 'arc_pmu_ev_hw_m=
ap' defined but not used [-Wunused-const-variable=3D]
    1    arch/arc/include/asm/perf_event.h:126:27: warning: 'arc_pmu_cache_=
map' defined but not used [-Wunused-const-variable=3D]
    1    WARNING: modpost: module mp5023 uses symbol pmbus_do_probe from na=
mespace PMBUS, but does not import it.

Section mismatches summary:

    1    WARNING: modpost: vmlinux.o(.text+0x70513): Section mismatch in re=
ference from the function __nodes_weight() to the variable .init.data:numa_=
nodes_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x15dc97): Section mismatch in r=
eference from the function __next_node() to the variable .init.data:numa_no=
des_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x15dc22): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed
    1    WARNING: modpost: vmlinux.o(.text+0x15dc0e): Section mismatch in r=
eference from the function test_bit() to the variable .init.data:numa_nodes=
_parsed

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warni=
ngs, 0 section mismatches

Warnings:
    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg=
): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "=
0,0"
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-13) =E2=80=94 FAIL, 43 errors, 13 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    fatal error: too many errors emitted, stopping now [-ferror-limit=3D]
    drivers/reset/reset-starfive-jh7100.c:81:10: error: implicit declaratio=
n of function 'readq' [-Werror,-Wimplicit-function-declaration]
    drivers/reset/reset-starfive-jh7100.c:86:2: error: implicit declaration=
 of function 'writeq' [-Werror,-Wimplicit-function-declaration]
    drivers/reset/reset-starfive-jh7100.c:126:14: error: implicit declarati=
on of function 'readq' [-Werror,-Wimplicit-function-declaration]
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:39:28: error: out of range pc-relative f=
ixup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/percpu.h:40:28: error: out of range pc-relative fi=
xup value
    fatal error: too many errors emitted, stopping now [-ferror-limit=3D]

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
    clang: warning:   CC      arch/arm/mach-omap2/id.o
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
allmodconfig (i386, clang-13) =E2=80=94 FAIL, 3 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/reset/reset-starfive-jh7100.c:81:10: error: implicit declaratio=
n of function 'readq' [-Werror,-Wimplicit-function-declaration]
    drivers/reset/reset-starfive-jh7100.c:86:2: error: implicit declaration=
 of function 'writeq' [-Werror,-Wimplicit-function-declaration]
    drivers/reset/reset-starfive-jh7100.c:126:14: error: implicit declarati=
on of function 'readq' [-Werror,-Wimplicit-function-declaration]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    drivers/gpio/gpio-sim.c:889:7: error: variable 'ret' is uninitialized w=
hen used here [-Werror,-Wuninitialized]

Warnings:
    drivers/gpio/gpio-sim.c:868:9: note: initialize the variable 'ret' to s=
ilence this warning

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
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section m=
ismatches

Errors:
    drivers/reset/reset-starfive-jh7100.c:81:10: error: implicit declaratio=
n of function =E2=80=98readq=E2=80=99; did you mean =E2=80=98readb=E2=80=99=
? [-Werror=3Dimplicit-function-declaration]
    drivers/reset/reset-starfive-jh7100.c:86:2: error: implicit declaration=
 of function =E2=80=98writeq=E2=80=99; did you mean =E2=80=98writeb=E2=80=
=99? [-Werror=3Dimplicit-function-declaration]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 18 warnings, 0 sec=
tion mismatches

Errors:
    drivers/gpio/gpio-sim.c:889:7: error: variable 'ret' is uninitialized w=
hen used here [-Werror,-Wuninitialized]

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
    vmlinux.o: warning: objtool: do_machine_check()+0x13a: call to mce_no_w=
ay_out() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_start()+0x44: call to __kasan_check_wr=
ite() leaves .noinstr.text section
    vmlinux.o: warning: objtool: mce_severity_amd()+0x5e: call to mce_sever=
ity_amd_smca() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x5a: call to ghcb=
_set_sw_exit_code() leaves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_get_ghcb()+0xa1: call to memcpy() le=
aves .noinstr.text section
    vmlinux.o: warning: objtool: __sev_put_ghcb()+0x36: call to memcpy() le=
aves .noinstr.text section
    fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely()+0x=
734: stack state mismatch: cfa1=3D4+200 cfa2=3D4+192
    drivers/gpio/gpio-sim.c:868:9: note: initialize the variable 'ret' to s=
ilence this warning

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x15dc0e): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x15dc22): Section mismatch in refere=
nce from the function test_bit() to the variable .init.data:numa_nodes_pars=
ed
    WARNING: modpost: vmlinux.o(.text+0x15dc97): Section mismatch in refere=
nce from the function __next_node() to the variable .init.data:numa_nodes_p=
arsed

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: modpost: module mp5023 uses symbol pmbus_do_probe from namespa=
ce PMBUS, but does not import it.

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=80=99 =
expects argument of type =E2=80=98int=E2=80=99, but argument 2 has type =E2=
=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]

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
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

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
bigsur_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    drivers/net/ethernet/broadcom/sb1250-mac.c:2187:20: error: assignment o=
f read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    arch/mips/boot/dts/ingenic/jz4780.dtsi:513.33-515.6: Warning (unit_addr=
ess_format): /nemc@13410000/efuse@d0/eth-mac-addr@0x22: unit name should no=
t have leading "0x"
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, =
0 section mismatches

Errors:
    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of read-=
only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 s=
ection mismatches

Errors:
    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of read-=
only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning,=
 0 section mismatches

Errors:
    drivers/net/ethernet/amd/declance.c:1231:20: error: assignment of read-=
only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-13) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunused-v=
ariable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 1 warning, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-13) =E2=80=94 PASS, 0 er=
rors, 2 warnings, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunused-v=
ariable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 1 warning, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-13) =E2=80=94 PASS, 0 errors, 2 warn=
ings, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunused-v=
ariable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 1 warning, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 1 warning, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 1 warning, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warni=
ngs, 0 section mismatches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''
    fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 4 w=
arnings, 0 section mismatches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''
    fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunused-v=
ariable]
    arch/arc/include/asm/perf_event.h:126:27: warning: 'arc_pmu_cache_map' =
defined but not used [-Wunused-const-variable=3D]
    arch/arc/include/asm/perf_event.h:91:27: warning: 'arc_pmu_ev_hw_map' d=
efined but not used [-Wunused-const-variable=3D]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-13) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunused-v=
ariable]
    1 warning generated.

---------------------------------------------------------------------------=
-----
i386_defconfig+debug (i386, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warnin=
g, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-13) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 =
section mismatches

Errors:
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value
    arch/arm/include/asm/current.h:53:6: error: out of range pc-relative fi=
xup value

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%d=E2=80=99 =
expects argument of type =E2=80=98int=E2=80=99, but argument 2 has type =E2=
=80=98struct gpio_desc *=E2=80=99 [-Wformat=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-13) =E2=80=94 PASS, 0 errors, 12 warnings, 0=
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
    fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunused-v=
ariable]
    1 warning generated.
    clang: warning: argument unused during compilation: '-march=3Darmv7-a' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 1 warning, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 1 warning, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 1=
 warning, 0 section mismatches

Errors:
    irq-gic-v3-its.c:(.text+0x14b8): undefined reference to `cpus_booted_on=
ce_mask'
    arm-linux-gnueabihf-ld: irq-gic-v3-its.c:(.text+0x14bc): undefined refe=
rence to `cpus_booted_once_mask'

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 1 warning, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

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
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    /tmp/kci/linux/build/../drivers/gpu/drm/panel/panel-edp.c:843: undefine=
d reference to `drm_panel_dp_aux_backlight'

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

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
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]
    drivers/block/paride/bpck.c:32: warning: "PC" redefined

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0=
 section mismatches

Errors:
    drivers/net/ethernet/broadcom/sb1250-mac.c:2187:20: error: assignment o=
f read-only location =E2=80=98*(dev->dev_addr + (sizetype)i)=E2=80=99

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unk=
nown, fallback to ''

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable 'inode' [-Wunused-v=
ariable]
    1 warning generated.

Section mismatches:
    WARNING: modpost: vmlinux.o(.text+0x70513): Section mismatch in referen=
ce from the function __nodes_weight() to the variable .init.data:numa_nodes=
_parsed

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warnin=
g, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warnin=
g, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]
    lib/strncpy_from_user.o: warning: objtool: strncpy_from_user()+0x8a: ca=
ll to do_strncpy_from_user() with UACCESS enabled
    lib/strnlen_user.o: warning: objtool: strnlen_user()+0x5d: call to do_s=
trnlen_user() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 1 war=
ning, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
1 warning, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 1 warning, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS, =
0 errors, 1 warning, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 1=
 warning, 0 section mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/lockd/svclock.c:474:17: warning: unused variable =E2=80=98inode=E2=
=80=99 [-Wunused-variable]

---
For more info write to <info@kernelci.org>
