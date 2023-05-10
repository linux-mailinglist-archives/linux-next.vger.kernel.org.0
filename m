Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 531C46FD522
	for <lists+linux-next@lfdr.de>; Wed, 10 May 2023 06:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjEJElM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 May 2023 00:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbjEJElL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 May 2023 00:41:11 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 080B440CD
        for <linux-next@vger.kernel.org>; Tue,  9 May 2023 21:41:07 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1aaf7067647so46909025ad.0
        for <linux-next@vger.kernel.org>; Tue, 09 May 2023 21:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1683693666; x=1686285666;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNIsstGZH5etraaBPkN2J55Xj8baGMWgQDtoYIuus3M=;
        b=rD/LkCAVepwvMuDcsFUZTuXTP8JhwAprYTixiV2I1DSCwB0xK70nj0Ll69H87AB9MO
         JJQWOLu/Xhi+71FK7j8NO6PUYONUoD6rHqN1bs254NyT9f7vVzI7wLDnyzhspiFv+hsY
         SVRj0BuVDLDeY+PfGujime8WIjwyn8+up4nIVWbfvTUpSqQ9xTXCcmYNvV5NN4F9E5F8
         0FXQMm+DZRxZH+rR7R7UDk+xgWZeJBrWkG0TWFKpb6ILdFklRHNxBPIJqPc8wDlH4+C+
         ZgLw0Gwmk/Jb5fxGO7Wu4avc/zMi6J+l+7SNFdewY8TOZzWUe8m9h5dAa8+tdsPffIyx
         t89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683693666; x=1686285666;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNIsstGZH5etraaBPkN2J55Xj8baGMWgQDtoYIuus3M=;
        b=UGavu//RyecfwXO6TNUqo0i3KNgltCGKE97HhY8CQSCJuQsmRl1hWL7WIazJEs9rAF
         fLDOFsqoqNkf/h69WPhEKCocJKOS7ChD5p5BbO9FzW1T3BUPsau4g+PHOy06/WCYE1/L
         WmxOQTD+gY7W1qtrfIjCvZbWgUwps6VovdlRSZwD75vpN+3OmYcwerOkOlWeF7lCl0qR
         HouDO4NICYgqbSyrAeb/VCgjtukmHYmNgs2BIyZsz0PwOJfvm/Lxj3zjRHQfgQhiv0fJ
         X6m7YD8JgOwzQqYnfXjf2GCaCbE6zOZLJLp+70DDi7TO9G26/AA7+hPvX6JqLzFD3vVp
         jMpQ==
X-Gm-Message-State: AC+VfDxL3ratvg6NqwdoxWxrdPdg/hQbgke66iB14OEm8F/llwm/4ScF
        hEC+V7bCXmP682mZAPWr4F4WK6XzxubklQhKc71S1g==
X-Google-Smtp-Source: ACHHUZ41Z7W1pK9Tsi1opGB83cFYqJEoIuL1ZTuuxMAv2UqWQYxdxtuHFpe5d2It7ULFvelWwckI4A==
X-Received: by 2002:a17:902:a9c4:b0:1ac:8def:db2a with SMTP id b4-20020a170902a9c400b001ac8defdb2amr5619652plr.0.1683693664641;
        Tue, 09 May 2023 21:41:04 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b15-20020a170902b60f00b001aafe232bcfsm2571466pls.44.2023.05.09.21.41.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 21:41:03 -0700 (PDT)
Message-ID: <645b205f.170a0220.a5e9b.5afa@mx.google.com>
Date:   Tue, 09 May 2023 21:41:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230510
X-Kernelci-Report-Type: build
Subject: next/master build: 200 builds: 3 failed, 197 passed, 7 errors,
 360 warnings (next-20230510)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 200 builds: 3 failed, 197 passed, 7 errors, 360 warnings=
 (next-20230510)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230510/

Tree: next
Branch: master
Git Describe: next-20230510
Git Commit: 578215f3e21c472c08d70b8796edf1ac58f88578
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm:
    rpc_defconfig: (gcc-10) FAIL

mips:
    decstation_64_defconfig: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error

arm64:

