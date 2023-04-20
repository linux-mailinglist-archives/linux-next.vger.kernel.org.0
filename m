Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8036E9A9B
	for <lists+linux-next@lfdr.de>; Thu, 20 Apr 2023 19:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbjDTRVh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Apr 2023 13:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231491AbjDTRVf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Apr 2023 13:21:35 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E486649E4
        for <linux-next@vger.kernel.org>; Thu, 20 Apr 2023 10:21:20 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1a68d61579bso11218615ad.1
        for <linux-next@vger.kernel.org>; Thu, 20 Apr 2023 10:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20221208.gappssmtp.com; s=20221208; t=1682011280; x=1684603280;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ff/6HKtVjPyUAS6zQsXQ4T/i7oBYkCA+zI2IYg66Qhg=;
        b=Y5BkJT2YPgmOgzOk/S0nF70miLQRpjX1YJNMdPdk2UgIiwvhI7Alyd0Py7IICgfoIJ
         3qHG4xvV8YuAhxXInbX1hkNA9EkQ80R2hkP9hk0AOgj2w8wXzvxiUjXfDk62pmcsNvHA
         bV+qgACgGQe3g1gVelfS8VAvjAeNg7fX7Wei48VWCMVzYxNrWhq5+7WCVm7nyuSCmEkC
         E6m07wUh101mqWBMQzuaQxykbbHt81HpUiiDSmjS+gInR2OylTeKCUlS5XRxh4MVdV7+
         94YpcN0Hynl8y1O/wh/Mhl2xU3DIO67B08BsGTA2oNKsX2csFi4osdpjsqITb/NoNERm
         rl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682011280; x=1684603280;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ff/6HKtVjPyUAS6zQsXQ4T/i7oBYkCA+zI2IYg66Qhg=;
        b=JdzwYtB6YatfBBkTlZVcWtnMY775K4oLxt8TRwIX+xn6H89JB8SWfh6l+KiNf9JSE4
         wOggssp2d8+61266uYoEqzBPlrdGMX8v2B71VEN2ZSSeLyjfiXRZIaPGhBpMzzdBDLw9
         jOXvGrhnwxw77xQuZ1tCDq8T2CTb+8pJ8re0/4e36gD0m4piaAL1YgBxcD1ZHE6Cvi7P
         MPiNcb6lt+E4/9I1MfHIq8AvJdTQAyYGFHfQr8tJYqTRVJW4NC1iyhaAwY+Wv7GnL5q6
         vqmule291/aazWglzbT1wvTs7YXuJDsBfsN9BLMXws/Bq8+zHGk5ym2AXTtFbds7XD8s
         DDDw==
X-Gm-Message-State: AAQBX9cLN+s6pJ402xE3JafRwOdhrce92m3tSXQN6+vQgvhswShnUxIj
        MuYEMIRgZbybEt5Y1D9noigaRDnwVd5jgvp61pMs1wMz
X-Google-Smtp-Source: AKy350b1SP0OTzHWOui89kwNM2cb5QWqnp8bmDSbIpTvU1kGNE+oex7/v6D2PUdwXuReryO2Xu3NRQ==
X-Received: by 2002:a17:903:124b:b0:1a9:2951:7753 with SMTP id u11-20020a170903124b00b001a929517753mr2606231plh.45.1682011278475;
        Thu, 20 Apr 2023 10:21:18 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id ay6-20020a17090b030600b0023fbb21214bsm3280116pjb.17.2023.04.20.10.21.17
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 10:21:18 -0700 (PDT)
Message-ID: <6441748e.170a0220.531bd.8013@mx.google.com>
Date:   Thu, 20 Apr 2023 10:21:18 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20230420
X-Kernelci-Report-Type: build
Subject: next/master build: 194 builds: 24 failed, 170 passed, 68 errors,
 198 warnings (next-20230420)
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

next/master build: 194 builds: 24 failed, 170 passed, 68 errors, 198 warnin=
gs (next-20230420)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20230420/

Tree: next
Branch: master
Git Describe: next-20230420
Git Commit: 44bf136283e567b2b62653be7630e7511da41da2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 8 unique architectures

Build Failures Detected:

arc:
    haps_hs_smp_defconfig+kselftest: (gcc-10) FAIL

arm64:
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config: (clang-13) =
FAIL
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book: (clang-13) FAIL
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL

arm:
    allmodconfig: (clang-17) FAIL
    allmodconfig: (gcc-10) FAIL
    davinci_all_defconfig: (gcc-10) FAIL
    omap2plus_defconfig: (gcc-10) FAIL
    pxa_defconfig: (gcc-10) FAIL
    rpc_defconfig: (gcc-10) FAIL

mips:
    32r2el_defconfig+debug: (gcc-10) FAIL
    32r2el_defconfig+kselftest: (gcc-10) FAIL
    decstation_64_defconfig: (gcc-10) FAIL
    loongson3_defconfig: (gcc-10) FAIL

