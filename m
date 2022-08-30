Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0717F5A5DC2
	for <lists+linux-next@lfdr.de>; Tue, 30 Aug 2022 10:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiH3IJg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Aug 2022 04:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiH3IJc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Aug 2022 04:09:32 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 032D2A1D62
        for <linux-next@vger.kernel.org>; Tue, 30 Aug 2022 01:09:29 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id c66so339009pfc.10
        for <linux-next@vger.kernel.org>; Tue, 30 Aug 2022 01:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=uV+4Dvf/PsVLbeZWNFdCnUKCLne+Ye/Y6Uvpm2le+LA=;
        b=5/3ba2B6On/NL48XBnFSI7K3WDFCjmLPZT47DGibGtufnwqiI2KDcQ/WPiWr2xNaU+
         LEJymU+V7KgGoA1R6JXaqMJgcSQi+213TUyBN2e/f13FojYSlfKq28aWMCeV+vsNgO9w
         5efN1laHUojnNyACc2MV9ZCcGy5dVkvNIjzU0+QlK9bR8B4fGTT76tFS6LPc+Dw4FD8Y
         bp2hAXQpKVZnUIraTsgRD9NgAC4LCtoJ0qqRwj3L99qdkJjVgILewOiHp1C34CG+60au
         1V/dUhDULTzdgYNfs6sJVkFOMwxFE3R51pUJyTvU7PGCrhq+LKyZl8CIAiALFyN8lJiD
         39HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=uV+4Dvf/PsVLbeZWNFdCnUKCLne+Ye/Y6Uvpm2le+LA=;
        b=n//IkJKLqRxuo6XqlRmRug27VEaM9eXdXD3fxsiqCekdHejcnZHuEINDDYNc+LDAB/
         UU3wv04dlwBSeMuACpIxmn1N20GVDh7l/zPUNFF0dy8GZSONSlvVT8gqIvYLGJ2lIk+X
         j/zhxagmAp5MpwjlTcMFvavYccfoCFAYOQ0f3C2fBq5YVEPYfrc7ZS8g8XHqYHwKTkNw
         R5QLjy/hYxVPcKeayBNndfp+Tt5csMU7zzVXD1E94Go0MklRIq4YDQlxu4l2DJQjnQj6
         KCYHItINhbJsbJUwC/ekSBO17r0xWHm/GQKWypkqy0Ss+Xew3wt9B9msQqVAOYwHBP0R
         bVaQ==
X-Gm-Message-State: ACgBeo2qx4V5LEtt+iO1ox+KEPOBp8z5MySbmDNdtAfemfwkdGxv4oBq
        puEbtBdz2dAKUe0xnpEH8TboqVjgWl/w8Ym2gTw=
X-Google-Smtp-Source: AA6agR5Ntt5O4MEr2UORBsqtpWKcSz3yTrQ3TJdXvj/IC0Ew7QRWDd5F1QFtk9mnfUhcIkpYP8P6yA==
X-Received: by 2002:a63:90c7:0:b0:42b:6b68:3655 with SMTP id a190-20020a6390c7000000b0042b6b683655mr16785891pge.335.1661846967135;
        Tue, 30 Aug 2022 01:09:27 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 126-20020a620484000000b0053617cbe2d2sm8607789pfe.168.2022.08.30.01.09.26
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 01:09:26 -0700 (PDT)
Message-ID: <630dc5b6.620a0220.cb394.f459@mx.google.com>
Date:   Tue, 30 Aug 2022 01:09:26 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220830
Subject: next/master build: 155 builds: 12 failed, 143 passed, 27 errors,
 66 warnings (next-20220830)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 155 builds: 12 failed, 143 passed, 27 errors, 66 warning=
s (next-20220830)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220830/

Tree: next
Branch: master
Git Describe: next-20220830
Git Commit: 282342f2dc97ccf54254c5de51bcc1101229615f
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config: (clang-13) =
FAIL
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook: (clang-13) FAIL

arm:
    allmodconfig: (clang-16) FAIL
    pxa_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL

riscv:
    allnoconfig: (clang-16) FAIL
    defconfig+CONFIG_EFI=3Dn: (clang-16) FAIL

x86_64:
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config: (clang-13=
) FAIL
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book: (clang-13) FAIL
    allmodconfig: (clang-16) FAIL

Errors and Warnings Detected:

arc:

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (clang-13): =
1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chr=
omebook (clang-13): 1 error, 1 warning
    defconfig+arm64-chromebook (clang-13): 6 warnings