arm:
    allmodconfig (clang-17): 6 warnings
    allmodconfig (gcc-10): 2 warnings
    am200epdkit_defconfig (gcc-10): 2 warnings
    aspeed_g4_defconfig (gcc-10): 1 warning
    aspeed_g5_defconfig (gcc-10): 1 warning
    aspeed_g5_defconfig (clang-17): 3 warnings
    assabet_defconfig (gcc-10): 2 warnings
    at91_dt_defconfig (gcc-10): 2 warnings
    axm55xx_defconfig (gcc-10): 2 warnings
    bcm2835_defconfig (gcc-10): 2 warnings
    collie_defconfig (gcc-10): 1 warning
    cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (clang-13): 6 =
warnings
    cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (clang-13=
): 6 warnings
    davinci_all_defconfig (gcc-10): 2 warnings
    exynos_defconfig (gcc-10): 2 warnings
    footbridge_defconfig (gcc-10): 2 warnings
    gemini_defconfig (gcc-10): 1 warning
    h3600_defconfig (gcc-10): 2 warnings
    hisi_defconfig (gcc-10): 1 warning
    imx_v4_v5_defconfig (gcc-10): 2 warnings
    imx_v6_v7_defconfig (gcc-10): 2 warnings
    imxrt_defconfig (gcc-10): 1 warning
    integrator_defconfig (gcc-10): 2 warnings
    ixp4xx_defconfig (gcc-10): 2 warnings
    jornada720_defconfig (gcc-10): 2 warnings
    keystone_defconfig (gcc-10): 2 warnings
    lpc18xx_defconfig (gcc-10): 1 warning
    lpc32xx_defconfig (gcc-10): 2 warnings
    milbeaut_m10v_defconfig (gcc-10): 2 warnings
    mmp2_defconfig (gcc-10): 2 warnings
    moxart_defconfig (gcc-10): 1 warning
    mps2_defconfig (gcc-10): 1 warning
    multi_v4t_defconfig (gcc-10): 1 warning
    multi_v5_defconfig (gcc-10): 2 warnings
    multi_v5_defconfig (clang-17): 6 warnings
    multi_v7_defconfig (gcc-10): 2 warnings
    multi_v7_defconfig (clang-17): 6 warnings
    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (gcc-10): 2 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-10): 2 warni=
ngs
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 2 warnings
    multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (gcc-10): 2 warnings
    multi_v7_defconfig+debug (gcc-10): 2 warnings
    multi_v7_defconfig+kselftest (gcc-10): 2 warnings
    mvebu_v5_defconfig (gcc-10): 2 warnings
    mvebu_v7_defconfig (gcc-10): 2 warnings
    mxs_defconfig (gcc-10): 2 warnings
    neponset_defconfig (gcc-10): 2 warnings
    netwinder_defconfig (gcc-10): 1 warning
    nhk8815_defconfig (gcc-10): 2 warnings
    omap2plus_defconfig (gcc-10): 2 warnings
    orion5x_defconfig (gcc-10): 2 warnings
    pxa168_defconfig (gcc-10): 2 warnings
    pxa3xx_defconfig (gcc-10): 2 warnings
    pxa910_defconfig (gcc-10): 2 warnings
    pxa_defconfig (gcc-10): 2 warnings
    qcom_defconfig (gcc-10): 2 warnings
    realview_defconfig (gcc-10): 2 warnings
    rpc_defconfig (gcc-10): 2 errors, 1 warning
    s3c6400_defconfig (gcc-10): 2 warnings
    s5pv210_defconfig (gcc-10): 2 warnings
    sama5_defconfig (gcc-10): 2 warnings
    sama7_defconfig (gcc-10): 2 warnings
    shmobile_defconfig (gcc-10): 1 warning
    socfpga_defconfig (gcc-10): 2 warnings
    sp7021_defconfig (gcc-10): 2 warnings
    spear13xx_defconfig (gcc-10): 2 warnings
    spear3xx_defconfig (gcc-10): 2 warnings
    spear6xx_defconfig (gcc-10): 2 warnings
    spitz_defconfig (gcc-10): 2 warnings
    stm32_defconfig (gcc-10): 1 warning
    sunxi_defconfig (gcc-10): 2 warnings
    tegra_defconfig (gcc-10): 2 warnings
    u8500_defconfig (gcc-10): 2 warnings
    versatile_defconfig (gcc-10): 2 warnings
    vexpress_defconfig (gcc-10): 2 warnings
    vf610m4_defconfig (gcc-10): 1 warning
    vt8500_v6_v7_defconfig (gcc-10): 1 warning
    wpcm450_defconfig (gcc-10): 2 warnings

