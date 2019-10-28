Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E41DAE707A
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2019 12:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbfJ1LeH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 07:34:07 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35345 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfJ1LeH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Oct 2019 07:34:07 -0400
Received: by mail-wr1-f66.google.com with SMTP id l10so9492796wrb.2
        for <linux-next@vger.kernel.org>; Mon, 28 Oct 2019 04:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=KtiabZXAj5mJa3T0HQ+EQ6WfQz0nXupEZpIux9YrVjE=;
        b=tugvEtnVdWj1OXtQOzgn5rLdJ/kheNkRoLPcSYoUgaZZRCehDArf0mOAJn1pbOOx3a
         WSNh1B9Y804lVD2ujDoattBFqbJGpgbBejV7lf6kvfnFKDyUp5pZQoa1Y1TeTuxAfAwo
         FTl501A5g7nvc+IuuV2QbQXapihv/YvGyx3X0EKj08uJj+2NAakE/m0aFM+czVLkT5ow
         trxGRcDufd9C8OCIQR1x7MyBOFdssNevP9puZf/i97454yni9enZFsSJ2lQO8QKMHL3r
         BZrYl4sxX3DrxjaXdsAAfnBCLajEl9OBro/DWEB4vOCQr0o8EHH5vH82soPHKz5e8gAh
         airA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=KtiabZXAj5mJa3T0HQ+EQ6WfQz0nXupEZpIux9YrVjE=;
        b=WScon2eeaRZsVTBS4tzLXlrBJdHIQn+lWUfX6W24qnjNucIqtDjQr6eKiSZ8xaBOw0
         +05yeAEziA8wxt5O3Qnwz8OQfCNYUG9xZkaJH5OscLAL77s4Q05xNv0zpP533Emw3jtw
         r2G3A1s9yEOYDQ2Yc84jM6agZJD8Ex7xTLveeNWKaCQvNFzHW+I48cxZC6zZQaaPII6R
         2g+xYm7GKwgGLeRv8waRWbWyco7PzjRWNr2k3qE7yV5FIz+I1CLG4z4HzC9/ODuxV65l
         GhTe+cRoSarIxtVIZ1JlX3riUbrTXiaoDBTldq+gX9/cRb64WYTItP+Q2ve/RLL6XkBU
         3+XQ==
X-Gm-Message-State: APjAAAVO87oSGZ2MPprNPdRLKvZ4AfhZoqLQgVFCh8WFyV4L/IyH76uF
        J9bpC7ttB9V8RNyqmNshZLFT6A9h0OY=
X-Google-Smtp-Source: APXvYqyefvcYGozT6N4iEOHjYx7IN50aYMSaQkHieAE/S1vmCwrAwm8QZIGfxRHOQH5UJR1CCNSpKA==
X-Received: by 2002:a5d:4644:: with SMTP id j4mr9054582wrs.355.1572262436675;
        Mon, 28 Oct 2019 04:33:56 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 17sm10128987wmg.29.2019.10.28.04.33.55
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 04:33:56 -0700 (PDT)
Message-ID: <5db6d224.1c69fb81.97f58.3481@mx.google.com>
Date:   Mon, 28 Oct 2019 04:33:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20191028
X-Kernelci-Report-Type: build
Subject: next/master build: 216 builds: 2 failed, 214 passed, 5 errors,
 373 warnings (next-20191028)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 216 builds: 2 failed, 214 passed, 5 errors, 373 warnings=
 (next-20191028)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191028/

Tree: next
Branch: master
Git Describe: next-20191028
Git Commit: 60c1769a45f4b6beddcc48843739d7d41b88dc1c
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    allmodconfig: (gcc-8) FAIL

