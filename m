Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A851B578F6A
	for <lists+linux-next@lfdr.de>; Tue, 19 Jul 2022 02:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236401AbiGSArI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jul 2022 20:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233896AbiGSArH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Jul 2022 20:47:07 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D012527FDD
        for <linux-next@vger.kernel.org>; Mon, 18 Jul 2022 17:47:02 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id 5so10539775plk.9
        for <linux-next@vger.kernel.org>; Mon, 18 Jul 2022 17:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=eUHgoDLK8FicyCNIfYBJ+rdpNPBBMCy2wncsKDYAc1M=;
        b=fve9kbTLohQYSjLLUsLTd2gPXCZIyC8BUnWIUcfwwC5obGd5G4mHNRN7KR32djHeY7
         PIpn4yYRPyePXYB6tE1E5zGL+x3gbKzB75Zdz/4/hfr3Go5MMuFmCxLnrL4f/yzvwDJ/
         sK6h8YbmLB1WcmdT7aefJsuue7iYBvw9xV1OOOPRAV4nTDE1JkGqkhjX9igjeqkazvFZ
         B1pl18BytOG9EvnbgO1VqzQEzaGy3JuGRVI1Ki3V+19KUltybIYuup44fORrRUBXakaK
         jHyKtEU/xNNifCrzU0UnZcbmlWFLHDP0QK1ywM8wLBGmwJR/8dhXNicq+dvVD7O2cD5I
         //IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=eUHgoDLK8FicyCNIfYBJ+rdpNPBBMCy2wncsKDYAc1M=;
        b=iXwTs1YdzDJ63xuqMeTNqdWKRxZGtBStb9NY3j1sqf5mPRq+axJAMZT/NNpmzfqBj3
         YQ2wfBqzsnn4hh/HHm75Ej1nz7vs1WVfwwU9ZCSfu/87UZvPr/BIW1YBc0CAlO+V+aIp
         L5wtnoLvJg23VLyIq93HmyhAqLADF3DTHs3JQYN1LdzGb4l6nJ8xINBcKVMuhcMh1bQN
         X1ZnhlvXP3eTdvW9YvKz8kzenNkqGPNeV+XbTwpp0PUZj+dPlcuYJ+/zouy6M8ezEG3y
         9iNUIzQXs3XF1NeNIlZwfMf+X07qCAKiWkSo3vpn1SaJGtyhcFbUxysASBL0mwRK/OQB
         DSFA==
X-Gm-Message-State: AJIora9w5QKEWRCBg0Ati28ellx9MHUaHjR97o+yvTC6Zm3wm+PFg23O
        DvUKTuOUDsUm2NW1M16TyLw9d2zf1p4ep85a
X-Google-Smtp-Source: AGRyM1todA+MXuYibDizPVZkOUYGGYES5Z3yNWEaXCBcVbk86pbRhwMHsZubbuX3qIkN5Tzl5dPYvQ==
X-Received: by 2002:a17:902:b58e:b0:16c:489e:7a0b with SMTP id a14-20020a170902b58e00b0016c489e7a0bmr30873437pls.145.1658191620505;
        Mon, 18 Jul 2022 17:47:00 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id z6-20020a623306000000b0052ac725ea3esm10197936pfz.97.2022.07.18.17.46.59
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 17:46:59 -0700 (PDT)
Message-ID: <62d5ff03.1c69fb81.84d8f.fa70@mx.google.com>
Date:   Mon, 18 Jul 2022 17:46:59 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220718
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 210 builds: 10 failed, 200 passed, 17 errors,
 226 warnings (next-20220718)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 210 builds: 10 failed, 200 passed, 17 errors, 226 warnin=
gs (next-20220718)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220718/

Tree: next
Branch: master
Git Describe: next-20220718
Git Commit: 036ad6daa8f0fd357af7f50f9da58539eaa6f68c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-15) FAIL
    allmodconfig: (gcc-10) FAIL

