Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB499668C12
	for <lists+linux-next@lfdr.de>; Fri, 13 Jan 2023 07:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbjAMGCj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Jan 2023 01:02:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239582AbjAMGBs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Jan 2023 01:01:48 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E099D1AA34
        for <linux-next@vger.kernel.org>; Thu, 12 Jan 2023 21:56:21 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id z4-20020a17090a170400b00226d331390cso23368232pjd.5
        for <linux-next@vger.kernel.org>; Thu, 12 Jan 2023 21:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zCbRhDS9Sssfsqi75VegyT6NHoBWD23gheR9fnP73Xw=;
        b=LUW973l4W57sIU4AexbuIVnL/l/QguTNC1CzXa5fcYJUYdbbLsoh0vykmgAF3V8Qt4
         ZjSPve7wTmcEhlKJvaydmsAgfhzHQStBLKJhA3sFMwxDQIbMCya/Dv/0a+NVsYfa2xiW
         5U28wU9gPdFb09LzfpHlZ9cUjr3q8znGA4TiTTc+rg06+1cYa0+2++t/AvgExf9XWSNm
         PabTNe+NQ5z2/nDHMZRlWLGv+ZVFl0JnFEtKVWKFpN+VVlEyxm+Msi4NG/WU0RQYpzlQ
         /6WA2IYDLAv8eGFbmGmBqqm+UGzmI5t26j0jPbIroSF6o2FQ2TI1WOnSplFI9d0yzVoI
         9I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zCbRhDS9Sssfsqi75VegyT6NHoBWD23gheR9fnP73Xw=;
        b=f077N2s4GkEkfY+ofWCGVCbYbSUmdPFGEJQXftjB8jSC4jq564zXQ+76BL2nEsxbds
         dCoYEyN+sy2qsJFGkmCRv+z8MQRSa4LSM4wSDzR33EZJ6orkWq0HLaEALCbCE34ZyqR9
         3pV5ktfEubtcWB/hnCeC9wS0dLTCO8cPYYwCVsNICFV0MFqUKlHMb1exEkr8zrhxGoFO
         Co/4QTCWba1kfSrdYO3FFUOi94Z3POFci/rPHWTh9OsSFdcTqKHsnmIoE91PKGuboV6o
         RCFlxdFOr7eLUM6IkjcxAqhc/V8CRyzDbb5iEbrbiVbVj9svJvMHlw/uZpYyiYkrAQhQ
         zS8Q==
X-Gm-Message-State: AFqh2koQtFMerjW+i3Bdw1galxn4rko2Aky6m0OHqbPXmPURkrrNfYV9
        QcI9aZQCzmk2eR67WhxAXl3oIR1jMCMQfR7dvFzAjg==
X-Google-Smtp-Source: AMrXdXtpFxwD0vkWNzPaRqTcG4OuYMeKC7LG42rG7kHHwXAX7NB1Vmtp0SbSUUAlaiqUCTMarwV3Cw==
X-Received: by 2002:a17:90a:6002:b0:216:cdc7:58bb with SMTP id y2-20020a17090a600200b00216cdc758bbmr27950169pji.34.1673589379602;
        Thu, 12 Jan 2023 21:56:19 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id t11-20020a17090a448b00b00226f49eca92sm10420160pjg.28.2023.01.12.21.56.18
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 21:56:18 -0800 (PST)
Message-ID: <63c0f282.170a0220.5d515.0d1a@mx.google.com>
Date:   Thu, 12 Jan 2023 21:56:18 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20230113
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: build
Subject: next/master build: 211 builds: 16 failed, 195 passed, 36 errors,
 656 warnings (next-20230113)
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

next/master build: 211 builds: 16 failed, 195 passed, 36 errors, 656 warnin=
gs (next-20230113)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230113/

Tree: next
Branch: master
Git Describe: next-20230113
Git Commit: 6b31ffe9c8b9947d6d3552d6e10752fd96d0f80f
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm64:
    allmodconfig: (clang-16) FAIL

arm:
    allmodconfig: (clang-16) FAIL
    allmodconfig: (gcc-10) FAIL
    assabet_defconfig: (gcc-10) FAIL
    collie_defconfig: (gcc-10) FAIL
    h3600_defconfig: (gcc-10) FAIL
    neponset_defconfig: (gcc-10) FAIL
    pxa3xx_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-16) FAIL