arm:
    allmodconfig (clang-16): 1 error, 13 warnings
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings
    pxa_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors
    u8500_defconfig (gcc-10): 2 warnings

i386:

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    fuloong2e_defconfig (gcc-10): 1 error
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error
    rb532_defconfig (gcc-10): 1 warning

riscv:
    allnoconfig (clang-16): 2 errors, 1 warning
    defconfig+CONFIG_EFI=3Dn (clang-16): 8 errors, 8 warnings

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    allmodconfig (clang-16): 5 errors, 9 warnings
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (clang-13)=
: 1 error
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chrome=
book (clang-13): 1 error

Errors summary:

    5    clang: error: clang frontend command failed with exit code 70 (use=
 -v to see invocation)
    4    drivers/gpu/drm/msm/dsi/dsi_host.c:1903:14: error: variable 'devic=
e_node' is uninitialized when used here [-Werror,-Wuninitialized]
    3    fatal error: error in backend: unable to write nop sequence of 7 b=
ytes
    3    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    2    sound/soc/intel/skylake/skl.c:729:18: error: unused variable 'skl'=
 [-Werror,-Wunused-variable]
    2    fatal error: error in backend: unable to write nop sequence of 3 b=
ytes
    1    net/ieee802154/nl802154.c:2503:19: error: =E2=80=98NL802154_CMD_DE=
L_SEC_LEVEL=E2=80=99 undeclared here (not in a function); did you mean =E2=
=80=98NL802154_CMD_SET_CCA_ED_LEVEL=E2=80=99?
    1    ld.lld: error: undefined symbol: __aeabi_uldivmod
    1    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:481:6: error: var=
iable 'err' is used uninitialized whenever 'if' condition is false [-Werror=
,-Wsometimes-uninitialized]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vb=
a_32.c:1721:6: error: stack frame size (2160) exceeds limit (2048) in 'dml3=
2_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vb=
a_31.c:3908:6: error: stack frame size (2216) exceeds limit (2048) in 'dml3=
1_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vb=
a_30.c:3542:6: error: stack frame size (2200) exceeds limit (2048) in 'dml3=
0_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    12   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    12   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    8    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    5    drivers/gpu/drm/msm/dsi/dsi_host.c:1870:44: note: initialize the v=
ariable 'device_node' to silence this warning
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    3    1 warning generated.
    2    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:474:9: note: init=
ialize the variable 'err' to silence this warning
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
    1    printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
    1    drivers/power/supply/ab8500_chargalg.c:493:13: warning: =E2=80=98a=
b8500_chargalg_ex_ac_enable_toggle=E2=80=99 defined but not used [-Wunused-=
variable]
    1    drivers/power/supply/ab8500_chargalg.c:493:13: warning: unused var=
iable =E2=80=98ab8500_chargalg_ex_ac_enable_toggle=E2=80=99 [-Wunused-varia=
ble]
    1    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:481:6: warning: v=
ariable 'err' is used uninitialized whenever 'if' condition is false [-Wsom=
etimes-uninitialized]
    1    drivers/media/i2c/m5mols/m5mols.o: warning: objtool: m5mols_set_fm=
t() falls through to next function m5mols_get_frame_desc()
    1    drivers/gpu/drm/msm/dsi/dsi_host.c:1903:14: warning: variable 'dev=
ice_node' is uninitialized when used here [-Wuninitialized]
    1    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 require=
s 44 bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift=
-overflow=3D]
    1    arch/riscv/mm/dma-noncoherent.c:87:18: note: initialize the variab=
le 'cbom_hartid' to silence this warning
    1    arch/riscv/mm/dma-noncoherent.c:107:6: warning: variable 'cbom_har=
tid' is uninitialized when used here [-Wuninitialized]
    1    : warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    1    0.	Program arguments: /usr/lib/llvm-16/bin/clang -Wp,-MMD,kernel/r=
cu/.tree.o.d -nostdinc -I../arch/riscv/include -I./arch/riscv/include/gener=
ated -I../include -I./include -I../arch/riscv/include/uapi -I./arch/riscv/i=
nclude/generated/uapi -I../include/uapi -I./include/generated/uapi -include=
 ../include/linux/compiler-version.h -include ../include/linux/kconfig.h -i=
nclude ../include/linux/compiler_types.h -D__KERNEL__ -Qunused-arguments -f=
macro-prefix-map=3D../=3D -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-tr=
igraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Di=
mplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -=
Wno-format-security -std=3Dgnu11 --target=3Driscv64-linux-gnu -fintegrated-=
as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument=
 -mabi=3Dlp64 -march=3Drv64imac_zicbom_zihintpause -mno-save-restore -DCONF=
