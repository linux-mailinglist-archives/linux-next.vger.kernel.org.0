Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9D1B4E97
	for <lists+linux-next@lfdr.de>; Tue, 17 Sep 2019 14:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbfIQM5m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 08:57:42 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50832 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbfIQM5l (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Sep 2019 08:57:41 -0400
Received: by mail-wm1-f65.google.com with SMTP id 5so3324342wmg.0
        for <linux-next@vger.kernel.org>; Tue, 17 Sep 2019 05:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=U0MPet/GxcvEMebnrK+LOfNNkJFD6eN9F5bUXcn/lts=;
        b=lVsumCBsEGTkF0Qpmjbj5r89bAda1HJ1feoX271TOguMal6q+ssxHBfKYpHBoOf/Uw
         xU2B9iRVwEiu6hV8IvVXRp96bIXbmg9bIIYShHocSH0XEUGfQpphJXigpdJZ20e6QLNX
         U6qjofxtEKuRYoJq3lr07e5Mnw08JBeGQjVixeK3XA9kwODcqmPVGSmNPQeAH4rfRguQ
         BhMazYFkc51/2DbWw9sPveUpAz/CMJqoUyAfzF2cCIa8VeT6byNdIx5/FkeYLBrBNXte
         EXPDZKNUjJcOs/y8BUf9G+zpWErpFN76hmdmLZRNz13p/9N9moLls0xyxjg0lW7KXWlM
         VXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=U0MPet/GxcvEMebnrK+LOfNNkJFD6eN9F5bUXcn/lts=;
        b=EiDuMz+6o3ju+BeRujfbUSsC12qzIFnHc+MR07Za964Uy7dTBGdl0/qsmBOOdabnu/
         3EurhWNsSXCdHXVHubnt2g5+CrZ0OP4PLoiKob9Vo7yKevghavjaOmpNLQuUuj/CVS2d
         SVtiLPFU2AUdHIZGJ+CbCuij2vrSef7jv+Y+dGflp9GblemN7eRzLD/ILpZ2QJ57Quph
         lBu7aAx/cgeU6UOCFWkQ7lvZwH6ErdzMV6P/lIfU7mjeB7RtXuN+ZHrnVqsxh4ZY6Ci2
         Mduj/D/wN180ody10QzM7Na5et/9xeGgiUfJzef8wooLlZlihLzi8dOJAohe9b8RPEyB
         2ErQ==
X-Gm-Message-State: APjAAAUJxLISFY9Z8OJwbdaqXT/Uv6BsKnI124ioHVdkE1oxIiXuTvTS
        AlFWfFMUESWRCNQ1Fj03uw+s68BFUYYEVA==
X-Google-Smtp-Source: APXvYqwOVQeVM16DqnoHtY3rvhx2KB8jWdwds+uGewLbrTx0aaVT5k86Uny6vxf5BGUVGB6VHUhqvA==
X-Received: by 2002:a1c:3cc3:: with SMTP id j186mr3305789wma.119.1568725050818;
        Tue, 17 Sep 2019 05:57:30 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f3sm2857107wmh.9.2019.09.17.05.57.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2019 05:57:30 -0700 (PDT)
Message-ID: <5d80d83a.1c69fb81.8b376.d303@mx.google.com>
Date:   Tue, 17 Sep 2019 05:57:30 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-3007-gf8654cb23405
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 214 builds: 0 failed, 214 passed,
 549 warnings (v5.3-3007-gf8654cb23405)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 214 builds: 0 failed, 214 passed, 549 warnings (v=
5.3-3007-gf8654cb23405)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-3007-gf8654cb23405/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-3007-gf8654cb23405
Git Commit: f8654cb234051f3e595b700c1f977d0b6743d6f7
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 2 warnings
    axs103_smp_defconfig (gcc-8): 2 warnings
    haps_hs_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    hsdk_defconfig (gcc-8): 2 warnings
    nsim_hs_defconfig (gcc-8): 2 warnings
    nsim_hs_defconfig (gcc-8): 29 warnings
    nsim_hs_smp_defconfig (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (gcc-8): 9 warnings
    defconfig (gcc-8): 3 warnings
    defconfig (gcc-8): 3 warnings
    defconfig (gcc-8): 3 warnings
    defconfig (gcc-8): 30 warnings

arm:
    at91_dt_defconfig (gcc-8): 4 warnings
    exynos_defconfig (gcc-8): 1 warning
    imx_v4_v5_defconfig (gcc-8): 1 warning
    mini2440_defconfig (gcc-8): 2 warnings
    multi_v5_defconfig (gcc-8): 4 warnings
    multi_v7_defconfig (gcc-8): 19 warnings
    multi_v7_defconfig (gcc-8): 19 warnings
    multi_v7_defconfig (gcc-8): 19 warnings
    multi_v7_defconfig (gcc-8): 19 warnings
    multi_v7_defconfig (gcc-8): 46 warnings
    omap2plus_defconfig (gcc-8): 3 warnings
    pxa_defconfig (gcc-8): 3 warnings
    qcom_defconfig (gcc-8): 2 warnings
    s3c6400_defconfig (gcc-8): 1 warning
    s5pv210_defconfig (gcc-8): 1 warning
    sama5_defconfig (gcc-8): 4 warnings
    shmobile_defconfig (gcc-8): 2 warnings
    tct_hammer_defconfig (gcc-8): 2 warnings
    u8500_defconfig (gcc-8): 6 warnings

i386:
    i386_defconfig (gcc-8): 27 warnings

mips:
    32r2el_defconfig (gcc-8): 3 warnings
    32r2el_defconfig (gcc-8): 30 warnings
    allnoconfig (gcc-8): 1 warning
    ar7_defconfig (gcc-8): 2 warnings
    ath25_defconfig (gcc-8): 2 warnings
    ath79_defconfig (gcc-8): 2 warnings
    bcm47xx_defconfig (gcc-8): 2 warnings
    bcm63xx_defconfig (gcc-8): 1 warning
    bigsur_defconfig (gcc-8): 6 warnings
    bmips_be_defconfig (gcc-8): 1 warning
    bmips_stb_defconfig (gcc-8): 1 warning
    capcella_defconfig (gcc-8): 2 warnings
    cavium_octeon_defconfig (gcc-8): 6 warnings
    ci20_defconfig (gcc-8): 2 warnings
    cobalt_defconfig (gcc-8): 2 warnings
    db1xxx_defconfig (gcc-8): 2 warnings
    decstation_64_defconfig (gcc-8): 6 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
    e55_defconfig (gcc-8): 2 warnings
    fuloong2e_defconfig (gcc-8): 6 warnings
    gcw0_defconfig (gcc-8): 1 warning
    gpr_defconfig (gcc-8): 2 warnings
    ip22_defconfig (gcc-8): 3 warnings
    ip27_defconfig (gcc-8): 6 warnings
    ip28_defconfig (gcc-8): 7 warnings
    ip32_defconfig (gcc-8): 6 warnings
    jazz_defconfig (gcc-8): 2 warnings
    jmr3927_defconfig (gcc-8): 1 warning
    lasat_defconfig (gcc-8): 1 warning
    lemote2f_defconfig (gcc-8): 6 warnings
    loongson1b_defconfig (gcc-8): 2 warnings
    loongson1c_defconfig (gcc-8): 2 warnings
    loongson3_defconfig (gcc-8): 6 warnings
    malta_defconfig (gcc-8): 2 warnings
    malta_kvm_defconfig (gcc-8): 2 warnings
    malta_kvm_guest_defconfig (gcc-8): 2 warnings
    malta_qemu_32r6_defconfig (gcc-8): 3 warnings
    maltaaprp_defconfig (gcc-8): 2 warnings
    maltasmvp_defconfig (gcc-8): 2 warnings
    maltasmvp_eva_defconfig (gcc-8): 2 warnings
    maltaup_defconfig (gcc-8): 2 warnings
    maltaup_xpa_defconfig (gcc-8): 2 warnings
    markeins_defconfig (gcc-8): 2 warnings
    mips_paravirt_defconfig (gcc-8): 6 warnings
    mpc30x_defconfig (gcc-8): 2 warnings
    msp71xx_defconfig (gcc-8): 2 warnings
    mtx1_defconfig (gcc-8): 2 warnings
    nlm_xlp_defconfig (gcc-8): 6 warnings
    nlm_xlr_defconfig (gcc-8): 2 warnings
    omega2p_defconfig (gcc-8): 1 warning
    pic32mzda_defconfig (gcc-8): 2 warnings
    pistachio_defconfig (gcc-8): 2 warnings
    pnx8335_stb225_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 4 warnings
    rb532_defconfig (gcc-8): 2 warnings
    rbtx49xx_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 2 warnings
    rt305x_defconfig (gcc-8): 2 warnings
    sb1250_swarm_defconfig (gcc-8): 4 warnings
    tb0219_defconfig (gcc-8): 2 warnings
    tb0226_defconfig (gcc-8): 2 warnings
    tb0287_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vocore2_defconfig (gcc-8): 1 warning
    workpad_defconfig (gcc-8): 2 warnings
    xway_defconfig (gcc-8): 2 warnings

riscv:
    defconfig (gcc-8): 27 warnings
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 27 warnings


Warnings summary:

    196  <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    11   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:800:20: warning: this sta=
tement may fall through [-Wimplicit-fallthrough=3D]
    11   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:795:20: warning: this sta=
tement may fall through [-Wimplicit-fallthrough=3D]
    10   drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    8    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    8    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    8    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    8    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    7    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
    7    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
    7    drivers/dma/imx-dma.c:542:6: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    5    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    5    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    5    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    3    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
    2    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret=
' [-Wunused-variable]
    2    drivers/usb/gadget/udc/s3c2410_udc.c:418:7: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    2    drivers/usb/gadget/udc/s3c2410_udc.c:314:7: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    2    drivers/scsi/wd33c93.c:1856:11: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:131: Warning: macro instruction expanded into mul=
tiple instructions
    1    include/linux/device.h:1502:2: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    1    drivers/video/fbdev/jz4740_fb.c:300:8: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    1    drivers/usb/host/ohci-tmio.c:103:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    1    drivers/usb/host/ohci-tmio.c:101:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    1    drivers/soundwire/slave.c:16:12: warning: 'sdw_slave_add' defined =
but not used [-Wunused-function]
    1    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mism=
atch in conditional expression
    1    drivers/hsi/clients/ssi_protocol.c:466:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/hsi/clients/ssi_protocol.c:291:6: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/gpu/drm/arm/malidp_hw.c:387:8: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    1    drivers/gpu/drm/arm/malidp_hw.c:1311:4: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    1    drivers/cpufreq/ti-cpufreq.c:79:20: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    1    .config:1170:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.qrZ0sp9Yp0:1741:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.qrZ0sp9Yp0:1725:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.qrZ0sp9Yp0:1724:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.qrZ0sp9Yp0:1720:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.qrZ0sp9Yp0:1700:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.qrZ0sp9Yp0:1694:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.qrZ0sp9Yp0:1685:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.qrZ0sp9Yp0:1683:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.qrZ0sp9Yp0:1682:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.qrZ0sp9Yp0:1681:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.qrZ0sp9Yp0:1679:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.qrZ0sp9Yp0:1678:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.qrZ0sp9Yp0:1675:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.qrZ0sp9Yp0:1668:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.qrZ0sp9Yp0:1658:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.qrZ0sp9Yp0:1647:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.qrZ0sp9Yp0:1541:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.qrZ0sp9Yp0:1537:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.qrZ0sp9Yp0:1512:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.qrZ0sp9Yp0:1491:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.qrZ0sp9Yp0:1433:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.qrZ0sp9Yp0:1432:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.qrZ0sp9Yp0:1428:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.qrZ0sp9Yp0:1427:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.qrZ0sp9Yp0:1425:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.qrZ0sp9Yp0:1424:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.qrZ0sp9Yp0:1421:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.krm52ugMmd:4822:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.krm52ugMmd:4806:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.krm52ugMmd:4805:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.krm52ugMmd:4801:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.krm52ugMmd:4781:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.krm52ugMmd:4775:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.krm52ugMmd:4766:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.krm52ugMmd:4764:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.krm52ugMmd:4763:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.krm52ugMmd:4762:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.krm52ugMmd:4760:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.krm52ugMmd:4759:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.krm52ugMmd:4756:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.krm52ugMmd:4749:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.krm52ugMmd:4739:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.krm52ugMmd:4728:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.krm52ugMmd:4622:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.krm52ugMmd:4618:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.krm52ugMmd:4593:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.krm52ugMmd:4572:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.krm52ugMmd:4514:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.krm52ugMmd:4513:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.krm52ugMmd:4509:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.krm52ugMmd:4508:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.krm52ugMmd:4506:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.krm52ugMmd:4505:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.krm52ugMmd:4502:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.g2dvafkVN3:8452:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.g2dvafkVN3:8436:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.g2dvafkVN3:8435:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.g2dvafkVN3:8431:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.g2dvafkVN3:8411:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.g2dvafkVN3:8405:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.g2dvafkVN3:8396:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.g2dvafkVN3:8394:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.g2dvafkVN3:8393:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.g2dvafkVN3:8392:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.g2dvafkVN3:8390:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.g2dvafkVN3:8389:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.g2dvafkVN3:8386:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.g2dvafkVN3:8379:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.g2dvafkVN3:8369:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.g2dvafkVN3:8358:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.g2dvafkVN3:8252:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.g2dvafkVN3:8248:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.g2dvafkVN3:8223:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.g2dvafkVN3:8202:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.g2dvafkVN3:8144:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.g2dvafkVN3:8143:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.g2dvafkVN3:8139:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.g2dvafkVN3:8138:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.g2dvafkVN3:8136:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.g2dvafkVN3:8135:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.g2dvafkVN3:8132:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.bMHPKkQG1Q:4883:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.bMHPKkQG1Q:4867:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.bMHPKkQG1Q:4866:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.bMHPKkQG1Q:4862:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.bMHPKkQG1Q:4842:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.bMHPKkQG1Q:4836:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.bMHPKkQG1Q:4827:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.bMHPKkQG1Q:4825:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.bMHPKkQG1Q:4824:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.bMHPKkQG1Q:4823:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.bMHPKkQG1Q:4821:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.bMHPKkQG1Q:4820:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.bMHPKkQG1Q:4817:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.bMHPKkQG1Q:4810:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.bMHPKkQG1Q:4800:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.bMHPKkQG1Q:4789:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.bMHPKkQG1Q:4683:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.bMHPKkQG1Q:4679:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.bMHPKkQG1Q:4654:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.bMHPKkQG1Q:4633:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.bMHPKkQG1Q:4575:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.bMHPKkQG1Q:4574:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.bMHPKkQG1Q:4570:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.bMHPKkQG1Q:4569:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.bMHPKkQG1Q:4567:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.bMHPKkQG1Q:4566:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.bMHPKkQG1Q:4563:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.RtCVaOJ6cf:3343:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.RtCVaOJ6cf:3327:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.RtCVaOJ6cf:3326:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.RtCVaOJ6cf:3322:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.RtCVaOJ6cf:3302:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.RtCVaOJ6cf:3296:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.RtCVaOJ6cf:3287:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.RtCVaOJ6cf:3285:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.RtCVaOJ6cf:3284:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.RtCVaOJ6cf:3283:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.RtCVaOJ6cf:3281:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.RtCVaOJ6cf:3280:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.RtCVaOJ6cf:3277:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.RtCVaOJ6cf:3270:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.RtCVaOJ6cf:3260:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.RtCVaOJ6cf:3249:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.RtCVaOJ6cf:3143:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.RtCVaOJ6cf:3139:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.RtCVaOJ6cf:3114:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.RtCVaOJ6cf:3093:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.RtCVaOJ6cf:3035:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.RtCVaOJ6cf:3034:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.RtCVaOJ6cf:3030:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.RtCVaOJ6cf:3029:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.RtCVaOJ6cf:3027:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.RtCVaOJ6cf:3026:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.RtCVaOJ6cf:3023:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.HeRKPKfK36:3986:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.HeRKPKfK36:3970:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.HeRKPKfK36:3969:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.HeRKPKfK36:3965:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.HeRKPKfK36:3945:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.HeRKPKfK36:3939:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.HeRKPKfK36:3930:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.HeRKPKfK36:3928:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.HeRKPKfK36:3927:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.HeRKPKfK36:3926:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.HeRKPKfK36:3924:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.HeRKPKfK36:3923:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.HeRKPKfK36:3920:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.HeRKPKfK36:3913:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.HeRKPKfK36:3903:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.HeRKPKfK36:3892:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.HeRKPKfK36:3786:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.HeRKPKfK36:3782:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.HeRKPKfK36:3757:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.HeRKPKfK36:3736:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.HeRKPKfK36:3678:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.HeRKPKfK36:3677:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.HeRKPKfK36:3673:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.HeRKPKfK36:3672:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.HeRKPKfK36:3670:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.HeRKPKfK36:3669:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.HeRKPKfK36:3666:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.0sbbk4vv67:7867:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0sbbk4vv67:7851:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.0sbbk4vv67:7850:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.0sbbk4vv67:7846:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.0sbbk4vv67:7826:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.0sbbk4vv67:7820:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.0sbbk4vv67:7811:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.0sbbk4vv67:7809:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.0sbbk4vv67:7808:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.0sbbk4vv67:7807:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.0sbbk4vv67:7805:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.0sbbk4vv67:7804:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.0sbbk4vv67:7801:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.0sbbk4vv67:7794:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.0sbbk4vv67:7784:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.0sbbk4vv67:7773:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0sbbk4vv67:7667:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.0sbbk4vv67:7663:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0sbbk4vv67:7638:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.0sbbk4vv67:7617:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.0sbbk4vv67:7559:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.0sbbk4vv67:7558:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.0sbbk4vv67:7554:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.0sbbk4vv67:7553:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.0sbbk4vv67:7551:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.0sbbk4vv67:7550:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.0sbbk4vv67:7547:warning: override: reassigning to sy=
mbol BPF_SYSCALL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 30 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.HeRKPKfK36:3666:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.HeRKPKfK36:3669:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.HeRKPKfK36:3670:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.HeRKPKfK36:3672:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.HeRKPKfK36:3673:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.HeRKPKfK36:3677:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.HeRKPKfK36:3678:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.HeRKPKfK36:3736:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.HeRKPKfK36:3757:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.HeRKPKfK36:3782:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.HeRKPKfK36:3786:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.HeRKPKfK36:3892:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.HeRKPKfK36:3903:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.HeRKPKfK36:3913:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.HeRKPKfK36:3920:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.HeRKPKfK36:3923:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.HeRKPKfK36:3924:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.HeRKPKfK36:3926:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.HeRKPKfK36:3927:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.HeRKPKfK36:3928:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.HeRKPKfK36:3930:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.HeRKPKfK36:3939:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.HeRKPKfK36:3945:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.HeRKPKfK36:3965:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.HeRKPKfK36:3969:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.HeRKPKfK36:3970:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.HeRKPKfK36:3986:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 section=
 mismatches

Warnings:
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/arm/malidp_hw.c:387:8: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/arm/malidp_hw.c:1311:4: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:795:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:800:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/soundwire/slave.c:16:12: warning: 'sdw_slave_add' defined but n=
ot used [-Wunused-function]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

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
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret' [-W=
unused-variable]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mismatch =
in conditional expression

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section mi=
smatches

Warnings:
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:795:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:800:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 3 warnings, 0 section mismatches

Warnings:
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:795:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:800:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 3 warnings, 0 section mismatches

Warnings:
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:795:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:800:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.RtCVaOJ6cf:3023:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.RtCVaOJ6cf:3026:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.RtCVaOJ6cf:3027:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.RtCVaOJ6cf:3029:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.RtCVaOJ6cf:3030:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.RtCVaOJ6cf:3034:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.RtCVaOJ6cf:3035:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.RtCVaOJ6cf:3093:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.RtCVaOJ6cf:3114:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.RtCVaOJ6cf:3139:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.RtCVaOJ6cf:3143:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.RtCVaOJ6cf:3249:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.RtCVaOJ6cf:3260:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.RtCVaOJ6cf:3270:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.RtCVaOJ6cf:3277:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.RtCVaOJ6cf:3280:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.RtCVaOJ6cf:3281:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.RtCVaOJ6cf:3283:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.RtCVaOJ6cf:3284:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.RtCVaOJ6cf:3285:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.RtCVaOJ6cf:3287:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.RtCVaOJ6cf:3296:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.RtCVaOJ6cf:3302:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.RtCVaOJ6cf:3322:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.RtCVaOJ6cf:3326:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.RtCVaOJ6cf:3327:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.RtCVaOJ6cf:3343:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 30 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.0sbbk4vv67:7547:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.0sbbk4vv67:7550:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.0sbbk4vv67:7551:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.0sbbk4vv67:7553:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.0sbbk4vv67:7554:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.0sbbk4vv67:7558:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.0sbbk4vv67:7559:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.0sbbk4vv67:7617:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.0sbbk4vv67:7638:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.0sbbk4vv67:7663:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.0sbbk4vv67:7667:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.0sbbk4vv67:7773:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.0sbbk4vv67:7784:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.0sbbk4vv67:7794:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.0sbbk4vv67:7801:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.0sbbk4vv67:7804:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.0sbbk4vv67:7805:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.0sbbk4vv67:7807:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.0sbbk4vv67:7808:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.0sbbk4vv67:7809:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.0sbbk4vv67:7811:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.0sbbk4vv67:7820:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.0sbbk4vv67:7826:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.0sbbk4vv67:7846:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.0sbbk4vv67:7850:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.0sbbk4vv67:7851:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.0sbbk4vv67:7867:warning: override: reassigning to symbol =
USER_NS
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:795:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:800:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 27 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.krm52ugMmd:4502:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.krm52ugMmd:4505:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.krm52ugMmd:4506:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.krm52ugMmd:4508:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.krm52ugMmd:4509:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.krm52ugMmd:4513:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.krm52ugMmd:4514:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.krm52ugMmd:4572:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.krm52ugMmd:4593:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.krm52ugMmd:4618:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.krm52ugMmd:4622:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.krm52ugMmd:4728:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.krm52ugMmd:4739:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.krm52ugMmd:4749:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.krm52ugMmd:4756:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.krm52ugMmd:4759:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.krm52ugMmd:4760:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.krm52ugMmd:4762:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.krm52ugMmd:4763:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.krm52ugMmd:4764:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.krm52ugMmd:4766:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.krm52ugMmd:4775:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.krm52ugMmd:4781:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.krm52ugMmd:4801:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.krm52ugMmd:4805:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.krm52ugMmd:4806:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.krm52ugMmd:4822:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/scsi/wd33c93.c:1856:11: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/scsi/wd33c93.c:1856:11: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    {standard input}:131: Warning: macro instruction expanded into multiple=
 instructions
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/usb/gadget/udc/s3c2410_udc.c:314:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/s3c2410_udc.c:418:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 19 warnings, 0 se=
ction mismatches

Warnings:
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:795:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:800:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 19 warnings, 0 section mismatches

Warnings:
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:795:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:800:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 19 warnings, 0 section mismatches

Warnings:
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:795:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:800:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 19=
 warnings, 0 section mismatches

Warnings:
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:795:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:800:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 46 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.g2dvafkVN3:8132:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.g2dvafkVN3:8135:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.g2dvafkVN3:8136:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.g2dvafkVN3:8138:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.g2dvafkVN3:8139:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.g2dvafkVN3:8143:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.g2dvafkVN3:8144:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.g2dvafkVN3:8202:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.g2dvafkVN3:8223:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.g2dvafkVN3:8248:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.g2dvafkVN3:8252:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.g2dvafkVN3:8358:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.g2dvafkVN3:8369:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.g2dvafkVN3:8379:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.g2dvafkVN3:8386:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.g2dvafkVN3:8389:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.g2dvafkVN3:8390:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.g2dvafkVN3:8392:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.g2dvafkVN3:8393:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.g2dvafkVN3:8394:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.g2dvafkVN3:8396:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.g2dvafkVN3:8405:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.g2dvafkVN3:8411:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.g2dvafkVN3:8431:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.g2dvafkVN3:8435:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.g2dvafkVN3:8436:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.g2dvafkVN3:8452:warning: override: reassigning to symbol =
USER_NS
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:795:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:800:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 29 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.qrZ0sp9Yp0:1421:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.qrZ0sp9Yp0:1424:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.qrZ0sp9Yp0:1425:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.qrZ0sp9Yp0:1427:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.qrZ0sp9Yp0:1428:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.qrZ0sp9Yp0:1432:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.qrZ0sp9Yp0:1433:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.qrZ0sp9Yp0:1491:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.qrZ0sp9Yp0:1512:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.qrZ0sp9Yp0:1537:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.qrZ0sp9Yp0:1541:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.qrZ0sp9Yp0:1647:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.qrZ0sp9Yp0:1658:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.qrZ0sp9Yp0:1668:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.qrZ0sp9Yp0:1675:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.qrZ0sp9Yp0:1678:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.qrZ0sp9Yp0:1679:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.qrZ0sp9Yp0:1681:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.qrZ0sp9Yp0:1682:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.qrZ0sp9Yp0:1683:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.qrZ0sp9Yp0:1685:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.qrZ0sp9Yp0:1694:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.qrZ0sp9Yp0:1700:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.qrZ0sp9Yp0:1720:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.qrZ0sp9Yp0:1724:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.qrZ0sp9Yp0:1725:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.qrZ0sp9Yp0:1741:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    drivers/cpufreq/ti-cpufreq.c:79:20: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/hsi/clients/ssi_protocol.c:291:6: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/hsi/clients/ssi_protocol.c:466:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    include/linux/device.h:1502:2: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    drivers/usb/host/ohci-tmio.c:101:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/usb/host/ohci-tmio.c:103:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:795:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:800:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret' [-W=
unused-variable]
    drivers/video/fbdev/jz4740_fb.c:300:8: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, =