riscv:
    nommu_k210_defconfig: (clang-17) FAIL
    nommu_k210_sdcard_defconfig: (clang-17) FAIL
    nommu_k210_defconfig: (gcc-10) FAIL
    nommu_k210_sdcard_defconfig: (gcc-10) FAIL

x86_64:
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook: (clang-13) FAIL
    allmodconfig: (gcc-10) FAIL
    x86_64_defconfig+amdgpu: (gcc-10) FAIL
    x86_64_defconfig+x86-chromebook: (gcc-10) FAIL
    x86_64_defconfig+x86-chromebook+amdgpu: (gcc-10) FAIL

Errors and Warnings Detected:

arc:
    axs103_defconfig (gcc-10): 2 warnings
    axs103_smp_defconfig (gcc-10): 2 warnings
    haps_hs_smp_defconfig+kselftest (gcc-10): 1 error
    hsdk_defconfig (gcc-10): 2 warnings
    vdk_hs38_defconfig (gcc-10): 2 warnings
    vdk_hs38_smp_defconfig (gcc-10): 2 warnings

arm64:
    allmodconfig (gcc-10): 2 errors, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (clang-13): =
1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chrome=
book (clang-13): 1 error, 1 warning
    cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chr=
omebook (clang-13): 1 error, 1 warning
    defconfig+CONFIG_ARM64_64K_PAGES=3Dy (clang-17): 3 warnings
    defconfig+arm64-chromebook (clang-13): 3 warnings

arm:
    allmodconfig (gcc-10): 3 errors, 1 warning
    allmodconfig (clang-17): 1 error, 1 warning
    aspeed_g5_defconfig (clang-17): 3 warnings
    aspeed_g5_defconfig (gcc-10): 2 warnings
    at91_dt_defconfig (gcc-10): 2 warnings
    axm55xx_defconfig (gcc-10): 2 warnings
    bcm2835_defconfig (gcc-10): 2 warnings
    davinci_all_defconfig (gcc-10): 11 errors, 2 warnings
    exynos_defconfig (gcc-10): 2 warnings
    hisi_defconfig (gcc-10): 2 warnings
    imx_v4_v5_defconfig (gcc-10): 2 warnings
    imxrt_defconfig (gcc-10): 2 warnings
    ixp4xx_defconfig (gcc-10): 2 warnings
    keystone_defconfig (gcc-10): 2 warnings
    milbeaut_m10v_defconfig (gcc-10): 2 warnings
    mmp2_defconfig (gcc-10): 2 warnings
    moxart_defconfig (gcc-10): 2 warnings
    multi_v5_defconfig (clang-17): 3 warnings
    multi_v5_defconfig (gcc-10): 2 warnings
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (gcc-10): 2 warni=
ngs
    multi_v7_defconfig+CONFIG_SMP=3Dn (gcc-10): 2 warnings
    multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (gcc-10): 2 warnings
    mvebu_v5_defconfig (gcc-10): 2 warnings
    mvebu_v7_defconfig (gcc-10): 2 warnings
    mxs_defconfig (gcc-10): 2 warnings
    nhk8815_defconfig (gcc-10): 2 warnings
    omap2plus_defconfig (gcc-10): 23 errors
    orion5x_defconfig (gcc-10): 2 warnings
    pxa_defconfig (gcc-10): 1 error, 2 warnings
    qcom_defconfig (gcc-10): 2 warnings
    rpc_defconfig (gcc-10): 2 errors, 2 warnings
    s3c6400_defconfig (gcc-10): 2 warnings
    s5pv210_defconfig (gcc-10): 2 warnings
    sama5_defconfig (gcc-10): 2 warnings
    sama7_defconfig (gcc-10): 2 warnings
    socfpga_defconfig (gcc-10): 2 warnings
    sp7021_defconfig (gcc-10): 2 warnings
    spear13xx_defconfig (gcc-10): 2 warnings
    spear3xx_defconfig (gcc-10): 2 warnings
    spear6xx_defconfig (gcc-10): 2 warnings
    spitz_defconfig (gcc-10): 2 warnings
    stm32_defconfig (gcc-10): 2 warnings
    sunxi_defconfig (gcc-10): 2 warnings
    tegra_defconfig (gcc-10): 2 warnings
    u8500_defconfig (gcc-10): 2 warnings
    vexpress_defconfig (gcc-10): 2 warnings
    vf610m4_defconfig (gcc-10): 2 warnings
    vt8500_v6_v7_defconfig (gcc-10): 2 warnings

i386:

