Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 322A66E83E4
	for <lists+linux-next@lfdr.de>; Wed, 19 Apr 2023 23:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbjDSVmj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Apr 2023 17:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbjDSVmi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Apr 2023 17:42:38 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AEF5526F
        for <linux-next@vger.kernel.org>; Wed, 19 Apr 2023 14:42:20 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-63d2ba63dddso323844b3a.2
        for <linux-next@vger.kernel.org>; Wed, 19 Apr 2023 14:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1681940540; x=1684532540;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eXAN1fqqvuFyEUj0GGgmU5wxHr5oqLyhgWS+rPbwE74=;
        b=o/PWUKSCeYhkDXMYqIRELGtS0DgNRAGapwsKo9Bhnlwi4wSOK/6UMCWGPDK3OE6buH
         154LIi925cSINXR7IgyH5ZHwLEO47MjMVFGDHGlNkX9M7rjvS+zfP5e85eJCXH4r9d2Q
         ufsrJCXDrGMkmu7YPrm3Vv9e4wvl2DOktAcc37iCPdh9eCbsj8ntt6yQD5wUdwOm993R
         f6sOrKyeA70pa8Dx7Iiw5UPmZDWXhsozR6uTAqeIVj+Oe98RN43zpgMUks2ARnANez0q
         mTYAW898KqyEoQO34VwVTif4Jeq2lQ3Qo7Sqg0jFoGhTn4YjlbEfZCR2LDlBfXQ7fQ4n
         BJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681940540; x=1684532540;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eXAN1fqqvuFyEUj0GGgmU5wxHr5oqLyhgWS+rPbwE74=;
        b=Yl298NI0Jj+WY+MktIYUXTisx9iu4a8KT4/LF76ZBXxfmUZqH+B4pZ6B/xGo4aeATn
         dDkY8bOYk01OFxiL5SzFJHhit2BxYvQslb1caJJ59AYT06LNZS9iEStvq3RqjCLSG8Kz
         N8e5VqTrvg4+8xePJYYIZnhgn6rm9Dpw5ov7Z6LPwSHM4A8bMN6Bu3XUJHWygCFHwQip
         xAUAtD1G4/d3uesPXPpBcL4AG6tJGfSZfAxvMJ8jZerC03KD4xC/kZwbeINqddzjkZw6
         tkhRMtiMtdtXxwVHIq8qz3C8/WJUL8weBjEl0X2G2ndAN5Xxj2tGo1fsijMjyBgwRbOQ
         YaQg==
X-Gm-Message-State: AAQBX9eHVVC1l3QcHpllHXKiED8m7ChOqDq2TmznNQ5Na88cNJRNyPz4
        LNAbdgnJm7QJszpL73fZXQQ+r1hca85lG6WxBGt17CmT
X-Google-Smtp-Source: AKy350btn4yFmz9uAvxvKMk/rH+6jNKqRaszAphS0a6vkoLwV34hh6fuZuDTQeqM9YrzK0U78mDhRA==
X-Received: by 2002:a05:6a00:1343:b0:63d:4752:4dad with SMTP id k3-20020a056a00134300b0063d47524dadmr5467515pfu.31.1681940538952;
        Wed, 19 Apr 2023 14:42:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 16-20020aa79210000000b006328ee1e56csm11427995pfo.2.2023.04.19.14.42.18
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 14:42:18 -0700 (PDT)
Message-ID: <6440603a.a70a0220.2e6d4.9e04@mx.google.com>
Date:   Wed, 19 Apr 2023 14:42:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230419
X-Kernelci-Report-Type: build
Subject: next/master build: 199 builds: 20 failed, 179 passed, 64 errors,
 30 warnings (next-20230419)
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

next/master build: 199 builds: 20 failed, 179 passed, 64 errors, 30 warning=
s (next-20230419)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230419/

Tree: next
Branch: master
Git Describe: next-20230419
Git Commit: 3cdbc01c40e34c57697f8934f2727a88551696be
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm64:
    allmodconfig: (clang-17) FAIL
    allmodconfig: (gcc-10) FAIL

arm:
    allmodconfig: (clang-17) FAIL
    allmodconfig: (gcc-10) FAIL
    davinci_all_defconfig: (gcc-10) FAIL
    omap2plus_defconfig: (gcc-10) FAIL
    pxa_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

i386:
    allmodconfig: (clang-17) FAIL

mips:
    32r2el_defconfig+debug: (gcc-10) FAIL
    32r2el_defconfig+kselftest: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    loongson3_defconfig: (gcc-10) FAIL

