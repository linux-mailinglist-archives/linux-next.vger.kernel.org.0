Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98BE6B3479
	for <lists+linux-next@lfdr.de>; Mon, 16 Sep 2019 07:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbfIPFlD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Sep 2019 01:41:03 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35220 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfIPFlD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Sep 2019 01:41:03 -0400
Received: by mail-wm1-f67.google.com with SMTP id y21so4384910wmi.0
        for <linux-next@vger.kernel.org>; Sun, 15 Sep 2019 22:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4qgoRYyM+W+0i4Oh7KONz2oNiCKFPy4011rrK9d8arY=;
        b=FXeIDLpuBP8jhWwu+NThFbM0vzjzukViuIZYqlONnLSZ7Dw0/bfxFR7gsMmBF9rxyT
         g0kjb3mmSP5rG8g9lnRY2zEzG08UzQnQQWmXiyCY73nCY85x5W8mxaRPb21n/mC0xgTu
         hMwV3R8EX2WFcc5/g8hTRFpOV+40lMyEVnnCuVrIQKrvd6f67dM+KZ/q2YbBeBP40LkT
         k3QM/LwpCPS+Ho2FO8f/VclSjY6Obhtg/XAf4TljnllDXAW/2HxOU4Tbf39XGVvzrOSN
         7BjExooHlUW44aoXkAGlxjEkdJuIMvkWurZNIVTkNpAsUewns9mWc8jx8Iw7u69Ja5X6
         FFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4qgoRYyM+W+0i4Oh7KONz2oNiCKFPy4011rrK9d8arY=;
        b=oDkv2xQAe/VB8+BtsHJEBRwiy1gAs8fonv+SCrIGjQy0Bg/W2RKE2NUJaAjsPbRNFF
         5aD4QMZCXmGJdQhrcdzUGC6BT/6is8nJeU65a08+KLniuF9xyZcafN8JcEFuWtOTZC5R
         Cp7tnDlsm0ZBZK1O9GVGkAVaWMA0y3vLdodR3svxbAguag8+GO1lDXWpp9Cql9jEV02O
         BoUQtefRFc8SW/gczWu7E1sK66j5wbPhU1KBX7OrNRpbCsqPlh8vrKb3ZNLleDAYqubV
         gXAgEJ5UtNxMISckCVK5xKcPmLTdqpWJzVoJwP86c9zpAnVzG5y1qzUd6AkKq6Tflu+L
         ZaLQ==
X-Gm-Message-State: APjAAAWzJC3WSSewIAOjI7FjA9ZvI6RTOCcZczefZ39h7waBiwf/H2Yb
        8TxajhiGjo4vD6FKbRttVQQfo6Tp6vI=
X-Google-Smtp-Source: APXvYqzm8qIhHRXUA60XfaLbFsWPidloDCCNHPnKh0qtT/EuHPXRv8c/AukiC6FYkK9uaZ/W1AOJRw==
X-Received: by 2002:a1c:9c96:: with SMTP id f144mr12921900wme.96.1568612452952;
        Sun, 15 Sep 2019 22:40:52 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z142sm22398787wmc.24.2019.09.15.22.40.51
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Sep 2019 22:40:52 -0700 (PDT)
Message-ID: <5d7f2064.1c69fb81.7cb8f.080e@mx.google.com>
Date:   Sun, 15 Sep 2019 22:40:52 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190915
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
Subject: next/master build: 218 builds: 6 failed, 212 passed, 11 errors,
 640 warnings (next-20190915)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 218 builds: 6 failed, 212 passed, 11 errors, 640 warning=
s (next-20190915)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190915/

Tree: next
Branch: master
Git Describe: next-20190915
Git Commit: 2015a28f2cd57fc46ad14d1a763ca658d82ebc68
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
    allmodconfig (clang-8): 1 error, 9 warnings
    allmodconfig (gcc-8): 1 error
    defconfig (gcc-8): 4 warnings
    defconfig (clang-8): 4 warnings
    defconfig (gcc-8): 4 warnings
    defconfig (gcc-8): 4 warnings
    defconfig (gcc-8): 31 warnings