0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/usb/gadget/udc/s3c2410_udc.c:314:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/s3c2410_udc.c:418:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1170:warning: override: UNWINDER_GUESS changes choice state

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
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]

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
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 27 war=
nings, 0 section mismatches

Warnings:
    ./.tmp.config.bMHPKkQG1Q:4563:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.bMHPKkQG1Q:4566:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.bMHPKkQG1Q:4567:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.bMHPKkQG1Q:4569:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.bMHPKkQG1Q:4570:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.bMHPKkQG1Q:4574:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.bMHPKkQG1Q:4575:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.bMHPKkQG1Q:4633:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.bMHPKkQG1Q:4654:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.bMHPKkQG1Q:4679:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.bMHPKkQG1Q:4683:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.bMHPKkQG1Q:4789:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.bMHPKkQG1Q:4800:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.bMHPKkQG1Q:4810:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.bMHPKkQG1Q:4817:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.bMHPKkQG1Q:4820:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.bMHPKkQG1Q:4821:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.bMHPKkQG1Q:4823:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.bMHPKkQG1Q:4824:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.bMHPKkQG1Q:4825:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.bMHPKkQG1Q:4827:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.bMHPKkQG1Q:4836:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.bMHPKkQG1Q:4842:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.bMHPKkQG1Q:4862:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.bMHPKkQG1Q:4866:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.bMHPKkQG1Q:4867:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.bMHPKkQG1Q:4883:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
