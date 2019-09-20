Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08DA4B90A3
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2019 15:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbfITN13 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Sep 2019 09:27:29 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39127 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727563AbfITN12 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Sep 2019 09:27:28 -0400
Received: by mail-wr1-f67.google.com with SMTP id r3so6781394wrj.6
        for <linux-next@vger.kernel.org>; Fri, 20 Sep 2019 06:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=jO4Hy7qYP81diQDjHeiOthN64cBBwnyBreme9t5pEec=;
        b=K7nBJjXbozRkCOq5hB9g15PEt27aywc/RtKyWuuUPaejT6nIaGtoJAOHXaja3/iWh9
         EQnJ7Ac+B1yzRKLg+gzM9iHd+KRrRdSY9XN4/lBsBx7tbi+l66gwYQfp167xOB8rpD9V
         3Cv87xfPSCdK+LrgKXWT4fexv6qVCIiT7zuO1OluUkVgUNd1tJ99VM9E94IcIOYH/rat
         wdMtdXGVua84xGrLuYzayogeb2j0p3jtxyvkvkWBnsi3ZAgNrxXK3Gu1ocCbKPpQrTox
         JIcPdoOrc4X9+XYU28fw9cvVONhbsyCXrGDNoIKWjkogSA9WiriM8VJEuTsI/pz/HGRe
         DX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=jO4Hy7qYP81diQDjHeiOthN64cBBwnyBreme9t5pEec=;
        b=SA42FUmbIhh0SGZADSHICk72sH1RPMf7oktOz9Bu2fVAUk9BgfhOJgbaQBsQXMK+/0
         o156dj5bGvkPCn9oQQA6xhqsLVjL0a3LkllANTtXpw7Co8648M7sElxSxG+KeUNjxqsw
         poX8X+cxZE/ODf2jb7MWkvQEYU9Cdd1GPbXViX/pTvAZAP2jja45tuJ4zzS8T/P7RTWu
         ifPZ6flc76ivAcMigY1IulKwC637u2ODQCyT5zRvkNl9FpKqYkxYfGaGoiQv7aRB+Rk0
         q3RiW7cAER6tgUeojgRnUE8DcLi0qsKcQjTWgOFapSqPbb3p9CaSTc5I30w72L6CVxOj
         v7Lg==
X-Gm-Message-State: APjAAAWPdzmO+0+HjR0DcQ7fMjV7Be23dYxysGM/3yOhZtwPYJdc3gMY
        7lseJxhRUl5YvN2ktfGHlKEl6qmOvCQGTg==
X-Google-Smtp-Source: APXvYqy/GkE13V3QAq0mhyRRNNl8Frd/GhSYWyqenl8KICpKCApaAZ+SUicQmFDpbJVIOXz1rm0SdA==
X-Received: by 2002:adf:dd41:: with SMTP id u1mr656596wrm.49.1568986037027;
        Fri, 20 Sep 2019 06:27:17 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w22sm1439412wmc.16.2019.09.20.06.27.15
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Sep 2019 06:27:16 -0700 (PDT)
Message-ID: <5d84d3b4.1c69fb81.3e26e.6767@mx.google.com>
Date:   Fri, 20 Sep 2019 06:27:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-10264-gbd302977ecfe
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 214 builds: 1 failed, 213 passed, 5 errors,
 415 warnings (v5.3-10264-gbd302977ecfe)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 214 builds: 1 failed, 213 passed, 5 errors, 415 w=
arnings (v5.3-10264-gbd302977ecfe)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-10264-gbd302977ecfe/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-10264-gbd302977ecfe
Git Commit: bd302977ecfe79e709503cdbbd1de778d2897eb5
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
    allmodconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 28 warnings

arm:
    assabet_defconfig (gcc-8): 1 warning
    collie_defconfig (gcc-8): 1 warning
    davinci_all_defconfig (gcc-8): 1 warning
    h3600_defconfig (gcc-8): 1 warning
    mini2440_defconfig (gcc-8): 1 error, 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 28 warnings
    neponset_defconfig (gcc-8): 1 warning
    omap2plus_defconfig (gcc-8): 3 warnings
    shannon_defconfig (gcc-8): 1 warning

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
    cavium_octeon_defconfig (gcc-8): 4 errors, 5 warnings
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

    2    arch/mips/include/asm/octeon/cvmx-ipd.h:331:36: error: 'CVMX_PIP_S=