arm:
    allmodconfig: (clang-15) FAIL
    allmodconfig: (gcc-10) FAIL
    milbeaut_m10v_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-15) FAIL
    i386_defconfig: (clang-15) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-15) FAIL

Errors and Warnings Detected:

arc:
    axs103_defconfig (gcc-10): 2 warnings
    axs103_smp_defconfig (gcc-10): 2 warnings
    haps_hs_defconfig (gcc-10): 2 warnings
    haps_hs_smp_defconfig (gcc-10): 2 warnings
    haps_hs_smp_defconfig+debug (gcc-10): 2 warnings
    hsdk_defconfig (gcc-10): 2 warnings
    nsimosci_hs_defconfig (gcc-10): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-10): 2 warnings
    vdk_hs38_defconfig (gcc-10): 2 warnings
    vdk_hs38_smp_defconfig (gcc-10): 2 warnings

arm64:

arm:
    allmodconfig (clang-15): 1 error, 13 warnings
    aspeed_g4_defconfig (gcc-10): 2 warnings
    aspeed_g5_defconfig (gcc-10): 2 warnings
    aspeed_g5_defconfig (clang-15): 15 warnings
    assabet_defconfig (gcc-10): 2 warnings
    at91_dt_defconfig (gcc-10): 2 warnings
    axm55xx_defconfig (gcc-10): 2 warnings
    badge4_defconfig (gcc-10): 2 warnings
    cerfcube_defconfig (gcc-10): 2 warnings
    cm_x300_defconfig (gcc-10): 2 warnings
    colibri_pxa270_defconfig (gcc-10): 2 warnings
    collie_defconfig (gcc-10): 2 warnings
    corgi_defconfig (gcc-10): 2 warnings
    eseries_pxa_defconfig (gcc-10): 2 warnings
    h5000_defconfig (gcc-10): 2 warnings
    hackkit_defconfig (gcc-10): 2 warnings
    hisi_defconfig (gcc-10): 2 warnings
    imx_v4_v5_defconfig (gcc-10): 2 warnings
    integrator_defconfig (gcc-10): 2 warnings
    keystone_defconfig (gcc-10): 2 warnings
    lart_defconfig (gcc-10): 2 warnings
    lpc32xx_defconfig (gcc-10): 2 warnings
    magician_defconfig (gcc-10): 2 warnings
    milbeaut_m10v_defconfig (gcc-10): 1 error
    moxart_defconfig (gcc-10): 2 warnings
    multi_v5_defconfig (gcc-10): 2 warnings
    multi_v5_defconfig (clang-15): 5 warnings
    multi_v7_defconfig (clang-15): 12 warnings
    mvebu_v5_defconfig (gcc-10): 2 warnings
    mvebu_v7_defconfig (gcc-10): 2 warnings
    netwinder_defconfig (gcc-10): 2 warnings
    nhk8815_defconfig (gcc-10): 2 warnings
    orion5x_defconfig (gcc-10): 2 warnings
    palmz72_defconfig (gcc-10): 2 warnings
    pcm027_defconfig (gcc-10): 2 warnings
    qcom_defconfig (gcc-10): 2 warnings
    realview_defconfig (gcc-10): 2 warnings
    rpc_defconfig (gcc-10): 2 errors
    sama5_defconfig (gcc-10): 2 warnings
    sama7_defconfig (gcc-10): 2 warnings
    shmobile_defconfig (gcc-10): 2 warnings
    socfpga_defconfig (gcc-10): 2 warnings
    spear13xx_defconfig (gcc-10): 2 warnings
    spear3xx_defconfig (gcc-10): 2 warnings
    spear6xx_defconfig (gcc-10): 2 warnings
    spitz_defconfig (gcc-10): 2 warnings
    sunxi_defconfig (gcc-10): 2 warnings
    trizeps4_defconfig (gcc-10): 2 warnings
    u8500_defconfig (gcc-10): 2 warnings
    vexpress_defconfig (gcc-10): 2 warnings
    vt8500_v6_v7_defconfig (gcc-10): 2 warnings
    zeus_defconfig (gcc-10): 2 warnings

