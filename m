Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9C5FB639D
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2019 14:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731315AbfIRMzq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Sep 2019 08:55:46 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55586 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729333AbfIRMzq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Sep 2019 08:55:46 -0400
Received: by mail-wm1-f66.google.com with SMTP id a6so2509525wma.5
        for <linux-next@vger.kernel.org>; Wed, 18 Sep 2019 05:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=DHIcGHg8dqdhV9nAPnObWMqxXguE6+x2dmMhvqIB728=;
        b=2SJASgQ59kw+FbeDNYA2yjnJparhuECYmxlH7Oi9He2csbjpOfqp1AwDUfH9+kxxtO
         Z8q2pSdPjsABvHm+Lq3IpaCk/y/hzt55qHmRzqXvKsdknWrPC1OeIYuil1wnXa8EQYbv
         InbNNLGLhCHRfDCxUouC8RO3g3bt+93WoPPzQZLyoSTweuoWP/CM62jmibigWH2F9A9M
         xcjucnHaDD951vpQ3VigSz+23kTt+NWcZH8KIFy61BmXWJnB8BeQn06K9I72GIrc7Qxv
         meK+oE4zvo0VeW2aQKf9QoJCRZTsdBfh3SVsIGQnRrzncJlhkMxNWHdPL8dpqD8joD3f
         PTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=DHIcGHg8dqdhV9nAPnObWMqxXguE6+x2dmMhvqIB728=;
        b=E27KVy2uBzf7E9Je2MJOAndGbo+yjw3i6cS7U7l6ZivxXr2yGqS4qS3DzETkjI2bVP
         cMoQDeUfKskRdOHFPPwRwPDjGNl8rvZdZa0oXemJHtpzCWIkcV3QL3Dsglhh5mcKmscV
         7237Pq2vRlLkgsBOmGBhvRoNJ7UP5/wT0OmA8NWoTHa44cP/AuH54ugGdZ1N+Bnn8KHV
         P/sUTivRbOl7zcgaAl8MBxsnp0ZAJOHOK7M+3ovCzdBKh94hQPIiZ9aD5mOx0pqPnFPw
         idFuAtRX8vhzgY/paT+MWrdW/lGSmRJT9+569HsbY11gwYvXvzKvSMqgXYEIywKCzQ8d
         JbVw==
X-Gm-Message-State: APjAAAW937vLHNuoCs0nrAxGpv7YtxuSLUVzc71QgY+T/7oVfBHS5oIr
        TtU0i5Hn+X74WbvyGAExSmCvhZ1yl3UInw==
X-Google-Smtp-Source: APXvYqzloxle5jI0rresdHZsA0aqMbQO+yz86VHbhemGt/MJcZRurEuYIiAIPqxLaIJI7EgXrxuaow==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr2853760wmk.49.1568811338413;
        Wed, 18 Sep 2019 05:55:38 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o9sm9237329wrh.46.2019.09.18.05.55.37
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Sep 2019 05:55:37 -0700 (PDT)
Message-ID: <5d822949.1c69fb81.b90c2.b104@mx.google.com>
Date:   Wed, 18 Sep 2019 05:55:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-4249-g733f21b14e9c
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 214 builds: 0 failed, 214 passed,
 513 warnings (v5.3-4249-g733f21b14e9c)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 214 builds: 0 failed, 214 passed, 513 warnings (v=
5.3-4249-g733f21b14e9c)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-4249-g733f21b14e9c/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-4249-g733f21b14e9c
Git Commit: 733f21b14e9c3cdd1f834e2c44061c114c41c390
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
    allmodconfig (gcc-8): 8 warnings
    defconfig (gcc-8): 3 warnings
    defconfig (gcc-8): 3 warnings
    defconfig (gcc-8): 3 warnings
    defconfig (gcc-8): 30 warnings