i386:

mips:
    32r2el_defconfig (gcc-10): 2 warnings
    32r2el_defconfig+debug (gcc-10): 2 warnings
    32r2el_defconfig+kselftest (gcc-10): 3 warnings
    ar7_defconfig (gcc-10): 2 warnings
    ath25_defconfig (gcc-10): 2 warnings
    ath79_defconfig (gcc-10): 2 warnings
    bcm47xx_defconfig (gcc-10): 2 warnings
    bcm63xx_defconfig (gcc-10): 1 warning
    bigsur_defconfig (gcc-10): 6 warnings
    bmips_be_defconfig (gcc-10): 1 warning
    bmips_stb_defconfig (gcc-10): 2 warnings
    cavium_octeon_defconfig (gcc-10): 6 warnings
    ci20_defconfig (gcc-10): 2 warnings
    cobalt_defconfig (gcc-10): 2 warnings
    cu1000-neo_defconfig (gcc-10): 2 warnings
    cu1830-neo_defconfig (gcc-10): 2 warnings
    db1xxx_defconfig (gcc-10): 1 warning
    decstation_64_defconfig (gcc-10): 6 warnings
    decstation_defconfig (gcc-10): 2 warnings
    decstation_r4k_defconfig (gcc-10): 2 warnings
    fuloong2e_defconfig (gcc-10): 1 error, 6 warnings
    gcw0_defconfig (gcc-10): 2 warnings
    gpr_defconfig (gcc-10): 2 warnings
    ip22_defconfig (gcc-10): 2 warnings
    ip27_defconfig (gcc-10): 6 warnings
    ip28_defconfig (gcc-10): 6 warnings
    ip32_defconfig (gcc-10): 6 warnings
    jazz_defconfig (gcc-10): 2 warnings
    lemote2f_defconfig (gcc-10): 1 error, 6 warnings
    loongson1b_defconfig (gcc-10): 2 warnings
    loongson1c_defconfig (gcc-10): 2 warnings
    loongson2k_defconfig (gcc-10): 1 error, 6 warnings
    loongson3_defconfig (gcc-10): 1 error, 6 warnings
    malta_defconfig (gcc-10): 2 warnings
    malta_kvm_defconfig (gcc-10): 2 warnings
    malta_qemu_32r6_defconfig (gcc-10): 2 warnings
    maltaaprp_defconfig (gcc-10): 2 warnings
    maltasmvp_defconfig (gcc-10): 2 warnings
    maltasmvp_eva_defconfig (gcc-10): 2 warnings
    maltaup_defconfig (gcc-10): 2 warnings
    maltaup_xpa_defconfig (gcc-10): 2 warnings
    mtx1_defconfig (gcc-10): 2 warnings
    omega2p_defconfig (gcc-10): 1 warning
    pic32mzda_defconfig (gcc-10): 2 warnings
    qi_lb60_defconfig (gcc-10): 2 warnings
    rb532_defconfig (gcc-10): 2 warnings
    rbtx49xx_defconfig (gcc-10): 2 warnings
    rm200_defconfig (gcc-10): 2 warnings
    rs90_defconfig (gcc-10): 1 warning
    rt305x_defconfig (gcc-10): 2 warnings
    sb1250_swarm_defconfig (gcc-10): 4 warnings
    vocore2_defconfig (gcc-10): 1 warning

riscv:

sparc:
    allnoconfig (gcc-10): 2 warnings
    sparc32_defconfig (gcc-10): 4 warnings
    sparc64_defconfig (gcc-10): 6 warnings
    sparc64_defconfig+debug (gcc-10): 4 warnings
    sparc64_defconfig+kselftest (gcc-10): 4 warnings
    tinyconfig (gcc-10): 2 warnings

x86_64:
    allnoconfig (gcc-10): 3 warnings
    x86_64_defconfig (gcc-10): 3 warnings
    x86_64_defconfig+amdgpu (gcc-10): 3 warnings
    x86_64_defconfig+crypto (gcc-10): 3 warnings
    x86_64_defconfig+debug (gcc-10): 3 warnings
    x86_64_defconfig+ima (gcc-10): 3 warnings
    x86_64_defconfig+kselftest (gcc-10): 3 warnings
    x86_64_defconfig+kselftest (rustc-1.62): 3 warnings
    x86_64_defconfig+x86-chromebook (gcc-10): 3 warnings
    x86_64_defconfig+x86-chromebook+amdgpu (gcc-10): 3 warnings
    x86_64_defconfig+x86-chromebook+kselftest (gcc-10): 3 warnings
    x86_64_defconfig+x86_kvm_guest (gcc-10): 3 warnings