i386:
    allmodconfig (clang-15): 1 error
    allnoconfig (clang-15): 2 warnings
    i386_defconfig (clang-15): 1 error

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    ar7_defconfig (gcc-10): 2 warnings
    bigsur_defconfig (gcc-10): 2 warnings
    bmips_be_defconfig (gcc-10): 2 warnings
    bmips_stb_defconfig (gcc-10): 2 warnings
    cavium_octeon_defconfig (gcc-10): 2 warnings
    ci20_defconfig (gcc-10): 2 warnings
    cu1000-neo_defconfig (gcc-10): 2 warnings
    cu1830-neo_defconfig (gcc-10): 2 warnings
    fuloong2e_defconfig (gcc-10): 1 error, 2 warnings
    gcw0_defconfig (gcc-10): 2 warnings
    gpr_defconfig (gcc-10): 2 warnings
    jazz_defconfig (gcc-10): 2 warnings
    lemote2f_defconfig (gcc-10): 1 error, 2 warnings
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 1 error
    malta_defconfig (gcc-10): 2 warnings
    malta_kvm_defconfig (gcc-10): 2 warnings
    malta_qemu_32r6_defconfig (gcc-10): 2 warnings
    maltaaprp_defconfig (gcc-10): 2 warnings
    maltasmvp_defconfig (gcc-10): 2 warnings
    maltasmvp_eva_defconfig (gcc-10): 2 warnings
    maltaup_xpa_defconfig (gcc-10): 2 warnings
    mtx1_defconfig (gcc-10): 2 warnings
    omega2p_defconfig (gcc-10): 2 warnings
    qi_lb60_defconfig (gcc-10): 2 warnings
    rb532_defconfig (gcc-10): 3 warnings
    rs90_defconfig (gcc-10): 2 warnings
    vocore2_defconfig (gcc-10): 2 warnings

riscv:

x86_64:
    allmodconfig (clang-15): 7 errors, 11 warnings

Errors summary:

    4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    1    lib/maple_tree.c:4300:20: error: stack frame size (1136) exceeds l=
imit (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
    1    lib/maple_tree.c:4300:20: error: stack frame size (1084) exceeds l=
imit (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
    1    lib/maple_tree.c:4300:20: error: stack frame size (1076) exceeds l=
imit (1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]
    1    drivers/nvme/common/auth.c:81:23: error: address of array 'dhgroup=
_map[i].name' will always evaluate to 'true' [-Werror,-Wpointer-bool-conver=
sion]
    1    drivers/nvme/common/auth.c:69:31: error: address of array 'dhgroup=
_map[dhgroup_id].kpp' will always evaluate to 'true' [-Werror,-Wpointer-boo=
l-conversion]
    1    drivers/nvme/common/auth.c:59:31: error: address of array 'dhgroup=
_map[dhgroup_id].name' will always evaluate to 'true' [-Werror,-Wpointer-bo=
ol-conversion]
    1    drivers/nvme/common/auth.c:152:25: error: address of array 'hash_m=
ap[hmac_id].hmac' will always evaluate to 'true' [-Werror,-Wpointer-bool-co=
nversion]
    1    drivers/nvme/common/auth.c:139:20: error: address of array 'hash_m=
ap[i].hmac' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversi=
on]
    1    drivers/nvme/common/auth.c:127:25: error: address of array 'hash_m=
ap[hmac_id].digest' will always evaluate to 'true' [-Werror,-Wpointer-bool-=
conversion]
    1    drivers/nvme/common/auth.c:117:25: error: address of array 'hash_m=
ap[hmac_id].hmac' will always evaluate to 'true' [-Werror,-Wpointer-bool-co=
nversion]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    ERROR: modpost: missing MODULE_LICENSE() in lib/crypto/libsha1.o