x86_64:
    allmodconfig: (clang-17) FAIL
    allmodconfig: (gcc-10) FAIL
    x86_64_defconfig+amdgpu: (gcc-10) FAIL
    x86_64_defconfig+x86-chromebook: (gcc-10) FAIL
    x86_64_defconfig+x86-chromebook+amdgpu: (gcc-10) FAIL
    x86_64_defconfig+x86-chromebook+kselftest: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error

arm64:
    allmodconfig (clang-17): 1 error, 1 warning
    allmodconfig (gcc-10): 2 errors, 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-17): 3 warnings

arm:
    allmodconfig (clang-17): 1 error, 1 warning
    allmodconfig (gcc-10): 3 errors, 1 warning
    davinci_all_defconfig (gcc-10): 11 errors
    omap2plus_defconfig (gcc-10): 23 errors
    pxa_defconfig (gcc-10): 1 error
    rpc_defconfig (gcc-10): 2 errors

i386:
    allmodconfig (clang-17): 1 error, 1 warning

mips:
    fuloong2e_defconfig (gcc-10): 1 error
    lemote2f_defconfig (gcc-10): 1 error
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 4 errors

riscv:

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 4 warnings
    sparc64_defconfig+debug (gcc-10): 2 warnings
    sparc64_defconfig+kselftest (gcc-10): 2 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    allmodconfig (clang-17): 1 error, 2 warnings
    allmodconfig (gcc-10): 2 errors, 1 warning
    x86_64_defconfig+amdgpu (gcc-10): 2 errors, 1 warning
    x86_64_defconfig+kselftest (rustc-1.62): 3 warnings
    x86_64_defconfig+x86-chromebook (gcc-10): 2 errors, 1 warning
    x86_64_defconfig+x86-chromebook+amdgpu (gcc-10): 2 errors, 1 warning
    x86_64_defconfig+x86-chromebook+kselftest (gcc-10): 2 errors, 1 warning

Errors summary:

    6    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:229:1=
1: error: unused variable =E2=80=98otg_inst=E2=80=99 [-Werror=3Dunused-vari=
able]
    6    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:226:2=
0: error: unused variable =E2=80=98cmd=E2=80=99 [-Werror=3Dunused-variable]
    4    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable =
'ret' is uninitialized when used here [-Werror,-Wuninitialized]
    3    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=
=80=98-mhard-float=E2=80=99
    2    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethern=
et/ti/cpsw_new.c:1355: undefined reference to `of_phy_deregister_fixed_link'
    2    /tmp/kci/linux/build/../drivers/net/phy/phy_device.c:3053: undefin=
ed reference to `devm_led_classdev_register_ext'
    1    r8169_main.c:(.text+0x8ec0): undefined reference to `devm_mdiobus_=
alloc_size'
    1    phy_device.c:(.text+0x401c): undefined reference to `devm_led_clas=
sdev_register_ext'
    1    phy_device.c:(.text+0x2f38): undefined reference to `devm_led_clas=
sdev_register_ext'
    1    net/bpfilter/main.c:3:10: fatal error: sys/uio.h: No such file or =
directory
    1    mips-linux-gnu-ld: r8169_main.c:(.text+0x8f3c): undefined referenc=
e to `__devm_mdiobus_register'
    1    ixgbe_phy.c:(.text+0x242c): undefined reference to `devm_mdiobus_a=
lloc_size'
    1    drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:66:5: error: "CO=
NFIG_ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Werror=3Dundef]
    1    drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:51:5: error: "CO=
NFIG_ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Werror=3Dundef]
    1    drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:33:5: error: "CO=
NFIG_ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Werror=3Dundef]
    1    davinci_mdio.c:(.text+0x250): undefined reference to `devm_mdiobus=
_alloc_size'
    1    davinci_emac.c:(.text.unlikely+0x5c): undefined reference to `of_p=
hy_is_fixed_link'
    1    davinci_emac.c:(.text+0xf54): undefined reference to `of_phy_is_fi=
xed_link'
    1    davinci_emac.c:(.text+0x1aa0): undefined reference to `of_phy_conn=
ect'
    1    davinci_emac.c:(.text+0x13f4): undefined reference to `of_phy_is_f=
ixed_link'
    1    arm-linux-gnueabihf-ld: davinci_mdio.c:(.text+0x44c): undefined re=
ference to `__of_mdiobus_register'
    1    arm-linux-gnueabihf-ld: davinci_emac.c:(.text.unlikely+0x6c): unde=
fined reference to `of_phy_deregister_fixed_link'
    1    arm-linux-gnueabihf-ld: davinci_emac.c:(.text+0xf68): undefined re=
