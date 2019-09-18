Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28B21B58FA
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2019 02:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbfIRAYz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Sep 2019 20:24:55 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:38506 "EHLO
        mail-wr1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbfIRAYz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Sep 2019 20:24:55 -0400
Received: by mail-wr1-f45.google.com with SMTP id l11so4978723wrx.5
        for <linux-next@vger.kernel.org>; Tue, 17 Sep 2019 17:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7XhhWXfz+TuMrb7zrGH5LBgjvDP78Epqm9repsad934=;
        b=xJe8zqCWaas0AXX+z5YmKxTPwBzgFFt9jIY+RekfxCyDhltQuPBB7LwiOOVXincWo+
         dyZYtwxAMJW0cNI5f7+EKPTIJSxCP2pP/1HAg9HmVxy0MRnzQbYq0ZH6up+xSATBjzDB
         0j5R9l3SWu0FlfUHJajqj8k5dCtSRBGXjo1OZFlQ0ZxzduqqwzI/ks6goRrJZBzXb1Ut
         Nfg20G6yTdiGcQVFFlrPqULxOzll/4JKyz7PvVr7dHKt1suKPbpSNTs67S8t44wSTWQi
         5FEpbBTLiPxY6Qc3osIdMm9Kd1GJY7GtmxlfSYKIETN7duk+VeBvT1uFhcxnosNX4qW/
         4Izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7XhhWXfz+TuMrb7zrGH5LBgjvDP78Epqm9repsad934=;
        b=ZFjUQPhESuaN8+/H6QxdoBNoo664D5ZH1a2xB6MH2eiPIxZOOqmFv6jvoMY8CZCHfb
         WiRVNChhCZgYqNcXiupElStAIXsFDXt4bkG2g3RPcD4rW/qT12b5uoRlotv3ed6dV+yc
         Bo4wZ94AJYjligJU43RZhFSRDFFNjI00kd39NSruaex4vJLQId9A5LpKxn4N76uc32SP
         xu20AYY92ef9A9hApfR5VSOy5l3vK28EeHFkdrrwXQn3TpFx4EpcBPcY08g09RlIcv7F
         WMmn1GtrzE00lKw94DSngbEVzSTcxPoyO9wQBoZ9eDc9b/wj0GTybOI/43KYtXjR1ezz
         mjSQ==
X-Gm-Message-State: APjAAAXibesUtHaz+y9UNS3RtaDUmcpE98x8Dn8ClKi928Ywoy9ZMIRL
        k8H97sbuzJ+i7JC3ifyX+v9TFTmIbwgvaQ==
X-Google-Smtp-Source: APXvYqxArVg4Lz602nUbHirGQ4JEVEIrZtqHPJnFJphyrrwZXBpqwwVjMHBfdrpGMCnVd4Krg3zmSQ==
X-Received: by 2002:a5d:430f:: with SMTP id h15mr793700wrq.177.1568766285886;
        Tue, 17 Sep 2019 17:24:45 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id k9sm6108389wrd.7.2019.09.17.17.24.44
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2019 17:24:45 -0700 (PDT)
Message-ID: <5d81794d.1c69fb81.8f9c9.ce22@mx.google.com>
Date:   Tue, 17 Sep 2019 17:24:45 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190917
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
Subject: next/master build: 218 builds: 6 failed, 212 passed, 11 errors,
 724 warnings (next-20190917)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 218 builds: 6 failed, 212 passed, 11 errors, 724 warning=
s (next-20190917)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190917/

Tree: next
Branch: master
Git Describe: next-20190917
Git Commit: a4b5b2e06e424454b690b31a9a965990b9eb60c1
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-8) FAIL
    allmodconfig: (gcc-8) FAIL

arm:
    allmodconfig: (gcc-8) FAIL

mips:
    cavium_octeon_defconfig: (gcc-8) FAIL
    msp71xx_defconfig: (gcc-8) FAIL