IG_PAGE_OFFSET=3D0xff60000000000000 -mcmodel=3Dmedany -fno-omit-frame-point=
er -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address-of-packe=
d-member -O2 -Wframe-larger-than=3D2048 -fstack-protector-strong -Wimplicit=
-fallthrough -Wno-gnu -Wno-unused-but-set-variable -Wno-unused-const-variab=
le -fno-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-i=
nit=3Dzero -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-fr=
om-clang -fno-stack-clash-protection -Wdeclaration-after-statement -Wvla -W=
no-pointer-sign -Wcast-function-type -fno-strict-overflow -fno-stack-check =
-Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wno-initializer-o=
verrides -Wno-format -Wno-sign-compare -Wno-pointer-to-enum-cast -Wno-tauto=
logical-constant-out-of-range-compare -Wno-unaligned-access -I ../kernel/rc=
u -I ./kernel/rcu -DKBUILD_MODFILE=3D\"kernel/rcu/tree\" -DKBUILD_BASENAME=
=3D\"tree\" -DKBUILD_MODNAME=3D\"tree\" -D__KBUILD_MODNAME=3Dkmod_tree -c -=
o kernel/rcu/tree.o ../kernel/rcu/tree.c
    1    0.	Program arguments: /usr/lib/llvm-16/bin/clang -Wp,-MMD,kernel/p=
rintk/.printk.o.d -nostdinc -I../arch/riscv/include -I./arch/riscv/include/=
generated -I../include -I./include -I../arch/riscv/include/uapi -I./arch/ri=
scv/include/generated/uapi -I../include/uapi -I./include/generated/uapi -in=
clude ../include/linux/compiler-version.h -include ../include/linux/kconfig=
.h -include ../include/linux/compiler_types.h -D__KERNEL__ -Qunused-argumen=
ts -fmacro-prefix-map=3D../=3D -Wall -Wundef -Werror=3Dstrict-prototypes -W=
no-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werro=
r=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-t=
ype -Wno-format-security -std=3Dgnu11 --target=3Driscv64-linux-gnu -fintegr=
ated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-arg=
ument -mabi=3Dlp64 -march=3Drv64imac_zicbom_zihintpause -mno-save-restore -=
DCONFIG_PAGE_OFFSET=3D0xff60000000000000 -mcmodel=3Dmedany -fno-omit-frame-=
pointer -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address-of-=
packed-member -O2 -Wframe-larger-than=3D2048 -fstack-protector-strong -Wimp=
licit-fallthrough -Wno-gnu -Wno-unused-but-set-variable -Wno-unused-const-v=
ariable -fno-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-=
var-init=3Dzero -enable-trivial-auto-var-init-zero-knowing-it-will-be-remov=
ed-from-clang -fno-stack-clash-protection -Wdeclaration-after-statement -Wv=
la -Wno-pointer-sign -Wcast-function-type -fno-strict-overflow -fno-stack-c=
heck -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wno-initiali=
zer-overrides -Wno-format -Wno-sign-compare -Wno-pointer-to-enum-cast -Wno-=
tautological-constant-out-of-range-compare -Wno-unaligned-access -I ../kern=
el/printk -I ./kernel/printk -DKBUILD_MODFILE=3D\"kernel/printk/printk\" -D=
KBUILD_BASENAME=3D\"printk\" -DKBUILD_MODNAME=3D\"printk\" -D__KBUILD_MODNA=
ME=3Dkmod_printk -c -o kernel/printk/printk.o ../kernel/printk/printk.c
    1    0.	Program arguments: /usr/lib/llvm-16/bin/clang -Wp,-MMD,init/.ma=
in.o.d -nostdinc -I../arch/riscv/include -I./arch/riscv/include/generated -=
I../include -I./include -I../arch/riscv/include/uapi -I./arch/riscv/include=
/generated/uapi -I../include/uapi -I./include/generated/uapi -include ../in=
clude/linux/compiler-version.h -include ../include/linux/kconfig.h -include=
 ../include/linux/compiler_types.h -D__KERNEL__ -Qunused-arguments -fmacro-=