ference to `of_phy_register_fixed_link'
    1    arm-linux-gnueabihf-ld: davinci_emac.c:(.text+0x1438): undefined r=
eference to `of_phy_deregister_fixed_link'
    1    arm-linux-gnueabihf-ld: davinci_emac.c:(.text+0x1428): undefined r=
eference to `of_phy_is_fixed_link'
    1    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethern=
et/ti/davinci_emac.c:2023: undefined reference to `of_phy_deregister_fixed_=
link'
    1    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethern=
et/ti/davinci_emac.c:1991: undefined reference to `of_phy_deregister_fixed_=
link'
    1    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethern=
et/ti/davinci_emac.c:1990: undefined reference to `of_phy_is_fixed_link'
    1    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethern=
et/ti/davinci_emac.c:1772: undefined reference to `of_phy_register_fixed_li=
nk'
    1    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethern=
et/ti/cpsw_new.c:1354: undefined reference to `of_phy_is_fixed_link'
    1    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethern=
et/ti/cpsw_new.c:1289: undefined reference to `of_phy_is_fixed_link'
    1    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethern=
et/ti/cpsw.c:1411: undefined reference to `of_phy_deregister_fixed_link'
    1    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethern=
et/ti/cpsw.c:1322: undefined reference to `of_phy_register_fixed_link'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=
=3D0x'
    1    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=
=3D0x'
    1    /tmp/kci/linux/build/../include/linux/phy.h:458: undefined referen=
ce to `devm_mdiobus_alloc_size'
    1    /tmp/kci/linux/build/../include/linux/of_mdio.h:23: undefined refe=
rence to `__of_mdiobus_register'
    1    /tmp/kci/linux/build/../drivers/net/ethernet/ti/davinci_emac.c:202=
2: undefined reference to `of_phy_is_fixed_link'
    1    /tmp/kci/linux/build/../drivers/net/ethernet/ti/davinci_emac.c:199=
0: undefined reference to `of_phy_is_fixed_link'
    1    /tmp/kci/linux/build/../drivers/net/ethernet/ti/davinci_emac.c:177=
0: undefined reference to `of_phy_is_fixed_link'
    1    /tmp/kci/linux/build/../drivers/net/ethernet/ti/davinci_emac.c:149=
7: undefined reference to `of_phy_connect'
    1    /tmp/kci/linux/build/../drivers/net/ethernet/ti/cpsw_new.c:768: un=
defined reference to `of_phy_connect'
    1    /tmp/kci/linux/build/../drivers/net/ethernet/ti/cpsw_new.c:1354: u=
ndefined reference to `of_phy_is_fixed_link'
    1    /tmp/kci/linux/build/../drivers/net/ethernet/ti/cpsw_new.c:1290: u=
ndefined reference to `of_phy_register_fixed_link'
    1    /tmp/kci/linux/build/../drivers/net/ethernet/ti/cpsw.c:614: undefi=
ned reference to `of_phy_connect'
    1    /tmp/kci/linux/build/../drivers/net/ethernet/ti/cpsw.c:1410: undef=
ined reference to `of_phy_is_fixed_link'
    1    /tmp/kci/linux/build/../drivers/net/ethernet/ti/cpsw.c:1318: undef=
ined reference to `of_phy_is_fixed_link'

Warnings summary:

    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    7    cc1: all warnings being treated as errors
    5    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initializ=
e the variable 'ret' to silence this warning
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to=
 !ENDBR: relocate_range+0xc6
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x28: relocation to=
 !ENDBR: relocate_range+0x23b
    1    vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xcc: relocation to =
!ENDBR: native_write_cr4+0x4
    1    fs/reiserfs/reiserfs.o: warning: objtool: balance_leaf+0x765f: sta=
ck state mismatch: cfa1=3D4+360 cfa2=3D4+352
    1    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: warning: variabl=
e 'ret' is uninitialized when used here [-Wuninitialized]
    1    1 warning generated.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm, clang-17) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-17) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, clang-17) =E2=80=94 FAIL, 1 error, 2 warnings, 0 sect=
ion mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning
    fs/reiserfs/reiserfs.o: warning: objtool: balance_leaf+0x765f: stack st=
ate mismatch: cfa1=3D4+360 cfa2=3D4+352

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 sectio=
n mismatches

Errors:
    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:229:11: er=
ror: unused variable =E2=80=98otg_inst=E2=80=99 [-Werror=3Dunused-variable]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:226:20: er=
ror: unused variable =E2=80=98cmd=E2=80=99 [-Werror=3Dunused-variable]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warning, 0 section=
 mismatches

Errors:
    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:229:11: er=
ror: unused variable =E2=80=98otg_inst=E2=80=99 [-Werror=3Dunused-variable]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:226:20: er=
ror: unused variable =E2=80=98cmd=E2=80=99 [-Werror=3Dunused-variable]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-10) =E2=80=94 FAIL, 3 errors, 1 warning, 0 section m=
ismatches

Errors:
    drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:33:5: error: "CONFIG_=
ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Werror=3Dundef]
    drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:51:5: error: "CONFIG_=
ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Werror=3Dundef]
    drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c:66:5: error: "CONFIG_=
ARCH_DMA_ADDR_T_64BIT" is not defined, evaluates to 0 [-Werror=3Dundef]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (i386, clang-17) =E2=80=94 FAIL, 1 error, 1 warning, 0 section=
 mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
davinci_all_defconfig (arm, gcc-10) =E2=80=94 FAIL, 11 errors, 0 warnings, =
0 section mismatches

Errors:
    phy_device.c:(.text+0x2f38): undefined reference to `devm_led_classdev_=