x86_64:
    allmodconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 2 warnings
    axs103_smp_defconfig (gcc-8): 2 warnings
    haps_hs_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    hsdk_defconfig (gcc-8): 2 warnings
    nsim_hs_defconfig (gcc-8): 2 warnings
    nsim_hs_defconfig (gcc-8): 31 warnings
    nsim_hs_smp_defconfig (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (clang-8): 1 error, 11 warnings
    allmodconfig (gcc-8): 1 error, 1 warning
    defconfig (gcc-8): 7 warnings
    defconfig (clang-8): 8 warnings
    defconfig (gcc-8): 7 warnings
    defconfig (gcc-8): 7 warnings
    defconfig (gcc-8): 34 warnings

arm:
    allmodconfig (gcc-8): 1 error, 1 warning
    am200epdkit_defconfig (gcc-8): 2 warnings
    assabet_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (gcc-8): 2 warnings
    axm55xx_defconfig (gcc-8): 4 warnings
    cm_x2xx_defconfig (gcc-8): 2 warnings
    cm_x300_defconfig (gcc-8): 2 warnings
    cns3420vb_defconfig (gcc-8): 2 warnings
    colibri_pxa270_defconfig (gcc-8): 2 warnings
    colibri_pxa300_defconfig (gcc-8): 2 warnings
    collie_defconfig (gcc-8): 1 warning
    davinci_all_defconfig (gcc-8): 4 warnings
    dove_defconfig (gcc-8): 2 warnings
    em_x270_defconfig (gcc-8): 2 warnings
    ep93xx_defconfig (gcc-8): 2 warnings
    eseries_pxa_defconfig (gcc-8): 2 warnings
    exynos_defconfig (gcc-8): 4 warnings
    ezx_defconfig (gcc-8): 3 warnings
    h3600_defconfig (gcc-8): 1 warning
    h5000_defconfig (gcc-8): 2 warnings
    imote2_defconfig (gcc-8): 3 warnings
    imx_v4_v5_defconfig (gcc-8): 2 warnings
    imx_v6_v7_defconfig (gcc-8): 6 warnings
    integrator_defconfig (gcc-8): 2 warnings
    ixp4xx_defconfig (gcc-8): 2 warnings
    keystone_defconfig (gcc-8): 2 warnings
    lpc32xx_defconfig (gcc-8): 2 warnings
    magician_defconfig (gcc-8): 2 warnings
    milbeaut_m10v_defconfig (gcc-8): 2 warnings
    mini2440_defconfig (gcc-8): 1 error, 4 warnings
    mmp2_defconfig (gcc-8): 2 warnings
    multi_v5_defconfig (gcc-8): 4 warnings
    multi_v7_defconfig (gcc-8): 5 warnings
    multi_v7_defconfig (gcc-8): 5 warnings
    multi_v7_defconfig (gcc-8): 5 warnings
    multi_v7_defconfig (gcc-8): 5 warnings
    multi_v7_defconfig (gcc-8): 32 warnings
    mv78xx0_defconfig (gcc-8): 2 warnings
    mvebu_v5_defconfig (gcc-8): 4 warnings
    mvebu_v7_defconfig (gcc-8): 4 warnings
    mxs_defconfig (gcc-8): 3 warnings
    neponset_defconfig (gcc-8): 1 warning
    nhk8815_defconfig (gcc-8): 4 warnings
    omap1_defconfig (gcc-8): 2 warnings
    omap2plus_defconfig (gcc-8): 5 warnings
    orion5x_defconfig (gcc-8): 2 warnings
    oxnas_v6_defconfig (gcc-8): 2 warnings
    palmz72_defconfig (gcc-8): 2 warnings
    pcm027_defconfig (gcc-8): 2 warnings
    prima2_defconfig (gcc-8): 2 warnings
    pxa168_defconfig (gcc-8): 2 warnings
    pxa3xx_defconfig (gcc-8): 2 warnings
    pxa910_defconfig (gcc-8): 2 warnings
    pxa_defconfig (gcc-8): 2 warnings
    qcom_defconfig (gcc-8): 6 warnings
    realview_defconfig (gcc-8): 2 warnings
    s3c2410_defconfig (gcc-8): 1 warning
    s3c6400_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (gcc-8): 2 warnings
    sama5_defconfig (gcc-8): 2 warnings
    shannon_defconfig (gcc-8): 1 warning
    spear13xx_defconfig (gcc-8): 6 warnings
    sunxi_defconfig (gcc-8): 4 warnings
    tango4_defconfig (gcc-8): 3 warnings
    tegra_defconfig (gcc-8): 4 warnings
    trizeps4_defconfig (gcc-8): 2 warnings
    u300_defconfig (gcc-8): 4 warnings
    u8500_defconfig (gcc-8): 2 warnings
    versatile_defconfig (gcc-8): 2 warnings
    vexpress_defconfig (gcc-8): 2 warnings
    viper_defconfig (gcc-8): 2 warnings
    xcep_defconfig (gcc-8): 2 warnings
    zeus_defconfig (gcc-8): 2 warnings

i386:
    i386_defconfig (gcc-8): 3 warnings
    i386_defconfig (gcc-8): 33 warnings

mips:
    32r2el_defconfig (gcc-8): 3 warnings
    32r2el_defconfig (gcc-8): 31 warnings
    allnoconfig (gcc-8): 1 warning
    ar7_defconfig (gcc-8): 2 warnings
    ath25_defconfig (gcc-8): 2 warnings
    ath79_defconfig (gcc-8): 2 warnings
    bcm47xx_defconfig (gcc-8): 2 warnings
    bcm63xx_defconfig (gcc-8): 1 warning
    bigsur_defconfig (gcc-8): 8 warnings
    bmips_be_defconfig (gcc-8): 1 warning
    bmips_stb_defconfig (gcc-8): 1 warning
    capcella_defconfig (gcc-8): 2 warnings
    cavium_octeon_defconfig (gcc-8): 2 errors, 4 warnings
    ci20_defconfig (gcc-8): 1 warning
    cobalt_defconfig (gcc-8): 2 warnings
    db1xxx_defconfig (gcc-8): 2 warnings
    decstation_64_defconfig (gcc-8): 8 warnings
    decstation_defconfig (gcc-8): 4 warnings
    decstation_r4k_defconfig (gcc-8): 4 warnings
    e55_defconfig (gcc-8): 2 warnings
    fuloong2e_defconfig (gcc-8): 9 warnings
    gcw0_defconfig (gcc-8): 1 warning
    gpr_defconfig (gcc-8): 2 warnings
    ip22_defconfig (gcc-8): 4 warnings
    ip27_defconfig (gcc-8): 8 warnings
    ip28_defconfig (gcc-8): 6 warnings
    ip32_defconfig (gcc-8): 9 warnings
    jazz_defconfig (gcc-8): 5 warnings
    jmr3927_defconfig (gcc-8): 1 warning
    lasat_defconfig (gcc-8): 1 warning
    lemote2f_defconfig (gcc-8): 7 warnings
    loongson1b_defconfig (gcc-8): 2 warnings
    loongson1c_defconfig (gcc-8): 2 warnings
    loongson3_defconfig (gcc-8): 12 warnings
    malta_defconfig (gcc-8): 4 warnings
    malta_kvm_defconfig (gcc-8): 4 warnings
    malta_kvm_guest_defconfig (gcc-8): 4 warnings
    malta_qemu_32r6_defconfig (gcc-8): 3 warnings
    maltaaprp_defconfig (gcc-8): 2 warnings
    maltasmvp_defconfig (gcc-8): 2 warnings
    maltasmvp_eva_defconfig (gcc-8): 2 warnings
    maltaup_defconfig (gcc-8): 2 warnings
    maltaup_xpa_defconfig (gcc-8): 4 warnings
    markeins_defconfig (gcc-8): 2 warnings
    mips_paravirt_defconfig (gcc-8): 6 warnings
    mpc30x_defconfig (gcc-8): 2 warnings
    msp71xx_defconfig (gcc-8): 4 errors, 2 warnings
    mtx1_defconfig (gcc-8): 4 warnings
    nlm_xlp_defconfig (gcc-8): 13 warnings
    nlm_xlr_defconfig (gcc-8): 7 warnings
    omega2p_defconfig (gcc-8): 1 warning
    pic32mzda_defconfig (gcc-8): 4 warnings
    pistachio_defconfig (gcc-8): 4 warnings
    pnx8335_stb225_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 2 warnings
    rb532_defconfig (gcc-8): 2 warnings
    rbtx49xx_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 5 warnings
    rt305x_defconfig (gcc-8): 2 warnings
    sb1250_swarm_defconfig (gcc-8): 6 warnings
    tb0219_defconfig (gcc-8): 2 warnings
    tb0226_defconfig (gcc-8): 2 warnings
    tb0287_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vocore2_defconfig (gcc-8): 1 warning
    workpad_defconfig (gcc-8): 2 warnings
    xway_defconfig (gcc-8): 2 warnings

riscv:
    defconfig (gcc-8): 3 warnings
    defconfig (gcc-8): 32 warnings
    rv32_defconfig (gcc-8): 9 warnings

x86_64:
    allmodconfig (gcc-8): 1 error, 1 warning
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 3 warnings
    x86_64_defconfig (gcc-8): 32 warnings

Errors summary:

    3    collect2: error: ld returned 1 exit status
    1    clang: error: linker command failed with exit code 1 (use -v to se=
e invocation)
    1    arch/mips/pmcs-msp71xx/msp_prom.c:65:20: error: 'prom_mem_size' de=
fined but not used [-Werror=3Dunused-variable]
    1    arch/mips/pmcs-msp71xx/msp_prom.c:64:34: error: 'MAX_PROM_MEM' und=
eclared here (not in a function); did you mean 'DEV_PROP_MAX'?
    1    arch/mips/pmcs-msp71xx/msp_prom.c:64:20: error: 'prom_mem_base' de=
fined but not used [-Werror=3Dunused-variable]
    1    arch/mips/pmcs-msp71xx/msp_prom.c:380:16: error: unused variable '=
addr' [-Werror=3Dunused-variable]
    1    arch/mips/include/asm/octeon/cvmx-ipd.h:331:36: error: 'CVMX_PIP_S=
FT_RST' undeclared (first use in this function); did you mean 'CVMX_CIU_SOF=
T_RST'?
    1    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: error: storage siz=
e of 'pip_sft_rst' isn't known
    1    "error: actual length %d less than expected %ld\n",

Warnings summary:

    192  <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    128  WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    67   WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    48   WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMB=
OL_GPL
    21   WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
    13   block/t10-pi.c:62:3: warning: enumeration value 'T10_PI_TYPE0_PROT=
ECTION' not handled in switch [-Wswitch]
    10   WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYM=
BOL_GPL
    6    WARNING: "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress] is a sta=
tic EXPORT_SYMBOL
    5    include/linux/kern_levels.h:5:18: warning: format '%lu' expects ar=
gument of type 'long unsigned int', but argument 8 has type 'unsigned int' =
[-Wformat=3D]
    5    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_=
period' defined but not used [-Wunused-function]
    5    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid=
 for REMOTEPROC
    5    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' =
invalid for REMOTEPROC
    5    1 warning generated.
    3    arch/mips/fw/arc/memory.c:163:16: warning: unused variable 'addr' =
[-Wunused-variable]
    2    block/t10-pi.c:62:11: warning: enumeration value 'T10_PI_TYPE0_PRO=
TECTION' not handled in switch [-Wswitch]
    2    WARNING: "ahci_em_messages" [drivers/ata/libahci] is a static EXPO=
RT_SYMBOL_GPL
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:134: Warning: macro instruction expanded into mul=
tiple instructions
    1    mm/shmem.c:2736:35: warning: variable 'shmem_falloc_waitq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    1    fs/proc/base.c:1894:35: warning: variable 'wq' is uninitialized wh=
en used within its own initialization [-Wuninitialized]
    1    fs/namei.c:3128:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    fs/namei.c:1640:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    drivers/net/wireless/zydas/zd1211rw/zd_def.h:18:25: warning: forma=
t '%ld' expects argument of type 'long int', but argument 6 has type 'size_=
t' {aka 'unsigned int'} [-Wformat=3D]
    1    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mism=
atch in conditional expression
    1    cc1: all warnings being treated as errors
    1    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: warning: unused va=
riable 'pip_sft_rst' [-Wunused-variable]
    1    arch/arm/configs/omap2plus_defconfig:484:warning: symbol value 'm'=
 invalid for REMOTEPROC
    1    arch/arm/configs/davinci_all_defconfig:231:warning: symbol value '=
m' invalid for REMOTEPROC
    1    2 warnings generated.
    1    .config:1179:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.zfkibTuFy4:4841:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.zfkibTuFy4:4825:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.zfkibTuFy4:4824:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.zfkibTuFy4:4820:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.zfkibTuFy4:4800:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.zfkibTuFy4:4794:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.zfkibTuFy4:4785:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.zfkibTuFy4:4783:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.zfkibTuFy4:4782:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.zfkibTuFy4:4781:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.zfkibTuFy4:4779:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.zfkibTuFy4:4778:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.zfkibTuFy4:4775:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.zfkibTuFy4:4768:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.zfkibTuFy4:4758:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.zfkibTuFy4:4747:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.zfkibTuFy4:4639:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.zfkibTuFy4:4635:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.zfkibTuFy4:4610:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.zfkibTuFy4:4589:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.zfkibTuFy4:4531:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.zfkibTuFy4:4530:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.zfkibTuFy4:4526:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.zfkibTuFy4:4525:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.zfkibTuFy4:4523:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.zfkibTuFy4:4522:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.zfkibTuFy4:4519:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.yU27yfxLhC:3990:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.yU27yfxLhC:3974:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.yU27yfxLhC:3973:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.yU27yfxLhC:3969:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.yU27yfxLhC:3949:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.yU27yfxLhC:3943:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.yU27yfxLhC:3934:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.yU27yfxLhC:3932:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.yU27yfxLhC:3931:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.yU27yfxLhC:3930:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.yU27yfxLhC:3928:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.yU27yfxLhC:3927:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.yU27yfxLhC:3924:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.yU27yfxLhC:3917:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.yU27yfxLhC:3907:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.yU27yfxLhC:3896:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.yU27yfxLhC:3788:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.yU27yfxLhC:3784:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.yU27yfxLhC:3759:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.yU27yfxLhC:3738:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.yU27yfxLhC:3680:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.yU27yfxLhC:3679:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.yU27yfxLhC:3675:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.yU27yfxLhC:3674:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.yU27yfxLhC:3672:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.yU27yfxLhC:3671:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.yU27yfxLhC:3668:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.xWsco9kjzU:4902:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xWsco9kjzU:4886:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.xWsco9kjzU:4885:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.xWsco9kjzU:4881:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.xWsco9kjzU:4861:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.xWsco9kjzU:4855:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.xWsco9kjzU:4846:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.xWsco9kjzU:4844:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.xWsco9kjzU:4843:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.xWsco9kjzU:4842:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.xWsco9kjzU:4840:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.xWsco9kjzU:4839:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.xWsco9kjzU:4836:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.xWsco9kjzU:4829:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.xWsco9kjzU:4819:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.xWsco9kjzU:4808:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xWsco9kjzU:4700:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.xWsco9kjzU:4696:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xWsco9kjzU:4671:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.xWsco9kjzU:4650:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.xWsco9kjzU:4592:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.xWsco9kjzU:4591:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.xWsco9kjzU:4587:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.xWsco9kjzU:4586:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.xWsco9kjzU:4584:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.xWsco9kjzU:4583:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.xWsco9kjzU:4580:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.waLWZIZ5Dt:3371:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.waLWZIZ5Dt:3355:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.waLWZIZ5Dt:3354:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.waLWZIZ5Dt:3350:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.waLWZIZ5Dt:3330:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.waLWZIZ5Dt:3324:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.waLWZIZ5Dt:3315:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.waLWZIZ5Dt:3313:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.waLWZIZ5Dt:3312:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.waLWZIZ5Dt:3311:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.waLWZIZ5Dt:3309:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.waLWZIZ5Dt:3308:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.waLWZIZ5Dt:3305:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.waLWZIZ5Dt:3298:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.waLWZIZ5Dt:3288:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.waLWZIZ5Dt:3277:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.waLWZIZ5Dt:3169:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.waLWZIZ5Dt:3165:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.waLWZIZ5Dt:3140:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.waLWZIZ5Dt:3119:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.waLWZIZ5Dt:3061:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.waLWZIZ5Dt:3060:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.waLWZIZ5Dt:3056:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.waLWZIZ5Dt:3055:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.waLWZIZ5Dt:3053:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.waLWZIZ5Dt:3052:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.waLWZIZ5Dt:3049:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.jLOMjJYmh8:8488:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.jLOMjJYmh8:8472:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.jLOMjJYmh8:8471:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.jLOMjJYmh8:8467:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.jLOMjJYmh8:8447:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.jLOMjJYmh8:8441:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.jLOMjJYmh8:8432:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.jLOMjJYmh8:8430:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.jLOMjJYmh8:8429:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.jLOMjJYmh8:8428:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.jLOMjJYmh8:8426:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.jLOMjJYmh8:8425:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.jLOMjJYmh8:8422:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.jLOMjJYmh8:8415:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.jLOMjJYmh8:8405:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.jLOMjJYmh8:8394:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.jLOMjJYmh8:8286:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.jLOMjJYmh8:8282:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.jLOMjJYmh8:8257:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.jLOMjJYmh8:8236:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.jLOMjJYmh8:8178:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.jLOMjJYmh8:8177:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.jLOMjJYmh8:8173:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.jLOMjJYmh8:8172:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.jLOMjJYmh8:8170:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.jLOMjJYmh8:8169:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.jLOMjJYmh8:8166:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.VHWnojjePa:7926:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VHWnojjePa:7910:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.VHWnojjePa:7909:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.VHWnojjePa:7905:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.VHWnojjePa:7885:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.VHWnojjePa:7879:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.VHWnojjePa:7870:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.VHWnojjePa:7868:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.VHWnojjePa:7867:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.VHWnojjePa:7866:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.VHWnojjePa:7864:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.VHWnojjePa:7863:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.VHWnojjePa:7860:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.VHWnojjePa:7853:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.VHWnojjePa:7843:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.VHWnojjePa:7832:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VHWnojjePa:7724:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.VHWnojjePa:7720:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VHWnojjePa:7695:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.VHWnojjePa:7674:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.VHWnojjePa:7616:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.VHWnojjePa:7615:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.VHWnojjePa:7611:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.VHWnojjePa:7610:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.VHWnojjePa:7608:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.VHWnojjePa:7607:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.VHWnojjePa:7604:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Q0BvXu6HJ6:1754:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Q0BvXu6HJ6:1738:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Q0BvXu6HJ6:1737:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.Q0BvXu6HJ6:1733:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.Q0BvXu6HJ6:1713:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.Q0BvXu6HJ6:1707:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.Q0BvXu6HJ6:1698:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.Q0BvXu6HJ6:1696:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Q0BvXu6HJ6:1695:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.Q0BvXu6HJ6:1694:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.Q0BvXu6HJ6:1692:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.Q0BvXu6HJ6:1691:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.Q0BvXu6HJ6:1688:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Q0BvXu6HJ6:1681:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Q0BvXu6HJ6:1671:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.Q0BvXu6HJ6:1660:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Q0BvXu6HJ6:1552:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.Q0BvXu6HJ6:1548:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Q0BvXu6HJ6:1523:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.Q0BvXu6HJ6:1502:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Q0BvXu6HJ6:1444:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.Q0BvXu6HJ6:1443:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.Q0BvXu6HJ6:1439:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.Q0BvXu6HJ6:1438:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.Q0BvXu6HJ6:1436:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.Q0BvXu6HJ6:1435:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.Q0BvXu6HJ6:1432:warning: override: reassigning to sy=
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
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 31 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.yU27yfxLhC:3668:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.yU27yfxLhC:3671:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.yU27yfxLhC:3672:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.yU27yfxLhC:3674:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.yU27yfxLhC:3675:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.yU27yfxLhC:3679:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.yU27yfxLhC:3680:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.yU27yfxLhC:3738:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.yU27yfxLhC:3759:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.yU27yfxLhC:3784:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.yU27yfxLhC:3788:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.yU27yfxLhC:3896:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.yU27yfxLhC:3907:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.yU27yfxLhC:3917:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.yU27yfxLhC:3924:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.yU27yfxLhC:3927:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.yU27yfxLhC:3928:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.yU27yfxLhC:3930:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.yU27yfxLhC:3931:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.yU27yfxLhC:3932:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.yU27yfxLhC:3934:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.yU27yfxLhC:3943:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.yU27yfxLhC:3949:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.yU27yfxLhC:3969:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.yU27yfxLhC:3973:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.yU27yfxLhC:3974:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.yU27yfxLhC:3990:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 FAIL, 1 error, 11 warnings, 0 secti=
on mismatches

Errors:
    clang: error: linker command failed with exit code 1 (use -v to see inv=
ocation)

Warnings:
    mm/shmem.c:2736:35: warning: variable 'shmem_falloc_waitq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/proc/base.c:1894:35: warning: variable 'wq' is uninitialized when us=
ed within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is uninitialized w=
hen used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/namei.c:1640:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    fs/namei.c:3128:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    2 warnings generated.
    block/t10-pi.c:62:11: warning: enumeration value 'T10_PI_TYPE0_PROTECTI=
ON' not handled in switch [-Wswitch]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section m=
ismatches

Errors:
    collect2: error: ld returned 1 exit status

Warnings:
    block/t10-pi.c:62:3: warning: enumeration value 'T10_PI_TYPE0_PROTECTIO=
N' not handled in switch [-Wswitch]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section mis=
matches

Errors:
    collect2: error: ld returned 1 exit status

Warnings:
    block/t10-pi.c:62:3: warning: enumeration value 'T10_PI_TYPE0_PROTECTIO=
N' not handled in switch [-Wswitch]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 section =
mismatches

Errors:
    collect2: error: ld returned 1 exit status

Warnings:
    block/t10-pi.c:62:3: warning: enumeration value 'T10_PI_TYPE0_PROTECTIO=
N' not handled in switch [-Wswitch]

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

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
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    arch/arm/configs/davinci_all_defconfig:231:warning: symbol value 'm' in=
valid for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [drivers/ata/libahci] is a static EXPORT_SY=
MBOL_GPL

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
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress] is a static E=
XPORT_SYMBOL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress] is a static E=
XPORT_SYMBOL

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress] is a static E=
XPORT_SYMBOL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress] is a static E=
XPORT_SYMBOL

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress] is a static E=
XPORT_SYMBOL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress] is a static E=
XPORT_SYMBOL

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section mi=
smatches