Warnings summary:

    71   mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 =
defined but not used [-Wunused-function]
    71   mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 =
defined but not used [-Wunused-function]
    23   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    10   mm/shmem.c:2848:12: warning: 'shmem_fileattr_set' defined but not =
used [-Wunused-function]
    10   mm/shmem.c:2839:12: warning: 'shmem_fileattr_get' defined but not =
used [-Wunused-function]
    10   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    4    1 warning generated.
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    2    mm/shmem.c:2848:12: warning: unused function 'shmem_fileattr_set' =
[-Wunused-function]
    2    mm/shmem.c:2839:12: warning: unused function 'shmem_fileattr_get' =
[-Wunused-function]
    2    2 warnings generated.
    1    vmlinux.o: warning: objtool: vc_switch_off_ist+0xbe: call to memcp=
y() leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: sync_regs+0x24: call to memcpy() leav=
es .noinstr.text section
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x31: relocation to=
 !ENDBR: machine_kexec_prepare+0x487
    1    vmlinux.o: warning: objtool: fixup_bad_iret+0x36: call to memset()=
 leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_put_ghcb+0x35: call to memcpy()=
 leaves .noinstr.text section
    1    vmlinux.o: warning: objtool: __sev_get_ghcb+0xaa: call to memcpy()=
 leaves .noinstr.text section
    1    lib/maple_tree.c:4300:20: warning: stack frame size (1104) exceeds=
 limit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
    1    lib/maple_tree.c:4300:20: warning: stack frame size (1096) exceeds=
 limit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
    1    lib/maple_tree.c:4300:20: warning: stack frame size (1088) exceeds=
 limit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
    1    lib/maple_tree.c:4300:20: warning: stack frame size (1076) exceeds=
 limit (1024) in 'mas_wr_modify' [-Wframe-larger-than]
    1    drivers/power/supply/ab8500_chargalg.c:493:13: warning: =E2=80=98a=
b8500_chargalg_ex_ac_enable_toggle=E2=80=99 defined but not used [-Wunused-=
variable]
    1    drivers/power/supply/ab8500_chargalg.c:493:13: warning: unused var=
iable =E2=80=98ab8500_chargalg_ex_ac_enable_toggle=E2=80=99 [-Wunused-varia=
ble]
    1    drivers/media/i2c/m5mols/m5mols.o: warning: objtool: m5mols_set_fm=
t() falls through to next function m5mols_get_frame_desc()
    1    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 require=
s 44 bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift=
-overflow=3D]
    1    arch/x86/kvm/kvm.o: warning: objtool: paging64_update_accessed_dir=
ty_bits+0x3a6: call to __ubsan_handle_load_invalid_value() with UACCESS ena=
bled
    1    arch/x86/kvm/kvm.o: warning: objtool: paging32_update_accessed_dir=
ty_bits+0x398: call to __ubsan_handle_load_invalid_value() with UACCESS ena=
bled
    1    arch/x86/kvm/kvm.o: warning: objtool: ept_update_accessed_dirty_bi=
ts+0x458: call to __ubsan_handle_load_invalid_value() with UACCESS enabled
    1    arch/x86/kvm/kvm.o: warning: objtool: emulator_cmpxchg_emulated+0x=
70e: call to __ubsan_handle_load_invalid_value() with UACCESS enabled

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
allmodconfig (arm64, clang-15) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-15) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    lib/maple_tree.c:4300:20: error: stack frame size (1076) exceeds limit =
(1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-15) =E2=80=94 FAIL, 1 error, 13 warnings, 0 sectio=
n mismatches

Errors:
    lib/maple_tree.c:4300:20: error: stack frame size (1136) exceeds limit =
(1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]

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
allmodconfig (x86_64, clang-15) =E2=80=94 FAIL, 7 errors, 11 warnings, 0 se=
ction mismatches

Errors:
    drivers/nvme/common/auth.c:59:31: error: address of array 'dhgroup_map[=