arm:
    assabet_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (gcc-8): 1 warning
    collie_defconfig (gcc-8): 1 warning
    h3600_defconfig (gcc-8): 1 warning
    mini2440_defconfig (gcc-8): 2 warnings
    multi_v5_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 14 warnings
    multi_v7_defconfig (gcc-8): 14 warnings
    multi_v7_defconfig (gcc-8): 14 warnings
    multi_v7_defconfig (gcc-8): 14 warnings
    multi_v7_defconfig (gcc-8): 41 warnings
    neponset_defconfig (gcc-8): 1 warning
    omap2plus_defconfig (gcc-8): 2 warnings
    pxa_defconfig (gcc-8): 3 warnings
    qcom_defconfig (gcc-8): 2 warnings
    sama5_defconfig (gcc-8): 1 warning
    shannon_defconfig (gcc-8): 1 warning
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
    malta_qemu_32r6_defconfig (gcc-8): 2 warnings
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
    7    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
    7    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
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
    5    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_=
period' defined but not used [-Wunused-function]
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
    1    include/linux/device.h:1733:2: warning: this statement may fall th=
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
    1    .config:1170:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.xrmp680iiJ:3987:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xrmp680iiJ:3971:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.xrmp680iiJ:3970:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.xrmp680iiJ:3966:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.xrmp680iiJ:3946:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.xrmp680iiJ:3940:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.xrmp680iiJ:3931:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.xrmp680iiJ:3929:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.xrmp680iiJ:3928:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.xrmp680iiJ:3927:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.xrmp680iiJ:3925:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.xrmp680iiJ:3924:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.xrmp680iiJ:3921:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.xrmp680iiJ:3914:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.xrmp680iiJ:3904:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.xrmp680iiJ:3893:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xrmp680iiJ:3787:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.xrmp680iiJ:3783:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xrmp680iiJ:3758:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.xrmp680iiJ:3737:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.xrmp680iiJ:3679:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.xrmp680iiJ:3678:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.xrmp680iiJ:3674:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.xrmp680iiJ:3673:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.xrmp680iiJ:3671:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.xrmp680iiJ:3670:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.xrmp680iiJ:3667:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.mhpuajrNtX:3343:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.mhpuajrNtX:3327:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.mhpuajrNtX:3326:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.mhpuajrNtX:3322:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.mhpuajrNtX:3302:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.mhpuajrNtX:3296:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.mhpuajrNtX:3287:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.mhpuajrNtX:3285:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.mhpuajrNtX:3284:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.mhpuajrNtX:3283:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.mhpuajrNtX:3281:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.mhpuajrNtX:3280:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.mhpuajrNtX:3277:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.mhpuajrNtX:3270:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.mhpuajrNtX:3260:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.mhpuajrNtX:3249:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.mhpuajrNtX:3143:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.mhpuajrNtX:3139:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.mhpuajrNtX:3114:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.mhpuajrNtX:3093:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.mhpuajrNtX:3035:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.mhpuajrNtX:3034:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.mhpuajrNtX:3030:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.mhpuajrNtX:3029:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.mhpuajrNtX:3027:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.mhpuajrNtX:3026:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.mhpuajrNtX:3023:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.kHIikT7fNn:4883:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.kHIikT7fNn:4867:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.kHIikT7fNn:4866:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.kHIikT7fNn:4862:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.kHIikT7fNn:4842:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.kHIikT7fNn:4836:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.kHIikT7fNn:4827:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.kHIikT7fNn:4825:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.kHIikT7fNn:4824:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.kHIikT7fNn:4823:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.kHIikT7fNn:4821:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.kHIikT7fNn:4820:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.kHIikT7fNn:4817:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.kHIikT7fNn:4810:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.kHIikT7fNn:4800:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.kHIikT7fNn:4789:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.kHIikT7fNn:4683:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.kHIikT7fNn:4679:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.kHIikT7fNn:4654:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.kHIikT7fNn:4633:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.kHIikT7fNn:4575:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.kHIikT7fNn:4574:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.kHIikT7fNn:4570:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.kHIikT7fNn:4569:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.kHIikT7fNn:4567:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.kHIikT7fNn:4566:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.kHIikT7fNn:4563:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.aaU4MPRDrp:7890:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.aaU4MPRDrp:7874:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.aaU4MPRDrp:7873:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.aaU4MPRDrp:7869:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.aaU4MPRDrp:7849:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.aaU4MPRDrp:7843:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.aaU4MPRDrp:7834:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.aaU4MPRDrp:7832:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.aaU4MPRDrp:7831:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.aaU4MPRDrp:7830:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.aaU4MPRDrp:7828:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.aaU4MPRDrp:7827:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.aaU4MPRDrp:7824:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.aaU4MPRDrp:7817:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.aaU4MPRDrp:7807:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.aaU4MPRDrp:7796:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.aaU4MPRDrp:7690:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.aaU4MPRDrp:7686:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.aaU4MPRDrp:7661:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.aaU4MPRDrp:7640:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.aaU4MPRDrp:7582:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.aaU4MPRDrp:7581:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.aaU4MPRDrp:7577:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.aaU4MPRDrp:7576:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.aaU4MPRDrp:7574:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.aaU4MPRDrp:7573:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.aaU4MPRDrp:7570:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.O74DkAWupY:8458:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.O74DkAWupY:8442:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.O74DkAWupY:8441:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.O74DkAWupY:8437:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.O74DkAWupY:8417:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.O74DkAWupY:8411:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.O74DkAWupY:8402:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.O74DkAWupY:8400:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.O74DkAWupY:8399:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.O74DkAWupY:8398:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.O74DkAWupY:8396:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.O74DkAWupY:8395:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.O74DkAWupY:8392:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.O74DkAWupY:8385:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.O74DkAWupY:8375:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.O74DkAWupY:8364:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.O74DkAWupY:8258:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.O74DkAWupY:8254:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.O74DkAWupY:8229:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.O74DkAWupY:8208:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.O74DkAWupY:8150:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.O74DkAWupY:8149:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.O74DkAWupY:8145:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.O74DkAWupY:8144:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.O74DkAWupY:8142:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.O74DkAWupY:8141:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.O74DkAWupY:8138:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Nt2rwTWRbh:1741:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Nt2rwTWRbh:1725:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Nt2rwTWRbh:1724:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.Nt2rwTWRbh:1720:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.Nt2rwTWRbh:1700:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.Nt2rwTWRbh:1694:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.Nt2rwTWRbh:1685:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.Nt2rwTWRbh:1683:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Nt2rwTWRbh:1682:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.Nt2rwTWRbh:1681:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.Nt2rwTWRbh:1679:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.Nt2rwTWRbh:1678:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.Nt2rwTWRbh:1675:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Nt2rwTWRbh:1668:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Nt2rwTWRbh:1658:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.Nt2rwTWRbh:1647:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Nt2rwTWRbh:1541:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.Nt2rwTWRbh:1537:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Nt2rwTWRbh:1512:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.Nt2rwTWRbh:1491:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Nt2rwTWRbh:1433:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.Nt2rwTWRbh:1432:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.Nt2rwTWRbh:1428:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.Nt2rwTWRbh:1427:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.Nt2rwTWRbh:1425:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.Nt2rwTWRbh:1424:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.Nt2rwTWRbh:1421:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.MehhGzqR9f:4822:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.MehhGzqR9f:4806:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.MehhGzqR9f:4805:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.MehhGzqR9f:4801:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.MehhGzqR9f:4781:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.MehhGzqR9f:4775:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.MehhGzqR9f:4766:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.MehhGzqR9f:4764:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.MehhGzqR9f:4763:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.MehhGzqR9f:4762:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.MehhGzqR9f:4760:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.MehhGzqR9f:4759:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.MehhGzqR9f:4756:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.MehhGzqR9f:4749:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.MehhGzqR9f:4739:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.MehhGzqR9f:4728:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.MehhGzqR9f:4622:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.MehhGzqR9f:4618:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.MehhGzqR9f:4593:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.MehhGzqR9f:4572:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.MehhGzqR9f:4514:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.MehhGzqR9f:4513:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.MehhGzqR9f:4509:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.MehhGzqR9f:4508:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.MehhGzqR9f:4506:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.MehhGzqR9f:4505:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.MehhGzqR9f:4502:warning: override: reassigning to sy=
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
    ./.tmp.config.xrmp680iiJ:3667:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.xrmp680iiJ:3670:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.xrmp680iiJ:3671:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.xrmp680iiJ:3673:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.xrmp680iiJ:3674:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.xrmp680iiJ:3678:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.xrmp680iiJ:3679:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.xrmp680iiJ:3737:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.xrmp680iiJ:3758:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.xrmp680iiJ:3783:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.xrmp680iiJ:3787:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.xrmp680iiJ:3893:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.xrmp680iiJ:3904:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.xrmp680iiJ:3914:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.xrmp680iiJ:3921:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.xrmp680iiJ:3924:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.xrmp680iiJ:3925:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.xrmp680iiJ:3927:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.xrmp680iiJ:3928:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.xrmp680iiJ:3929:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.xrmp680iiJ:3931:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.xrmp680iiJ:3940:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.xrmp680iiJ:3946:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.xrmp680iiJ:3966:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.xrmp680iiJ:3970:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.xrmp680iiJ:3971:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.xrmp680iiJ:3987:warning: override: reassigning to symbol =
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
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section=
 mismatches