arm:
    allmodconfig (gcc-8): 1 error
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
    davinci_all_defconfig (gcc-8): 3 warnings
    dove_defconfig (gcc-8): 2 warnings
    em_x270_defconfig (gcc-8): 2 warnings
    ep93xx_defconfig (gcc-8): 2 warnings
    eseries_pxa_defconfig (gcc-8): 2 warnings
    exynos_defconfig (gcc-8): 2 warnings
    ezx_defconfig (gcc-8): 3 warnings
    h3600_defconfig (gcc-8): 1 warning
    h5000_defconfig (gcc-8): 2 warnings
    imote2_defconfig (gcc-8): 3 warnings
    imx_v4_v5_defconfig (gcc-8): 2 warnings
    imx_v6_v7_defconfig (gcc-8): 4 warnings
    integrator_defconfig (gcc-8): 2 warnings
    ixp4xx_defconfig (gcc-8): 2 warnings
    keystone_defconfig (gcc-8): 2 warnings
    lpc32xx_defconfig (gcc-8): 2 warnings
    magician_defconfig (gcc-8): 2 warnings
    milbeaut_m10v_defconfig (gcc-8): 2 warnings
    mini2440_defconfig (gcc-8): 1 error, 3 warnings
    mmp2_defconfig (gcc-8): 2 warnings
    multi_v5_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 30 warnings
    mv78xx0_defconfig (gcc-8): 2 warnings
    mvebu_v5_defconfig (gcc-8): 2 warnings
    mvebu_v7_defconfig (gcc-8): 2 warnings
    mxs_defconfig (gcc-8): 2 warnings
    neponset_defconfig (gcc-8): 1 warning
    nhk8815_defconfig (gcc-8): 4 warnings
    omap1_defconfig (gcc-8): 2 warnings
    omap2plus_defconfig (gcc-8): 3 warnings
    orion5x_defconfig (gcc-8): 2 warnings
    oxnas_v6_defconfig (gcc-8): 2 warnings
    palmz72_defconfig (gcc-8): 2 warnings
    pcm027_defconfig (gcc-8): 2 warnings
    prima2_defconfig (gcc-8): 2 warnings
    pxa168_defconfig (gcc-8): 2 warnings
    pxa3xx_defconfig (gcc-8): 2 warnings
    pxa910_defconfig (gcc-8): 2 warnings
    pxa_defconfig (gcc-8): 1 warning
    qcom_defconfig (gcc-8): 4 warnings
    realview_defconfig (gcc-8): 2 warnings
    s3c2410_defconfig (gcc-8): 1 warning
    s3c6400_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (gcc-8): 2 warnings
    sama5_defconfig (gcc-8): 2 warnings
    shannon_defconfig (gcc-8): 1 warning
    spear13xx_defconfig (gcc-8): 4 warnings
    sunxi_defconfig (gcc-8): 2 warnings
    tango4_defconfig (gcc-8): 3 warnings
    tegra_defconfig (gcc-8): 2 warnings
    trizeps4_defconfig (gcc-8): 2 warnings
    u300_defconfig (gcc-8): 4 warnings
    u8500_defconfig (gcc-8): 2 warnings
    versatile_defconfig (gcc-8): 2 warnings
    vexpress_defconfig (gcc-8): 2 warnings
    viper_defconfig (gcc-8): 2 warnings
    xcep_defconfig (gcc-8): 2 warnings
    zeus_defconfig (gcc-8): 2 warnings

i386:
    i386_defconfig (gcc-8): 30 warnings

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
    lemote2f_defconfig (gcc-8): 6 warnings
    loongson1b_defconfig (gcc-8): 2 warnings
    loongson1c_defconfig (gcc-8): 2 warnings
    loongson3_defconfig (gcc-8): 8 warnings
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
    nlm_xlp_defconfig (gcc-8): 9 warnings
    nlm_xlr_defconfig (gcc-8): 6 warnings
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
    defconfig (gcc-8): 29 warnings
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    allmodconfig (gcc-8): 1 error, 2 warnings
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 29 warnings

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
    48   WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMB=
OL_GPL
    21   WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
    3    arch/mips/fw/arc/memory.c:163:16: warning: unused variable 'addr' =
[-Wunused-variable]
    3    1 warning generated.
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
    1    drivers/usb/gadget/udc/lpc32xx_udc.c:1255:11: warning: cast from p=