mips:
    cavium_octeon_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 2 warnings
    axs103_smp_defconfig (gcc-8): 2 warnings
    haps_hs_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    hsdk_defconfig (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (gcc-8): 1 warning
    allmodconfig (clang-8): 55 warnings
    defconfig (clang-8): 3 warnings
    defconfig (gcc-8): 29 warnings

arm:
    allmodconfig (gcc-8): 1 error, 19 warnings
    am200epdkit_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (gcc-8): 1 warning
    axm55xx_defconfig (gcc-8): 1 warning
    cm_x2xx_defconfig (gcc-8): 1 warning
    cm_x300_defconfig (gcc-8): 1 warning
    cns3420vb_defconfig (gcc-8): 1 warning
    colibri_pxa270_defconfig (gcc-8): 1 warning
    colibri_pxa300_defconfig (gcc-8): 1 warning
    davinci_all_defconfig (gcc-8): 1 warning
    dove_defconfig (gcc-8): 1 warning
    em_x270_defconfig (gcc-8): 1 warning
    ep93xx_defconfig (gcc-8): 1 warning
    eseries_pxa_defconfig (gcc-8): 2 warnings
    exynos_defconfig (gcc-8): 1 warning
    ezx_defconfig (gcc-8): 1 warning
    h5000_defconfig (gcc-8): 1 warning
    imote2_defconfig (gcc-8): 1 warning
    imx_v4_v5_defconfig (gcc-8): 1 warning
    imx_v6_v7_defconfig (gcc-8): 1 warning
    integrator_defconfig (gcc-8): 1 warning
    ixp4xx_defconfig (gcc-8): 1 warning
    keystone_defconfig (gcc-8): 1 warning
    lpc32xx_defconfig (gcc-8): 1 warning
    magician_defconfig (gcc-8): 2 warnings
    milbeaut_m10v_defconfig (gcc-8): 1 warning
    mini2440_defconfig (gcc-8): 1 warning
    mmp2_defconfig (gcc-8): 1 warning
    multi_v5_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 31 warnings
    mv78xx0_defconfig (gcc-8): 1 warning
    mvebu_v5_defconfig (gcc-8): 1 warning
    mvebu_v7_defconfig (gcc-8): 1 warning
    mxs_defconfig (gcc-8): 1 warning
    nhk8815_defconfig (gcc-8): 1 warning
    omap1_defconfig (gcc-8): 1 warning
    omap2plus_defconfig (gcc-8): 1 warning
    orion5x_defconfig (gcc-8): 1 warning
    oxnas_v6_defconfig (gcc-8): 1 warning
    palmz72_defconfig (gcc-8): 1 warning
    pcm027_defconfig (gcc-8): 1 warning
    prima2_defconfig (gcc-8): 1 warning
    pxa168_defconfig (gcc-8): 1 warning
    pxa3xx_defconfig (gcc-8): 1 warning
    pxa910_defconfig (gcc-8): 1 warning
    qcom_defconfig (gcc-8): 1 warning
    realview_defconfig (gcc-8): 1 warning
    s3c2410_defconfig (gcc-8): 1 warning
    s3c6400_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (gcc-8): 1 warning
    sama5_defconfig (gcc-8): 1 warning
    spear13xx_defconfig (gcc-8): 1 warning
    sunxi_defconfig (gcc-8): 1 warning
    tango4_defconfig (gcc-8): 1 warning
    tegra_defconfig (gcc-8): 1 warning
    trizeps4_defconfig (gcc-8): 1 warning
    u300_defconfig (gcc-8): 1 warning
    u8500_defconfig (gcc-8): 1 warning
    versatile_defconfig (gcc-8): 1 warning
    vexpress_defconfig (gcc-8): 1 warning
    viper_defconfig (gcc-8): 1 warning
    xcep_defconfig (gcc-8): 1 warning
    zeus_defconfig (gcc-8): 2 warnings

i386:
    i386_defconfig (gcc-8): 31 warnings

mips:
    32r2el_defconfig (gcc-8): 31 warnings
    cavium_octeon_defconfig (gcc-8): 4 errors, 3 warnings
    db1xxx_defconfig (gcc-8): 1 warning
    ip27_defconfig (gcc-8): 2 warnings
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    nlm_xlp_defconfig (gcc-8): 2 warnings
    nlm_xlr_defconfig (gcc-8): 4 warnings
    rbtx49xx_defconfig (gcc-8): 1 warning

riscv:
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 31 warnings
    rv32_defconfig (gcc-8): 8 warnings

x86_64:
    allmodconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 29 warnings

Errors summary:

    1    drivers/staging/octeon/ethernet.c:516:29: error: type of formal pa=
rameter 2 is incomplete
    1    drivers/staging/octeon/ethernet.c:499:30: error: storage size of '=
link_info' isn't known
    1    drivers/staging/octeon/ethernet.c:463:30: error: storage size of '=
link_info' isn't known
    1    drivers/staging/octeon/ethernet.c:177:21: error: dereferencing poi=
nter to incomplete type 'struct cvmx_wqe'
    1    ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/mellanox/mlxsw/mlx=
sw_spectrum.ko] undefined!