prefix-map=3D../=3D -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraph=
s -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplici=
t-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-fo=
rmat-security -std=3Dgnu11 --target=3Driscv64-linux-gnu -fintegrated-as -We=
rror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mabi=
=3Dlp64 -march=3Drv64imac_zicbom_zihintpause -mno-save-restore -DCONFIG_PAG=
E_OFFSET=3D0xff60000000000000 -mcmodel=3Dmedany -fno-omit-frame-pointer -fn=
o-delete-null-pointer-checks -Wno-frame-address -Wno-address-of-packed-memb=
er -O2 -Wframe-larger-than=3D2048 -fstack-protector-strong -Wimplicit-fallt=
hrough -Wno-gnu -Wno-unused-but-set-variable -Wno-unused-const-variable -fn=
o-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-init=3D=
zero -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-cla=
ng -fno-stack-clash-protection -Wdeclaration-after-statement -Wvla -Wno-poi=
nter-sign -Wcast-function-type -fno-strict-overflow -fno-stack-check -Werro=
r=3Ddate-time -Werror=3Dincompatible-pointer-types -Wno-initializer-overrid=
es -Wno-format -Wno-sign-compare -Wno-pointer-to-enum-cast -Wno-tautologica=
l-constant-out-of-range-compare -Wno-unaligned-access -fno-function-section=
s -fno-data-sections -I ../init -I ./init -DKBUILD_MODFILE=3D\"init/main\" =
-DKBUILD_BASENAME=3D\"main\" -DKBUILD_MODNAME=3D\"main\" -D__KBUILD_MODNAME=
=3Dkmod_main -c -o init/main.o ../init/main.c
    1    0.	Program arguments: /usr/lib/llvm-16/bin/clang -Wp,-MMD,init/.ma=
in.o.d -nostdinc -I../arch/riscv/include -I./arch/riscv/include/generated -=
I../include -I./include -I../arch/riscv/include/uapi -I./arch/riscv/include=
/generated/uapi -I../include/uapi -I./include/generated/uapi -include ../in=
clude/linux/compiler-version.h -include ../include/linux/kconfig.h -include=
 ../include/linux/compiler_types.h -D__KERNEL__ -Qunused-arguments -fmacro-=
prefix-map=3D../=3D -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraph=
s -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplici=
t-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-fo=
rmat-security -std=3Dgnu11 --target=3Driscv64-linux-gnu -fintegrated-as -We=
rror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mabi=
=3Dlp64 -march=3Drv64imac_zicbom_zihintpause -mno-save-restore -DCONFIG_PAG=
E_OFFSET=3D0xff60000000000000 -mcmodel=3Dmedany -fno-delete-null-pointer-ch=
ecks -Wno-frame-address -Wno-address-of-packed-member -O2 -Wframe-larger-th=
an=3D2048 -fno-stack-protector -Wimplicit-fallthrough -Wno-gnu -Wno-unused-=
but-set-variable -Wno-unused-const-variable -fomit-frame-pointer -ftrivial-=
auto-var-init=3Dzero -enable-trivial-auto-var-init-zero-knowing-it-will-be-=
removed-from-clang -fno-stack-clash-protection -Wdeclaration-after-statemen=
t -Wvla -Wno-pointer-sign -Wcast-function-type -fno-strict-overflow -fno-st=
ack-check -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wno-ini=
tializer-overrides -Wno-format -Wno-sign-compare -Wno-pointer-to-enum-cast =
-Wno-tautological-constant-out-of-range-compare -Wno-unaligned-access -fno-=
function-sections -fno-data-sections -I ../init -I ./init -DKBUILD_MODFILE=
=3D\"init/main\" -DKBUILD_BASENAME=3D\"main\" -DKBUILD_MODNAME=3D\"main\" -=
D__KBUILD_MODNAME=3Dkmod_main -c -o init/main.o ../init/main.c
    1    0.	Program arguments: /usr/lib/llvm-16/bin/clang -Wp,-MMD,init/.do=