mips:
    32r2el_defconfig (gcc-10): 2 warnings
    32r2el_defconfig+debug (gcc-10): 2 warnings
    32r2el_defconfig+kselftest (gcc-10): 2 warnings
    bmips_be_defconfig (gcc-10): 2 warnings
    bmips_stb_defconfig (gcc-10): 2 warnings
    cavium_octeon_defconfig (gcc-10): 2 warnings
    ci20_defconfig (gcc-10): 2 warnings
    cobalt_defconfig (gcc-10): 2 warnings
    cu1000-neo_defconfig (gcc-10): 2 warnings
    cu1830-neo_defconfig (gcc-10): 2 warnings
    db1xxx_defconfig (gcc-10): 2 warnings
    decstation_64_defconfig (gcc-10): 2 warnings
    decstation_defconfig (gcc-10): 2 warnings
    decstation_r4k_defconfig (gcc-10): 2 warnings
    fuloong2e_defconfig (gcc-10): 1 error, 2 warnings
    gcw0_defconfig (gcc-10): 2 warnings
    ip27_defconfig (gcc-10): 2 warnings
    jazz_defconfig (gcc-10): 2 warnings
    lemote2f_defconfig (gcc-10): 1 error
    loongson1b_defconfig (gcc-10): 2 warnings
    loongson1c_defconfig (gcc-10): 2 warnings
    loongson2k_defconfig (gcc-10): 1 error
    loongson3_defconfig (gcc-10): 4 errors
    pic32mzda_defconfig (gcc-10): 2 warnings
    qi_lb60_defconfig (gcc-10): 2 warnings
    rm200_defconfig (gcc-10): 2 warnings
    rs90_defconfig (gcc-10): 2 warnings

riscv:
    defconfig (gcc-10): 2 warnings
    defconfig (clang-17): 3 warnings
    defconfig+debug (gcc-10): 2 warnings
    defconfig+kselftest (gcc-10): 2 warnings
    nommu_k210_defconfig (gcc-10): 1 error
    nommu_k210_defconfig (clang-17): 1 error
    nommu_k210_sdcard_defconfig (gcc-10): 1 error
    nommu_k210_sdcard_defconfig (clang-17): 1 error
    rv32_defconfig (gcc-10): 2 warnings

sparc:
    allnoconfig (gcc-10): 1 warning
    sparc32_defconfig (gcc-10): 2 warnings
    sparc64_defconfig (gcc-10): 6 warnings
    sparc64_defconfig+debug (gcc-10): 4 warnings
    sparc64_defconfig+kselftest (gcc-10): 4 warnings
    tinyconfig (gcc-10): 1 warning

x86_64:
    allmodconfig (gcc-10): 2 errors, 1 warning
    cros://chromeos-5.10/x86_64/chromeos-amd-stoneyridge.flavour.config+x86=
-chromebook (clang-13): 2 errors
    x86_64_defconfig+amdgpu (gcc-10): 2 errors, 1 warning
    x86_64_defconfig+kselftest (rustc-1.62): 3 warnings
    x86_64_defconfig+x86-chromebook (gcc-10): 2 errors, 1 warning
    x86_64_defconfig+x86-chromebook+amdgpu (gcc-10): 2 errors, 1 warning

Errors summary:

    5    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:229:1=
1: error: unused variable =E2=80=98otg_inst=E2=80=99 [-Werror=3Dunused-vari=
able]
    5    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:226:2=
0: error: unused variable =E2=80=98cmd=E2=80=99 [-Werror=3Dunused-variable]
    4    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable =
'ret' is uninitialized when used here [-Werror,-Wuninitialized]
    4    ERROR: modpost: Section mismatches detected.
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
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:229:1=
1: error: unused variable 'otg_inst' [-Werror,-Wunused-variable]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:226:2=
0: error: unused variable 'cmd' [-Werror,-Wunused-variable]
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

    74   fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=
=99 [-Wunused-variable]
    74   fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=
=99 [-Wunused-variable]
    10   <stdin>:1519:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    8    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-va=
riable]
    8    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-var=
iable]
    6    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initializ=
e the variable 'ret' to silence this warning
    6    cc1: all warnings being treated as errors
    3    2 warnings generated.
    2    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: warning: variabl=
e 'ret' is uninitialized when used here [-Wuninitialized]
    2    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version genera=
tion failed, symbol will not be versioned.
    2    1 warning generated.
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x3e: relocation to=
 !ENDBR: relocate_range+0xc6
    1    vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x28: relocation to=
 !ENDBR: relocate_range+0x23b
    1    vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0xcc: relocation to =
!ENDBR: native_write_cr4+0x4

Section mismatches summary:

    66   WARNING: modpost: vmlinux.o: section mismatch in reference: handsh=
ake_exit (section: .exit.text) -> handshake_genl_net_ops (section: .init.da=
ta)
    25   WARNING: modpost: vmlinux.o: section mismatch in reference: handsh=
ake_exit (section: .exit.text) -> (unknown) (section: .init.data)
    9    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_ca=