Errors summary:

    4    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    1    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or =
directory
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'

Warnings summary:

    279  <stdin>:1567:2: warning: #warning syscall cachestat not implemente=
d [-Wcpp]
    11   <stdin>:1567:2: warning: syscall cachestat not implemented [-W#war=
nings]
    11   1 warning generated.
    11   #warning syscall cachestat not implemented
    10   vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    9    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    6    vmlinux.o: warning: objtool: .altinstr_replacement+0x18b6: redunda=
nt UACCESS disable
    2    vmlinux.o: warning: objtool: .altinstr_replacement+0x1e97: redunda=
nt UACCESS disable
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to=
 !ENDBR: .text+0x140a76
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x28: relocation to=
 !ENDBR: .text+0x140beb
    1    vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xcc: relocation to =
!ENDBR: native_write_cr4+0x4
    1    vmlinux.o: warning: objtool: __import_iovec+0x342: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    1    vmlinux.o: warning: objtool: .altinstr_replacement+0x1a60: redunda=
nt UACCESS disable
    1    vmlinux.o: warning: objtool: .altinstr_replacement+0x18ca: redunda=
nt UACCESS disable
    1    lib/iov_iter.o: warning: objtool: iovec_from_user+0x80: call to co=
py_iovec_from_user.part.0() with UACCESS enabled
    1    lib/iov_iter.o: warning: objtool: __import_iovec+0x13b: call to co=
py_iovec_from_user.part.0() with UACCESS enabled
    1    lib/iov_iter.o: warning: objtool: .altinstr_replacement+0x1f: redu=
ndant UACCESS disable

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
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 PASS, 0 errors, 3 warni=
ngs, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    lib/iov_iter.o: warning: objtool: .altinstr_replacement+0x1f: redundant=
 UACCESS disable
    lib/iov_iter.o: warning: objtool: iovec_from_user+0x80: call to copy_io=
vec_from_user.part.0() with UACCESS enabled
    lib/iov_iter.o: warning: objtool: __import_iovec+0x13b: call to copy_io=
vec_from_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

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
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

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
cros://chromeos-5.10/arm64/chromiumos-rockchip64.flavour.config+arm64-chrom=
ebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-arm.flavour.config (arm, clang-13) =
=E2=80=94 PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/armel/chromiumos-rockchip.flavour.config (arm, clang-1=
3) =E2=80=94 PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.

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
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 6 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
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
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

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
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 6 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

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
    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or direc=
tory

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 6 warnings, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 6 warnings, 0 =
section mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 6 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnin=
gs, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.
    <stdin>:1567:2: warning: syscall cachestat not implemented [-W#warnings]
    #warning syscall cachestat not implemented
    1 warning generated.

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-10) =E2=80=94 PASS, =
0 errors, 2 warnings, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2=
 warnings, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 2 warnings, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+debug (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warn=
ings, 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

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
omap2plus_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section =
mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 war=
nings, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]
    <stdin>:1567:2: warning: #warning syscall cachestat not implemented [-W=
cpp]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18b6: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnin=
gs, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18b6: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+crypto (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnin=
gs, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18ca: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+debug (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1a60: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x342: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+ima (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18b6: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3 war=
nings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1e97: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 3=
 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x28: relocation to !END=
BR: .text+0x140beb
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to !END=
BR: .text+0x140a76
    vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xcc: relocation to !ENDB=
R: native_write_cr4+0x4

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust-samples (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, =
3 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18b6: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 PASS, 0 e=
rrors, 3 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18b6: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 PASS, =
0 errors, 3 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x1e97: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 3=
 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: .altinstr_replacement+0x18b6: redundant UA=
CCESS disable
    vmlinux.o: warning: objtool: iovec_from_user+0x88: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled
    vmlinux.o: warning: objtool: __import_iovec+0x147: call to copy_iovec_f=
rom_user.part.0() with UACCESS enabled

---
For more info write to <info@kernelci.org>
