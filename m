Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 602D75A7770
	for <lists+linux-next@lfdr.de>; Wed, 31 Aug 2022 09:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiHaH0d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 31 Aug 2022 03:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiHaH0c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 31 Aug 2022 03:26:32 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2973BBA5C
        for <linux-next@vger.kernel.org>; Wed, 31 Aug 2022 00:26:28 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id q3so10090255pjg.3
        for <linux-next@vger.kernel.org>; Wed, 31 Aug 2022 00:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=OMjo0ayOviybP75xq52oYKsPOfYI6Jt30t/v5t9q3Tc=;
        b=UdDuWqo/ACdv58dU/qalWmIxuBeDOMjtk9kS86VJZouFOueDFZwmD3xvcwYkN3gnuL
         d8t4AdcDxY1B9cnYoOjC7A9YBxuxmh5VjOXn8lNeoKxXUNorW22MPR0y3EtURW3AApLI
         BwiWg8Yt2aEQdFJfl0vw3+OXkR5Y20X71HsNM7TnAh4SJIfUcQYJAMh5Zjn3+r/ltxFp
         CXCp6R33qpvgeEIPjt4OCSPd54aeR1FPWzZYaZBtODebyouxYr3Y2JVbqD7mxk4QtwnH
         i0EiQdy4UNNom6DpH9zbqHOKTfsFsivPtMN/jqlHTU5aseCyj2RmuzKYj8I7KyGK6pe6
         Bkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=OMjo0ayOviybP75xq52oYKsPOfYI6Jt30t/v5t9q3Tc=;
        b=VuBCSTFKRrLQ+cvX9fV1GwnX+1jeDsIh2S5nvvKfnO0bFCMpg9SrQUjNByPQ/4NGSF
         8GdumHgJGWftOA5at0viMrH/C1EWm71ux6LQNOYOBbHPVsSuZZsT6ztll3iofJiOpGew
         EbPvJLx9GcMKjISf74JBT6a/Aw2NFBQUxycULcx3XgFsb7P6Tld7tSQJ2wW74ofdHiGJ
         2gkKmSbvP/SE2oLK44a4uabgy55S36jzGAAH9hZgqvdbWJJuq6GCVjVARSkwpnTDOfIu
         zOqQB8F6u2VGoE20dA5SN75cTLL9Q9WDf6nTyj0L1Tz+USUw4mvAAwaIKbRseubL7QgF
         tvjQ==
X-Gm-Message-State: ACgBeo0yZtlv78xrbcGK3wm/GOL65gQVB10WsvjdnQxfXl6XwCYTOAP5
        Wdw0U+GorJ3W0A/V+etJVml5VBcmrhqbo555dx8=
X-Google-Smtp-Source: AA6agR61dE9yCuGP+FN0o29Mv5/ZxJpOVAH9YR7ABzSFQRrJZwHnuNuvUeWWp5UH3KmC79mUYT/e+A==
X-Received: by 2002:a17:90a:2a8a:b0:1fd:bb56:ec53 with SMTP id j10-20020a17090a2a8a00b001fdbb56ec53mr1969635pjd.78.1661930786792;
        Wed, 31 Aug 2022 00:26:26 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id u13-20020a170903124d00b0016bb24f5d19sm11060177plh.209.2022.08.31.00.26.25
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 00:26:25 -0700 (PDT)
Message-ID: <630f0d21.170a0220.5e78a.441e@mx.google.com>
Date:   Wed, 31 Aug 2022 00:26:25 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20220831
Subject: next/master build: 237 builds: 44 failed, 193 passed, 61 errors,
 88 warnings (next-20220831)
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

next/master build: 237 builds: 44 failed, 193 passed, 61 errors, 88 warning=
s (next-20220831)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20220831/

Tree: next
Branch: master
Git Describe: next-20220831
Git Commit: 7fd22855300e693668c3397771b3a2b3948f827a
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-16) FAIL