mips:
    32r2el_defconfig+debug: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    loongson2k_defconfig: (gcc-10) FAIL
    loongson3_defconfig: (gcc-10) FAIL

x86_64:
    x86_64_defconfig+rust: (rustc-1.62) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-10): 1 warning
    axs103_defconfig (gcc-10): 1 warning
    haps_hs_defconfig (gcc-10): 1 warning
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error
    nsimosci_hs_defconfig (gcc-10): 1 warning
    tinyconfig (gcc-10): 1 warning
    vdk_hs38_defconfig (gcc-10): 1 warning

arm64:
    allmodconfig (clang-16): 1 error

arm:
    allmodconfig (clang-16): 2 errors
    allmodconfig (gcc-10): 1 error, 1 warning
    am200epdkit_defconfig (gcc-10): 1 warning
    aspeed_g4_defconfig (gcc-10): 1 warning
    assabet_defconfig (gcc-10): 4 errors, 3 warnings
    at91_dt_defconfig (gcc-10): 1 warning
    bcm2835_defconfig (gcc-10): 1 warning
    collie_defconfig (gcc-10): 5 errors, 3 warnings
    davinci_all_defconfig (gcc-10): 1 warning
    footbridge_defconfig (gcc-10): 1 warning
    gemini_defconfig (gcc-10): 1 warning
    h3600_defconfig (gcc-10): 6 errors, 5 warnings
    imx_v4_v5_defconfig (gcc-10): 1 warning
    imxrt_defconfig (gcc-10): 52 warnings
    integrator_defconfig (gcc-10): 1 warning
    ixp4xx_defconfig (gcc-10): 1 warning
    jornada720_defconfig (gcc-10): 1 warning
    lpc18xx_defconfig (gcc-10): 54 warnings
    lpc32xx_defconfig (gcc-10): 1 warning
    milbeaut_m10v_defconfig (gcc-10): 79 warnings
    mmp2_defconfig (gcc-10): 1 warning
    moxart_defconfig (gcc-10): 1 warning
    mps2_defconfig (gcc-10): 51 warnings
    multi_v4t_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (clang-16): 2 warnings
    multi_v5_defconfig (gcc-10): 1 warning
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 1 warning
    multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (gcc-10): 123 warnings
    mvebu_v5_defconfig (gcc-10): 1 warning
    mxs_defconfig (gcc-10): 1 warning
    neponset_defconfig (gcc-10): 4 errors, 2 warnings
    netwinder_defconfig (gcc-10): 1 warning
    nhk8815_defconfig (gcc-10): 1 warning
    orion5x_defconfig (gcc-10): 1 warning
    pxa168_defconfig (gcc-10): 1 warning
    pxa3xx_defconfig (gcc-10): 1 error, 1 warning
    pxa910_defconfig (gcc-10): 1 warning
    pxa_defconfig (gcc-10): 1 warning
    rpc_defconfig (gcc-10): 2 errors, 1 warning
    s3c6400_defconfig (gcc-10): 1 warning
    s5pv210_defconfig (gcc-10): 1 warning
    sama5_defconfig (gcc-10): 1 warning
    sama7_defconfig (gcc-10): 1 warning
    sp7021_defconfig (gcc-10): 65 warnings
    spear3xx_defconfig (gcc-10): 1 warning
    spear6xx_defconfig (gcc-10): 1 warning
    spitz_defconfig (gcc-10): 1 warning
    stm32_defconfig (gcc-10): 49 warnings
    versatile_defconfig (gcc-10): 1 warning
    vf610m4_defconfig (gcc-10): 48 warnings
    vt8500_v6_v7_defconfig (gcc-10): 1 warning
    wpcm450_defconfig (gcc-10): 1 warning

i386:
    allmodconfig (clang-16): 2 errors
    allnoconfig (gcc-10): 1 warning
    allnoconfig (clang-16): 2 warnings
    tinyconfig (gcc-10): 1 warning