ointer to integer of different size [-Wpointer-to-int-cast]
    1    drivers/usb/gadget/udc/lpc32xx_udc.c:1154:11: warning: cast from p=
ointer to integer of different size [-Wpointer-to-int-cast]
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
    1    .config:1178:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.wvT8jGhqkC:8487:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.wvT8jGhqkC:8471:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.wvT8jGhqkC:8470:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.wvT8jGhqkC:8466:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.wvT8jGhqkC:8446:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.wvT8jGhqkC:8440:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.wvT8jGhqkC:8431:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.wvT8jGhqkC:8429:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.wvT8jGhqkC:8428:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.wvT8jGhqkC:8427:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.wvT8jGhqkC:8425:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.wvT8jGhqkC:8424:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.wvT8jGhqkC:8421:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.wvT8jGhqkC:8414:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.wvT8jGhqkC:8404:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.wvT8jGhqkC:8393:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.wvT8jGhqkC:8285:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.wvT8jGhqkC:8281:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.wvT8jGhqkC:8256:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.wvT8jGhqkC:8235:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.wvT8jGhqkC:8177:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.wvT8jGhqkC:8176:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.wvT8jGhqkC:8172:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.wvT8jGhqkC:8171:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.wvT8jGhqkC:8169:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.wvT8jGhqkC:8168:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.wvT8jGhqkC:8165:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.tXMxJASLgn:1753:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.tXMxJASLgn:1737:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.tXMxJASLgn:1736:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.tXMxJASLgn:1732:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.tXMxJASLgn:1712:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.tXMxJASLgn:1706:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.tXMxJASLgn:1697:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.tXMxJASLgn:1695:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.tXMxJASLgn:1694:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.tXMxJASLgn:1693:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.tXMxJASLgn:1691:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.tXMxJASLgn:1690:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.tXMxJASLgn:1687:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.tXMxJASLgn:1680:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.tXMxJASLgn:1670:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.tXMxJASLgn:1659:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.tXMxJASLgn:1551:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.tXMxJASLgn:1547:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.tXMxJASLgn:1522:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.tXMxJASLgn:1501:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.tXMxJASLgn:1443:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.tXMxJASLgn:1442:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.tXMxJASLgn:1438:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.tXMxJASLgn:1437:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.tXMxJASLgn:1435:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.tXMxJASLgn:1434:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.tXMxJASLgn:1431:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.rXijXHTE6j:3370:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.rXijXHTE6j:3354:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.rXijXHTE6j:3353:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.rXijXHTE6j:3349:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.rXijXHTE6j:3329:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.rXijXHTE6j:3323:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.rXijXHTE6j:3314:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.rXijXHTE6j:3312:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.rXijXHTE6j:3311:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.rXijXHTE6j:3310:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.rXijXHTE6j:3308:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.rXijXHTE6j:3307:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.rXijXHTE6j:3304:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.rXijXHTE6j:3297:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.rXijXHTE6j:3287:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.rXijXHTE6j:3276:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.rXijXHTE6j:3168:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.rXijXHTE6j:3164:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.rXijXHTE6j:3139:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.rXijXHTE6j:3118:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.rXijXHTE6j:3060:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.rXijXHTE6j:3059:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.rXijXHTE6j:3055:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.rXijXHTE6j:3054:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.rXijXHTE6j:3052:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.rXijXHTE6j:3051:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.rXijXHTE6j:3048:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.onY6doHBPs:7916:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.onY6doHBPs:7900:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.onY6doHBPs:7899:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.onY6doHBPs:7895:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.onY6doHBPs:7875:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.onY6doHBPs:7869:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.onY6doHBPs:7860:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.onY6doHBPs:7858:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.onY6doHBPs:7857:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.onY6doHBPs:7856:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.onY6doHBPs:7854:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.onY6doHBPs:7853:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.onY6doHBPs:7850:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.onY6doHBPs:7843:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.onY6doHBPs:7833:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.onY6doHBPs:7822:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.onY6doHBPs:7714:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.onY6doHBPs:7710:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.onY6doHBPs:7685:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.onY6doHBPs:7664:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.onY6doHBPs:7606:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.onY6doHBPs:7605:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.onY6doHBPs:7601:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.onY6doHBPs:7600:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.onY6doHBPs:7598:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.onY6doHBPs:7597:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.onY6doHBPs:7594:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ei9gXprhQR:4840:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ei9gXprhQR:4824:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ei9gXprhQR:4823:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.ei9gXprhQR:4819:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.ei9gXprhQR:4799:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.ei9gXprhQR:4793:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.ei9gXprhQR:4784:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.ei9gXprhQR:4782:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ei9gXprhQR:4781:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.ei9gXprhQR:4780:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.ei9gXprhQR:4778:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.ei9gXprhQR:4777:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.ei9gXprhQR:4774:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ei9gXprhQR:4767:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ei9gXprhQR:4757:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.ei9gXprhQR:4746:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ei9gXprhQR:4638:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.ei9gXprhQR:4634:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ei9gXprhQR:4609:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.ei9gXprhQR:4588:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ei9gXprhQR:4530:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.ei9gXprhQR:4529:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.ei9gXprhQR:4525:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.ei9gXprhQR:4524:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.ei9gXprhQR:4522:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.ei9gXprhQR:4521:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.ei9gXprhQR:4518:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.aWKWsFzSWJ:3989:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.aWKWsFzSWJ:3973:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.aWKWsFzSWJ:3972:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.aWKWsFzSWJ:3968:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.aWKWsFzSWJ:3948:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.aWKWsFzSWJ:3942:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.aWKWsFzSWJ:3933:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.aWKWsFzSWJ:3931:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.aWKWsFzSWJ:3930:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.aWKWsFzSWJ:3929:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.aWKWsFzSWJ:3927:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.aWKWsFzSWJ:3926:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.aWKWsFzSWJ:3923:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.aWKWsFzSWJ:3916:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.aWKWsFzSWJ:3906:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.aWKWsFzSWJ:3895:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.aWKWsFzSWJ:3787:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.aWKWsFzSWJ:3783:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.aWKWsFzSWJ:3758:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.aWKWsFzSWJ:3737:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.aWKWsFzSWJ:3679:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.aWKWsFzSWJ:3678:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.aWKWsFzSWJ:3674:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.aWKWsFzSWJ:3673:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.aWKWsFzSWJ:3671:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.aWKWsFzSWJ:3670:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.aWKWsFzSWJ:3667:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.9Gtgrl8QcS:4901:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.9Gtgrl8QcS:4885:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.9Gtgrl8QcS:4884:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.9Gtgrl8QcS:4880:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.9Gtgrl8QcS:4860:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.9Gtgrl8QcS:4854:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.9Gtgrl8QcS:4845:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.9Gtgrl8QcS:4843:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.9Gtgrl8QcS:4842:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.9Gtgrl8QcS:4841:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.9Gtgrl8QcS:4839:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.9Gtgrl8QcS:4838:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.9Gtgrl8QcS:4835:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.9Gtgrl8QcS:4828:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.9Gtgrl8QcS:4818:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.9Gtgrl8QcS:4807:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.9Gtgrl8QcS:4699:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.9Gtgrl8QcS:4695:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.9Gtgrl8QcS:4670:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.9Gtgrl8QcS:4649:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.9Gtgrl8QcS:4591:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.9Gtgrl8QcS:4590:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.9Gtgrl8QcS:4586:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.9Gtgrl8QcS:4585:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.9Gtgrl8QcS:4583:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.9Gtgrl8QcS:4582:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.9Gtgrl8QcS:4579:warning: override: reassigning to sy=
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
    ./.tmp.config.aWKWsFzSWJ:3667:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.aWKWsFzSWJ:3670:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.aWKWsFzSWJ:3671:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.aWKWsFzSWJ:3673:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.aWKWsFzSWJ:3674:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.aWKWsFzSWJ:3678:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.aWKWsFzSWJ:3679:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.aWKWsFzSWJ:3737:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.aWKWsFzSWJ:3758:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.aWKWsFzSWJ:3783:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.aWKWsFzSWJ:3787:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.aWKWsFzSWJ:3895:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.aWKWsFzSWJ:3906:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.aWKWsFzSWJ:3916:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.aWKWsFzSWJ:3923:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.aWKWsFzSWJ:3926:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.aWKWsFzSWJ:3927:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.aWKWsFzSWJ:3929:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.aWKWsFzSWJ:3930:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.aWKWsFzSWJ:3931:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.aWKWsFzSWJ:3933:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.aWKWsFzSWJ:3942:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.aWKWsFzSWJ:3948:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.aWKWsFzSWJ:3968:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.aWKWsFzSWJ:3972:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.aWKWsFzSWJ:3973:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.aWKWsFzSWJ:3989:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 FAIL, 1 error, 9 warnings, 0 sectio=