arm:
    allmodconfig: (clang-16) FAIL
    allnoconfig: (clang-16) FAIL
    allmodconfig: (gcc-10) FAIL
    allnoconfig: (gcc-10) FAIL
    am200epdkit_defconfig: (gcc-10) FAIL
    badge4_defconfig: (gcc-10) FAIL
    cerfcube_defconfig: (gcc-10) FAIL
    colibri_pxa300_defconfig: (gcc-10) FAIL
    corgi_defconfig: (gcc-10) FAIL
    dove_defconfig: (gcc-10) FAIL
    ep93xx_defconfig: (gcc-10) FAIL
    eseries_pxa_defconfig: (gcc-10) FAIL
    h5000_defconfig: (gcc-10) FAIL
    imxrt_defconfig: (gcc-10) FAIL
    jornada720_defconfig: (gcc-10) FAIL
    lpd270_defconfig: (gcc-10) FAIL
    lubbock_defconfig: (gcc-10) FAIL
    mainstone_defconfig: (gcc-10) FAIL
    mmp2_defconfig: (gcc-10) FAIL
    moxart_defconfig: (gcc-10) FAIL
    mps2_defconfig: (gcc-10) FAIL
    mv78xx0_defconfig: (gcc-10) FAIL
    mvebu_v5_defconfig: (gcc-10) FAIL
    netwinder_defconfig: (gcc-10) FAIL
    orion5x_defconfig: (gcc-10) FAIL
    pcm027_defconfig: (gcc-10) FAIL
    pxa168_defconfig: (gcc-10) FAIL
    pxa255-idp_defconfig: (gcc-10) FAIL
    pxa3xx_defconfig: (gcc-10) FAIL
    pxa_defconfig: (gcc-10) FAIL
    realview_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL
    simpad_defconfig: (gcc-10) FAIL
    sp7021_defconfig: (gcc-10) FAIL
    spitz_defconfig: (gcc-10) FAIL
    tinyconfig: (gcc-10) FAIL
    viper_defconfig: (gcc-10) FAIL
    zeus_defconfig: (gcc-10) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL

riscv:
    allnoconfig: (clang-16) FAIL
    defconfig+CONFIG_EFI=3Dn: (clang-16) FAIL

x86_64:
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config: (clang-13=
) FAIL
    allmodconfig: (clang-16) FAIL

Errors and Warnings Detected:

arc:

arm64:
    allmodconfig (clang-16): 1 error, 1 warning
    defconfig (clang-16): 3 warnings
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-16): 3 warnings
    defconfig+arm64-chromebook (clang-13): 3 warnings

arm:
    allmodconfig (gcc-10): 4 errors
    allmodconfig (clang-16): 1 error, 13 warnings
    allnoconfig (clang-16): 1 error, 1 warning
    allnoconfig (gcc-10): 1 error
    am200epdkit_defconfig (gcc-10): 1 error
    aspeed_g5_defconfig (clang-16): 10 warnings
    badge4_defconfig (gcc-10): 1 error
    cerfcube_defconfig (gcc-10): 1 error
    colibri_pxa300_defconfig (gcc-10): 1 error
    corgi_defconfig (gcc-10): 1 error
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings
    dove_defconfig (gcc-10): 2 errors
    ep93xx_defconfig (gcc-10): 1 error
    eseries_pxa_defconfig (gcc-10): 1 error
    h5000_defconfig (gcc-10): 1 error
    imxrt_defconfig (gcc-10): 1 error
    jornada720_defconfig (gcc-10): 1 error
    lpd270_defconfig (gcc-10): 1 error
    lubbock_defconfig (gcc-10): 1 error
    mainstone_defconfig (gcc-10): 1 error
    mmp2_defconfig (gcc-10): 2 errors
    moxart_defconfig (gcc-10): 1 error
    mps2_defconfig (gcc-10): 1 error
    multi_v7_defconfig (clang-16): 10 warnings
    mv78xx0_defconfig (gcc-10): 1 error
    mvebu_v5_defconfig (gcc-10): 1 error
    netwinder_defconfig (gcc-10): 1 error
    orion5x_defconfig (gcc-10): 1 error
    pcm027_defconfig (gcc-10): 1 error
    pxa168_defconfig (gcc-10): 2 errors
    pxa255-idp_defconfig (gcc-10): 1 error
    pxa3xx_defconfig (gcc-10): 1 error
    pxa_defconfig (gcc-10): 1 error
    realview_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors
    simpad_defconfig (gcc-10): 1 error
    sp7021_defconfig (gcc-10): 1 error
    spitz_defconfig (gcc-10): 1 error
    tinyconfig (gcc-10): 1 error
    u8500_defconfig (gcc-10): 2 warnings
    viper_defconfig (gcc-10): 1 error
    zeus_defconfig (gcc-10): 1 error