mips:
    32r2el_defconfig (gcc-10): 1 warning
    32r2el_defconfig+debug (gcc-10): 1 warning
    32r2el_defconfig+kselftest (gcc-10): 1 warning
    ar7_defconfig (gcc-10): 1 warning
    ath25_defconfig (gcc-10): 1 warning
    ath79_defconfig (gcc-10): 1 warning
    bcm47xx_defconfig (gcc-10): 1 warning
    bcm63xx_defconfig (gcc-10): 1 warning
    ci20_defconfig (gcc-10): 1 warning
    cobalt_defconfig (gcc-10): 1 warning
    cu1000-neo_defconfig (gcc-10): 1 warning
    cu1830-neo_defconfig (gcc-10): 1 warning
    db1xxx_defconfig (gcc-10): 1 warning
    decstation_64_defconfig (gcc-10): 1 warning
    decstation_defconfig (gcc-10): 1 warning
    decstation_r4k_defconfig (gcc-10): 1 warning
    fuloong2e_defconfig (gcc-10): 1 error, 1 warning
    gcw0_defconfig (gcc-10): 1 warning
    gpr_defconfig (gcc-10): 1 warning
    ip22_defconfig (gcc-10): 1 warning
    ip28_defconfig (gcc-10): 1 warning
    ip32_defconfig (gcc-10): 1 warning
    jazz_defconfig (gcc-10): 1 warning
    lemote2f_defconfig (gcc-10): 1 error, 1 warning
    loongson1b_defconfig (gcc-10): 1 warning
    loongson1c_defconfig (gcc-10): 1 warning
    loongson2k_defconfig (gcc-10): 2 errors, 4 warnings
    loongson3_defconfig (gcc-10): 2 errors, 3 warnings
    malta_qemu_32r6_defconfig (gcc-10): 1 warning
    mtx1_defconfig (gcc-10): 1 warning
    omega2p_defconfig (gcc-10): 1 warning
    pic32mzda_defconfig (gcc-10): 1 warning
    qi_lb60_defconfig (gcc-10): 1 warning
    rb532_defconfig (gcc-10): 2 warnings
    rbtx49xx_defconfig (gcc-10): 1 warning
    rm200_defconfig (gcc-10): 1 warning
    rs90_defconfig (gcc-10): 1 warning
    rt305x_defconfig (gcc-10): 1 warning
    vocore2_defconfig (gcc-10): 1 warning

riscv:

sparc:
    allnoconfig (gcc-10): 2 warnings
    sparc32_defconfig (gcc-10): 3 warnings
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 2 warnings

x86_64:
    allnoconfig (gcc-10): 1 warning
    allnoconfig (clang-16): 2 warnings
    tinyconfig (gcc-10): 1 warning
    x86_64_defconfig+kselftest (rustc-1.62): 4 warnings
    x86_64_defconfig+kselftest (gcc-10): 2 warnings
    x86_64_defconfig+rust (rustc-1.62): 1 error
    x86_64_defconfig+x86-chromebook+kselftest (gcc-10): 2 warnings

Errors summary:

    2    drivers/scsi/qla2xxx/qla_mid.c:1094:45: error: format specifies ty=
pe 'long' but the argument has type 'unsigned int' [-Werror,-Wformat]
    2    drivers/gpu/drm/ttm/ttm_bo_util.c:429:3: error: implicit declarati=
on of function =E2=80=98vunmap=E2=80=99; did you mean =E2=80=98kunmap=E2=80=
=99? [-Werror=3Dimplicit-function-declaration]
    2    drivers/gpu/drm/ttm/ttm_bo_util.c:364:18: error: implicit declarat=
ion of function =E2=80=98vmap=E2=80=99; did you mean =E2=80=98kmap=E2=80=99=
? [-Werror=3Dimplicit-function-declaration]
    2    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    2    arch/arm/mach-sa1100/assabet.c:328:3: error: =E2=80=98struct irda_=
platform_data=E2=80=99 has no member named =E2=80=98set_speed=E2=80=99
    2    arch/arm/mach-sa1100/assabet.c:327:3: error: =E2=80=98struct irda_=
platform_data=E2=80=99 has no member named =E2=80=98set_power=E2=80=99
    2    arch/arm/mach-sa1100/assabet.c:326:34: error: storage size of =E2=
=80=98assabet_irda_data=E2=80=99 isn=E2=80=99t known
    2    arch/arm/mach-sa1100/assabet.c:326:15: error: variable =E2=80=98as=
sabet_irda_data=E2=80=99 has initializer but incomplete type
    1    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or =
directory
    1    include/linux/fortify-string.h:430:4: error: call to '__write_over=