Warnings summary:

    64   WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    20   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    6    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunu=
sed-variable]
    6    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e100=
0e_s0ix_exit_flow' defined but not used [-Wunused-function]
    6    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e100=
0e_s0ix_entry_flow' defined but not used [-Wunused-function]
    5    include/linux/kern_levels.h:5:18: warning: format '%lu' expects ar=
gument of type 'long unsigned int', but argument 8 has type 'unsigned int' =
[-Wformat=3D]
    5    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argu=
ment of type 'long unsigned int', but argument 5 has type 'unsigned int' [-=
Wformat=3D]
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    3    sound/soc/codecs/rt5677-spi.c:114:30: warning: unused variable 'rt=
d' [-Wunused-variable]
    2    arch/arm64/kernel/sys_compat.c:40:21: warning: value size does not=
 match register size specified by the constraint and modifier [-Wasm-operan=
d-widths]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:134: Warning: macro instruction expanded into mul=
tiple instructions
    1    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable 'rtd' [-=
Wunused-variable]
    1    drivers/staging/octeon/octeon-ethernet.h:94:12: warning: 'union cv=
mx_helper_link_info' declared inside parameter list will not be visible out=
side of this definition or declaration
    1    drivers/staging/octeon/ethernet.c:499:30: warning: unused variable=
 'link_info' [-Wunused-variable]
    1    drivers/staging/octeon/ethernet.c:463:30: warning: unused variable=
 'link_info' [-Wunused-variable]
    1    drivers/net/phy/mdio-octeon.c:48:3: warning: cast from pointer to =