n mismatches

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

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    collect2: error: ld returned 1 exit status

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    collect2: error: ld returned 1 exit status

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 FAIL, 1 error, 2 warnings, 0 section=
 mismatches

Errors:
    collect2: error: ld returned 1 exit status

Warnings:
    drivers/usb/gadget/udc/lpc32xx_udc.c:1154:11: warning: cast from pointe=
r to integer of different size [-Wpointer-to-int-cast]
    drivers/usb/gadget/udc/lpc32xx_udc.c:1255:11: warning: cast from pointe=
r to integer of different size [-Wpointer-to-int-cast]

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
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    arch/arm/configs/davinci_all_defconfig:231:warning: symbol value 'm' in=
valid for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section mi=
smatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section =
mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 4 warnings, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 4 warnings, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 29 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.rXijXHTE6j:3048:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.rXijXHTE6j:3051:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.rXijXHTE6j:3052:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.rXijXHTE6j:3054:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.rXijXHTE6j:3055:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.rXijXHTE6j:3059:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.rXijXHTE6j:3060:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.rXijXHTE6j:3118:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.rXijXHTE6j:3139:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.rXijXHTE6j:3164:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.rXijXHTE6j:3168:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.rXijXHTE6j:3276:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.rXijXHTE6j:3287:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.rXijXHTE6j:3297:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.rXijXHTE6j:3304:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.rXijXHTE6j:3307:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.rXijXHTE6j:3308:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.rXijXHTE6j:3310:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.rXijXHTE6j:3311:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.rXijXHTE6j:3312:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.rXijXHTE6j:3314:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.rXijXHTE6j:3323:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.rXijXHTE6j:3329:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.rXijXHTE6j:3349:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.rXijXHTE6j:3353:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.rXijXHTE6j:3354:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.rXijXHTE6j:3370:warning: override: reassigning to symbol =
USER_NS
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 31 warnings, 0=
 section mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    ./.tmp.config.onY6doHBPs:7594:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.onY6doHBPs:7597:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.onY6doHBPs:7598:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.onY6doHBPs:7600:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.onY6doHBPs:7601:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.onY6doHBPs:7605:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.onY6doHBPs:7606:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.onY6doHBPs:7664:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.onY6doHBPs:7685:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.onY6doHBPs:7710:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.onY6doHBPs:7714:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.onY6doHBPs:7822:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.onY6doHBPs:7833:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.onY6doHBPs:7843:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.onY6doHBPs:7850:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.onY6doHBPs:7853:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.onY6doHBPs:7854:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.onY6doHBPs:7856:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.onY6doHBPs:7857:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.onY6doHBPs:7858:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.onY6doHBPs:7860:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.onY6doHBPs:7869:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.onY6doHBPs:7875:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.onY6doHBPs:7895:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.onY6doHBPs:7899:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.onY6doHBPs:7900:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.onY6doHBPs:7916:warning: override: reassigning to symbol =