flow_field' declared with 'warning' attribute: detected write beyond size o=
f field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-war=
ning]
    1    error: aborting due to previous error
    1    drivers/scsi/qla2xxx/qla_mid.c:1094:37: error: format =E2=80=98%ld=
=E2=80=99 expects argument of type =E2=80=98long int=E2=80=99, but argument=
 5 has type =E2=80=98unsigned int=E2=80=99 [-Werror=3Dformat=3D]
    1    drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3598:12: error: =
stack frame size (1256) exceeds limit (1024) in 'mlx5e_setup_tc' [-Werror,-=
Wframe-larger-than]
    1    drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3598:12: error: =
stack frame size (1076) exceeds limit (1024) in 'mlx5e_setup_tc' [-Werror,-=
Wframe-larger-than]
    1    arch/arm/mach-sa1100/h3600.c:125:3: error: =E2=80=98struct irda_pl=
atform_data=E2=80=99 has no member named =E2=80=98shutdown=E2=80=99
    1    arch/arm/mach-sa1100/h3600.c:124:3: error: =E2=80=98struct irda_pl=
atform_data=E2=80=99 has no member named =E2=80=98startup=E2=80=99
    1    arch/arm/mach-sa1100/h3600.c:123:3: error: =E2=80=98struct irda_pl=
atform_data=E2=80=99 has no member named =E2=80=98set_speed=E2=80=99
    1    arch/arm/mach-sa1100/h3600.c:122:3: error: =E2=80=98struct irda_pl=
atform_data=E2=80=99 has no member named =E2=80=98set_power=E2=80=99
    1    arch/arm/mach-sa1100/h3600.c:121:34: error: storage size of =E2=80=
=98h3600_irda_data=E2=80=99 isn=E2=80=99t known
    1    arch/arm/mach-sa1100/h3600.c:121:15: error: variable =E2=80=98h360=
0_irda_data=E2=80=99 has initializer but incomplete type
    1    arch/arm/mach-sa1100/collie.c:148:3: error: =E2=80=98struct irda_p=
latform_data=E2=80=99 has no member named =E2=80=98set_power=E2=80=99
    1    arch/arm/mach-sa1100/collie.c:147:3: error: =E2=80=98struct irda_p=
latform_data=E2=80=99 has no member named =E2=80=98shutdown=E2=80=99
    1    arch/arm/mach-sa1100/collie.c:146:3: error: =E2=80=98struct irda_p=
latform_data=E2=80=99 has no member named =E2=80=98startup=E2=80=99
    1    arch/arm/mach-sa1100/collie.c:145:34: error: storage size of =E2=
=80=98collie_ir_data=E2=80=99 isn=E2=80=99t known
    1    arch/arm/mach-sa1100/collie.c:145:15: error: variable =E2=80=98col=
lie_ir_data=E2=80=99 has initializer but incomplete type
    1    arch/arm/mach-pxa/pxa320.h:6:10: fatal error: mfp-pxa320.h: No suc=
h file or directory
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    516  <command-line>: warning: "__thumb2__" redefined
    86   kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=
=99 defined but not used [-Wunused-function]
    10   <stdin>:1517:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    6    kernel/workqueue.c:1993:13: warning: 'rebind_worker' defined but n=
ot used [-Wunused-function]
    6    WARNING: modpost: EXPORT symbol "asm_load_gs_index" [vmlinux] vers=
ion generation failed, symbol will not be versioned.
    3    kernel/workqueue.c:1993:13: warning: unused function 'rebind_worke=
r' [-Wunused-function]
    3    arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_devic=
e_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expec=
ted "0,0"
    3    1 warning generated.
    2    drivers/gpu/drm/ttm/ttm_bo_util.c:509:9: warning: assignment to =
=E2=80=98void *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from inte=
ger without a cast [-Wint-conversion]
    2    drivers/gpu/drm/ttm/ttm_bo_util.c:364:16: warning: assignment to =
=E2=80=98void *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from inte=
ger without a cast [-Wint-conversion]
    2    cc1: some warnings being treated as errors
    2    arch/arm/mach-sa1100/assabet.c:328:15: warning: excess elements in=
 struct initializer
    2    arch/arm/mach-sa1100/assabet.c:327:15: warning: excess elements in=
 struct initializer
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to=
 !ENDBR: .text+0x142f16
    1    vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xcc: relocation to =