register_ext'
    davinci_emac.c:(.text+0xf54): undefined reference to `of_phy_is_fixed_l=
ink'
    arm-linux-gnueabihf-ld: davinci_emac.c:(.text+0xf68): undefined referen=
ce to `of_phy_register_fixed_link'
    davinci_emac.c:(.text+0x13f4): undefined reference to `of_phy_is_fixed_=
link'
    arm-linux-gnueabihf-ld: davinci_emac.c:(.text+0x1428): undefined refere=
nce to `of_phy_is_fixed_link'
    arm-linux-gnueabihf-ld: davinci_emac.c:(.text+0x1438): undefined refere=
nce to `of_phy_deregister_fixed_link'
    davinci_emac.c:(.text+0x1aa0): undefined reference to `of_phy_connect'
    davinci_emac.c:(.text.unlikely+0x5c): undefined reference to `of_phy_is=
_fixed_link'
    arm-linux-gnueabihf-ld: davinci_emac.c:(.text.unlikely+0x6c): undefined=
 reference to `of_phy_deregister_fixed_link'
    davinci_mdio.c:(.text+0x250): undefined reference to `devm_mdiobus_allo=
c_size'
    arm-linux-gnueabihf-ld: davinci_mdio.c:(.text+0x44c): undefined referen=
ce to `__of_mdiobus_register'

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
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
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
defconfig+CONFIG_ARM64_64K_PAGES=3Dy (arm64, clang-17) =E2=80=94 PASS, 0 er=
rors, 3 warnings, 0 section mismatches

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: warning: variable 're=
t' is uninitialized when used here [-Wuninitialized]
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning
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
defconfig+videodec (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
i386_defconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
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
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
loongson3_defconfig (mips, gcc-10) =E2=80=94 FAIL, 4 errors, 0 warnings, 0 =
section mismatches

Errors:
    phy_device.c:(.text+0x401c): undefined reference to `devm_led_classdev_=
register_ext'
    ixgbe_phy.c:(.text+0x242c): undefined reference to `devm_mdiobus_alloc_=
size'
    r8169_main.c:(.text+0x8ec0): undefined reference to `devm_mdiobus_alloc=
_size'
    mips-linux-gnu-ld: r8169_main.c:(.text+0x8f3c): undefined reference to =
`__devm_mdiobus_register'

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
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
netwinder_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 0 w=
arnings, 0 section mismatches

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
omap2plus_defconfig (arm, gcc-10) =E2=80=94 FAIL, 23 errors, 0 warnings, 0 =
section mismatches

Errors:
    /tmp/kci/linux/build/../drivers/net/phy/phy_device.c:3053: undefined re=
ference to `devm_led_classdev_register_ext'
    /tmp/kci/linux/build/../drivers/net/ethernet/ti/davinci_emac.c:1770: un=
defined reference to `of_phy_is_fixed_link'
    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethernet/ti=
/davinci_emac.c:1772: undefined reference to `of_phy_register_fixed_link'
    /tmp/kci/linux/build/../drivers/net/ethernet/ti/davinci_emac.c:1990: un=
defined reference to `of_phy_is_fixed_link'
    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethernet/ti=
/davinci_emac.c:1990: undefined reference to `of_phy_is_fixed_link'
    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethernet/ti=
/davinci_emac.c:1991: undefined reference to `of_phy_deregister_fixed_link'
    /tmp/kci/linux/build/../drivers/net/ethernet/ti/davinci_emac.c:1497: un=
defined reference to `of_phy_connect'
    /tmp/kci/linux/build/../drivers/net/ethernet/ti/davinci_emac.c:2022: un=
defined reference to `of_phy_is_fixed_link'
    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethernet/ti=
/davinci_emac.c:2023: undefined reference to `of_phy_deregister_fixed_link'
    /tmp/kci/linux/build/../include/linux/of_mdio.h:23: undefined reference=
 to `__of_mdiobus_register'
    /tmp/kci/linux/build/../include/linux/phy.h:458: undefined reference to=
 `devm_mdiobus_alloc_size'
    /tmp/kci/linux/build/../drivers/net/ethernet/ti/cpsw.c:1410: undefined =
reference to `of_phy_is_fixed_link'
    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethernet/ti=
/cpsw.c:1411: undefined reference to `of_phy_deregister_fixed_link'
    /tmp/kci/linux/build/../drivers/net/ethernet/ti/cpsw.c:1318: undefined =
reference to `of_phy_is_fixed_link'
    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethernet/ti=
/cpsw.c:1322: undefined reference to `of_phy_register_fixed_link'
    /tmp/kci/linux/build/../drivers/net/ethernet/ti/cpsw.c:614: undefined r=
eference to `of_phy_connect'
    /tmp/kci/linux/build/../drivers/net/ethernet/ti/cpsw_new.c:1354: undefi=
ned reference to `of_phy_is_fixed_link'
    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethernet/ti=
/cpsw_new.c:1355: undefined reference to `of_phy_deregister_fixed_link'
    /tmp/kci/linux/build/../drivers/net/ethernet/ti/cpsw_new.c:1290: undefi=
ned reference to `of_phy_register_fixed_link'
    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethernet/ti=
/cpsw_new.c:1289: undefined reference to `of_phy_is_fixed_link'
    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethernet/ti=
/cpsw_new.c:1354: undefined reference to `of_phy_is_fixed_link'
    arm-linux-gnueabihf-ld: /tmp/kci/linux/build/../drivers/net/ethernet/ti=
/cpsw_new.c:1355: undefined reference to `of_phy_deregister_fixed_link'
    /tmp/kci/linux/build/../drivers/net/ethernet/ti/cpsw_new.c:768: undefin=
ed reference to `of_phy_connect'

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
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
    /tmp/kci/linux/build/../drivers/net/phy/phy_device.c:3053: undefined re=
ference to `devm_led_classdev_register_ext'

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
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
shmobile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 war=
nings, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
wpcm450_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+amdgpu (x86_64, gcc-10) =E2=80=94 FAIL, 2 errors, 1 warnin=
g, 0 section mismatches

Errors:
    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:229:11: er=
ror: unused variable =E2=80=98otg_inst=E2=80=99 [-Werror=3Dunused-variable]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:226:20: er=
ror: unused variable =E2=80=98cmd=E2=80=99 [-Werror=3Dunused-variable]

Warnings:
    cc1: all warnings being treated as errors

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
x86_64_defconfig+kselftest (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 3=
 warnings, 0 section mismatches

Warnings:
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x28: relocation to !END=
BR: relocate_range+0x23b
    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to !END=
BR: relocate_range+0xc6
    vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xcc: relocation to !ENDB=
R: native_write_cr4+0x4

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

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
x86_64_defconfig+x86-chromebook (x86_64, gcc-10) =E2=80=94 FAIL, 2 errors, =
1 warning, 0 section mismatches

Errors:
    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:229:11: er=
ror: unused variable =E2=80=98otg_inst=E2=80=99 [-Werror=3Dunused-variable]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:226:20: er=
ror: unused variable =E2=80=98cmd=E2=80=99 [-Werror=3Dunused-variable]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+amdgpu (x86_64, gcc-10) =E2=80=94 FAIL, 2 e=
rrors, 1 warning, 0 section mismatches

Errors:
    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:229:11: er=
ror: unused variable =E2=80=98otg_inst=E2=80=99 [-Werror=3Dunused-variable]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:226:20: er=
ror: unused variable =E2=80=98cmd=E2=80=99 [-Werror=3Dunused-variable]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook+kselftest (x86_64, gcc-10) =E2=80=94 FAIL, =
2 errors, 1 warning, 0 section mismatches

Errors:
    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:229:11: er=
ror: unused variable =E2=80=98otg_inst=E2=80=99 [-Werror=3Dunused-variable]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:226:20: er=
ror: unused variable =E2=80=98cmd=E2=80=99 [-Werror=3Dunused-variable]

Warnings:
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