llin (section: .text) -> probe_vendor_features (section: .init.text)

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
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+debug (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 2 warni=
ngs, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
allnoconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
allnoconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
aspeed_g5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)

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
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
bmips_be_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config (arm64, clang-13=
) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-arm64.flavour.config+arm64-chromebook=
 (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatches

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

---------------------------------------------------------------------------=
-----
cros://chromeos-5.10/arm64/chromiumos-mediatek.flavour.config+arm64-chromeb=
ook (arm64, clang-13) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mismatc=
hes

Errors:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable 'ret'=
 is uninitialized when used here [-Werror,-Wuninitialized]

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning

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
omebook (x86_64, clang-13) =E2=80=94 FAIL, 2 errors, 0 warnings, 0 section =
mismatches

Errors:
    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:226:20: er=
ror: unused variable 'cmd' [-Werror,-Wunused-variable]
    drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_hwseq.c:229:11: er=
ror: unused variable 'otg_inst' [-Werror,-Wunused-variable]

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
cu1000-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
cu1830-neo_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-10) =E2=80=94 FAIL, 11 errors, 2 warnings, =
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

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-10) =E2=80=94 FAIL, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
defconfig (riscv, clang-17) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]
    2 warnings generated.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

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
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-10) =E2=80=94 PASS, 0 error=
s, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, clang-13) =E2=80=94 PASS, 0 errors, 3 wa=
rnings, 0 section mismatches

Warnings:
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: warning: variable 're=
t' is uninitialized when used here [-Wuninitialized]
    drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:216:12: note: initialize the=
 variable 'ret' to silence this warning
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+arm64-chromebook (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+crypto (arm64, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
defconfig+debug (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 2 warnings, 0 s=
ection mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

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
hisi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]

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
imx_v4_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)

---------------------------------------------------------------------------=
-----
imxrt_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
ip27_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 se=
ction mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
loongson2k_defconfig (mips, gcc-10) =E2=80=94 PASS, 1 error, 0 warnings, 0 =
section mismatches

Errors:
    cc1: error: =E2=80=98-mloongson-mmi=E2=80=99 must be used with =E2=80=
=98-mhard-float=E2=80=99

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

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

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)

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

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, clang-17) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-10) =E2=80=
=94 PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2=
 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy (arm, gcc-10) =E2=80=94 PASS, 0=
 errors, 2 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)

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
nhk8815_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warnings, 0=
 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
nommu_k210_defconfig (riscv, clang-17) =E2=80=94 FAIL, 1 error, 0 warnings,=
 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, gcc-10) =E2=80=94 FAIL, 1 error, 0 warn=
ings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
nommu_k210_sdcard_defconfig (riscv, clang-17) =E2=80=94 FAIL, 1 error, 0 wa=
rnings, 0 section mismatches

Errors:
    ERROR: modpost: Section mismatches detected.

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

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
orion5x_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
pxa_defconfig (arm, gcc-10) =E2=80=94 FAIL, 1 error, 2 warnings, 0 section =
mismatches

Errors:
    /tmp/kci/linux/build/../drivers/net/phy/phy_device.c:3053: undefined re=
ference to `devm_led_classdev_register_ext'

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-10) =E2=80=94 FAIL, 2 errors, 2 warnings, 0 section=
 mismatches

Errors:
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r7,=3D0x'
    arch/arm/kernel/head.S:319: Error: missing expression -- `ldr r3,=3D0x'

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
rs90_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: smp_callin =
(section: .text) -> probe_vendor_features (section: .init.text)

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
sama7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
socfpga_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
sp7021_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
sparc32_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation =
failed, symbol will not be versioned.

---------------------------------------------------------------------------=
-----
sparc64_defconfig+debug (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
sparc64_defconfig+kselftest (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 4 war=
nings, 0 section mismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> (unknown) (section: .init.data)

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
tinyconfig (sparc, gcc-10) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable 'i' [-Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable 'i' [-Wunused-variabl=
e]

Section mismatches:
    WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_e=
xit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-10) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-10) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    fs/ext4/super.c:1262:6: warning: unused variable =E2=80=98i=E2=80=99 [-=
Wunused-variable]
    fs/ext4/super.c:5200:15: warning: unused variable =E2=80=98i=E2=80=99 [=
-Wunused-variable]

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
x86_64_defconfig (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, clang-17) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
x86_64_defconfig+kselftest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0 war=
nings, 0 section mismatches

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
x86_64_defconfig+rust (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+rust-samples (x86_64, rustc-1.62) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+x86-chromebook (x86_64, clang-13) =E2=80=94 PASS, 0 errors=
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
x86_64_defconfig+x86_kvm_guest (x86_64, gcc-10) =E2=80=94 PASS, 0 errors, 0=
 warnings, 0 section mismatches

---
For more info write to <info@kernelci.org>