i386:

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    fuloong2e_defconfig (gcc-10): 1 error
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 1 error
    rb532_defconfig (gcc-10): 1 warning

riscv:
    allnoconfig (clang-16): 2 errors, 1 warning
    defconfig+CONFIG_EFI=3Dn (clang-16): 4 errors, 6 warnings

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 3 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    allmodconfig (clang-16): 4 errors, 8 warnings
    cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config (clang-13)=
: 1 error

Errors summary:

    7    init.c:(.init.text+0x1bc): undefined reference to `phys_initrd_sta=
rt'
    6    /tmp/kci/linux/build/../arch/arm/mm/init.c:218: undefined referenc=
e to `phys_initrd_start'
    5    /tmp/kci/linux/build/../arch/arm/mm/init.c:219: undefined referenc=
e to `phys_initrd_start'
    4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    3    init.c:(.init.text+0x1e0): undefined reference to `phys_initrd_sta=
rt'
    3    fatal error: error in backend: unable to write nop sequence of 7 b=
ytes
    3    clang: error: clang frontend command failed with exit code 70 (use=
 -v to see invocation)
    3    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../arch/arm/mm/init.c=
:191: undefined reference to `phys_initrd_start'
    3    /tmp/kci/linux/build/../arch/arm/mm/init.c:191: undefined referenc=
e to `phys_initrd_start'
    2    init.c:(.init.text+0x1ec): undefined reference to `phys_initrd_sta=
rt'
    2    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:481:6: error: var=
iable 'err' is used uninitialized whenever 'if' condition is false [-Werror=
,-Wsometimes-uninitialized]
    1    sound/soc/intel/skylake/skl.c:729:18: error: unused variable 'skl'=
 [-Werror,-Wunused-variable]
    1    net/ieee802154/nl802154.c:2503:19: error: =E2=80=98NL802154_CMD_DE=
L_SEC_LEVEL=E2=80=99 undeclared here (not in a function); did you mean =E2=
=80=98NL802154_CMD_SET_CCA_ED_LEVEL=E2=80=99?
    1    ld.lld: error: undefined symbol: phys_initrd_start
    1    ld.lld: error: undefined symbol: __aeabi_uldivmod
    1    init.c:(.init.text+0xf4): undefined reference to `phys_initrd_star=
t'
    1    init.c:(.init.text+0xd4): undefined reference to `phys_initrd_star=
t'
    1    init.c:(.init.text+0xc8): undefined reference to `phys_initrd_star=
t'
    1    init.c:(.init.text+0x244): undefined reference to `phys_initrd_sta=
rt'
    1    init.c:(.init.text+0x214): undefined reference to `phys_initrd_sta=
rt'
    1    init.c:(.init.text+0x1c0): undefined reference to `phys_initrd_sta=
rt'
    1    init.c:(.init.text+0x10c): undefined reference to `phys_initrd_sta=
rt'
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vb=
a_32.c:1721:6: error: stack frame size (2152) exceeds limit (2048) in 'dml3=
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
    1    ERROR: modpost: "aspeed_unregister_hace_hash_algs" [drivers/crypto=
/aspeed/aspeed_crypto.ko] undefined!
    1    ERROR: modpost: "aspeed_unregister_hace_crypto_algs" [drivers/cryp=
to/aspeed/aspeed_crypto.ko] undefined!
    1    ERROR: modpost: "aspeed_register_hace_hash_algs" [drivers/crypto/a=
speed/aspeed_crypto.ko] undefined!
    1    ERROR: modpost: "aspeed_register_hace_crypto_algs" [drivers/crypto=
/aspeed/aspeed_crypto.ko] undefined!

Warnings summary:

    23   clang: warning: argument unused during compilation: '-march=3Darmv=
6k' [-Wunused-command-line-argument]
    22   clang: warning: argument unused during compilation: '-march=3Darmv=
7-a' [-Wunused-command-line-argument]
    10   <stdin>:1517:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    5    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:474:9: note: init=
ialize the variable 'err' to silence this warning
    4    1 warning generated.
    3    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:481:6: warning: v=