_mounts_initrd.o.d -nostdinc -I../arch/riscv/include -I./arch/riscv/include=
/generated -I../include -I./include -I../arch/riscv/include/uapi -I./arch/r=
iscv/include/generated/uapi -I../include/uapi -I./include/generated/uapi -i=
nclude ../include/linux/compiler-version.h -include ../include/linux/kconfi=
g.h -include ../include/linux/compiler_types.h -D__KERNEL__ -Qunused-argume=
nts -fmacro-prefix-map=3D../=3D -Wall -Wundef -Werror=3Dstrict-prototypes -=
Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werr=
or=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-=
type -Wno-format-security -std=3Dgnu11 --target=3Driscv64-linux-gnu -finteg=
rated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-ar=
gument -mabi=3Dlp64 -march=3Drv64imac_zicbom_zihintpause -mno-save-restore =
-DCONFIG_PAGE_OFFSET=3D0xff60000000000000 -mcmodel=3Dmedany -fno-omit-frame=
-pointer -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address-of=
-packed-member -O2 -Wframe-larger-than=3D2048 -fstack-protector-strong -Wim=
plicit-fallthrough -Wno-gnu -Wno-unused-but-set-variable -Wno-unused-const-=
variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto=
-var-init=3Dzero -enable-trivial-auto-var-init-zero-knowing-it-will-be-remo=
ved-from-clang -fno-stack-clash-protection -Wdeclaration-after-statement -W=
vla -Wno-pointer-sign -Wcast-function-type -fno-strict-overflow -fno-stack-=
check -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wno-initial=
izer-overrides -Wno-format -Wno-sign-compare -Wno-pointer-to-enum-cast -Wno=
-tautological-constant-out-of-range-compare -Wno-unaligned-access -fno-func=
tion-sections -fno-data-sections -I ../init -I ./init -DKBUILD_MODFILE=3D\"=
init/mounts\" -DKBUILD_BASENAME=3D\"do_mounts_initrd\" -DKBUILD_MODNAME=3D\=
"mounts\" -D__KBUILD_MODNAME=3Dkmod_mounts -c -o init/do_mounts_initrd.o ..=
/init/do_mounts_initrd.c

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
allmodconfig (x86_64, clang-16) =E2=80=94 FAIL, 5 errors, 9 warnings, 0 sec=
tion mismatches

Errors:
    drivers/gpu/drm/msm/dsi/dsi_host.c:1903:14: error: variable 'device_nod=
e' is uninitialized when used here [-Werror,-Wuninitialized]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.=
c:3542:6: error: stack frame size (2200) exceeds limit (2048) in 'dml30_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.=
c:1721:6: error: stack frame size (2160) exceeds limit (2048) in 'dml32_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.=
c:3908:6: error: stack frame size (2216) exceeds limit (2048) in 'dml31_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:481:6: error: variable=
 'err' is used uninitialized whenever 'if' condition is false [-Werror,-Wso=
metimes-uninitialized]

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
    drivers/media/i2c/m5mols/m5mols.o: warning: objtool: m5mols_set_fmt() f=
alls through to next function m5mols_get_frame_desc()
    drivers/gpu/drm/msm/dsi/dsi_host.c:1870:44: note: initialize the variab=
le 'device_node' to silence this warning
    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:474:9: note: initializ=
e the variable 'err' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-16) =E2=80=94 FAIL, 1 error, 13 warnings, 0 sectio=
n mismatches

Errors:
    ld.lld: error: undefined symbol: __aeabi_uldivmod

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    clang: warning: argument unused during compilation: '-march=3Darmv6k' [=
-Wunused-command-line-argument]
    : warning: argument unused during compilation: '-march=3Darmv6k' [-Wunu=
sed-command-line-argument]
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
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
allnoconfig (i386, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, clang-16) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    fatal error: error in backend: unable to write nop sequence of 7 bytes
    clang: error: clang frontend command failed with exit code 70 (use -v t=
o see invocation)

Warnings:
    0.	Program arguments: /usr/lib/llvm-16/bin/clang -Wp,-MMD,init/.main.o.=
d -nostdinc -I../arch/riscv/include -I./arch/riscv/include/generated -I../i=
nclude -I./include -I../arch/riscv/include/uapi -I./arch/riscv/include/gene=
rated/uapi -I../include/uapi -I./include/generated/uapi -include ../include=
/linux/compiler-version.h -include ../include/linux/kconfig.h -include ../i=
nclude/linux/compiler_types.h -D__KERNEL__ -Qunused-arguments -fmacro-prefi=
x-map=3D../=3D -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-fun=
ction-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-format-=
security -std=3Dgnu11 --target=3Driscv64-linux-gnu -fintegrated-as -Werror=
=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mabi=3Dl=
p64 -march=3Drv64imac_zicbom_zihintpause -mno-save-restore -DCONFIG_PAGE_OF=
FSET=3D0xff60000000000000 -mcmodel=3Dmedany -fno-delete-null-pointer-checks=
 -Wno-frame-address -Wno-address-of-packed-member -O2 -Wframe-larger-than=
