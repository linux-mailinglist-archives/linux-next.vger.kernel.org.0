Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4169BB36B5
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 10:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731430AbfIPIzc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 04:55:32 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55036 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731413AbfIPIzc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 04:55:32 -0400
Received: by mail-wm1-f66.google.com with SMTP id p7so9138827wmp.4
        for <linux-next@vger.kernel.org>; Mon, 16 Sep 2019 01:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=fGV+cfWDVr0gH5DTCqkFQr9s1bDIjK8mBfd89b3u1Nc=;
        b=htezao6v1Cq/aEr4ouu3sXPdH0GkJKeVX6nlhv202pnAbqxC0g+Iakr1GOdUQYGe6T
         NRF3hyYoFqeDJBCdD1VnUMzzj66DKhRZxYPTngHs/eTEXv1xIy3HKaeXPobtdlOXtUxs
         5CfD07awX1suZ0pwOqs0x3o64tnV+N+o4Al/Fn9//XNGQW8vuSGztO5sN3+WZ67e+qKh
         KKNnQO+8wkvSFYK8dF7mJrBunAU6lrcm+xD4l0t4y2Tphl2fyZ/eMNf33TKBkBe58Yvq
         lhF5lYIXpz+fse/LonSPu/ztlFIvyphK0Sj1OChj8O/PHpEGgjJBmB334kOXb675u0aD
         NN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=fGV+cfWDVr0gH5DTCqkFQr9s1bDIjK8mBfd89b3u1Nc=;
        b=AyqjctSCEtbGk3aWlHvtTJ9t4KwMDwGWncrjM7nD8FHY+WH9oX256izpLYEkhlEUwh
         cE5q2sQUS3G80SKKnzEhzhLfw1lRAWc/KBYJprVrOylEWvsC2TDrwXvGN2wR7VN0new2
         cOmljmZ8orHXSoL8HFyLmE845t7/rY8gzcSG0UGtgMTtO7z8ZcAw7sTlviAhZ3WeC8WZ
         hnqxT2XTNWY5cXHaTYv9BExGcgmcgdnk8k4f/Ej07ffPBn/IFa8qjz5lB/WHOmzdnEjX
         25a4s6ICloMopPhXBWyBsDjOjYxcXmNQBbfW8Cjk3vSA0P9Z8MAdR2gUOQmVRZsIoMua
         5KDw==
X-Gm-Message-State: APjAAAWWSuMXwJ2FHGaMSBN4Uc1zz7xhiHRzamfDS+tIXt6RKBbv5f/B
        FHArC5vt0ORCdSOCjM79wJmYLia6Zko=
X-Google-Smtp-Source: APXvYqyRkBud1/j2xHrG8pKDnBggv3Q6DMr2toTgIP9xG2Oz3IM2Kiqc4/S9RSRzeYdoQCbBg+1WCg==
X-Received: by 2002:a1c:bc46:: with SMTP id m67mr13108515wmf.126.1568624119846;
        Mon, 16 Sep 2019 01:55:19 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b184sm15897773wmg.47.2019.09.16.01.55.18
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Sep 2019 01:55:19 -0700 (PDT)
Message-ID: <5d7f4df7.1c69fb81.99930.4c4b@mx.google.com>
Date:   Mon, 16 Sep 2019 01:55:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-586-g78e9b0f1c69e
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 222 builds: 0 failed, 222 passed,
 549 warnings (v5.3-586-g78e9b0f1c69e)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 222 builds: 0 failed, 222 passed, 549 warnings (v=
5.3-586-g78e9b0f1c69e)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-586-g78e9b0f1c69e/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-586-g78e9b0f1c69e
Git Commit: 78e9b0f1c69e1bb067e2f5495bcc9aae3e472034
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
    11   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this sta=