!ENDBR: native_write_cr4+0x4
    1    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 require=
s 44 bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift=
-overflow=3D]
    1    cc1: all warnings being treated as errors
    1    arch/arm/mach-sa1100/h3600.c:125:14: warning: excess elements in s=
truct initializer
    1    arch/arm/mach-sa1100/h3600.c:124:13: warning: excess elements in s=
truct initializer
    1    arch/arm/mach-sa1100/h3600.c:123:15: warning: excess elements in s=
truct initializer
    1    arch/arm/mach-sa1100/h3600.c:122:15: warning: excess elements in s=
truct initializer
    1    arch/arm/mach-sa1100/collie.c:148:15: warning: excess elements in =
struct initializer
    1    arch/arm/mach-sa1100/collie.c:147:14: warning: excess elements in =
struct initializer
    1    arch/arm/mach-sa1100/collie.c:146:13: warning: excess elements in =
struct initializer

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
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 1 warning, =
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
allmodconfig (arm, clang-16) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 sectio=
n mismatches

Errors:
    drivers/scsi/qla2xxx/qla_mid.c:1094:45: error: format specifies type 'l=
ong' but the argument has type 'unsigned int' [-Werror,-Wformat]
    drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3598:12: error: stack=
 frame size (1256) exceeds limit (1024) in 'mlx5e_setup_tc' [-Werror,-Wfram=
e-larger-than]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-16) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    include/linux/fortify-string.h:430:4: error: call to '__write_overflow_=
field' declared with 'warning' attribute: detected write beyond size of fie=
ld (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mi=
smatches

Errors:
    drivers/scsi/qla2xxx/qla_mid.c:1094:37: error: format =E2=80=98%ld=E2=
=80=99 expects argument of type =E2=80=98long int=E2=80=99, but argument 5 =
has type =E2=80=98unsigned int=E2=80=99 [-Werror=3Dformat=3D]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-16) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 secti=
on mismatches

Errors:
    drivers/scsi/qla2xxx/qla_mid.c:1094:45: error: format specifies type 'l=