integer of different size [-Wpointer-to-int-cast]
    1    2 warnings generated.
    1    /tmp/ccbuX3ng.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccbuX3ng.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1166:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.vCu4QrfAt2:3992:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vCu4QrfAt2:3975:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.vCu4QrfAt2:3974:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.vCu4QrfAt2:3970:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.vCu4QrfAt2:3950:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.vCu4QrfAt2:3944:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.vCu4QrfAt2:3935:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.vCu4QrfAt2:3933:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.vCu4QrfAt2:3932:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.vCu4QrfAt2:3931:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.vCu4QrfAt2:3929:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.vCu4QrfAt2:3928:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.vCu4QrfAt2:3925:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.vCu4QrfAt2:3918:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.vCu4QrfAt2:3908:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.vCu4QrfAt2:3897:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vCu4QrfAt2:3789:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.vCu4QrfAt2:3785:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vCu4QrfAt2:3759:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.vCu4QrfAt2:3738:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.vCu4QrfAt2:3730:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.vCu4QrfAt2:3726:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.vCu4QrfAt2:3671:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.vCu4QrfAt2:3670:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.vCu4QrfAt2:3666:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.vCu4QrfAt2:3665:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.vCu4QrfAt2:3663:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.vCu4QrfAt2:3662:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.vCu4QrfAt2:3659:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.HQcg6vXcOg:8586:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.HQcg6vXcOg:8569:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.HQcg6vXcOg:8568:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.HQcg6vXcOg:8564:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.HQcg6vXcOg:8544:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.HQcg6vXcOg:8538:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.HQcg6vXcOg:8529:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.HQcg6vXcOg:8527:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.HQcg6vXcOg:8526:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.HQcg6vXcOg:8525:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.HQcg6vXcOg:8523:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.HQcg6vXcOg:8522:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.HQcg6vXcOg:8519:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.HQcg6vXcOg:8512:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.HQcg6vXcOg:8502:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.HQcg6vXcOg:8491:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.HQcg6vXcOg:8383:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.HQcg6vXcOg:8379:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.HQcg6vXcOg:8353:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.HQcg6vXcOg:8332:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.HQcg6vXcOg:8324:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.HQcg6vXcOg:8320:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.HQcg6vXcOg:8265:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.HQcg6vXcOg:8264:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.HQcg6vXcOg:8260:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.HQcg6vXcOg:8259:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.HQcg6vXcOg:8257:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.HQcg6vXcOg:8256:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.HQcg6vXcOg:8253:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.BuDHwkPxRx:4837:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.BuDHwkPxRx:4820:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.BuDHwkPxRx:4819:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.BuDHwkPxRx:4815:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.BuDHwkPxRx:4795:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.BuDHwkPxRx:4789:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.BuDHwkPxRx:4780:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.BuDHwkPxRx:4778:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.BuDHwkPxRx:4777:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.BuDHwkPxRx:4776:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.BuDHwkPxRx:4774:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.BuDHwkPxRx:4773:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.BuDHwkPxRx:4770:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.BuDHwkPxRx:4763:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.BuDHwkPxRx:4753:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.BuDHwkPxRx:4742:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.BuDHwkPxRx:4634:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.BuDHwkPxRx:4630:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.BuDHwkPxRx:4604:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.BuDHwkPxRx:4583:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.BuDHwkPxRx:4575:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.BuDHwkPxRx:4571:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.BuDHwkPxRx:4516:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.BuDHwkPxRx:4515:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.BuDHwkPxRx:4511:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.BuDHwkPxRx:4510:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.BuDHwkPxRx:4508:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.BuDHwkPxRx:4507:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.BuDHwkPxRx:4504:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.7SYIUodQI4:4900:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7SYIUodQI4:4883:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.7SYIUodQI4:4882:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.7SYIUodQI4:4878:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.7SYIUodQI4:4858:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.7SYIUodQI4:4852:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.7SYIUodQI4:4843:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.7SYIUodQI4:4841:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.7SYIUodQI4:4840:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.7SYIUodQI4:4839:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.7SYIUodQI4:4837:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.7SYIUodQI4:4836:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.7SYIUodQI4:4833:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.7SYIUodQI4:4826:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.7SYIUodQI4:4816:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.7SYIUodQI4:4805:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7SYIUodQI4:4697:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.7SYIUodQI4:4693:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7SYIUodQI4:4667:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.7SYIUodQI4:4646:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.7SYIUodQI4:4638:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.7SYIUodQI4:4634:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.7SYIUodQI4:4579:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.7SYIUodQI4:4578:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.7SYIUodQI4:4574:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.7SYIUodQI4:4573:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.7SYIUodQI4:4571:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.7SYIUodQI4:4570:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.7SYIUodQI4:4567:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.7PqBjeP3X7:7981:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7PqBjeP3X7:7964:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.7PqBjeP3X7:7963:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.7PqBjeP3X7:7959:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.7PqBjeP3X7:7939:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.7PqBjeP3X7:7933:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.7PqBjeP3X7:7924:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.7PqBjeP3X7:7922:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.7PqBjeP3X7:7921:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.7PqBjeP3X7:7920:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.7PqBjeP3X7:7918:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.7PqBjeP3X7:7917:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.7PqBjeP3X7:7914:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.7PqBjeP3X7:7907:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.7PqBjeP3X7:7897:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.7PqBjeP3X7:7886:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7PqBjeP3X7:7778:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.7PqBjeP3X7:7774:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7PqBjeP3X7:7748:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.7PqBjeP3X7:7727:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.7PqBjeP3X7:7719:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.7PqBjeP3X7:7715:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.7PqBjeP3X7:7660:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.7PqBjeP3X7:7659:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.7PqBjeP3X7:7655:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.7PqBjeP3X7:7654:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.7PqBjeP3X7:7652:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.7PqBjeP3X7:7651:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.7PqBjeP3X7:7648:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.6LJZlUVPsJ:3378:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6LJZlUVPsJ:3361:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.6LJZlUVPsJ:3360:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.6LJZlUVPsJ:3356:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.6LJZlUVPsJ:3336:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.6LJZlUVPsJ:3330:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.6LJZlUVPsJ:3321:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.6LJZlUVPsJ:3319:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.6LJZlUVPsJ:3318:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.6LJZlUVPsJ:3317:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.6LJZlUVPsJ:3315:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.6LJZlUVPsJ:3314:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.6LJZlUVPsJ:3311:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.6LJZlUVPsJ:3304:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.6LJZlUVPsJ:3294:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.6LJZlUVPsJ:3283:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6LJZlUVPsJ:3175:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.6LJZlUVPsJ:3171:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6LJZlUVPsJ:3145:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.6LJZlUVPsJ:3124:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.6LJZlUVPsJ:3116:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.6LJZlUVPsJ:3112:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.6LJZlUVPsJ:3057:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.6LJZlUVPsJ:3056:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.6LJZlUVPsJ:3052:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.6LJZlUVPsJ:3051:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.6LJZlUVPsJ:3049:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.6LJZlUVPsJ:3048:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.6LJZlUVPsJ:3045:warning: override: reassigning to sy=
mbol BPF_SYSCALL