dhgroup_id].name' will always evaluate to 'true' [-Werror,-Wpointer-bool-co=
nversion]
    drivers/nvme/common/auth.c:69:31: error: address of array 'dhgroup_map[=
dhgroup_id].kpp' will always evaluate to 'true' [-Werror,-Wpointer-bool-con=
version]
    drivers/nvme/common/auth.c:81:23: error: address of array 'dhgroup_map[=
i].name' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
    drivers/nvme/common/auth.c:117:25: error: address of array 'hash_map[hm=
ac_id].hmac' will always evaluate to 'true' [-Werror,-Wpointer-bool-convers=
ion]
    drivers/nvme/common/auth.c:127:25: error: address of array 'hash_map[hm=
ac_id].digest' will always evaluate to 'true' [-Werror,-Wpointer-bool-conve=
rsion]
    drivers/nvme/common/auth.c:139:20: error: address of array 'hash_map[i]=
.hmac' will always evaluate to 'true' [-Werror,-Wpointer-bool-conversion]
    drivers/nvme/common/auth.c:152:25: error: address of array 'hash_map[hm=
ac_id].hmac' will always evaluate to 'true' [-Werror,-Wpointer-bool-convers=
ion]

Warnings:
    vmlinux.o: warning: objtool: sync_regs+0x24: call to memcpy() leaves .n=
oinstr.text section
    vmlinux.o: warning: objtool: vc_switch_off_ist+0xbe: call to memcpy() l=
eaves .noinstr.text section
    vmlinux.o: warning: objtool: fixup_bad_iret+0x36: call to memset() leav=
es .noinstr.text section
    vmlinux.o: warning: objtool: __sev_get_ghcb+0xaa: call to memcpy() leav=
es .noinstr.text section
    vmlinux.o: warning: objtool: __sev_put_ghcb+0x35: call to memcpy() leav=
es .noinstr.text section
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x31: relocation to !END=
BR: machine_kexec_prepare+0x487
    arch/x86/kvm/kvm.o: warning: objtool: emulator_cmpxchg_emulated+0x70e: =
call to __ubsan_handle_load_invalid_value() with UACCESS enabled
    arch/x86/kvm/kvm.o: warning: objtool: paging64_update_accessed_dirty_bi=
ts+0x3a6: call to __ubsan_handle_load_invalid_value() with UACCESS enabled
    arch/x86/kvm/kvm.o: warning: objtool: paging32_update_accessed_dirty_bi=
ts+0x398: call to __ubsan_handle_load_invalid_value() with UACCESS enabled
    arch/x86/kvm/kvm.o: warning: objtool: ept_update_accessed_dirty_bits+0x=
458: call to __ubsan_handle_load_invalid_value() with UACCESS enabled
    drivers/media/i2c/m5mols/m5mols.o: warning: objtool: m5mols_set_fmt() f=
alls through to next function m5mols_get_frame_desc()

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-15) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    lib/maple_tree.c:4300:20: warning: stack frame size (1076) exceeds limi=
t (1024) in 'mas_wr_modify' [-Wframe-larger-than]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-15) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-15) =E2=80=94 PASS, 0 errors, 15 warnings, =
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
    mm/shmem.c:2839:12: warning: unused function 'shmem_fileattr_get' [-Wun=
used-function]
    mm/shmem.c:2848:12: warning: unused function 'shmem_fileattr_set' [-Wun=
used-function]
    2 warnings generated.
    lib/maple_tree.c:4300:20: warning: stack frame size (1104) exceeds limi=
t (1024) in 'mas_wr_modify' [-Wframe-larger-than]
    1 warning generated.
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

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
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: 'shmem_fileattr_set' defined but not used =
[-Wunused-function]
    mm/shmem.c:2839:12: warning: 'shmem_fileattr_get' defined but not used =
[-Wunused-function]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: 'shmem_fileattr_set' defined but not used =
[-Wunused-function]
    mm/shmem.c:2839:12: warning: 'shmem_fileattr_get' defined but not used =