=3D2048 -fno-stack-protector -Wimplicit-fallthrough -Wno-gnu -Wno-unused-bu=
t-set-variable -Wno-unused-const-variable -fomit-frame-pointer -ftrivial-au=
to-var-init=3Dzero -enable-trivial-auto-var-init-zero-knowing-it-will-be-re=
moved-from-clang -fno-stack-clash-protection -Wdeclaration-after-statement =
-Wvla -Wno-pointer-sign -Wcast-function-type -fno-strict-overflow -fno-stac=
k-check -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wno-initi=
alizer-overrides -Wno-format -Wno-sign-compare -Wno-pointer-to-enum-cast -W=
no-tautological-constant-out-of-range-compare -Wno-unaligned-access -fno-fu=
nction-sections -fno-data-sections -I ../init -I ./init -DKBUILD_MODFILE=3D=
\"init/main\" -DKBUILD_BASENAME=3D\"main\" -DKBUILD_MODNAME=3D\"main\" -D__=
KBUILD_MODNAME=3Dkmod_main -c -o init/main.o ../init/main.c

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
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
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
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    drivers/gpu/drm/msm/dsi/dsi_host.c:1903:14: error: variable 'device_nod=
e' is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/gpu/drm/msm/dsi/dsi_host.c:1870:44: note: initialize the variab=
le 'device_node' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    drivers/gpu/drm/msm/dsi/dsi_host.c:1903:14: error: variable 'device_nod=
e' is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/gpu/drm/msm/dsi/dsi_host.c:1870:44: note: initialize the variab=
le 'device_node' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatc=
hes

Errors:
    drivers/gpu/drm/msm/dsi/dsi_host.c:1903:14: error: variable 'device_nod=
e' is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/gpu/drm/msm/dsi/dsi_host.c:1870:44: note: initialize the variab=
le 'device_node' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 PASS, 0 errors, 6 warnings, 0 section mismatches

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

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 6 warnings, 0 section mismatches

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

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-denverton.flavour.config+x86-chr=
omebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromeos-intel-pineview.flavour.config+x86-chro=
mebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (x86_64, clang=
-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatches

Errors:
    sound/soc/intel/skylake/skl.c:729:18: error: unused variable 'skl' [-We=
rror,-Wunused-variable]

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mismatch=
es

Errors:
    sound/soc/intel/skylake/skl.c:729:18: error: unused variable 'skl' [-We=
rror,-Wunused-variable]

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
defconfig+CONFIG_ARM64_16K_PAGES=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 erro=
rs, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-16) =E2=80=94 FAIL, 8 errors, 8 warn=
ings, 0 section mismatches

Errors:
    fatal error: error in backend: unable to write nop sequence of 7 bytes
    clang: error: clang frontend command failed with exit code 70 (use -v t=
o see invocation)
    fatal error: error in backend: unable to write nop sequence of 7 bytes
    clang: error: clang frontend command failed with exit code 70 (use -v t=
o see invocation)
    fatal error: error in backend: unable to write nop sequence of 3 bytes
    clang: error: clang frontend command failed with exit code 70 (use -v t=
o see invocation)
    fatal error: error in backend: unable to write nop sequence of 3 bytes
    clang: error: clang frontend command failed with exit code 70 (use -v t=
o see invocation)

Warnings:
    0.	Program arguments: /usr/lib/llvm-16/bin/clang -Wp,-MMD,init/.do_moun=
ts_initrd.o.d -nostdinc -I../arch/riscv/include -I./arch/riscv/include/gene=
rated -I../include -I./include -I../arch/riscv/include/uapi -I./arch/riscv/=
include/generated/uapi -I../include/uapi -I./include/generated/uapi -includ=
e ../include/linux/compiler-version.h -include ../include/linux/kconfig.h -=
include ../include/linux/compiler_types.h -D__KERNEL__ -Qunused-arguments -=
fmacro-prefix-map=3D../=3D -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-t=
rigraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3D=
implicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type =
-Wno-format-security -std=3Dgnu11 --target=3Driscv64-linux-gnu -fintegrated=
-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argumen=
t -mabi=3Dlp64 -march=3Drv64imac_zicbom_zihintpause -mno-save-restore -DCON=
FIG_PAGE_OFFSET=3D0xff60000000000000 -mcmodel=3Dmedany -fno-omit-frame-poin=
ter -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address-of-pack=
ed-member -O2 -Wframe-larger-than=3D2048 -fstack-protector-strong -Wimplici=
t-fallthrough -Wno-gnu -Wno-unused-but-set-variable -Wno-unused-const-varia=
ble -fno-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-=
init=3Dzero -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-f=
rom-clang -fno-stack-clash-protection -Wdeclaration-after-statement -Wvla -=
Wno-pointer-sign -Wcast-function-type -fno-strict-overflow -fno-stack-check=
 -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wno-initializer-=