Warnings:
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
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
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_perio=
d' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
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
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_perio=
d' defined but not used [-Wunused-function]

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
    ./.tmp.config.mhpuajrNtX:3023:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.mhpuajrNtX:3026:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.mhpuajrNtX:3027:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.mhpuajrNtX:3029:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.mhpuajrNtX:3030:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.mhpuajrNtX:3034:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.mhpuajrNtX:3035:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.mhpuajrNtX:3093:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.mhpuajrNtX:3114:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.mhpuajrNtX:3139:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.mhpuajrNtX:3143:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.mhpuajrNtX:3249:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.mhpuajrNtX:3260:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.mhpuajrNtX:3270:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.mhpuajrNtX:3277:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.mhpuajrNtX:3280:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.mhpuajrNtX:3281:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.mhpuajrNtX:3283:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.mhpuajrNtX:3284:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.mhpuajrNtX:3285:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.mhpuajrNtX:3287:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.mhpuajrNtX:3296:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.mhpuajrNtX:3302:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.mhpuajrNtX:3322:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.mhpuajrNtX:3326:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.mhpuajrNtX:3327:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.mhpuajrNtX:3343:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 30 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.aaU4MPRDrp:7570:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.aaU4MPRDrp:7573:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.aaU4MPRDrp:7574:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.aaU4MPRDrp:7576:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.aaU4MPRDrp:7577:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.aaU4MPRDrp:7581:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.aaU4MPRDrp:7582:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.aaU4MPRDrp:7640:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.aaU4MPRDrp:7661:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.aaU4MPRDrp:7686:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.aaU4MPRDrp:7690:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.aaU4MPRDrp:7796:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.aaU4MPRDrp:7807:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.aaU4MPRDrp:7817:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.aaU4MPRDrp:7824:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.aaU4MPRDrp:7827:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.aaU4MPRDrp:7828:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.aaU4MPRDrp:7830:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.aaU4MPRDrp:7831:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.aaU4MPRDrp:7832:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.aaU4MPRDrp:7834:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.aaU4MPRDrp:7843:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.aaU4MPRDrp:7849:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.aaU4MPRDrp:7869:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.aaU4MPRDrp:7873:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.aaU4MPRDrp:7874:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.aaU4MPRDrp:7890:warning: override: reassigning to symbol =
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
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_perio=
d' defined but not used [-Wunused-function]

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
    ./.tmp.config.MehhGzqR9f:4502:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.MehhGzqR9f:4505:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.MehhGzqR9f:4506:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.MehhGzqR9f:4508:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.MehhGzqR9f:4509:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.MehhGzqR9f:4513:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.MehhGzqR9f:4514:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.MehhGzqR9f:4572:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.MehhGzqR9f:4593:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.MehhGzqR9f:4618:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.MehhGzqR9f:4622:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.MehhGzqR9f:4728:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.MehhGzqR9f:4739:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.MehhGzqR9f:4749:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.MehhGzqR9f:4756:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.MehhGzqR9f:4759:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.MehhGzqR9f:4760:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.MehhGzqR9f:4762:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.MehhGzqR9f:4763:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.MehhGzqR9f:4764:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.MehhGzqR9f:4766:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.MehhGzqR9f:4775:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.MehhGzqR9f:4781:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.MehhGzqR9f:4801:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.MehhGzqR9f:4805:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.MehhGzqR9f:4806:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.MehhGzqR9f:4822:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
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
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 14 warnings, 0 se=
ction mismatches