USER_NS
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
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
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 30 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.ei9gXprhQR:4518:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.ei9gXprhQR:4521:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.ei9gXprhQR:4522:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.ei9gXprhQR:4524:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.ei9gXprhQR:4525:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.ei9gXprhQR:4529:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.ei9gXprhQR:4530:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.ei9gXprhQR:4588:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.ei9gXprhQR:4609:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.ei9gXprhQR:4634:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.ei9gXprhQR:4638:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.ei9gXprhQR:4746:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.ei9gXprhQR:4757:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.ei9gXprhQR:4767:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.ei9gXprhQR:4774:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.ei9gXprhQR:4777:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.ei9gXprhQR:4778:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.ei9gXprhQR:4780:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.ei9gXprhQR:4781:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.ei9gXprhQR:4782:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.ei9gXprhQR:4784:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.ei9gXprhQR:4793:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.ei9gXprhQR:4799:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.ei9gXprhQR:4819:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.ei9gXprhQR:4823:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.ei9gXprhQR:4824:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.ei9gXprhQR:4840:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
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
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 s=
ection mismatches

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
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 1 error, 3 warnings, 0 sect=
ion mismatches

Errors:
    "error: actual length %d less than expected %ld\n",

Warnings:
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
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 3 warnings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 =
warnings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 30 warn=
ings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    ./.tmp.config.wvT8jGhqkC:8165:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.wvT8jGhqkC:8168:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.wvT8jGhqkC:8169:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.wvT8jGhqkC:8171:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.wvT8jGhqkC:8172:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.wvT8jGhqkC:8176:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.wvT8jGhqkC:8177:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.wvT8jGhqkC:8235:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.wvT8jGhqkC:8256:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.wvT8jGhqkC:8281:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.wvT8jGhqkC:8285:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.wvT8jGhqkC:8393:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.wvT8jGhqkC:8404:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.wvT8jGhqkC:8414:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.wvT8jGhqkC:8421:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.wvT8jGhqkC:8424:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.wvT8jGhqkC:8425:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.wvT8jGhqkC:8427:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.wvT8jGhqkC:8428:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.wvT8jGhqkC:8429:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.wvT8jGhqkC:8431:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.wvT8jGhqkC:8440:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.wvT8jGhqkC:8446:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.wvT8jGhqkC:8466:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.wvT8jGhqkC:8470:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.wvT8jGhqkC:8471:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.wvT8jGhqkC:8487:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
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
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
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
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 sec=
tion mismatches

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
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
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
    ./.tmp.config.tXMxJASLgn:1431:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.tXMxJASLgn:1434:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.tXMxJASLgn:1435:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.tXMxJASLgn:1437:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.tXMxJASLgn:1438:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.tXMxJASLgn:1442:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.tXMxJASLgn:1443:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.tXMxJASLgn:1501:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.tXMxJASLgn:1522:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.tXMxJASLgn:1547:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.tXMxJASLgn:1551:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.tXMxJASLgn:1659:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.tXMxJASLgn:1670:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.tXMxJASLgn:1680:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.tXMxJASLgn:1687:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.tXMxJASLgn:1690:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.tXMxJASLgn:1691:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.tXMxJASLgn:1693:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.tXMxJASLgn:1694:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.tXMxJASLgn:1695:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.tXMxJASLgn:1697:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.tXMxJASLgn:1706:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.tXMxJASLgn:1712:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.tXMxJASLgn:1732:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.tXMxJASLgn:1736:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.tXMxJASLgn:1737:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.tXMxJASLgn:1753:warning: override: reassigning to symbol =
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
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/configs/omap2plus_defconfig:484:warning: symbol value 'm' inva=
lid for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "fuse_put_request" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
    .config:1178:warning: override: UNWINDER_GUESS changes choice state

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
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 29 war=
nings, 0 section mismatches