Warnings:
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 section mi=
smatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    block/t10-pi.c:62:3: warning: enumeration value 'T10_PI_TYPE0_PROTECTIO=
N' not handled in switch [-Wswitch]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 section =
mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    block/t10-pi.c:62:11: warning: enumeration value 'T10_PI_TYPE0_PROTECTI=
ON' not handled in switch [-Wswitch]
    1 warning generated.
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 7 warnings, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    block/t10-pi.c:62:3: warning: enumeration value 'T10_PI_TYPE0_PROTECTIO=
N' not handled in switch [-Wswitch]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 7 warnings, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    block/t10-pi.c:62:3: warning: enumeration value 'T10_PI_TYPE0_PROTECTIO=
N' not handled in switch [-Wswitch]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 32 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.waLWZIZ5Dt:3049:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.waLWZIZ5Dt:3052:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.waLWZIZ5Dt:3053:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.waLWZIZ5Dt:3055:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.waLWZIZ5Dt:3056:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.waLWZIZ5Dt:3060:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.waLWZIZ5Dt:3061:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.waLWZIZ5Dt:3119:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.waLWZIZ5Dt:3140:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.waLWZIZ5Dt:3165:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.waLWZIZ5Dt:3169:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.waLWZIZ5Dt:3277:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.waLWZIZ5Dt:3288:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.waLWZIZ5Dt:3298:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.waLWZIZ5Dt:3305:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.waLWZIZ5Dt:3308:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.waLWZIZ5Dt:3309:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.waLWZIZ5Dt:3311:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.waLWZIZ5Dt:3312:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.waLWZIZ5Dt:3313:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.waLWZIZ5Dt:3315:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.waLWZIZ5Dt:3324:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.waLWZIZ5Dt:3330:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.waLWZIZ5Dt:3350:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.waLWZIZ5Dt:3354:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.waLWZIZ5Dt:3355:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.waLWZIZ5Dt:3371:warning: override: reassigning to symbol =
USER_NS
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 34 warnings, 0=
 section mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    ./.tmp.config.VHWnojjePa:7604:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.VHWnojjePa:7607:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.VHWnojjePa:7608:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.VHWnojjePa:7610:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.VHWnojjePa:7611:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.VHWnojjePa:7615:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.VHWnojjePa:7616:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.VHWnojjePa:7674:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.VHWnojjePa:7695:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.VHWnojjePa:7720:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.VHWnojjePa:7724:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.VHWnojjePa:7832:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.VHWnojjePa:7843:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.VHWnojjePa:7853:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.VHWnojjePa:7860:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.VHWnojjePa:7863:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.VHWnojjePa:7864:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.VHWnojjePa:7866:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.VHWnojjePa:7867:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.VHWnojjePa:7868:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.VHWnojjePa:7870:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.VHWnojjePa:7879:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.VHWnojjePa:7885:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.VHWnojjePa:7905:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.VHWnojjePa:7909:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.VHWnojjePa:7910:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.VHWnojjePa:7926:warning: override: reassigning to symbol =