Warnings:
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
 errors, 14 warnings, 0 section mismatches

Warnings:
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
=94 PASS, 0 errors, 14 warnings, 0 section mismatches

Warnings:
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
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 14=
 warnings, 0 section mismatches

Warnings:
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
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 41 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.O74DkAWupY:8138:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.O74DkAWupY:8141:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.O74DkAWupY:8142:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.O74DkAWupY:8144:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.O74DkAWupY:8145:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.O74DkAWupY:8149:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.O74DkAWupY:8150:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.O74DkAWupY:8208:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.O74DkAWupY:8229:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.O74DkAWupY:8254:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.O74DkAWupY:8258:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.O74DkAWupY:8364:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.O74DkAWupY:8375:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.O74DkAWupY:8385:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.O74DkAWupY:8392:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.O74DkAWupY:8395:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.O74DkAWupY:8396:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.O74DkAWupY:8398:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.O74DkAWupY:8399:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.O74DkAWupY:8400:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.O74DkAWupY:8402:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.O74DkAWupY:8411:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.O74DkAWupY:8417:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.O74DkAWupY:8437:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.O74DkAWupY:8441:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.O74DkAWupY:8442:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.O74DkAWupY:8458:warning: override: reassigning to symbol =
USER_NS
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
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_perio=
d' defined but not used [-Wunused-function]

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
    ./.tmp.config.Nt2rwTWRbh:1421:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Nt2rwTWRbh:1424:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.Nt2rwTWRbh:1425:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.Nt2rwTWRbh:1427:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.Nt2rwTWRbh:1428:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.Nt2rwTWRbh:1432:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.Nt2rwTWRbh:1433:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.Nt2rwTWRbh:1491:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Nt2rwTWRbh:1512:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.Nt2rwTWRbh:1537:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Nt2rwTWRbh:1541:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.Nt2rwTWRbh:1647:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Nt2rwTWRbh:1658:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.Nt2rwTWRbh:1668:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Nt2rwTWRbh:1675:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Nt2rwTWRbh:1678:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.Nt2rwTWRbh:1679:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.Nt2rwTWRbh:1681:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.Nt2rwTWRbh:1682:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.Nt2rwTWRbh:1683:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Nt2rwTWRbh:1685:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.Nt2rwTWRbh:1694:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.Nt2rwTWRbh:1700:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.Nt2rwTWRbh:1720:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.Nt2rwTWRbh:1724:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.Nt2rwTWRbh:1725:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Nt2rwTWRbh:1741:warning: override: reassigning to symbol =
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
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
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
    include/linux/device.h:1733:2: warning: this statement may fall through=
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
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
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
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_perio=
d' defined but not used [-Wunused-function]

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
    .config:1170:warning: override: UNWINDER_GUESS changes choice state

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
    ./.tmp.config.kHIikT7fNn:4563:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.kHIikT7fNn:4566:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.kHIikT7fNn:4567:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.kHIikT7fNn:4569:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.kHIikT7fNn:4570:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.kHIikT7fNn:4574:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.kHIikT7fNn:4575:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.kHIikT7fNn:4633:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.kHIikT7fNn:4654:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.kHIikT7fNn:4679:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.kHIikT7fNn:4683:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.kHIikT7fNn:4789:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.kHIikT7fNn:4800:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.kHIikT7fNn:4810:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.kHIikT7fNn:4817:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.kHIikT7fNn:4820:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.kHIikT7fNn:4821:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.kHIikT7fNn:4823:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.kHIikT7fNn:4824:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.kHIikT7fNn:4825:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.kHIikT7fNn:4827:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.kHIikT7fNn:4836:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.kHIikT7fNn:4842:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.kHIikT7fNn:4862:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.kHIikT7fNn:4866:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.kHIikT7fNn:4867:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.kHIikT7fNn:4883:warning: override: reassigning to symbol =
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