Warnings:
    ./.tmp.config.9Gtgrl8QcS:4579:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.9Gtgrl8QcS:4582:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.9Gtgrl8QcS:4583:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.9Gtgrl8QcS:4585:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.9Gtgrl8QcS:4586:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.9Gtgrl8QcS:4590:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.9Gtgrl8QcS:4591:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.9Gtgrl8QcS:4649:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.9Gtgrl8QcS:4670:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.9Gtgrl8QcS:4695:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.9Gtgrl8QcS:4699:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.9Gtgrl8QcS:4807:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.9Gtgrl8QcS:4818:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.9Gtgrl8QcS:4828:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.9Gtgrl8QcS:4835:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.9Gtgrl8QcS:4838:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.9Gtgrl8QcS:4839:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.9Gtgrl8QcS:4841:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.9Gtgrl8QcS:4842:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.9Gtgrl8QcS:4843:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.9Gtgrl8QcS:4845:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.9Gtgrl8QcS:4854:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.9Gtgrl8QcS:4860:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.9Gtgrl8QcS:4880:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.9Gtgrl8QcS:4884:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.9Gtgrl8QcS:4885:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.9Gtgrl8QcS:4901:warning: override: reassigning to symbol =
USER_NS
    WARNING: "fuse_put_request" [fs/fuse/fuse] is a static EXPORT_SYMBOL_GPL
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