ariable 'err' is used uninitialized whenever 'if' condition is false [-Wsom=
etimes-uninitialized]
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
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
    1    drivers/media/i2c/m5mols/m5mols.o: warning: objtool: m5mols_set_fm=
t() falls through to next function m5mols_get_frame_desc()
    1    clang: warning: argument unused during compilation: '-march=3Darmv=
7-m' [-Wunused-command-line-argument]
    1    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 require=
s 44 bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift=
-overflow=3D]
    1    arch/riscv/mm/dma-noncoherent.c:87:18: note: initialize the variab=
le 'cbom_hartid' to silence this warning
    1    arch/riscv/mm/dma-noncoherent.c:107:6: warning: variable 'cbom_har=
tid' is uninitialized when used here [-Wuninitialized]
    1    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
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
allmodconfig (arm64, clang-16) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:481:6: error: variable=
 'err' is used uninitialized whenever 'if' condition is false [-Werror,-Wso=
metimes-uninitialized]

Warnings:
    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:474:9: note: initializ=
e the variable 'err' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 4 errors, 0 warnings, 0 section =
mismatches

Errors:
    ERROR: modpost: "aspeed_register_hace_hash_algs" [drivers/crypto/aspeed=
/aspeed_crypto.ko] undefined!
    ERROR: modpost: "aspeed_unregister_hace_crypto_algs" [drivers/crypto/as=
peed/aspeed_crypto.ko] undefined!
    ERROR: modpost: "aspeed_register_hace_crypto_algs" [drivers/crypto/aspe=
ed/aspeed_crypto.ko] undefined!
    ERROR: modpost: "aspeed_unregister_hace_hash_algs" [drivers/crypto/aspe=
ed/aspeed_crypto.ko] undefined!

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-16) =E2=80=94 FAIL, 4 errors, 8 warnings, 0 sec=
tion mismatches

Errors:
    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:481:6: error: variable=
 'err' is used uninitialized whenever 'if' condition is false [-Werror,-Wso=
metimes-uninitialized]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.=
c:1721:6: error: stack frame size (2152) exceeds limit (2048) in 'dml32_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_mode_vba_30.=
c:3542:6: error: stack frame size (2200) exceeds limit (2048) in 'dml30_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_mode_vba_31.=
c:3908:6: error: stack frame size (2216) exceeds limit (2048) in 'dml31_Mod=
eSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]

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
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, clang-16) =E2=80=94 FAIL, 1 error, 1 warning, 0 section m=
ismatches

Errors:
    ld.lld: error: undefined symbol: phys_initrd_start

Warnings:
    clang: warning: argument unused during compilation: '-march=3Darmv7-m' =
[-Wunused-command-line-argument]

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    init.c:(.init.text+0xd4): undefined reference to `phys_initrd_start'

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    init.c:(.init.text+0x1bc): undefined reference to `phys_initrd_start'

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
aspeed_g5_defconfig (arm, clang-16) =E2=80=94 PASS, 0 errors, 10 warnings, =
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
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    /tmp/kci/linux/build/../arch/arm/mm/init.c:219: undefined reference to =
`phys_initrd_start'

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
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    init.c:(.init.text+0x1e0): undefined reference to `phys_initrd_start'

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
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings,=
 0 section mismatches

Errors:
    /tmp/kci/linux/build/../arch/arm/mm/init.c:218: undefined reference to =
`phys_initrd_start'

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    init.c:(.init.text+0x1ec): undefined reference to `phys_initrd_start'

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatch=
es

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-qualcomm.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section misma=
tches

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
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-16) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:481:6: warning: variab=
le 'err' is used uninitialized whenever 'if' condition is false [-Wsometime=
s-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:474:9: note: initializ=
e the variable 'err' to silence this warning
    1 warning generated.

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
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-16) =E2=80=94 PASS, 0 er=
rors, 3 warnings, 0 section mismatches

Warnings:
    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:481:6: warning: variab=