FT_RST' undeclared (first use in this function); did you mean 'CVMX_CIU_SOF=
T_RST'?
    2    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: error: storage siz=
e of 'pip_sft_rst' isn't known
    1    "error: actual length %d less than expected %ld\n",

Warnings summary:

    193  <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    5    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_=
period' defined but not used [-Wunused-function]
    5    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' =
invalid for REMOTEPROC
    4    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid=
 for REMOTEPROC
    2    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret=
' [-Wunused-variable]
    2    drivers/scsi/wd33c93.c:1856:11: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    2    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: warning: unused va=
riable 'pip_sft_rst' [-Wunused-variable]
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
    1    arch/arm/configs/omap2plus_defconfig:484:warning: symbol value 'm'=
 invalid for REMOTEPROC
    1    arch/arm/configs/davinci_all_defconfig:231:warning: symbol value '=
m' invalid for REMOTEPROC
    1    .config:1170:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.pD3zQNWSx2:3992:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.pD3zQNWSx2:3976:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.pD3zQNWSx2:3975:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.pD3zQNWSx2:3971:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.pD3zQNWSx2:3951:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.pD3zQNWSx2:3945:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.pD3zQNWSx2:3936:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.pD3zQNWSx2:3934:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.pD3zQNWSx2:3933:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.pD3zQNWSx2:3932:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.pD3zQNWSx2:3930:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.pD3zQNWSx2:3929:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.pD3zQNWSx2:3926:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.pD3zQNWSx2:3919:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.pD3zQNWSx2:3909:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.pD3zQNWSx2:3898:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.pD3zQNWSx2:3792:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.pD3zQNWSx2:3788:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.pD3zQNWSx2:3763:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.pD3zQNWSx2:3742:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.pD3zQNWSx2:3684:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.pD3zQNWSx2:3683:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.pD3zQNWSx2:3679:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.pD3zQNWSx2:3678:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.pD3zQNWSx2:3676:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.pD3zQNWSx2:3675:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.pD3zQNWSx2:3672:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.g3CIVhbBAd:7907:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.g3CIVhbBAd:7891:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.g3CIVhbBAd:7890:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.g3CIVhbBAd:7886:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.g3CIVhbBAd:7866:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.g3CIVhbBAd:7860:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.g3CIVhbBAd:7851:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.g3CIVhbBAd:7849:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.g3CIVhbBAd:7848:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.g3CIVhbBAd:7847:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.g3CIVhbBAd:7845:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.g3CIVhbBAd:7844:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.g3CIVhbBAd:7841:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.g3CIVhbBAd:7834:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.g3CIVhbBAd:7824:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.g3CIVhbBAd:7813:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.g3CIVhbBAd:7707:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.g3CIVhbBAd:7703:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.g3CIVhbBAd:7678:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.g3CIVhbBAd:7657:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.g3CIVhbBAd:7599:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.g3CIVhbBAd:7598:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.g3CIVhbBAd:7594:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.g3CIVhbBAd:7593:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.g3CIVhbBAd:7591:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.g3CIVhbBAd:7590:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.g3CIVhbBAd:7587:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.cMYZbw6C7d:1743:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.cMYZbw6C7d:1727:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.cMYZbw6C7d:1726:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.cMYZbw6C7d:1722:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.cMYZbw6C7d:1702:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.cMYZbw6C7d:1696:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.cMYZbw6C7d:1687:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.cMYZbw6C7d:1685:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.cMYZbw6C7d:1684:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.cMYZbw6C7d:1683:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.cMYZbw6C7d:1681:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.cMYZbw6C7d:1680:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.cMYZbw6C7d:1677:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.cMYZbw6C7d:1670:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.cMYZbw6C7d:1660:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.cMYZbw6C7d:1649:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.cMYZbw6C7d:1543:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.cMYZbw6C7d:1539:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.cMYZbw6C7d:1514:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.cMYZbw6C7d:1493:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.cMYZbw6C7d:1435:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.cMYZbw6C7d:1434:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.cMYZbw6C7d:1430:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.cMYZbw6C7d:1429:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.cMYZbw6C7d:1427:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.cMYZbw6C7d:1426:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.cMYZbw6C7d:1423:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.W8JZ9UPI3e:8483:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.W8JZ9UPI3e:8467:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.W8JZ9UPI3e:8466:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.W8JZ9UPI3e:8462:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.W8JZ9UPI3e:8442:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.W8JZ9UPI3e:8436:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.W8JZ9UPI3e:8427:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.W8JZ9UPI3e:8425:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.W8JZ9UPI3e:8424:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.W8JZ9UPI3e:8423:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.W8JZ9UPI3e:8421:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.W8JZ9UPI3e:8420:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.W8JZ9UPI3e:8417:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.W8JZ9UPI3e:8410:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.W8JZ9UPI3e:8400:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.W8JZ9UPI3e:8389:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.W8JZ9UPI3e:8283:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.W8JZ9UPI3e:8279:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.W8JZ9UPI3e:8254:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.W8JZ9UPI3e:8233:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.W8JZ9UPI3e:8175:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.W8JZ9UPI3e:8174:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.W8JZ9UPI3e:8170:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.W8JZ9UPI3e:8169:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.W8JZ9UPI3e:8167:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.W8JZ9UPI3e:8166:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.W8JZ9UPI3e:8163:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Tz77cwEBc4:3366:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Tz77cwEBc4:3350:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Tz77cwEBc4:3349:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.Tz77cwEBc4:3345:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.Tz77cwEBc4:3325:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.Tz77cwEBc4:3319:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.Tz77cwEBc4:3310:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.Tz77cwEBc4:3308:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Tz77cwEBc4:3307:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.Tz77cwEBc4:3306:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.Tz77cwEBc4:3304:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.Tz77cwEBc4:3303:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.Tz77cwEBc4:3300:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Tz77cwEBc4:3293:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Tz77cwEBc4:3283:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.Tz77cwEBc4:3272:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Tz77cwEBc4:3166:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.Tz77cwEBc4:3162:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Tz77cwEBc4:3137:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.Tz77cwEBc4:3116:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Tz77cwEBc4:3058:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.Tz77cwEBc4:3057:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.Tz77cwEBc4:3053:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.Tz77cwEBc4:3052:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.Tz77cwEBc4:3050:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.Tz77cwEBc4:3049:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.Tz77cwEBc4:3046:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.OmdGOwzyKm:4889:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.OmdGOwzyKm:4873:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.OmdGOwzyKm:4872:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.OmdGOwzyKm:4868:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.OmdGOwzyKm:4848:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.OmdGOwzyKm:4842:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.OmdGOwzyKm:4833:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.OmdGOwzyKm:4831:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.OmdGOwzyKm:4830:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.OmdGOwzyKm:4829:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.OmdGOwzyKm:4827:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.OmdGOwzyKm:4826:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.OmdGOwzyKm:4823:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.OmdGOwzyKm:4816:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.OmdGOwzyKm:4806:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.OmdGOwzyKm:4795:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.OmdGOwzyKm:4689:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.OmdGOwzyKm:4685:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.OmdGOwzyKm:4660:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.OmdGOwzyKm:4639:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.OmdGOwzyKm:4581:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.OmdGOwzyKm:4580:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.OmdGOwzyKm:4576:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.OmdGOwzyKm:4575:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.OmdGOwzyKm:4573:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.OmdGOwzyKm:4572:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.OmdGOwzyKm:4569:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.D7Hc4DHcFI:4827:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.D7Hc4DHcFI:4811:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.D7Hc4DHcFI:4810:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.D7Hc4DHcFI:4806:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.D7Hc4DHcFI:4786:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.D7Hc4DHcFI:4780:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.D7Hc4DHcFI:4771:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.D7Hc4DHcFI:4769:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.D7Hc4DHcFI:4768:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.D7Hc4DHcFI:4767:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.D7Hc4DHcFI:4765:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.D7Hc4DHcFI:4764:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.D7Hc4DHcFI:4761:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.D7Hc4DHcFI:4754:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.D7Hc4DHcFI:4744:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.D7Hc4DHcFI:4733:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.D7Hc4DHcFI:4627:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.D7Hc4DHcFI:4623:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.D7Hc4DHcFI:4598:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.D7Hc4DHcFI:4577:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.D7Hc4DHcFI:4519:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.D7Hc4DHcFI:4518:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.D7Hc4DHcFI:4514:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.D7Hc4DHcFI:4513:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.D7Hc4DHcFI:4511:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.D7Hc4DHcFI:4510:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.D7Hc4DHcFI:4507:warning: override: reassigning to sy=
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
    ./.tmp.config.pD3zQNWSx2:3672:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.pD3zQNWSx2:3675:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.pD3zQNWSx2:3676:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.pD3zQNWSx2:3678:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.pD3zQNWSx2:3679:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.pD3zQNWSx2:3683:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.pD3zQNWSx2:3684:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.pD3zQNWSx2:3742:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.pD3zQNWSx2:3763:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.pD3zQNWSx2:3788:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.pD3zQNWSx2:3792:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.pD3zQNWSx2:3898:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.pD3zQNWSx2:3909:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.pD3zQNWSx2:3919:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.pD3zQNWSx2:3926:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.pD3zQNWSx2:3929:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.pD3zQNWSx2:3930:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.pD3zQNWSx2:3932:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.pD3zQNWSx2:3933:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.pD3zQNWSx2:3934:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.pD3zQNWSx2:3936:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.pD3zQNWSx2:3945:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.pD3zQNWSx2:3951:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.pD3zQNWSx2:3971:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.pD3zQNWSx2:3975:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.pD3zQNWSx2:3976:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.pD3zQNWSx2:3992:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/soundwire/slave.c:16:12: warning: 'sdw_slave_add' defined but n=