Section mismatches summary:

    5    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    3    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    3    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x7c8): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x710): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x3630): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    1    WARNING: vmlinux.o(.text.unlikely+0x3320): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 31 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.vCu4QrfAt2:3659:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.vCu4QrfAt2:3662:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.vCu4QrfAt2:3663:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.vCu4QrfAt2:3665:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.vCu4QrfAt2:3666:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.vCu4QrfAt2:3670:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.vCu4QrfAt2:3671:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.vCu4QrfAt2:3726:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.vCu4QrfAt2:3730:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.vCu4QrfAt2:3738:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.vCu4QrfAt2:3759:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.vCu4QrfAt2:3785:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.vCu4QrfAt2:3789:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.vCu4QrfAt2:3897:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.vCu4QrfAt2:3908:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.vCu4QrfAt2:3918:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.vCu4QrfAt2:3925:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.vCu4QrfAt2:3928:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.vCu4QrfAt2:3929:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.vCu4QrfAt2:3931:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.vCu4QrfAt2:3932:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.vCu4QrfAt2:3933:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.vCu4QrfAt2:3935:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.vCu4QrfAt2:3944:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.vCu4QrfAt2:3950:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.vCu4QrfAt2:3970:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.vCu4QrfAt2:3974:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.vCu4QrfAt2:3975:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.vCu4QrfAt2:3992:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 19 warnings, 0 section m=
ismatches

Errors:
    ERROR: "__aeabi_uldivmod" [drivers/net/ethernet/mellanox/mlxsw/mlxsw_sp=
ectrum.ko] undefined!

Warnings:
    /tmp/ccbuX3ng.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccbuX3ng.s:18191: Warning: using r15 results in unpredictable beha=
viour
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]
    sound/soc/codecs/rt5677-spi.c:114:30: warning: unused variable 'rtd' [-=
Wunused-variable]
    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-octeon.c:48:3: warning: cast from pointer to integ=