USER_NS
    block/t10-pi.c:62:3: warning: enumeration value 'T10_PI_TYPE0_PROTECTIO=
N' not handled in switch [-Wswitch]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 33 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.zfkibTuFy4:4519:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.zfkibTuFy4:4522:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.zfkibTuFy4:4523:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.zfkibTuFy4:4525:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.zfkibTuFy4:4526:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.zfkibTuFy4:4530:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.zfkibTuFy4:4531:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.zfkibTuFy4:4589:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.zfkibTuFy4:4610:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.zfkibTuFy4:4635:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.zfkibTuFy4:4639:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.zfkibTuFy4:4747:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.zfkibTuFy4:4758:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.zfkibTuFy4:4768:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.zfkibTuFy4:4775:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.zfkibTuFy4:4778:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.zfkibTuFy4:4779:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.zfkibTuFy4:4781:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.zfkibTuFy4:4782:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.zfkibTuFy4:4783:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.zfkibTuFy4:4785:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.zfkibTuFy4:4794:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.zfkibTuFy4:4800:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.zfkibTuFy4:4820:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.zfkibTuFy4:4824:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.zfkibTuFy4:4825:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.zfkibTuFy4:4841:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
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
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/mips/fw/arc/memory.c:163:16: warning: unused variable 'addr' [-Wun=
used-variable]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/mips/fw/arc/memory.c:163:16: warning: unused variable 'addr' [-Wun=
used-variable]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

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
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    block/t10-pi.c:62:3: warning: enumeration value 'T10_PI_TYPE0_PROTECTIO=
N' not handled in switch [-Wswitch]
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
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 12 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    block/t10-pi.c:62:3: warning: enumeration value 'T10_PI_TYPE0_PROTECTIO=
N' not handled in switch [-Wswitch]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    {standard input}:134: Warning: macro instruction expanded into multiple=
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
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 1 error, 4 warnings, 0 sect=
ion mismatches