ot used [-Wunused-function]

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
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 4 errors, 5 warnings,=
 0 section mismatches

Errors:
    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: error: storage size of =
'pip_sft_rst' isn't known
    arch/mips/include/asm/octeon/cvmx-ipd.h:331:36: error: 'CVMX_PIP_SFT_RS=
T' undeclared (first use in this function); did you mean 'CVMX_CIU_SOFT_RST=
'?
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
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    arch/arm/configs/davinci_all_defconfig:231:warning: symbol value 'm' in=
valid for REMOTEPROC

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.Tz77cwEBc4:3046:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Tz77cwEBc4:3049:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.Tz77cwEBc4:3050:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.Tz77cwEBc4:3052:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.Tz77cwEBc4:3053:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.Tz77cwEBc4:3057:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.Tz77cwEBc4:3058:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.Tz77cwEBc4:3116:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Tz77cwEBc4:3137:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.Tz77cwEBc4:3162:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Tz77cwEBc4:3166:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.Tz77cwEBc4:3272:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Tz77cwEBc4:3283:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.Tz77cwEBc4:3293:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Tz77cwEBc4:3300:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Tz77cwEBc4:3303:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.Tz77cwEBc4:3304:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.Tz77cwEBc4:3306:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.Tz77cwEBc4:3307:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.Tz77cwEBc4:3308:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Tz77cwEBc4:3310:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.Tz77cwEBc4:3319:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.Tz77cwEBc4:3325:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.Tz77cwEBc4:3345:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.Tz77cwEBc4:3349:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.Tz77cwEBc4:3350:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Tz77cwEBc4:3366:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 28 warnings, 0=
 section mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    ./.tmp.config.g3CIVhbBAd:7587:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.g3CIVhbBAd:7590:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.g3CIVhbBAd:7591:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.g3CIVhbBAd:7593:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.g3CIVhbBAd:7594:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.g3CIVhbBAd:7598:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.g3CIVhbBAd:7599:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.g3CIVhbBAd:7657:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.g3CIVhbBAd:7678:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.g3CIVhbBAd:7703:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.g3CIVhbBAd:7707:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.g3CIVhbBAd:7813:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.g3CIVhbBAd:7824:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.g3CIVhbBAd:7834:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.g3CIVhbBAd:7841:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.g3CIVhbBAd:7844:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.g3CIVhbBAd:7845:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.g3CIVhbBAd:7847:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.g3CIVhbBAd:7848:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.g3CIVhbBAd:7849:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.g3CIVhbBAd:7851:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.g3CIVhbBAd:7860:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.g3CIVhbBAd:7866:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.g3CIVhbBAd:7886:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.g3CIVhbBAd:7890:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.g3CIVhbBAd:7891:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.g3CIVhbBAd:7907:warning: override: reassigning to symbol =