ong' but the argument has type 'unsigned int' [-Werror,-Wformat]
    drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3598:12: error: stack=
 frame size (1076) exceeds limit (1024) in 'mlx5e_setup_tc' [-Werror,-Wfram=
e-larger-than]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-16) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: unused function 'rebind_worker' [-=
Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    kernel/workqueue.c:1993:13: warning: 'rebind_worker' defined but not us=
ed [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-16) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: unused function 'rebind_worker' [-=
Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 FAIL, 4 errors, 3 warnings, 0 sec=
tion mismatches

Errors:
    arch/arm/mach-sa1100/assabet.c:326:15: error: variable =E2=80=98assabet=
_irda_data=E2=80=99 has initializer but incomplete type
    arch/arm/mach-sa1100/assabet.c:327:3: error: =E2=80=98struct irda_platf=
orm_data=E2=80=99 has no member named =E2=80=98set_power=E2=80=99
    arch/arm/mach-sa1100/assabet.c:328:3: error: =E2=80=98struct irda_platf=
orm_data=E2=80=99 has no member named =E2=80=98set_speed=E2=80=99
    arch/arm/mach-sa1100/assabet.c:326:34: error: storage size of =E2=80=98=
assabet_irda_data=E2=80=99 isn=E2=80=99t known

Warnings:
    arch/arm/mach-sa1100/assabet.c:327:15: warning: excess elements in stru=
ct initializer
    arch/arm/mach-sa1100/assabet.c:328:15: warning: excess elements in stru=
ct initializer
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: 'rebind_worker' defined but not us=
ed [-Wunused-function]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

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
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 FAIL, 5 errors, 3 warnings, 0 sect=
ion mismatches

Errors:
    arch/arm/mach-sa1100/collie.c:145:15: error: variable =E2=80=98collie_i=
r_data=E2=80=99 has initializer but incomplete type
    arch/arm/mach-sa1100/collie.c:146:3: error: =E2=80=98struct irda_platfo=
rm_data=E2=80=99 has no member named =E2=80=98startup=E2=80=99
    arch/arm/mach-sa1100/collie.c:147:3: error: =E2=80=98struct irda_platfo=
rm_data=E2=80=99 has no member named =E2=80=98shutdown=E2=80=99
    arch/arm/mach-sa1100/collie.c:148:3: error: =E2=80=98struct irda_platfo=
rm_data=E2=80=99 has no member named =E2=80=98set_power=E2=80=99
    arch/arm/mach-sa1100/collie.c:145:34: error: storage size of =E2=80=98c=
ollie_ir_data=E2=80=99 isn=E2=80=99t known

Warnings:
    arch/arm/mach-sa1100/collie.c:146:13: warning: excess elements in struc=
t initializer
    arch/arm/mach-sa1100/collie.c:147:14: warning: excess elements in struc=
t initializer
    arch/arm/mach-sa1100/collie.c:148:15: warning: excess elements in struc=
t initializer

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
=E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

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
-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/x86_64/chromiumos-x86_64.flavour.config+x86-chromebook=
 (x86_64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mismatc=
hes

---------------------------------------------------------------------------=
-----
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
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
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 wa=
rnings, 0 section mismatches

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
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 1 warning, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 FAIL, 6 errors, 5 warnings, 0 secti=
on mismatches

Errors:
    arch/arm/mach-sa1100/h3600.c:121:15: error: variable =E2=80=98h3600_ird=
a_data=E2=80=99 has initializer but incomplete type
    arch/arm/mach-sa1100/h3600.c:122:3: error: =E2=80=98struct irda_platfor=
m_data=E2=80=99 has no member named =E2=80=98set_power=E2=80=99
    arch/arm/mach-sa1100/h3600.c:123:3: error: =E2=80=98struct irda_platfor=
m_data=E2=80=99 has no member named =E2=80=98set_speed=E2=80=99
    arch/arm/mach-sa1100/h3600.c:124:3: error: =E2=80=98struct irda_platfor=
m_data=E2=80=99 has no member named =E2=80=98startup=E2=80=99
    arch/arm/mach-sa1100/h3600.c:125:3: error: =E2=80=98struct irda_platfor=
m_data=E2=80=99 has no member named =E2=80=98shutdown=E2=80=99
    arch/arm/mach-sa1100/h3600.c:121:34: error: storage size of =E2=80=98h3=
600_irda_data=E2=80=99 isn=E2=80=99t known

Warnings:
    arch/arm/mach-sa1100/h3600.c:122:15: warning: excess elements in struct=
 initializer
    arch/arm/mach-sa1100/h3600.c:123:15: warning: excess elements in struct=
 initializer
    arch/arm/mach-sa1100/h3600.c:124:13: warning: excess elements in struct=
 initializer
    arch/arm/mach-sa1100/h3600.c:125:14: warning: excess elements in struct=
 initializer
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: 'rebind_worker' defined but not us=
ed [-Wunused-function]

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
    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or direc=
tory

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
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 52 warnings, 0 sect=
ion mismatches

Warnings:
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 1 warning, 0 sec=
tion mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 FAIL, 2 errors, 4 warnings, 0=
 section mismatches

Errors:
    drivers/gpu/drm/ttm/ttm_bo_util.c:364:18: error: implicit declaration o=
f function =E2=80=98vmap=E2=80=99; did you mean =E2=80=98kmap=E2=80=99? [-W=
error=3Dimplicit-function-declaration]
    drivers/gpu/drm/ttm/ttm_bo_util.c:429:3: error: implicit declaration of=
 function =E2=80=98vunmap=E2=80=99; did you mean =E2=80=98kunmap=E2=80=99? =
[-Werror=3Dimplicit-function-declaration]

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]
    drivers/gpu/drm/ttm/ttm_bo_util.c:364:16: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer wi=
thout a cast [-Wint-conversion]
    drivers/gpu/drm/ttm/ttm_bo_util.c:509:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer wi=
thout a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 FAIL, 2 errors, 3 warnings, 0 =
section mismatches

Errors:
    drivers/gpu/drm/ttm/ttm_bo_util.c:364:18: error: implicit declaration o=
f function =E2=80=98vmap=E2=80=99; did you mean =E2=80=98kmap=E2=80=99? [-W=
error=3Dimplicit-function-declaration]
    drivers/gpu/drm/ttm/ttm_bo_util.c:429:3: error: implicit declaration of=
 function =E2=80=98vunmap=E2=80=99; did you mean =E2=80=98kunmap=E2=80=99? =
[-Werror=3Dimplicit-function-declaration]

Warnings:
    drivers/gpu/drm/ttm/ttm_bo_util.c:364:16: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer wi=
thout a cast [-Wint-conversion]
    drivers/gpu/drm/ttm/ttm_bo_util.c:509:9: warning: assignment to =E2=80=
=98void *=E2=80=99 from =E2=80=98int=E2=80=99 makes pointer from integer wi=
thout a cast [-Wint-conversion]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 54 warnings, 0 se=
ction mismatches

Warnings:
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

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
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warnin=
g, 0 section mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

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
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 79 warnings=
, 0 section mismatches

Warnings:
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 51 warnings, 0 secti=
on mismatches

Warnings:
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-16) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: unused function 'rebind_worker' [-=
Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1=
 warning, 0 section mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 123 warnings, 0 section mismatches

Warnings:
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined

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
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 FAIL, 4 errors, 2 warnings, 0 se=
ction mismatches

Errors:
    arch/arm/mach-sa1100/assabet.c:326:15: error: variable =E2=80=98assabet=
_irda_data=E2=80=99 has initializer but incomplete type
    arch/arm/mach-sa1100/assabet.c:327:3: error: =E2=80=98struct irda_platf=
orm_data=E2=80=99 has no member named =E2=80=98set_power=E2=80=99
    arch/arm/mach-sa1100/assabet.c:328:3: error: =E2=80=98struct irda_platf=
orm_data=E2=80=99 has no member named =E2=80=98set_speed=E2=80=99
    arch/arm/mach-sa1100/assabet.c:326:34: error: storage size of =E2=80=98=
assabet_irda_data=E2=80=99 isn=E2=80=99t known

Warnings:
    arch/arm/mach-sa1100/assabet.c:327:15: warning: excess elements in stru=
ct initializer
    arch/arm/mach-sa1100/assabet.c:328:15: warning: excess elements in stru=
ct initializer

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-16) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: 'rebind_worker' defined but not us=
ed [-Wunused-function]

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
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    arch/arm/mach-pxa/pxa320.h:6:10: fatal error: mfp-pxa320.h: No such fil=
e or directory

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]
    cc1: warning: result of =E2=80=98-117440512 << 16=E2=80=99 requires 44 =