Errors:
    "error: actual length %d less than expected %ld\n",

Warnings:
    block/t10-pi.c:62:3: warning: enumeration value 'T10_PI_TYPE0_PROTECTIO=
N' not handled in switch [-Wswitch]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    drivers/net/wireless/zydas/zd1211rw/zd_def.h:18:25: warning: format '%l=
d' expects argument of type 'long int', but argument 6 has type 'size_t' {a=
ka 'unsigned int'} [-Wformat=3D]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
msp71xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 4 errors, 2 warnings, 0 sec=
tion mismatches

Errors:
    arch/mips/pmcs-msp71xx/msp_prom.c:64:34: error: 'MAX_PROM_MEM' undeclar=
ed here (not in a function); did you mean 'DEV_PROP_MAX'?
    arch/mips/pmcs-msp71xx/msp_prom.c:380:16: error: unused variable 'addr'=
 [-Werror=3Dunused-variable]
    arch/mips/pmcs-msp71xx/msp_prom.c:65:20: error: 'prom_mem_size' defined=
 but not used [-Werror=3Dunused-variable]
    arch/mips/pmcs-msp71xx/msp_prom.c:64:20: error: 'prom_mem_base' defined=
 but not used [-Werror=3Dunused-variable]

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 5 warnings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 =
warnings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 32 warn=
ings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    ./.tmp.config.jLOMjJYmh8:8166:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.jLOMjJYmh8:8169:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.jLOMjJYmh8:8170:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.jLOMjJYmh8:8172:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.jLOMjJYmh8:8173:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.jLOMjJYmh8:8177:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.jLOMjJYmh8:8178:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.jLOMjJYmh8:8236:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.jLOMjJYmh8:8257:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.jLOMjJYmh8:8282:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.jLOMjJYmh8:8286:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.jLOMjJYmh8:8394:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.jLOMjJYmh8:8405:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.jLOMjJYmh8:8415:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.jLOMjJYmh8:8422:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.jLOMjJYmh8:8425:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.jLOMjJYmh8:8426:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.jLOMjJYmh8:8428:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.jLOMjJYmh8:8429:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.jLOMjJYmh8:8430:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.jLOMjJYmh8:8432:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.jLOMjJYmh8:8441:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.jLOMjJYmh8:8447:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.jLOMjJYmh8:8467:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.jLOMjJYmh8:8471:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.jLOMjJYmh8:8472:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.jLOMjJYmh8:8488:warning: override: reassigning to symbol =
USER_NS
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    block/t10-pi.c:62:3: warning: enumeration value 'T10_PI_TYPE0_PROTECTIO=
N' not handled in switch [-Wswitch]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 13 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    block/t10-pi.c:62:3: warning: enumeration value 'T10_PI_TYPE0_PROTECTIO=
N' not handled in switch [-Wswitch]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    block/t10-pi.c:62:3: warning: enumeration value 'T10_PI_TYPE0_PROTECTIO=
N' not handled in switch [-Wswitch]
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 31 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.Q0BvXu6HJ6:1432:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Q0BvXu6HJ6:1435:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.Q0BvXu6HJ6:1436:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.Q0BvXu6HJ6:1438:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.Q0BvXu6HJ6:1439:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.Q0BvXu6HJ6:1443:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.Q0BvXu6HJ6:1444:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.Q0BvXu6HJ6:1502:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Q0BvXu6HJ6:1523:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.Q0BvXu6HJ6:1548:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Q0BvXu6HJ6:1552:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.Q0BvXu6HJ6:1660:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Q0BvXu6HJ6:1671:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.Q0BvXu6HJ6:1681:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Q0BvXu6HJ6:1688:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Q0BvXu6HJ6:1691:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.Q0BvXu6HJ6:1692:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.Q0BvXu6HJ6:1694:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.Q0BvXu6HJ6:1695:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.Q0BvXu6HJ6:1696:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Q0BvXu6HJ6:1698:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.Q0BvXu6HJ6:1707:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.Q0BvXu6HJ6:1713:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.Q0BvXu6HJ6:1733:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.Q0BvXu6HJ6:1737:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.Q0BvXu6HJ6:1738:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Q0BvXu6HJ6:1754:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

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
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/configs/omap2plus_defconfig:484:warning: symbol value 'm' inva=
lid for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

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
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    WARNING: "ahci_em_messages" [drivers/ata/libahci] is a static EXPORT_SY=
MBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
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
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/mips/fw/arc/memory.c:163:16: warning: unused variable 'addr' [-Wun=
used-variable]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

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
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, =
0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

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
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

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
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1179:warning: override: UNWINDER_GUESS changes choice state

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
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 32 war=
nings, 0 section mismatches

Warnings:
    ./.tmp.config.xWsco9kjzU:4580:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.xWsco9kjzU:4583:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.xWsco9kjzU:4584:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.xWsco9kjzU:4586:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.xWsco9kjzU:4587:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.xWsco9kjzU:4591:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.xWsco9kjzU:4592:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.xWsco9kjzU:4650:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.xWsco9kjzU:4671:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.xWsco9kjzU:4696:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.xWsco9kjzU:4700:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.xWsco9kjzU:4808:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.xWsco9kjzU:4819:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.xWsco9kjzU:4829:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.xWsco9kjzU:4836:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.xWsco9kjzU:4839:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.xWsco9kjzU:4840:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.xWsco9kjzU:4842:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.xWsco9kjzU:4843:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.xWsco9kjzU:4844:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.xWsco9kjzU:4846:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.xWsco9kjzU:4855:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.xWsco9kjzU:4861:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.xWsco9kjzU:4881:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.xWsco9kjzU:4885:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.xWsco9kjzU:4886:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.xWsco9kjzU:4902:warning: override: reassigning to symbol =
USER_NS
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