tement may fall through [-Wimplicit-fallthrough=3D]
    11   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this sta=
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
    1    include/linux/device.h:1499:2: warning: this statement may fall th=
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
    1    .config:1168:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.s6aFlpuDFH:3332:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.s6aFlpuDFH:3316:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.s6aFlpuDFH:3315:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.s6aFlpuDFH:3311:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.s6aFlpuDFH:3291:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.s6aFlpuDFH:3285:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.s6aFlpuDFH:3276:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.s6aFlpuDFH:3274:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.s6aFlpuDFH:3273:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.s6aFlpuDFH:3272:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.s6aFlpuDFH:3270:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.s6aFlpuDFH:3269:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.s6aFlpuDFH:3266:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.s6aFlpuDFH:3259:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.s6aFlpuDFH:3249:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.s6aFlpuDFH:3238:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.s6aFlpuDFH:3132:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.s6aFlpuDFH:3128:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.s6aFlpuDFH:3103:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.s6aFlpuDFH:3082:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.s6aFlpuDFH:3024:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.s6aFlpuDFH:3023:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.s6aFlpuDFH:3019:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.s6aFlpuDFH:3018:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.s6aFlpuDFH:3016:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.s6aFlpuDFH:3015:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.s6aFlpuDFH:3012:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.rb4bmoZC6i:3986:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.rb4bmoZC6i:3970:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.rb4bmoZC6i:3969:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.rb4bmoZC6i:3965:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.rb4bmoZC6i:3945:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.rb4bmoZC6i:3939:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.rb4bmoZC6i:3930:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.rb4bmoZC6i:3928:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.rb4bmoZC6i:3927:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.rb4bmoZC6i:3926:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.rb4bmoZC6i:3924:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.rb4bmoZC6i:3923:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.rb4bmoZC6i:3920:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.rb4bmoZC6i:3913:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.rb4bmoZC6i:3903:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.rb4bmoZC6i:3892:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.rb4bmoZC6i:3786:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.rb4bmoZC6i:3782:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.rb4bmoZC6i:3757:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.rb4bmoZC6i:3736:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.rb4bmoZC6i:3678:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.rb4bmoZC6i:3677:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.rb4bmoZC6i:3673:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.rb4bmoZC6i:3672:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.rb4bmoZC6i:3670:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.rb4bmoZC6i:3669:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.rb4bmoZC6i:3666:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.o1QaoM2oJB:1742:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.o1QaoM2oJB:1726:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.o1QaoM2oJB:1725:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.o1QaoM2oJB:1721:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.o1QaoM2oJB:1701:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.o1QaoM2oJB:1695:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.o1QaoM2oJB:1686:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.o1QaoM2oJB:1684:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.o1QaoM2oJB:1683:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.o1QaoM2oJB:1682:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.o1QaoM2oJB:1680:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.o1QaoM2oJB:1679:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.o1QaoM2oJB:1676:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.o1QaoM2oJB:1669:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.o1QaoM2oJB:1659:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.o1QaoM2oJB:1648:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.o1QaoM2oJB:1542:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.o1QaoM2oJB:1538:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.o1QaoM2oJB:1513:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.o1QaoM2oJB:1492:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.o1QaoM2oJB:1434:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.o1QaoM2oJB:1433:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.o1QaoM2oJB:1429:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.o1QaoM2oJB:1428:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.o1QaoM2oJB:1426:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.o1QaoM2oJB:1425:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.o1QaoM2oJB:1422:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.mOZdTJyn2l:4821:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.mOZdTJyn2l:4805:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.mOZdTJyn2l:4804:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.mOZdTJyn2l:4800:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.mOZdTJyn2l:4780:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.mOZdTJyn2l:4774:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.mOZdTJyn2l:4765:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.mOZdTJyn2l:4763:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.mOZdTJyn2l:4762:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.mOZdTJyn2l:4761:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.mOZdTJyn2l:4759:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.mOZdTJyn2l:4758:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.mOZdTJyn2l:4755:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.mOZdTJyn2l:4748:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.mOZdTJyn2l:4738:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.mOZdTJyn2l:4727:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.mOZdTJyn2l:4621:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.mOZdTJyn2l:4617:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.mOZdTJyn2l:4592:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.mOZdTJyn2l:4571:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.mOZdTJyn2l:4513:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.mOZdTJyn2l:4512:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.mOZdTJyn2l:4508:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.mOZdTJyn2l:4507:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.mOZdTJyn2l:4505:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.mOZdTJyn2l:4504:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.mOZdTJyn2l:4501:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.U6ajRyDR9P:4887:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.U6ajRyDR9P:4871:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.U6ajRyDR9P:4870:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.U6ajRyDR9P:4866:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.U6ajRyDR9P:4846:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.U6ajRyDR9P:4840:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.U6ajRyDR9P:4831:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.U6ajRyDR9P:4829:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.U6ajRyDR9P:4828:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.U6ajRyDR9P:4827:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.U6ajRyDR9P:4825:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.U6ajRyDR9P:4824:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.U6ajRyDR9P:4821:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.U6ajRyDR9P:4814:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.U6ajRyDR9P:4804:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.U6ajRyDR9P:4793:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.U6ajRyDR9P:4687:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.U6ajRyDR9P:4683:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.U6ajRyDR9P:4658:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.U6ajRyDR9P:4637:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.U6ajRyDR9P:4579:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.U6ajRyDR9P:4578:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.U6ajRyDR9P:4574:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.U6ajRyDR9P:4573:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.U6ajRyDR9P:4571:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.U6ajRyDR9P:4570:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.U6ajRyDR9P:4567:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.HxjgDfbLkD:7847:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.HxjgDfbLkD:7831:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.HxjgDfbLkD:7830:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.HxjgDfbLkD:7826:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.HxjgDfbLkD:7806:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.HxjgDfbLkD:7800:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.HxjgDfbLkD:7791:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.HxjgDfbLkD:7789:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.HxjgDfbLkD:7788:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.HxjgDfbLkD:7787:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.HxjgDfbLkD:7785:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.HxjgDfbLkD:7784:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.HxjgDfbLkD:7781:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.HxjgDfbLkD:7774:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.HxjgDfbLkD:7764:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.HxjgDfbLkD:7753:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.HxjgDfbLkD:7647:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.HxjgDfbLkD:7643:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.HxjgDfbLkD:7618:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.HxjgDfbLkD:7597:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.HxjgDfbLkD:7539:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.HxjgDfbLkD:7538:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.HxjgDfbLkD:7534:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.HxjgDfbLkD:7533:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.HxjgDfbLkD:7531:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.HxjgDfbLkD:7530:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.HxjgDfbLkD:7527:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.EmRyFbqHUM:8431:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.EmRyFbqHUM:8415:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.EmRyFbqHUM:8414:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.EmRyFbqHUM:8410:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.EmRyFbqHUM:8390:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.EmRyFbqHUM:8384:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.EmRyFbqHUM:8375:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.EmRyFbqHUM:8373:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.EmRyFbqHUM:8372:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.EmRyFbqHUM:8371:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.EmRyFbqHUM:8369:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.EmRyFbqHUM:8368:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.EmRyFbqHUM:8365:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.EmRyFbqHUM:8358:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.EmRyFbqHUM:8348:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.EmRyFbqHUM:8337:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.EmRyFbqHUM:8231:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.EmRyFbqHUM:8227:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.EmRyFbqHUM:8202:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.EmRyFbqHUM:8181:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.EmRyFbqHUM:8123:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.EmRyFbqHUM:8122:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.EmRyFbqHUM:8118:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.EmRyFbqHUM:8117:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.EmRyFbqHUM:8115:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.EmRyFbqHUM:8114:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.EmRyFbqHUM:8111:warning: override: reassigning to sy=
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
    ./.tmp.config.rb4bmoZC6i:3666:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.rb4bmoZC6i:3669:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.rb4bmoZC6i:3670:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.rb4bmoZC6i:3672:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.rb4bmoZC6i:3673:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.rb4bmoZC6i:3677:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.rb4bmoZC6i:3678:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.rb4bmoZC6i:3736:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.rb4bmoZC6i:3757:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.rb4bmoZC6i:3782:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.rb4bmoZC6i:3786:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.rb4bmoZC6i:3892:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.rb4bmoZC6i:3903:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.rb4bmoZC6i:3913:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.rb4bmoZC6i:3920:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.rb4bmoZC6i:3923:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.rb4bmoZC6i:3924:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.rb4bmoZC6i:3926:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.rb4bmoZC6i:3927:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.rb4bmoZC6i:3928:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.rb4bmoZC6i:3930:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.rb4bmoZC6i:3939:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.rb4bmoZC6i:3945:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.rb4bmoZC6i:3965:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.rb4bmoZC6i:3969:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.rb4bmoZC6i:3970:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.rb4bmoZC6i:3986:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