bits to represent, but =E2=80=98int=E2=80=99 only has 32 bits [-Wshift-over=
flow=3D]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section =
mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, clang-16) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 65 warnings, 0 sec=
tion mismatches

Warnings:
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

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
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 49 warnings, 0 sect=
ion mismatches

Warnings:
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    kernel/workqueue.c:1993:13: warning: 'rebind_worker' defined but not us=
ed [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    <stdin>:1517:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: 'rebind_worker' defined but not us=
ed [-Wunused-function]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 48 warnings, 0 se=
ction mismatches

Warnings:
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined
    <command-line>: warning: "__thumb2__" redefined

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/workqueue.c:1993:13: warning: =E2=80=98rebind_worker=E2=80=99 de=
fined but not used [-Wunused-function]

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
x86_64_defconfig (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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
x86_64_defconfig+kselftest (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 4=
 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to !END=
BR: .text+0x142f16
    vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xcc: relocation to !ENDB=
R: native_write_cr4+0x4
    WARNING: modpost: EXPORT symbol "asm_load_gs_index" [vmlinux] version g=
eneration failed, symbol will not be versioned.
    WARNING: modpost: EXPORT symbol "asm_load_gs_index" [vmlinux] version g=
eneration failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 2 war=
nings, 0 section mismatches

Warnings:
    WARNING: modpost: EXPORT symbol "asm_load_gs_index" [vmlinux] version g=
eneration failed, symbol will not be versioned.
    WARNING: modpost: EXPORT symbol "asm_load_gs_index" [vmlinux] version g=
eneration failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust (x86_64, rustc-1.62) =E2=80=94 FAIL, 1 error, 0 warni=
ngs, 0 section mismatches

Errors:
    error: aborting due to previous error

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust-samples (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

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
0 errors, 2 warnings, 0 section mismatches

Warnings:
    WARNING: modpost: EXPORT symbol "asm_load_gs_index" [vmlinux] version g=
eneration failed, symbol will not be versioned.
    WARNING: modpost: EXPORT symbol "asm_load_gs_index" [vmlinux] version g=
eneration failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