overrides -Wno-format -Wno-sign-compare -Wno-pointer-to-enum-cast -Wno-taut=
ological-constant-out-of-range-compare -Wno-unaligned-access -fno-function-=
sections -fno-data-sections -I ../init -I ./init -DKBUILD_MODFILE=3D\"init/=
mounts\" -DKBUILD_BASENAME=3D\"do_mounts_initrd\" -DKBUILD_MODNAME=3D\"moun=
ts\" -D__KBUILD_MODNAME=3Dkmod_mounts -c -o init/do_mounts_initrd.o ../init=
/do_mounts_initrd.c
    0.	Program arguments: /usr/lib/llvm-16/bin/clang -Wp,-MMD,init/.main.o.=
d -nostdinc -I../arch/riscv/include -I./arch/riscv/include/generated -I../i=
nclude -I./include -I../arch/riscv/include/uapi -I./arch/riscv/include/gene=
rated/uapi -I../include/uapi -I./include/generated/uapi -include ../include=
/linux/compiler-version.h -include ../include/linux/kconfig.h -include ../i=
nclude/linux/compiler_types.h -D__KERNEL__ -Qunused-arguments -fmacro-prefi=
x-map=3D../=3D -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigraphs -fn=
o-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplicit-fun=
ction-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-format-=
security -std=3Dgnu11 --target=3Driscv64-linux-gnu -fintegrated-as -Werror=
=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mabi=3Dl=
p64 -march=3Drv64imac_zicbom_zihintpause -mno-save-restore -DCONFIG_PAGE_OF=
FSET=3D0xff60000000000000 -mcmodel=3Dmedany -fno-omit-frame-pointer -fno-de=
lete-null-pointer-checks -Wno-frame-address -Wno-address-of-packed-member -=
O2 -Wframe-larger-than=3D2048 -fstack-protector-strong -Wimplicit-fallthrou=
gh -Wno-gnu -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-om=
it-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-init=3Dzero=
 -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang -=
fno-stack-clash-protection -Wdeclaration-after-statement -Wvla -Wno-pointer=
-sign -Wcast-function-type -fno-strict-overflow -fno-stack-check -Werror=3D=
date-time -Werror=3Dincompatible-pointer-types -Wno-initializer-overrides -=
Wno-format -Wno-sign-compare -Wno-pointer-to-enum-cast -Wno-tautological-co=
nstant-out-of-range-compare -Wno-unaligned-access -fno-function-sections -f=
no-data-sections -I ../init -I ./init -DKBUILD_MODFILE=3D\"init/main\" -DKB=
UILD_BASENAME=3D\"main\" -DKBUILD_MODNAME=3D\"main\" -D__KBUILD_MODNAME=3Dk=
mod_main -c -o init/main.o ../init/main.c
    0.	Program arguments: /usr/lib/llvm-16/bin/clang -Wp,-MMD,kernel/printk=
/.printk.o.d -nostdinc -I../arch/riscv/include -I./arch/riscv/include/gener=
ated -I../include -I./include -I../arch/riscv/include/uapi -I./arch/riscv/i=
nclude/generated/uapi -I../include/uapi -I./include/generated/uapi -include=
 ../include/linux/compiler-version.h -include ../include/linux/kconfig.h -i=
nclude ../include/linux/compiler_types.h -D__KERNEL__ -Qunused-arguments -f=
macro-prefix-map=3D../=3D -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-tr=
igraphs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Di=
mplicit-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -=
Wno-format-security -std=3Dgnu11 --target=3Driscv64-linux-gnu -fintegrated-=
as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimization-argument=
 -mabi=3Dlp64 -march=3Drv64imac_zicbom_zihintpause -mno-save-restore -DCONF=
IG_PAGE_OFFSET=3D0xff60000000000000 -mcmodel=3Dmedany -fno-omit-frame-point=
er -fno-delete-null-pointer-checks -Wno-frame-address -Wno-address-of-packe=
d-member -O2 -Wframe-larger-than=3D2048 -fstack-protector-strong -Wimplicit=
-fallthrough -Wno-gnu -Wno-unused-but-set-variable -Wno-unused-const-variab=
le -fno-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-i=
nit=3Dzero -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-fr=
om-clang -fno-stack-clash-protection -Wdeclaration-after-statement -Wvla -W=
no-pointer-sign -Wcast-function-type -fno-strict-overflow -fno-stack-check =
-Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wno-initializer-o=
verrides -Wno-format -Wno-sign-compare -Wno-pointer-to-enum-cast -Wno-tauto=
logical-constant-out-of-range-compare -Wno-unaligned-access -I ../kernel/pr=
intk -I ./kernel/printk -DKBUILD_MODFILE=3D\"kernel/printk/printk\" -DKBUIL=
D_BASENAME=3D\"printk\" -DKBUILD_MODNAME=3D\"printk\" -D__KBUILD_MODNAME=3D=
kmod_printk -c -o kernel/printk/printk.o ../kernel/printk/printk.c
    0.	Program arguments: /usr/lib/llvm-16/bin/clang -Wp,-MMD,kernel/rcu/.t=