acs5k_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
acs5k_tiny_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
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
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 3 warnings, 0 section mismatches

Warnings:
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 3 warnings, 0 section mismatches

Warnings:
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.s6aFlpuDFH:3012:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.s6aFlpuDFH:3015:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.s6aFlpuDFH:3016:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.s6aFlpuDFH:3018:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.s6aFlpuDFH:3019:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.s6aFlpuDFH:3023:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.s6aFlpuDFH:3024:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.s6aFlpuDFH:3082:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.s6aFlpuDFH:3103:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.s6aFlpuDFH:3128:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.s6aFlpuDFH:3132:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.s6aFlpuDFH:3238:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.s6aFlpuDFH:3249:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.s6aFlpuDFH:3259:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.s6aFlpuDFH:3266:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.s6aFlpuDFH:3269:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.s6aFlpuDFH:3270:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.s6aFlpuDFH:3272:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.s6aFlpuDFH:3273:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.s6aFlpuDFH:3274:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.s6aFlpuDFH:3276:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.s6aFlpuDFH:3285:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.s6aFlpuDFH:3291:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.s6aFlpuDFH:3311:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.s6aFlpuDFH:3315:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.s6aFlpuDFH:3316:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.s6aFlpuDFH:3332:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 30 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.HxjgDfbLkD:7527:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.HxjgDfbLkD:7530:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.HxjgDfbLkD:7531:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.HxjgDfbLkD:7533:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.HxjgDfbLkD:7534:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.HxjgDfbLkD:7538:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.HxjgDfbLkD:7539:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.HxjgDfbLkD:7597:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.HxjgDfbLkD:7618:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.HxjgDfbLkD:7643:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.HxjgDfbLkD:7647:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.HxjgDfbLkD:7753:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.HxjgDfbLkD:7764:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.HxjgDfbLkD:7774:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.HxjgDfbLkD:7781:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.HxjgDfbLkD:7784:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.HxjgDfbLkD:7785:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.HxjgDfbLkD:7787:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.HxjgDfbLkD:7788:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.HxjgDfbLkD:7789:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.HxjgDfbLkD:7791:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.HxjgDfbLkD:7800:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.HxjgDfbLkD:7806:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.HxjgDfbLkD:7826:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.HxjgDfbLkD:7830:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.HxjgDfbLkD:7831:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.HxjgDfbLkD:7847:warning: override: reassigning to symbol =
USER_NS
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
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
    ./.tmp.config.mOZdTJyn2l:4501:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.mOZdTJyn2l:4504:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.mOZdTJyn2l:4505:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.mOZdTJyn2l:4507:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.mOZdTJyn2l:4508:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.mOZdTJyn2l:4512:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.mOZdTJyn2l:4513:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.mOZdTJyn2l:4571:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.mOZdTJyn2l:4592:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.mOZdTJyn2l:4617:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.mOZdTJyn2l:4621:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.mOZdTJyn2l:4727:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.mOZdTJyn2l:4738:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.mOZdTJyn2l:4748:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.mOZdTJyn2l:4755:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.mOZdTJyn2l:4758:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.mOZdTJyn2l:4759:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.mOZdTJyn2l:4761:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.mOZdTJyn2l:4762:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.mOZdTJyn2l:4763:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.mOZdTJyn2l:4765:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.mOZdTJyn2l:4774:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.mOZdTJyn2l:4780:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.mOZdTJyn2l:4800:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.mOZdTJyn2l:4804:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.mOZdTJyn2l:4805:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.mOZdTJyn2l:4821:warning: override: reassigning to symbol =
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
iop13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
iop33x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
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
ks8695_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
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
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
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
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
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
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
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
    ./.tmp.config.EmRyFbqHUM:8111:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.EmRyFbqHUM:8114:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.EmRyFbqHUM:8115:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.EmRyFbqHUM:8117:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.EmRyFbqHUM:8118:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.EmRyFbqHUM:8122:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.EmRyFbqHUM:8123:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.EmRyFbqHUM:8181:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.EmRyFbqHUM:8202:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.EmRyFbqHUM:8227:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.EmRyFbqHUM:8231:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.EmRyFbqHUM:8337:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.EmRyFbqHUM:8348:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.EmRyFbqHUM:8358:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.EmRyFbqHUM:8365:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.EmRyFbqHUM:8368:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.EmRyFbqHUM:8369:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.EmRyFbqHUM:8371:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.EmRyFbqHUM:8372:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.EmRyFbqHUM:8373:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.EmRyFbqHUM:8375:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.EmRyFbqHUM:8384:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.EmRyFbqHUM:8390:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.EmRyFbqHUM:8410:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.EmRyFbqHUM:8414:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.EmRyFbqHUM:8415:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.EmRyFbqHUM:8431:warning: override: reassigning to symbol =
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
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
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
    ./.tmp.config.o1QaoM2oJB:1422:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.o1QaoM2oJB:1425:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.o1QaoM2oJB:1426:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.o1QaoM2oJB:1428:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.o1QaoM2oJB:1429:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.o1QaoM2oJB:1433:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.o1QaoM2oJB:1434:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.o1QaoM2oJB:1492:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.o1QaoM2oJB:1513:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.o1QaoM2oJB:1538:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.o1QaoM2oJB:1542:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.o1QaoM2oJB:1648:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.o1QaoM2oJB:1659:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.o1QaoM2oJB:1669:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.o1QaoM2oJB:1676:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.o1QaoM2oJB:1679:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.o1QaoM2oJB:1680:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.o1QaoM2oJB:1682:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.o1QaoM2oJB:1683:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.o1QaoM2oJB:1684:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.o1QaoM2oJB:1686:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.o1QaoM2oJB:1695:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.o1QaoM2oJB:1701:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.o1QaoM2oJB:1721:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.o1QaoM2oJB:1725:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.o1QaoM2oJB:1726:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.o1QaoM2oJB:1742:warning: override: reassigning to symbol =
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
nuc910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
nuc950_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
nuc960_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
    include/linux/device.h:1499:2: warning: this statement may fall through=
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
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/video/fbdev/jz4740_fb.c:300:8: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret' [-W=
unused-variable]
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
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1168:warning: override: UNWINDER_GUESS changes choice state

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
    ./.tmp.config.U6ajRyDR9P:4567:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.U6ajRyDR9P:4570:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.U6ajRyDR9P:4571:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.U6ajRyDR9P:4573:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.U6ajRyDR9P:4574:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.U6ajRyDR9P:4578:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.U6ajRyDR9P:4579:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.U6ajRyDR9P:4637:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.U6ajRyDR9P:4658:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.U6ajRyDR9P:4683:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.U6ajRyDR9P:4687:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.U6ajRyDR9P:4793:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.U6ajRyDR9P:4804:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.U6ajRyDR9P:4814:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.U6ajRyDR9P:4821:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.U6ajRyDR9P:4824:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.U6ajRyDR9P:4825:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.U6ajRyDR9P:4827:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.U6ajRyDR9P:4828:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.U6ajRyDR9P:4829:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.U6ajRyDR9P:4831:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.U6ajRyDR9P:4840:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.U6ajRyDR9P:4846:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.U6ajRyDR9P:4866:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.U6ajRyDR9P:4870:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.U6ajRyDR9P:4871:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.U6ajRyDR9P:4887:warning: override: reassigning to symbol =
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