[-Wunused-function]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

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
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

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
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-15) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-15) =E2=80=94 PASS, 0 er=
rors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-15) =E2=80=94 PASS, 0 errors, 0 warn=
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
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 2 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: 'shmem_fileattr_set' defined but not used =
[-Wunused-function]
    mm/shmem.c:2839:12: warning: 'shmem_fileattr_get' defined but not used =
[-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: 'shmem_fileattr_set' defined but not used =
[-Wunused-function]
    mm/shmem.c:2839:12: warning: 'shmem_fileattr_get' defined but not used =
[-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+debug (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warni=
ngs, 0 section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: 'shmem_fileattr_set' defined but not used =
[-Wunused-function]
    mm/shmem.c:2839:12: warning: 'shmem_fileattr_get' defined but not used =
[-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/shmem.c:2848:12: warning: 'shmem_fileattr_set' defined but not used =
[-Wunused-function]
    mm/shmem.c:2839:12: warning: 'shmem_fileattr_get' defined but not used =
[-Wunused-function]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-15) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    lib/maple_tree.c:4300:20: error: stack frame size (1084) exceeds limit =
(1024) in 'mas_wr_modify' [-Werror,-Wframe-larger-than]

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
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 2 warnings, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

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
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnin=
gs, 0 section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, =
0 section mismatches

Errors:
    ERROR: modpost: missing MODULE_LICENSE() in lib/crypto/libsha1.o

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-15) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    mm/shmem.c:2839:12: warning: unused function 'shmem_fileattr_get' [-Wun=
used-function]
    mm/shmem.c:2848:12: warning: unused function 'shmem_fileattr_set' [-Wun=
used-function]
    2 warnings generated.
    lib/maple_tree.c:4300:20: warning: stack frame size (1088) exceeds limi=
t (1024) in 'mas_wr_modify' [-Wframe-larger-than]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-15) =E2=80=94 PASS, 0 errors, 12 warnings, 0=
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
    lib/maple_tree.c:4300:20: warning: stack frame size (1096) exceeds limi=
t (1024) in 'mas_wr_modify' [-Wframe-larger-than]
    1 warning generated.
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
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

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
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

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
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: 'shmem_fileattr_set' defined but not used =
[-Wunused-function]
    mm/shmem.c:2839:12: warning: 'shmem_fileattr_get' defined but not used =
[-Wunused-function]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: 'shmem_fileattr_set' defined but not used =
[-Wunused-function]
    mm/shmem.c:2839:12: warning: 'shmem_fileattr_get' defined but not used =
[-Wunused-function]

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]
    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 requires 44 =
bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift-over=
flow=3D]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

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
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

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
s3c2410_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/power/supply/ab8500_chargalg.c:493:13: warning: unused variable=
 =E2=80=98ab8500_chargalg_ex_ac_enable_toggle=E2=80=99 [-Wunused-variable]
    drivers/power/supply/ab8500_chargalg.c:493:13: warning: =E2=80=98ab8500=
_chargalg_ex_ac_enable_toggle=E2=80=99 defined but not used [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:2848:12: warning: 'shmem_fileattr_set' defined but not used =
[-Wunused-function]
    mm/shmem.c:2839:12: warning: 'shmem_fileattr_get' defined but not used =
[-Wunused-function]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: 'shmem_fileattr_set' defined but not used =
[-Wunused-function]
    mm/shmem.c:2839:12: warning: 'shmem_fileattr_get' defined but not used =
[-Wunused-function]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-15) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

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
xcep_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    mm/shmem.c:2848:12: warning: =E2=80=98shmem_fileattr_set=E2=80=99 defin=
ed but not used [-Wunused-function]
    mm/shmem.c:2839:12: warning: =E2=80=98shmem_fileattr_get=E2=80=99 defin=
ed but not used [-Wunused-function]

---
For more info write to <info@kernelci.org>