USER_NS

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
    ./.tmp.config.D7Hc4DHcFI:4507:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.D7Hc4DHcFI:4510:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.D7Hc4DHcFI:4511:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.D7Hc4DHcFI:4513:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.D7Hc4DHcFI:4514:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.D7Hc4DHcFI:4518:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.D7Hc4DHcFI:4519:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.D7Hc4DHcFI:4577:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.D7Hc4DHcFI:4598:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.D7Hc4DHcFI:4623:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.D7Hc4DHcFI:4627:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.D7Hc4DHcFI:4733:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.D7Hc4DHcFI:4744:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.D7Hc4DHcFI:4754:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.D7Hc4DHcFI:4761:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.D7Hc4DHcFI:4764:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.D7Hc4DHcFI:4765:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.D7Hc4DHcFI:4767:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.D7Hc4DHcFI:4768:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.D7Hc4DHcFI:4769:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.D7Hc4DHcFI:4771:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.D7Hc4DHcFI:4780:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.D7Hc4DHcFI:4786:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.D7Hc4DHcFI:4806:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.D7Hc4DHcFI:4810:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.D7Hc4DHcFI:4811:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.D7Hc4DHcFI:4827:warning: override: reassigning to symbol =
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
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 1 warning, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 1 warning, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 =
warning, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 28 warn=
ings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    ./.tmp.config.W8JZ9UPI3e:8163:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.W8JZ9UPI3e:8166:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.W8JZ9UPI3e:8167:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.W8JZ9UPI3e:8169:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.W8JZ9UPI3e:8170:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.W8JZ9UPI3e:8174:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.W8JZ9UPI3e:8175:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.W8JZ9UPI3e:8233:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.W8JZ9UPI3e:8254:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.W8JZ9UPI3e:8279:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.W8JZ9UPI3e:8283:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.W8JZ9UPI3e:8389:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.W8JZ9UPI3e:8400:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.W8JZ9UPI3e:8410:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.W8JZ9UPI3e:8417:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.W8JZ9UPI3e:8420:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.W8JZ9UPI3e:8421:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.W8JZ9UPI3e:8423:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.W8JZ9UPI3e:8424:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.W8JZ9UPI3e:8425:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.W8JZ9UPI3e:8427:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.W8JZ9UPI3e:8436:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.W8JZ9UPI3e:8442:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.W8JZ9UPI3e:8462:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.W8JZ9UPI3e:8466:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.W8JZ9UPI3e:8467:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.W8JZ9UPI3e:8483:warning: override: reassigning to symbol =
USER_NS

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
    ./.tmp.config.cMYZbw6C7d:1423:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.cMYZbw6C7d:1426:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.cMYZbw6C7d:1427:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.cMYZbw6C7d:1429:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.cMYZbw6C7d:1430:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.cMYZbw6C7d:1434:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.cMYZbw6C7d:1435:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.cMYZbw6C7d:1493:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.cMYZbw6C7d:1514:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.cMYZbw6C7d:1539:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.cMYZbw6C7d:1543:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.cMYZbw6C7d:1649:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.cMYZbw6C7d:1660:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.cMYZbw6C7d:1670:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.cMYZbw6C7d:1677:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.cMYZbw6C7d:1680:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.cMYZbw6C7d:1681:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.cMYZbw6C7d:1683:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.cMYZbw6C7d:1684:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.cMYZbw6C7d:1685:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.cMYZbw6C7d:1687:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.cMYZbw6C7d:1696:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.cMYZbw6C7d:1702:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.cMYZbw6C7d:1722:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.cMYZbw6C7d:1726:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.cMYZbw6C7d:1727:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.cMYZbw6C7d:1743:warning: override: reassigning to symbol =
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
    arch/arm/configs/omap2plus_defconfig:484:warning: symbol value 'm' inva=
lid for REMOTEPROC
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
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
    ./.tmp.config.OmdGOwzyKm:4569:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.OmdGOwzyKm:4572:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.OmdGOwzyKm:4573:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.OmdGOwzyKm:4575:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.OmdGOwzyKm:4576:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.OmdGOwzyKm:4580:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.OmdGOwzyKm:4581:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.OmdGOwzyKm:4639:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.OmdGOwzyKm:4660:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.OmdGOwzyKm:4685:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.OmdGOwzyKm:4689:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.OmdGOwzyKm:4795:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.OmdGOwzyKm:4806:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.OmdGOwzyKm:4816:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.OmdGOwzyKm:4823:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.OmdGOwzyKm:4826:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.OmdGOwzyKm:4827:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.OmdGOwzyKm:4829:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.OmdGOwzyKm:4830:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.OmdGOwzyKm:4831:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.OmdGOwzyKm:4833:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.OmdGOwzyKm:4842:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.OmdGOwzyKm:4848:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.OmdGOwzyKm:4868:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.OmdGOwzyKm:4872:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.OmdGOwzyKm:4873:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.OmdGOwzyKm:4889:warning: override: reassigning to symbol =
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
