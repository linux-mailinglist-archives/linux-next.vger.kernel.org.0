Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E673B7479
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 09:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730336AbfISH4Y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 03:56:24 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:37704 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729833AbfISH4Y (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Sep 2019 03:56:24 -0400
Received: by mail-wr1-f52.google.com with SMTP id i1so1998856wro.4
        for <linux-next@vger.kernel.org>; Thu, 19 Sep 2019 00:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ykrgFBMh4/KTPyi4LlfmayrgOeKmWYKU8oavWUDK9C8=;
        b=vaTmjwT5qfr+bIZ6R3GGq5IaeuiffORHVJ5oPwZaXkjYveW+doazrJxXNo08LxJwo2
         qF2jh+hoePU4QgV6pSt3znbJEcY4u6mlNzoq85fW9x6XbnWb8ZYpSAgn4uV4Fvv3XNKP
         wq3zQoflBnJN5gG19xx2fKxGiMVmAbJIf6Gf1FP2+nFQXwQ0XfvJCRbgwel4/VvvFIvb
         Qy1WMqYkINlXq04DrlIDPTH6Lo+YUDtR8vEUmm4bbFtRsNAAfDJci1XS/qu4bXsrCuKY
         +HV3hKhz40fMPtxKwwTM7ki+sEyqKpDXjYzZIn1nfYhb2jK4BOhEE+3nxhbDAcsUZnkT
         Z09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ykrgFBMh4/KTPyi4LlfmayrgOeKmWYKU8oavWUDK9C8=;
        b=ciJiM9QDyZg0Ae92fsKSP1DorwUPlxt4SfV4hdNcyqcF3YfDM8Ol4ZXrtw1eh+xwjk
         kG8IuMVaOMxlN/Qc1oJkN6jVRyNIYHV1I5DA1tri9a5/MxPOMda72U40L6XYrGKFmYA4
         5OvIaae6E2AayjlCVpfYO8R0e9mGxvDNnWyZvJfQVc8QydeEyzYbA4Ink+ewCAY65p6O
         1XrNaqfFAS3JRm4+ErZQVI5QUUicZ5yXfLqu9WGVqH69wOjZdEPfDbfkvZPlTL7pjvRf
         m9R8Fn7iEhLEOYcu9iJ37C3YvFsCt5RTnwuRKW/jHsWX4Pw1ZznUvkVHEQwddpKpAl21
         harg==
X-Gm-Message-State: APjAAAVMeKjS6jP3qHj1CIjJamDwCdmsYc5SFDxkZkACkoH5dizgZq2q
        isuiqKD46dW6bLa3NCx1W0l/COsBXMtVAQ==
X-Google-Smtp-Source: APXvYqx1W2SZia7ZHlgVmfDHTXjCsT2M8HLdN+0xQQJQM2BPL0XvsxpCrDWvwFHo6JrPfhehdyIH4A==
X-Received: by 2002:adf:e9ce:: with SMTP id l14mr5441665wrn.264.1568879772501;
        Thu, 19 Sep 2019 00:56:12 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v8sm13454808wra.79.2019.09.19.00.56.11
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Sep 2019 00:56:11 -0700 (PDT)
Message-ID: <5d83349b.1c69fb81.132c9.d269@mx.google.com>
Date:   Thu, 19 Sep 2019 00:56:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-7731-gcd0a293e6cef
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 214 builds: 1 failed, 213 passed, 3 errors,
 466 warnings (v5.3-7731-gcd0a293e6cef)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 214 builds: 1 failed, 213 passed, 3 errors, 466 w=
arnings (v5.3-7731-gcd0a293e6cef)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-7731-gcd0a293e6cef/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-7731-gcd0a293e6cef
Git Commit: cd0a293e6cef4a0111ed8d5c7f9350aa1c9096c1
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failure Detected:

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
    collie_defconfig (gcc-8): 1 warning
    h3600_defconfig (gcc-8): 1 warning
    mini2440_defconfig (gcc-8): 1 error, 1 warning
    multi_v7_defconfig (gcc-8): 8 warnings
    multi_v7_defconfig (gcc-8): 8 warnings
    multi_v7_defconfig (gcc-8): 8 warnings
    multi_v7_defconfig (gcc-8): 8 warnings
    multi_v7_defconfig (gcc-8): 35 warnings
    neponset_defconfig (gcc-8): 1 warning
    omap2plus_defconfig (gcc-8): 2 warnings
    qcom_defconfig (gcc-8): 2 warnings
    shannon_defconfig (gcc-8): 1 warning
    shmobile_defconfig (gcc-8): 2 warnings

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
    cavium_octeon_defconfig (gcc-8): 2 errors, 4 warnings
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

Errors summary:

    1    arch/mips/include/asm/octeon/cvmx-ipd.h:331:36: error: 'CVMX_PIP_S=
FT_RST' undeclared (first use in this function); did you mean 'CVMX_CIU_SOF=
T_RST'?
    1    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: error: storage siz=
e of 'pip_sft_rst' isn't known
    1    "error: actual length %d less than expected %ld\n",

Warnings summary:

    193  <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
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
    5    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_=
period' defined but not used [-Wunused-function]
    5    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    5    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    5    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    2    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret=
' [-Wunused-variable]
    2    drivers/scsi/wd33c93.c:1856:11: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    drivers/video/fbdev/jz4740_fb.c:300:8: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    1    drivers/soundwire/slave.c:16:12: warning: 'sdw_slave_add' defined =
but not used [-Wunused-function]
    1    drivers/net/wireless/zydas/zd1211rw/zd_def.h:18:25: warning: forma=
t '%ld' expects argument of type 'long int', but argument 6 has type 'size_=
t' {aka 'unsigned int'} [-Wformat=3D]
    1    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mism=
atch in conditional expression
    1    drivers/hsi/clients/ssi_protocol.c:467:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/hsi/clients/ssi_protocol.c:292:6: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/gpu/drm/arm/malidp_hw.c:387:8: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    1    drivers/gpu/drm/arm/malidp_hw.c:1311:4: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    1    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: warning: unused va=
riable 'pip_sft_rst' [-Wunused-variable]
    1    .config:1170:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.vFIzwprF92:4889:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vFIzwprF92:4873:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.vFIzwprF92:4872:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.vFIzwprF92:4868:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.vFIzwprF92:4848:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.vFIzwprF92:4842:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.vFIzwprF92:4833:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.vFIzwprF92:4831:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.vFIzwprF92:4830:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.vFIzwprF92:4829:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.vFIzwprF92:4827:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.vFIzwprF92:4826:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.vFIzwprF92:4823:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.vFIzwprF92:4816:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.vFIzwprF92:4806:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.vFIzwprF92:4795:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vFIzwprF92:4689:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.vFIzwprF92:4685:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vFIzwprF92:4660:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.vFIzwprF92:4639:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.vFIzwprF92:4581:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.vFIzwprF92:4580:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.vFIzwprF92:4576:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.vFIzwprF92:4575:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.vFIzwprF92:4573:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.vFIzwprF92:4572:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.vFIzwprF92:4569:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.oZnEtzmOAI:4827:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.oZnEtzmOAI:4811:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.oZnEtzmOAI:4810:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.oZnEtzmOAI:4806:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.oZnEtzmOAI:4786:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.oZnEtzmOAI:4780:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.oZnEtzmOAI:4771:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.oZnEtzmOAI:4769:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.oZnEtzmOAI:4768:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.oZnEtzmOAI:4767:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.oZnEtzmOAI:4765:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.oZnEtzmOAI:4764:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.oZnEtzmOAI:4761:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.oZnEtzmOAI:4754:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.oZnEtzmOAI:4744:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.oZnEtzmOAI:4733:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.oZnEtzmOAI:4627:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.oZnEtzmOAI:4623:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.oZnEtzmOAI:4598:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.oZnEtzmOAI:4577:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.oZnEtzmOAI:4519:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.oZnEtzmOAI:4518:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.oZnEtzmOAI:4514:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.oZnEtzmOAI:4513:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.oZnEtzmOAI:4511:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.oZnEtzmOAI:4510:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.oZnEtzmOAI:4507:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.NxMloLeyHJ:3347:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.NxMloLeyHJ:3331:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.NxMloLeyHJ:3330:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.NxMloLeyHJ:3326:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.NxMloLeyHJ:3306:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.NxMloLeyHJ:3300:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.NxMloLeyHJ:3291:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.NxMloLeyHJ:3289:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.NxMloLeyHJ:3288:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.NxMloLeyHJ:3287:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.NxMloLeyHJ:3285:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.NxMloLeyHJ:3284:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.NxMloLeyHJ:3281:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.NxMloLeyHJ:3274:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.NxMloLeyHJ:3264:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.NxMloLeyHJ:3253:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.NxMloLeyHJ:3147:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.NxMloLeyHJ:3143:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.NxMloLeyHJ:3118:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.NxMloLeyHJ:3097:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.NxMloLeyHJ:3039:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.NxMloLeyHJ:3038:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.NxMloLeyHJ:3034:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.NxMloLeyHJ:3033:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.NxMloLeyHJ:3031:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.NxMloLeyHJ:3030:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.NxMloLeyHJ:3027:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.NqXcl5W7kc:1743:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.NqXcl5W7kc:1727:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.NqXcl5W7kc:1726:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.NqXcl5W7kc:1722:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.NqXcl5W7kc:1702:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.NqXcl5W7kc:1696:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.NqXcl5W7kc:1687:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.NqXcl5W7kc:1685:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.NqXcl5W7kc:1684:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.NqXcl5W7kc:1683:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.NqXcl5W7kc:1681:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.NqXcl5W7kc:1680:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.NqXcl5W7kc:1677:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.NqXcl5W7kc:1670:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.NqXcl5W7kc:1660:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.NqXcl5W7kc:1649:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.NqXcl5W7kc:1543:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.NqXcl5W7kc:1539:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.NqXcl5W7kc:1514:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.NqXcl5W7kc:1493:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.NqXcl5W7kc:1435:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.NqXcl5W7kc:1434:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.NqXcl5W7kc:1430:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.NqXcl5W7kc:1429:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.NqXcl5W7kc:1427:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.NqXcl5W7kc:1426:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.NqXcl5W7kc:1423:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.MRJx4OGrbA:8471:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.MRJx4OGrbA:8455:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.MRJx4OGrbA:8454:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.MRJx4OGrbA:8450:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.MRJx4OGrbA:8430:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.MRJx4OGrbA:8424:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.MRJx4OGrbA:8415:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.MRJx4OGrbA:8413:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.MRJx4OGrbA:8412:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.MRJx4OGrbA:8411:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.MRJx4OGrbA:8409:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.MRJx4OGrbA:8408:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.MRJx4OGrbA:8405:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.MRJx4OGrbA:8398:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.MRJx4OGrbA:8388:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.MRJx4OGrbA:8377:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.MRJx4OGrbA:8271:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.MRJx4OGrbA:8267:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.MRJx4OGrbA:8242:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.MRJx4OGrbA:8221:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.MRJx4OGrbA:8163:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.MRJx4OGrbA:8162:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.MRJx4OGrbA:8158:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.MRJx4OGrbA:8157:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.MRJx4OGrbA:8155:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.MRJx4OGrbA:8154:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.MRJx4OGrbA:8151:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.KeoTa5fMzf:3992:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.KeoTa5fMzf:3976:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.KeoTa5fMzf:3975:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.KeoTa5fMzf:3971:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.KeoTa5fMzf:3951:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.KeoTa5fMzf:3945:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.KeoTa5fMzf:3936:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.KeoTa5fMzf:3934:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.KeoTa5fMzf:3933:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.KeoTa5fMzf:3932:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.KeoTa5fMzf:3930:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.KeoTa5fMzf:3929:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.KeoTa5fMzf:3926:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.KeoTa5fMzf:3919:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.KeoTa5fMzf:3909:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.KeoTa5fMzf:3898:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.KeoTa5fMzf:3792:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.KeoTa5fMzf:3788:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.KeoTa5fMzf:3763:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.KeoTa5fMzf:3742:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.KeoTa5fMzf:3684:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.KeoTa5fMzf:3683:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.KeoTa5fMzf:3679:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.KeoTa5fMzf:3678:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.KeoTa5fMzf:3676:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.KeoTa5fMzf:3675:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.KeoTa5fMzf:3672:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.0fMHTGXp0T:7901:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0fMHTGXp0T:7885:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.0fMHTGXp0T:7884:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.0fMHTGXp0T:7880:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.0fMHTGXp0T:7860:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.0fMHTGXp0T:7854:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.0fMHTGXp0T:7845:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.0fMHTGXp0T:7843:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.0fMHTGXp0T:7842:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.0fMHTGXp0T:7841:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.0fMHTGXp0T:7839:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.0fMHTGXp0T:7838:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.0fMHTGXp0T:7835:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.0fMHTGXp0T:7828:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.0fMHTGXp0T:7818:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.0fMHTGXp0T:7807:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0fMHTGXp0T:7701:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.0fMHTGXp0T:7697:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0fMHTGXp0T:7672:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.0fMHTGXp0T:7651:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.0fMHTGXp0T:7593:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.0fMHTGXp0T:7592:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.0fMHTGXp0T:7588:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.0fMHTGXp0T:7587:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.0fMHTGXp0T:7585:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.0fMHTGXp0T:7584:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.0fMHTGXp0T:7581:warning: override: reassigning to sy=
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
    ./.tmp.config.KeoTa5fMzf:3672:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.KeoTa5fMzf:3675:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.KeoTa5fMzf:3676:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.KeoTa5fMzf:3678:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.KeoTa5fMzf:3679:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.KeoTa5fMzf:3683:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.KeoTa5fMzf:3684:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.KeoTa5fMzf:3742:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.KeoTa5fMzf:3763:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.KeoTa5fMzf:3788:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.KeoTa5fMzf:3792:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.KeoTa5fMzf:3898:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.KeoTa5fMzf:3909:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.KeoTa5fMzf:3919:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.KeoTa5fMzf:3926:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.KeoTa5fMzf:3929:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.KeoTa5fMzf:3930:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.KeoTa5fMzf:3932:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.KeoTa5fMzf:3933:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.KeoTa5fMzf:3934:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.KeoTa5fMzf:3936:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.KeoTa5fMzf:3945:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.KeoTa5fMzf:3951:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.KeoTa5fMzf:3971:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.KeoTa5fMzf:3975:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.KeoTa5fMzf:3976:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.KeoTa5fMzf:3992:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 2 errors, 4 warnings,=
 0 section mismatches

Errors:
    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: error: storage size of =
'pip_sft_rst' isn't known
    arch/mips/include/asm/octeon/cvmx-ipd.h:331:36: error: 'CVMX_PIP_SFT_RS=
T' undeclared (first use in this function); did you mean 'CVMX_CIU_SOFT_RST=
'?

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: warning: unused variabl=
e 'pip_sft_rst' [-Wunused-variable]

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
    ./.tmp.config.NxMloLeyHJ:3027:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.NxMloLeyHJ:3030:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.NxMloLeyHJ:3031:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.NxMloLeyHJ:3033:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.NxMloLeyHJ:3034:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.NxMloLeyHJ:3038:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.NxMloLeyHJ:3039:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.NxMloLeyHJ:3097:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.NxMloLeyHJ:3118:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.NxMloLeyHJ:3143:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.NxMloLeyHJ:3147:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.NxMloLeyHJ:3253:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.NxMloLeyHJ:3264:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.NxMloLeyHJ:3274:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.NxMloLeyHJ:3281:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.NxMloLeyHJ:3284:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.NxMloLeyHJ:3285:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.NxMloLeyHJ:3287:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.NxMloLeyHJ:3288:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.NxMloLeyHJ:3289:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.NxMloLeyHJ:3291:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.NxMloLeyHJ:3300:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.NxMloLeyHJ:3306:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.NxMloLeyHJ:3326:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.NxMloLeyHJ:3330:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.NxMloLeyHJ:3331:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.NxMloLeyHJ:3347:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 30 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.0fMHTGXp0T:7581:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.0fMHTGXp0T:7584:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.0fMHTGXp0T:7585:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.0fMHTGXp0T:7587:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.0fMHTGXp0T:7588:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.0fMHTGXp0T:7592:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.0fMHTGXp0T:7593:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.0fMHTGXp0T:7651:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.0fMHTGXp0T:7672:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.0fMHTGXp0T:7697:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.0fMHTGXp0T:7701:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.0fMHTGXp0T:7807:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.0fMHTGXp0T:7818:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.0fMHTGXp0T:7828:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.0fMHTGXp0T:7835:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.0fMHTGXp0T:7838:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.0fMHTGXp0T:7839:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.0fMHTGXp0T:7841:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.0fMHTGXp0T:7842:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.0fMHTGXp0T:7843:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.0fMHTGXp0T:7845:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.0fMHTGXp0T:7854:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.0fMHTGXp0T:7860:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.0fMHTGXp0T:7880:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.0fMHTGXp0T:7884:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.0fMHTGXp0T:7885:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.0fMHTGXp0T:7901:warning: override: reassigning to symbol =
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
    ./.tmp.config.oZnEtzmOAI:4507:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.oZnEtzmOAI:4510:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.oZnEtzmOAI:4511:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.oZnEtzmOAI:4513:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.oZnEtzmOAI:4514:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.oZnEtzmOAI:4518:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.oZnEtzmOAI:4519:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.oZnEtzmOAI:4577:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.oZnEtzmOAI:4598:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.oZnEtzmOAI:4623:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.oZnEtzmOAI:4627:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.oZnEtzmOAI:4733:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.oZnEtzmOAI:4744:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.oZnEtzmOAI:4754:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.oZnEtzmOAI:4761:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.oZnEtzmOAI:4764:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.oZnEtzmOAI:4765:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.oZnEtzmOAI:4767:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.oZnEtzmOAI:4768:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.oZnEtzmOAI:4769:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.oZnEtzmOAI:4771:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.oZnEtzmOAI:4780:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.oZnEtzmOAI:4786:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.oZnEtzmOAI:4806:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.oZnEtzmOAI:4810:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.oZnEtzmOAI:4811:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.oZnEtzmOAI:4827:warning: override: reassigning to symbol =
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
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 1 error, 1 warning, 0 secti=
on mismatches

Errors:
    "error: actual length %d less than expected %ld\n",

Warnings:
    drivers/net/wireless/zydas/zd1211rw/zd_def.h:18:25: warning: format '%l=
d' expects argument of type 'long int', but argument 6 has type 'size_t' {a=
ka 'unsigned int'} [-Wformat=3D]

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
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sec=
tion mismatches

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
    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 8 warnings, 0 section mismatches

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
    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 8 warnings, 0 section mismatches

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
    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 8 =
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
    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 35 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.MRJx4OGrbA:8151:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.MRJx4OGrbA:8154:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.MRJx4OGrbA:8155:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.MRJx4OGrbA:8157:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.MRJx4OGrbA:8158:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.MRJx4OGrbA:8162:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.MRJx4OGrbA:8163:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.MRJx4OGrbA:8221:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.MRJx4OGrbA:8242:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.MRJx4OGrbA:8267:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.MRJx4OGrbA:8271:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.MRJx4OGrbA:8377:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.MRJx4OGrbA:8388:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.MRJx4OGrbA:8398:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.MRJx4OGrbA:8405:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.MRJx4OGrbA:8408:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.MRJx4OGrbA:8409:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.MRJx4OGrbA:8411:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.MRJx4OGrbA:8412:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.MRJx4OGrbA:8413:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.MRJx4OGrbA:8415:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.MRJx4OGrbA:8424:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.MRJx4OGrbA:8430:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.MRJx4OGrbA:8450:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.MRJx4OGrbA:8454:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.MRJx4OGrbA:8455:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.MRJx4OGrbA:8471:warning: override: reassigning to symbol =
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
    ./.tmp.config.NqXcl5W7kc:1423:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.NqXcl5W7kc:1426:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.NqXcl5W7kc:1427:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.NqXcl5W7kc:1429:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.NqXcl5W7kc:1430:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.NqXcl5W7kc:1434:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.NqXcl5W7kc:1435:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.NqXcl5W7kc:1493:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.NqXcl5W7kc:1514:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.NqXcl5W7kc:1539:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.NqXcl5W7kc:1543:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.NqXcl5W7kc:1649:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.NqXcl5W7kc:1660:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.NqXcl5W7kc:1670:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.NqXcl5W7kc:1677:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.NqXcl5W7kc:1680:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.NqXcl5W7kc:1681:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.NqXcl5W7kc:1683:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.NqXcl5W7kc:1684:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.NqXcl5W7kc:1685:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.NqXcl5W7kc:1687:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.NqXcl5W7kc:1696:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.NqXcl5W7kc:1702:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.NqXcl5W7kc:1722:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.NqXcl5W7kc:1726:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.NqXcl5W7kc:1727:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.NqXcl5W7kc:1743:warning: override: reassigning to symbol =
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
    drivers/hsi/clients/ssi_protocol.c:292:6: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/hsi/clients/ssi_protocol.c:467:7: warning: this statement may f=
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
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1170:warning: override: UNWINDER_GUESS changes choice state

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
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
    ./.tmp.config.vFIzwprF92:4569:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.vFIzwprF92:4572:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.vFIzwprF92:4573:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.vFIzwprF92:4575:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.vFIzwprF92:4576:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.vFIzwprF92:4580:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.vFIzwprF92:4581:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.vFIzwprF92:4639:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.vFIzwprF92:4660:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.vFIzwprF92:4685:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.vFIzwprF92:4689:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.vFIzwprF92:4795:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.vFIzwprF92:4806:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.vFIzwprF92:4816:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.vFIzwprF92:4823:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.vFIzwprF92:4826:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.vFIzwprF92:4827:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.vFIzwprF92:4829:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.vFIzwprF92:4830:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.vFIzwprF92:4831:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.vFIzwprF92:4833:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.vFIzwprF92:4842:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.vFIzwprF92:4848:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.vFIzwprF92:4868:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.vFIzwprF92:4872:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.vFIzwprF92:4873:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.vFIzwprF92:4889:warning: override: reassigning to symbol =
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