le 'err' is used uninitialized whenever 'if' condition is false [-Wsometime=
s-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:474:9: note: initializ=
e the variable 'err' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_EFI=3Dn (riscv, clang-16) =E2=80=94 FAIL, 4 errors, 6 warn=
ings, 0 section mismatches

Errors:
    fatal error: error in backend: unable to write nop sequence of 7 bytes
    clang: error: clang frontend command failed with exit code 70 (use -v t=
o see invocation)
    fatal error: error in backend: unable to write nop sequence of 7 bytes
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
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 3 wa=
rnings, 0 section mismatches

Warnings:
    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:481:6: warning: variab=
le 'err' is used uninitialized whenever 'if' condition is false [-Wsometime=
s-uninitialized]
    drivers/net/ethernet/mellanox/mlx5/core/en_rep.c:474:9: note: initializ=
e the variable 'err' to silence this warning
    1 warning generated.

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
defconfig+debug (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
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
dove_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    /tmp/kci/linux/build/../arch/arm/mm/init.c:191: undefined reference to =
`phys_initrd_start'
    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../arch/arm/mm/init.c:191:=
 undefined reference to `phys_initrd_start'

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    init.c:(.init.text+0x1c0): undefined reference to `phys_initrd_start'

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    init.c:(.init.text+0x1bc): undefined reference to `phys_initrd_start'

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
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    init.c:(.init.text+0x1bc): undefined reference to `phys_initrd_start'

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
haps_hs_smp_defconfig+kselftest (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    init.c:(.init.text+0xf4): undefined reference to `phys_initrd_start'

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
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    init.c:(.init.text+0x244): undefined reference to `phys_initrd_start'

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    /tmp/kci/linux/build/../arch/arm/mm/init.c:219: undefined reference to =
`phys_initrd_start'

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    /tmp/kci/linux/build/../arch/arm/mm/init.c:219: undefined reference to =
`phys_initrd_start'

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    /tmp/kci/linux/build/../arch/arm/mm/init.c:219: undefined reference to =
`phys_initrd_start'

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
mini2440_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    /tmp/kci/linux/build/../arch/arm/mm/init.c:191: undefined reference to =
`phys_initrd_start'
    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../arch/arm/mm/init.c:191:=
 undefined reference to `phys_initrd_start'

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    /tmp/kci/linux/build/../arch/arm/mm/init.c:218: undefined reference to =
`phys_initrd_start'

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    /tmp/kci/linux/build/../arch/arm/mm/init.c:218: undefined reference to =
`phys_initrd_start'

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
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-16) =E2=80=94 PASS, 0 errors, 10 warnings, 0=
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
mv78xx0_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    /tmp/kci/linux/build/../arch/arm/mm/init.c:218: undefined reference to =
`phys_initrd_start'

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    /tmp/kci/linux/build/../arch/arm/mm/init.c:218: undefined reference to =
`phys_initrd_start'

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
netwinder_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    init.c:(.init.text+0x1e0): undefined reference to `phys_initrd_start'

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
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    /tmp/kci/linux/build/../arch/arm/mm/init.c:218: undefined reference to =
`phys_initrd_start'

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
pcm027_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    init.c:(.init.text+0x1bc): undefined reference to `phys_initrd_start'

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
pxa168_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sect=
ion mismatches

Errors:
    /tmp/kci/linux/build/../arch/arm/mm/init.c:191: undefined reference to =
`phys_initrd_start'
    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../arch/arm/mm/init.c:191:=
 undefined reference to `phys_initrd_start'

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 s=
ection mismatches

Errors:
    /tmp/kci/linux/build/../arch/arm/mm/init.c:219: undefined reference to =
`phys_initrd_start'

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    init.c:(.init.text+0x1bc): undefined reference to `phys_initrd_start'

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
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sec=
tion mismatches

Errors:
    init.c:(.init.text+0x214): undefined reference to `phys_initrd_start'

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
simpad_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    init.c:(.init.text+0x1e0): undefined reference to `phys_initrd_start'

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    init.c:(.init.text+0x10c): undefined reference to `phys_initrd_start'

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
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
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    init.c:(.init.text+0x1ec): undefined reference to `phys_initrd_start'

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
tinyconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mis=
matches

Errors:
    init.c:(.init.text+0xc8): undefined reference to `phys_initrd_start'

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
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
viper_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sectio=
n mismatches

Errors:
    init.c:(.init.text+0x1bc): undefined reference to `phys_initrd_start'

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
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
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

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
zeus_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    init.c:(.init.text+0x1bc): undefined reference to `phys_initrd_start'

---
For more info write to <info@kernelci.org>