er of different size [-Wpointer-to-int-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    sound/soc/codecs/rt5677-spi.c:114:30: warning: unused variable 'rtd' [-=
Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    sound/soc/codecs/rt5677-spi.c:114:30: warning: unused variable 'rtd' [-=
Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 55 warnings, 0 sect=
ion mismatches

Warnings:
    arch/arm64/kernel/sys_compat.c:40:21: warning: value size does not matc=
h register size specified by the constraint and modifier [-Wasm-operand-wid=
ths]
    arch/arm64/kernel/sys_compat.c:40:21: warning: value size does not matc=
h register size specified by the constraint and modifier [-Wasm-operand-wid=
ths]
    2 warnings generated.
    mm/shmem.c:2737:35: warning: variable 'shmem_falloc_waitq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/proc/base.c:1894:35: warning: variable 'wq' is uninitialized when us=
ed within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is uninitialized w=
hen used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/namei.c:1644:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    fs/namei.c:3132:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/android/binderfs.c:657:41: warning: suggest braces around initi=
alization of subobject [-Wmissing-braces]
    1 warning generated.
    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized when=
 used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/cifs/readdir.c:83:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when used =
within its own initialization [-Wuninitialized]
    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when used=
 within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:151:20: warning: variable 'cmd' is =
uninitialized when used within its own initialization [-Wuninitialized]
    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:151:25: warning: variable 'cfg' is =
uninitialized when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    sound/soc/codecs/rt5677-spi.c:114:30: warning: unused variable 'rtd' [-=
Wunused-variable]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../powerplay/renoir_ppt.c:183:26: warning: s=
uggest braces around initialization of subobject [-Wmissing-braces]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:2520:42: warnin=
g: implicit conversion from enumeration type 'enum transmitter' to differen=
t enumeration type 'enum physical_phy_id' [-Wenum-conversion]
    1 warning generated.
    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitialized=
 when used within its own initialization [-Wuninitialized]
    1 warning generated.
    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/misc/mic/vop/vop_vringh.c:155:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    drivers/misc/mic/vop/vop_vringh.c:399:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/net/usb/lan78xx.c:2662:34: warning: variable 'unlink_wakeup' is=
 uninitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/scsi/lpfc/lpfc_sli.c:11878:34: warning: variable 'done_q' is un=
initialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/scsi/lpfc/lpfc_scsi.c:4726:34: warning: variable 'waitq' is uni=
nitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/net/wireless/realtek/rtw88/phy.c:2074:36: warning: address of a=
rray 'swing_table->n' will always evaluate to 'true' [-Wpointer-bool-conver=
sion]
    drivers/net/wireless/realtek/rtw88/phy.c:2074:55: warning: address of a=
rray 'swing_table->p' will always evaluate to 'true' [-Wpointer-bool-conver=
sion]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 4 errors, 3 warnings,=
 0 section mismatches

Errors:
    drivers/staging/octeon/ethernet.c:177:21: error: dereferencing pointer =
to incomplete type 'struct cvmx_wqe'
    drivers/staging/octeon/ethernet.c:463:30: error: storage size of 'link_=
info' isn't known
    drivers/staging/octeon/ethernet.c:499:30: error: storage size of 'link_=
info' isn't known
    drivers/staging/octeon/ethernet.c:516:29: error: type of formal paramet=
er 2 is incomplete

Warnings:
    drivers/staging/octeon/octeon-ethernet.h:94:12: warning: 'union cvmx_he=
lper_link_info' declared inside parameter list will not be visible outside =
of this definition or declaration
    drivers/staging/octeon/ethernet.c:463:30: warning: unused variable 'lin=
k_info' [-Wunused-variable]
    drivers/staging/octeon/ethernet.c:499:30: warning: unused variable 'lin=
k_info' [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3630): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3320): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e1000e_s0=
ix_exit_flow' defined but not used [-Wunused-function]
    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e1000e_s0=
ix_entry_flow' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    arch/arm64/kernel/sys_compat.c:40:21: warning: value size does not matc=
h register size specified by the constraint and modifier [-Wasm-operand-wid=
ths]
    arch/arm64/kernel/sys_compat.c:40:21: warning: value size does not matc=
h register size specified by the constraint and modifier [-Wasm-operand-wid=
ths]
    2 warnings generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 31 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.6LJZlUVPsJ:3045:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.6LJZlUVPsJ:3048:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.6LJZlUVPsJ:3049:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.6LJZlUVPsJ:3051:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.6LJZlUVPsJ:3052:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.6LJZlUVPsJ:3056:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.6LJZlUVPsJ:3057:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.6LJZlUVPsJ:3112:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.6LJZlUVPsJ:3116:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.6LJZlUVPsJ:3124:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.6LJZlUVPsJ:3145:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.6LJZlUVPsJ:3171:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.6LJZlUVPsJ:3175:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.6LJZlUVPsJ:3283:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.6LJZlUVPsJ:3294:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.6LJZlUVPsJ:3304:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.6LJZlUVPsJ:3311:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.6LJZlUVPsJ:3314:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.6LJZlUVPsJ:3315:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.6LJZlUVPsJ:3317:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.6LJZlUVPsJ:3318:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.6LJZlUVPsJ:3319:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.6LJZlUVPsJ:3321:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.6LJZlUVPsJ:3330:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.6LJZlUVPsJ:3336:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.6LJZlUVPsJ:3356:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.6LJZlUVPsJ:3360:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.6LJZlUVPsJ:3361:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.6LJZlUVPsJ:3378:warning: override: reassigning to symbol =
USER_NS
    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e1000e_s0=
ix_exit_flow' defined but not used [-Wunused-function]
    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e1000e_s0=
ix_entry_flow' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 29 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.7PqBjeP3X7:7648:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.7PqBjeP3X7:7651:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.7PqBjeP3X7:7652:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.7PqBjeP3X7:7654:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.7PqBjeP3X7:7655:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.7PqBjeP3X7:7659:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.7PqBjeP3X7:7660:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.7PqBjeP3X7:7715:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.7PqBjeP3X7:7719:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.7PqBjeP3X7:7727:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.7PqBjeP3X7:7748:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.7PqBjeP3X7:7774:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.7PqBjeP3X7:7778:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.7PqBjeP3X7:7886:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.7PqBjeP3X7:7897:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.7PqBjeP3X7:7907:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.7PqBjeP3X7:7914:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.7PqBjeP3X7:7917:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.7PqBjeP3X7:7918:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.7PqBjeP3X7:7920:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.7PqBjeP3X7:7921:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.7PqBjeP3X7:7922:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.7PqBjeP3X7:7924:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.7PqBjeP3X7:7933:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.7PqBjeP3X7:7939:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.7PqBjeP3X7:7959:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.7PqBjeP3X7:7963:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.7PqBjeP3X7:7964:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.7PqBjeP3X7:7981:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x710): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 31 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.BuDHwkPxRx:4504:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.BuDHwkPxRx:4507:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.BuDHwkPxRx:4508:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.BuDHwkPxRx:4510:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.BuDHwkPxRx:4511:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.BuDHwkPxRx:4515:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.BuDHwkPxRx:4516:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.BuDHwkPxRx:4571:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.BuDHwkPxRx:4575:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.BuDHwkPxRx:4583:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.BuDHwkPxRx:4604:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.BuDHwkPxRx:4630:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.BuDHwkPxRx:4634:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.BuDHwkPxRx:4742:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.BuDHwkPxRx:4753:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.BuDHwkPxRx:4763:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.BuDHwkPxRx:4770:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.BuDHwkPxRx:4773:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.BuDHwkPxRx:4774:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.BuDHwkPxRx:4776:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.BuDHwkPxRx:4777:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.BuDHwkPxRx:4778:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.BuDHwkPxRx:4780:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.BuDHwkPxRx:4789:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.BuDHwkPxRx:4795:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.BuDHwkPxRx:4815:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.BuDHwkPxRx:4819:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.BuDHwkPxRx:4820:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.BuDHwkPxRx:4837:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e1000e_s0=
ix_exit_flow' defined but not used [-Wunused-function]
    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e1000e_s0=
ix_entry_flow' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x7c8): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    {standard input}:134: Warning: macro instruction expanded into multiple=
 instructions

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 1 warning, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 1 warning, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 =
warning, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 31 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.HQcg6vXcOg:8253:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.HQcg6vXcOg:8256:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.HQcg6vXcOg:8257:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.HQcg6vXcOg:8259:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.HQcg6vXcOg:8260:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.HQcg6vXcOg:8264:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.HQcg6vXcOg:8265:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.HQcg6vXcOg:8320:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.HQcg6vXcOg:8324:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.HQcg6vXcOg:8332:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.HQcg6vXcOg:8353:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.HQcg6vXcOg:8379:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.HQcg6vXcOg:8383:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.HQcg6vXcOg:8491:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.HQcg6vXcOg:8502:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.HQcg6vXcOg:8512:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.HQcg6vXcOg:8519:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.HQcg6vXcOg:8522:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.HQcg6vXcOg:8523:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.HQcg6vXcOg:8525:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.HQcg6vXcOg:8526:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.HQcg6vXcOg:8527:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.HQcg6vXcOg:8529:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.HQcg6vXcOg:8538:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.HQcg6vXcOg:8544:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.HQcg6vXcOg:8564:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.HQcg6vXcOg:8568:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.HQcg6vXcOg:8569:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.HQcg6vXcOg:8586:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e1000e_s0=
ix_exit_flow' defined but not used [-Wunused-function]
    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e1000e_s0=
ix_entry_flow' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e1000e_s0=
ix_exit_flow' defined but not used [-Wunused-function]
    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e1000e_s0=
ix_entry_flow' defined but not used [-Wunused-function]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable 'rtd' [-Wunus=
ed-variable]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e1000e_s0=
ix_exit_flow' defined but not used [-Wunused-function]
    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e1000e_s0=
ix_entry_flow' defined but not used [-Wunused-function]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1166:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 29 war=
nings, 0 section mismatches

Warnings:
    ./.tmp.config.7SYIUodQI4:4567:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.7SYIUodQI4:4570:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.7SYIUodQI4:4571:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.7SYIUodQI4:4573:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.7SYIUodQI4:4574:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.7SYIUodQI4:4578:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.7SYIUodQI4:4579:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.7SYIUodQI4:4634:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.7SYIUodQI4:4638:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.7SYIUodQI4:4646:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.7SYIUodQI4:4667:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.7SYIUodQI4:4693:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.7SYIUodQI4:4697:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.7SYIUodQI4:4805:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.7SYIUodQI4:4816:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.7SYIUodQI4:4826:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.7SYIUodQI4:4833:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.7SYIUodQI4:4836:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.7SYIUodQI4:4837:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.7SYIUodQI4:4839:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.7SYIUodQI4:4840:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.7SYIUodQI4:4841:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.7SYIUodQI4:4843:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.7SYIUodQI4:4852:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.7SYIUodQI4:4858:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.7SYIUodQI4:4878:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.7SYIUodQI4:4882:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.7SYIUodQI4:4883:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.7SYIUodQI4:4900:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