ree.o.d -nostdinc -I../arch/riscv/include -I./arch/riscv/include/generated =
-I../include -I./include -I../arch/riscv/include/uapi -I./arch/riscv/includ=
e/generated/uapi -I../include/uapi -I./include/generated/uapi -include ../i=
nclude/linux/compiler-version.h -include ../include/linux/kconfig.h -includ=
e ../include/linux/compiler_types.h -D__KERNEL__ -Qunused-arguments -fmacro=
-prefix-map=3D../=3D -Wall -Wundef -Werror=3Dstrict-prototypes -Wno-trigrap=
hs -fno-strict-aliasing -fno-common -fshort-wchar -fno-PIE -Werror=3Dimplic=
it-function-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Wno-f=
ormat-security -std=3Dgnu11 --target=3Driscv64-linux-gnu -fintegrated-as -W=
error=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -mab=
i=3Dlp64 -march=3Drv64imac_zicbom_zihintpause -mno-save-restore -DCONFIG_PA=
GE_OFFSET=3D0xff60000000000000 -mcmodel=3Dmedany -fno-omit-frame-pointer -f=
no-delete-null-pointer-checks -Wno-frame-address -Wno-address-of-packed-mem=
ber -O2 -Wframe-larger-than=3D2048 -fstack-protector-strong -Wimplicit-fall=
through -Wno-gnu -Wno-unused-but-set-variable -Wno-unused-const-variable -f=
no-omit-frame-pointer -fno-optimize-sibling-calls -ftrivial-auto-var-init=
=3Dzero -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-=
clang -fno-stack-clash-protection -Wdeclaration-after-statement -Wvla -Wno-=
pointer-sign -Wcast-function-type -fno-strict-overflow -fno-stack-check -We=
rror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wno-initializer-over=
rides -Wno-format -Wno-sign-compare -Wno-pointer-to-enum-cast -Wno-tautolog=
ical-constant-out-of-range-compare -Wno-unaligned-access -I ../kernel/rcu -=
I ./kernel/rcu -DKBUILD_MODFILE=3D\"kernel/rcu/tree\" -DKBUILD_BASENAME=3D\=
"tree\" -DKBUILD_MODNAME=3D\"tree\" -D__KBUILD_MODNAME=3Dkmod_tree -c -o ke=
rnel/rcu/tree.o ../kernel/rcu/tree.c
    arch/riscv/mm/dma-noncoherent.c:107:6: warning: variable 'cbom_hartid' =
is uninitialized when used here [-Wuninitialized]
    printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
    arch/riscv/mm/dma-noncoherent.c:87:18: note: initialize the variable 'c=
bom_hartid' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 6 wa=
rnings, 0 section mismatches

Warnings:
    drivers/gpu/drm/msm/dsi/dsi_host.c:1903:14: warning: variable 'device_n=
ode' is uninitialized when used here [-Wuninitialized]
    drivers/gpu/drm/msm/dsi/dsi_host.c:1870:44: note: initialize the variab=
le 'device_node' to silence this warning
    1 warning generated.
    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:481:6: warning: variab=
le 'err' is used uninitialized whenever 'if' condition is false [-Wsometime=
s-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:474:9: note: initializ=
e the variable 'err' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
defconfig+ima (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
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
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
magician_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
mini2440_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

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
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
pxa_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    net/ieee802154/nl802154.c:2503:19: error: =E2=80=98NL802154_CMD_DEL_SEC=
_LEVEL=E2=80=99 undeclared here (not in a function); did you mean =E2=80=98=
NL802154_CMD_SET_CCA_ED_LEVEL=E2=80=99?

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 requires 44 =
bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift-over=
flow=3D]

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
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
shannon_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 war=
nings, 0 section mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
tct_hammer_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
viper_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

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
zeus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---
For more info write to <info@kernelci.org>
