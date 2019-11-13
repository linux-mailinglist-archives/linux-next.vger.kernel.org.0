Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE2E2FAFD2
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2019 12:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727733AbfKMLjT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 13 Nov 2019 06:39:19 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44702 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbfKMLjS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 13 Nov 2019 06:39:18 -0500
Received: by mail-wr1-f67.google.com with SMTP id f2so1945241wrs.11
        for <linux-next@vger.kernel.org>; Wed, 13 Nov 2019 03:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=BPlEk3OEbTpgI22WAwm4/XT0AxVv1LFR0RLtHt8mzgk=;
        b=L46mq8X3J3LwEfgxsisNG21QVUVn7zAByCBxnnyAHBmtEY4su+m87rAgiCdsB5bTTZ
         kiREpCWyUTplbYqWx1s37ZzZFR+jLMg2Bl0Ect8jCR6pv9Vfv7yeXmup6dF+ag3+jagc
         D9TwSxMs/QSDx6qBBycGFi136lNGn+71R3M2MmJCgkJYi1RrfT1vF64kZt/wg616VOnD
         91MojWATbAs8flM1XjN7oxczGDnZtJv+4l86jka626kMcUf5j1pWo+qcoJahTjFHWF//
         Sgxn3Qd8H4FZl4/cTKHQ+sf9l8+K1veJsdnetNF4DpFpR8NHA/BR0dkaeOUIFYqdG2Ti
         ExBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=BPlEk3OEbTpgI22WAwm4/XT0AxVv1LFR0RLtHt8mzgk=;
        b=QX6EfW+p45o+5Anp+KmXM+N+KlxCSGhEVoFKsxTIIxUrULBjK343/x72k7Bvjabu4w
         fhGXzCeaDvsCrVgJYDW80ry7zdXf3CI63T6ftZoGz/z8C626MAM/95R8UuY/kigFx2Mf
         62wBGgtNtbnTovirAy53QvaSGrNKoA+aboPb83DBIpy6asl82j169R15MzZiDcmZR4uc
         lx28Brq5kHpo68UwphsCFccepDfT4yI9I+RSf6AT8FVurGxX667QklbfuzcGg2M9+JHb
         8CzffW/GAQHN02pF0SthCoondjrmZwJc0iC6zqBRHHv0W4W7tzmf85ipTgjEdeJxiuuU
         uJLw==
X-Gm-Message-State: APjAAAWZWoGy/R6bsVIQ+sJJmB2IfJt/abrvid0YezGMYXlLo0l3oQvb
        PV0Rrli5/OAb3KMIVlcJg2i3NKQQoOKLNg==
X-Google-Smtp-Source: APXvYqzKKKtSAtjGZKM0uo5fyNCM92brora5JjaLH6rXHVMHhh6i4B2Do45QTcgjypH5oLWzzv4waw==
X-Received: by 2002:a5d:6cc3:: with SMTP id c3mr2369820wrc.202.1573645145787;
        Wed, 13 Nov 2019 03:39:05 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b3sm1880385wmj.44.2019.11.13.03.39.04
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 03:39:04 -0800 (PST)
Message-ID: <5dcbeb58.1c69fb81.e294c.83ef@mx.google.com>
Date:   Wed, 13 Nov 2019 03:39:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20191113
Subject: next/master build: 212 builds: 2 failed, 210 passed, 5 errors,
 480 warnings (next-20191113)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 212 builds: 2 failed, 210 passed, 5 errors, 480 warnings=
 (next-20191113)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191113/

Tree: next
Branch: master
Git Describe: next-20191113
Git Commit: 4e8f108c3af2d6922a64df9f3d3d488c74f6009d
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    pxa_defconfig: (gcc-8) FAIL

mips:
    cavium_octeon_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 3 warnings
    axs103_smp_defconfig (gcc-8): 3 warnings
    haps_hs_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    hsdk_defconfig (gcc-8): 3 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 2 warnings
    vdk_hs38_smp_defconfig (gcc-8): 2 warnings

arm64:
    allmodconfig (clang-8): 51 warnings
    allmodconfig (gcc-8): 1 warning
    defconfig (gcc-8): 29 warnings

arm:
    allmodconfig (gcc-8): 20 warnings
    am200epdkit_defconfig (gcc-8): 1 warning
    aspeed_g4_defconfig (gcc-8): 1 warning
    aspeed_g5_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (gcc-8): 3 warnings
    axm55xx_defconfig (gcc-8): 2 warnings
    badge4_defconfig (gcc-8): 1 warning
    bcm2835_defconfig (gcc-8): 1 warning
    cerfcube_defconfig (gcc-8): 1 warning
    cm_x2xx_defconfig (gcc-8): 2 warnings
    cm_x300_defconfig (gcc-8): 3 warnings
    cns3420vb_defconfig (gcc-8): 1 warning
    colibri_pxa270_defconfig (gcc-8): 1 warning
    colibri_pxa300_defconfig (gcc-8): 2 warnings
    davinci_all_defconfig (gcc-8): 3 warnings
    dove_defconfig (gcc-8): 2 warnings
    em_x270_defconfig (gcc-8): 2 warnings
    ep93xx_defconfig (gcc-8): 2 warnings
    eseries_pxa_defconfig (gcc-8): 2 warnings
    exynos_defconfig (gcc-8): 2 warnings
    ezx_defconfig (gcc-8): 2 warnings
    h5000_defconfig (gcc-8): 1 warning
    hisi_defconfig (gcc-8): 1 warning
    imote2_defconfig (gcc-8): 2 warnings
    imx_v4_v5_defconfig (gcc-8): 3 warnings
    imx_v6_v7_defconfig (gcc-8): 2 warnings
    integrator_defconfig (gcc-8): 1 warning
    iop32x_defconfig (gcc-8): 1 warning
    ixp4xx_defconfig (gcc-8): 2 warnings
    keystone_defconfig (gcc-8): 3 warnings
    lart_defconfig (gcc-8): 1 warning
    lpc32xx_defconfig (gcc-8): 2 warnings
    magician_defconfig (gcc-8): 1 warning
    milbeaut_m10v_defconfig (gcc-8): 2 warnings
    mini2440_defconfig (gcc-8): 2 warnings
    mmp2_defconfig (gcc-8): 2 warnings
    moxart_defconfig (gcc-8): 1 warning
    multi_v5_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 32 warnings
    mv78xx0_defconfig (gcc-8): 2 warnings
    mvebu_v5_defconfig (gcc-8): 2 warnings
    mvebu_v7_defconfig (gcc-8): 3 warnings
    mxs_defconfig (gcc-8): 3 warnings
    nhk8815_defconfig (gcc-8): 2 warnings
    omap1_defconfig (gcc-8): 2 warnings
    omap2plus_defconfig (gcc-8): 2 warnings
    orion5x_defconfig (gcc-8): 2 warnings
    oxnas_v6_defconfig (gcc-8): 3 warnings
    palmz72_defconfig (gcc-8): 2 warnings
    pcm027_defconfig (gcc-8): 2 warnings
    prima2_defconfig (gcc-8): 1 warning
    pxa168_defconfig (gcc-8): 1 warning
    pxa910_defconfig (gcc-8): 1 warning
    pxa_defconfig (gcc-8): 1 error
    qcom_defconfig (gcc-8): 2 warnings
    realview_defconfig (gcc-8): 1 warning
    rpc_defconfig (gcc-8): 1 warning
    s3c2410_defconfig (gcc-8): 1 warning
    s3c6400_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (gcc-8): 2 warnings
    sama5_defconfig (gcc-8): 3 warnings
    simpad_defconfig (gcc-8): 1 warning
    socfpga_defconfig (gcc-8): 1 warning
    spear13xx_defconfig (gcc-8): 2 warnings
    spear3xx_defconfig (gcc-8): 1 warning
    spear6xx_defconfig (gcc-8): 1 warning
    spitz_defconfig (gcc-8): 1 warning
    stm32_defconfig (gcc-8): 1 warning
    sunxi_defconfig (gcc-8): 2 warnings
    tango4_defconfig (gcc-8): 2 warnings
    tegra_defconfig (gcc-8): 2 warnings
    trizeps4_defconfig (gcc-8): 2 warnings
    u300_defconfig (gcc-8): 1 warning
    u8500_defconfig (gcc-8): 2 warnings
    versatile_defconfig (gcc-8): 1 warning
    vexpress_defconfig (gcc-8): 3 warnings
    vf610m4_defconfig (gcc-8): 1 warning
    viper_defconfig (gcc-8): 2 warnings
    vt8500_v6_v7_defconfig (gcc-8): 1 warning
    xcep_defconfig (gcc-8): 1 warning
    zeus_defconfig (gcc-8): 2 warnings
    zx_defconfig (gcc-8): 1 warning

i386:
    i386_defconfig (gcc-8): 30 warnings

mips:
    32r2el_defconfig (gcc-8): 2 warnings
    32r2el_defconfig (gcc-8): 32 warnings
    bmips_be_defconfig (gcc-8): 1 warning
    bmips_stb_defconfig (gcc-8): 1 warning
    capcella_defconfig (gcc-8): 1 warning
    cavium_octeon_defconfig (gcc-8): 4 errors, 4 warnings
    ci20_defconfig (gcc-8): 2 warnings
    cobalt_defconfig (gcc-8): 1 warning
    db1xxx_defconfig (gcc-8): 1 warning
    decstation_64_defconfig (gcc-8): 1 warning
    decstation_defconfig (gcc-8): 1 warning
    decstation_r4k_defconfig (gcc-8): 1 warning
    e55_defconfig (gcc-8): 1 warning
    fuloong2e_defconfig (gcc-8): 1 warning
    ip27_defconfig (gcc-8): 1 warning
    jazz_defconfig (gcc-8): 1 warning
    lasat_defconfig (gcc-8): 1 warning
    loongson1b_defconfig (gcc-8): 2 warnings
    loongson1c_defconfig (gcc-8): 2 warnings
    malta_defconfig (gcc-8): 1 warning
    malta_kvm_defconfig (gcc-8): 1 warning
    malta_kvm_guest_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    maltaup_xpa_defconfig (gcc-8): 1 warning
    markeins_defconfig (gcc-8): 1 warning
    mips_paravirt_defconfig (gcc-8): 1 warning
    nlm_xlp_defconfig (gcc-8): 1 warning
    nlm_xlr_defconfig (gcc-8): 1 warning
    pic32mzda_defconfig (gcc-8): 1 warning
    pistachio_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 2 warnings
    rbtx49xx_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 1 warning
    tb0219_defconfig (gcc-8): 1 warning
    tb0287_defconfig (gcc-8): 1 warning
    workpad_defconfig (gcc-8): 1 warning

riscv:
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 30 warnings
    rv32_defconfig (gcc-8): 7 warnings

x86_64:
    allmodconfig (gcc-8): 2 warnings
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
    1    arch/arm/mach-pxa/icontrol.c:92:23: error: 'mcp251x_info' undeclar=
ed here (not in a function); did you mean 'mcp251x_board_info'?

Warnings summary:

    103  fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-=
variable]
    63   WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    36   drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wu=
nused-variable]
    20   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    16   1 warning generated.
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    5    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argu=
ment of type 'long unsigned int', but argument 5 has type 'unsigned int' [-=
Wformat=3D]
    5    2 warnings generated.
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:134: Warning: macro instruction expanded into mul=
tiple instructions
    1    warning: same module names found:
    1    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable 'rtd' [-=
Wunused-variable]
    1    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitia=
lized when used within its own initialization [-Wuninitialized]
    1    mm/shmem.c:2737:35: warning: variable 'shmem_falloc_waitq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    lib/cpumask.c:302:1: warning: the frame size of 5280 bytes is larg=
er than 2048 bytes [-Wframe-larger-than=3D]
    1    include/linux/kern_levels.h:5:18: warning: format '%ld' expects ar=
gument of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned =
int'} [-Wformat=3D]
    1    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    1    fs/proc/base.c:1894:35: warning: variable 'wq' is uninitialized wh=
en used within its own initialization [-Wuninitialized]
    1    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when=
 used within its own initialization [-Wuninitialized]
    1    fs/namei.c:3132:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    fs/namei.c:1644:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized =
when used within its own initialization [-Wuninitialized]
    1    fs/cifs/readdir.c:83:34: warning: variable 'wq' is uninitialized w=
hen used within its own initialization [-Wuninitialized]
    1    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized=
 when used within its own initialization [-Wuninitialized]
    1    drivers/staging/octeon/octeon-ethernet.h:94:12: warning: 'union cv=
mx_helper_link_info' declared inside parameter list will not be visible out=
side of this definition or declaration
    1    drivers/staging/octeon/ethernet.c:499:30: warning: unused variable=
 'link_info' [-Wunused-variable]
    1    drivers/staging/octeon/ethernet.c:463:30: warning: unused variable=
 'link_info' [-Wunused-variable]
    1    drivers/scsi/lpfc/lpfc_sli.c:11909:34: warning: variable 'done_q' =
is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/lpfc/lpfc_scsi.c:4726:34: warning: variable 'waitq' i=
s uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1    drivers/net/usb/lan78xx.c:2665:34: warning: variable 'unlink_wakeu=
p' is uninitialized when used within its own initialization [-Wuninitialize=
d]
    1    drivers/net/phy/mdio-octeon.c:48:3: warning: cast from pointer to =
integer of different size [-Wpointer-to-int-cast]
    1    drivers/misc/mic/vop/vop_vringh.c:399:34: warning: variable 'wake'=
 is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/misc/mic/vop/vop_vringh.c:155:34: warning: variable 'wake'=
 is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:303=
:53: warning: suggest braces around initialization of subobject [-Wmissing-=
braces]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:112=
:62: warning: suggest braces around initialization of subobject [-Wmissing-=
braces]
    1    drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:297:4=
1: warning: suggest braces around initialization of subobject [-Wmissing-br=
aces]
    1    drivers/bus/fsl-mc/fsl-mc-bus.c:720:37: warning: suggest braces ar=
ound initialization of subobject [-Wmissing-braces]
    1    drivers/bus/fsl-mc/fsl-mc-bus.c:719:37: warning: suggest braces ar=
ound initialization of subobject [-Wmissing-braces]
    1    drivers/bus/fsl-mc/fsl-mc-bus.c:718:43: warning: suggest braces ar=
ound initialization of subobject [-Wmissing-braces]
    1    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/android/binderfs.c:657:41: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    1    3 warnings generated.
    1    /tmp/ccZzZ5o7.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccZzZ5o7.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1169:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.VW7Zrd6lQJ:4844:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VW7Zrd6lQJ:4827:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.VW7Zrd6lQJ:4826:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.VW7Zrd6lQJ:4822:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.VW7Zrd6lQJ:4802:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.VW7Zrd6lQJ:4796:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.VW7Zrd6lQJ:4787:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.VW7Zrd6lQJ:4785:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.VW7Zrd6lQJ:4784:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.VW7Zrd6lQJ:4783:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.VW7Zrd6lQJ:4781:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.VW7Zrd6lQJ:4780:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.VW7Zrd6lQJ:4777:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.VW7Zrd6lQJ:4770:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.VW7Zrd6lQJ:4760:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.VW7Zrd6lQJ:4749:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VW7Zrd6lQJ:4641:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.VW7Zrd6lQJ:4637:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VW7Zrd6lQJ:4611:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.VW7Zrd6lQJ:4590:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.VW7Zrd6lQJ:4582:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.VW7Zrd6lQJ:4578:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.VW7Zrd6lQJ:4523:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.VW7Zrd6lQJ:4522:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.VW7Zrd6lQJ:4518:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.VW7Zrd6lQJ:4517:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.VW7Zrd6lQJ:4515:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.VW7Zrd6lQJ:4514:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.VW7Zrd6lQJ:4511:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.VSTjVcVcbj:4008:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VSTjVcVcbj:3991:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.VSTjVcVcbj:3990:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.VSTjVcVcbj:3986:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.VSTjVcVcbj:3966:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.VSTjVcVcbj:3960:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.VSTjVcVcbj:3951:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.VSTjVcVcbj:3949:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.VSTjVcVcbj:3948:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.VSTjVcVcbj:3947:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.VSTjVcVcbj:3945:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.VSTjVcVcbj:3944:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.VSTjVcVcbj:3941:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.VSTjVcVcbj:3934:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.VSTjVcVcbj:3924:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.VSTjVcVcbj:3913:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VSTjVcVcbj:3805:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.VSTjVcVcbj:3801:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VSTjVcVcbj:3775:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.VSTjVcVcbj:3754:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.VSTjVcVcbj:3746:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.VSTjVcVcbj:3742:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.VSTjVcVcbj:3687:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.VSTjVcVcbj:3686:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.VSTjVcVcbj:3682:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.VSTjVcVcbj:3681:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.VSTjVcVcbj:3679:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.VSTjVcVcbj:3678:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.VSTjVcVcbj:3675:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.UcxnCzpE3a:3381:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.UcxnCzpE3a:3364:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.UcxnCzpE3a:3363:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.UcxnCzpE3a:3359:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.UcxnCzpE3a:3339:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.UcxnCzpE3a:3333:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.UcxnCzpE3a:3324:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.UcxnCzpE3a:3322:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.UcxnCzpE3a:3321:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.UcxnCzpE3a:3320:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.UcxnCzpE3a:3318:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.UcxnCzpE3a:3317:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.UcxnCzpE3a:3314:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.UcxnCzpE3a:3307:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.UcxnCzpE3a:3297:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.UcxnCzpE3a:3286:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.UcxnCzpE3a:3178:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.UcxnCzpE3a:3174:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.UcxnCzpE3a:3148:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.UcxnCzpE3a:3127:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.UcxnCzpE3a:3119:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.UcxnCzpE3a:3115:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.UcxnCzpE3a:3060:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.UcxnCzpE3a:3059:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.UcxnCzpE3a:3055:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.UcxnCzpE3a:3054:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.UcxnCzpE3a:3052:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.UcxnCzpE3a:3051:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.UcxnCzpE3a:3048:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.E0lKvLnGGy:8018:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.E0lKvLnGGy:8001:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.E0lKvLnGGy:8000:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.E0lKvLnGGy:7996:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.E0lKvLnGGy:7976:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.E0lKvLnGGy:7970:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.E0lKvLnGGy:7961:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.E0lKvLnGGy:7959:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.E0lKvLnGGy:7958:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.E0lKvLnGGy:7957:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.E0lKvLnGGy:7955:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.E0lKvLnGGy:7954:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.E0lKvLnGGy:7951:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.E0lKvLnGGy:7944:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.E0lKvLnGGy:7934:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.E0lKvLnGGy:7923:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.E0lKvLnGGy:7815:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.E0lKvLnGGy:7811:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.E0lKvLnGGy:7785:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.E0lKvLnGGy:7764:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.E0lKvLnGGy:7756:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.E0lKvLnGGy:7752:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.E0lKvLnGGy:7697:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.E0lKvLnGGy:7696:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.E0lKvLnGGy:7692:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.E0lKvLnGGy:7691:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.E0lKvLnGGy:7689:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.E0lKvLnGGy:7688:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.E0lKvLnGGy:7685:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.4ueO7OGaA4:4907:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.4ueO7OGaA4:4890:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.4ueO7OGaA4:4889:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.4ueO7OGaA4:4885:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.4ueO7OGaA4:4865:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.4ueO7OGaA4:4859:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.4ueO7OGaA4:4850:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.4ueO7OGaA4:4848:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.4ueO7OGaA4:4847:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.4ueO7OGaA4:4846:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.4ueO7OGaA4:4844:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.4ueO7OGaA4:4843:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.4ueO7OGaA4:4840:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.4ueO7OGaA4:4833:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.4ueO7OGaA4:4823:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.4ueO7OGaA4:4812:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.4ueO7OGaA4:4704:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.4ueO7OGaA4:4700:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.4ueO7OGaA4:4674:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.4ueO7OGaA4:4653:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.4ueO7OGaA4:4645:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.4ueO7OGaA4:4641:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.4ueO7OGaA4:4586:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.4ueO7OGaA4:4585:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.4ueO7OGaA4:4581:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.4ueO7OGaA4:4580:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.4ueO7OGaA4:4578:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.4ueO7OGaA4:4577:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.4ueO7OGaA4:4574:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.1QFAjgFLFe:8624:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.1QFAjgFLFe:8607:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.1QFAjgFLFe:8606:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.1QFAjgFLFe:8602:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.1QFAjgFLFe:8582:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.1QFAjgFLFe:8576:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.1QFAjgFLFe:8567:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.1QFAjgFLFe:8565:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.1QFAjgFLFe:8564:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.1QFAjgFLFe:8563:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.1QFAjgFLFe:8561:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.1QFAjgFLFe:8560:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.1QFAjgFLFe:8557:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.1QFAjgFLFe:8550:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.1QFAjgFLFe:8540:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.1QFAjgFLFe:8529:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.1QFAjgFLFe:8421:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.1QFAjgFLFe:8417:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.1QFAjgFLFe:8391:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.1QFAjgFLFe:8370:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.1QFAjgFLFe:8362:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.1QFAjgFLFe:8358:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.1QFAjgFLFe:8303:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.1QFAjgFLFe:8302:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.1QFAjgFLFe:8298:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.1QFAjgFLFe:8297:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.1QFAjgFLFe:8295:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.1QFAjgFLFe:8294:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.1QFAjgFLFe:8291:warning: override: reassigning to sy=
mbol BPF_SYSCALL

Section mismatches summary:

    5    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    3    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x7c8): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x710): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x3980): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    1    WARNING: vmlinux.o(.text.unlikely+0x363c): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 32 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.VSTjVcVcbj:3675:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.VSTjVcVcbj:3678:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.VSTjVcVcbj:3679:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.VSTjVcVcbj:3681:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.VSTjVcVcbj:3682:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.VSTjVcVcbj:3686:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.VSTjVcVcbj:3687:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.VSTjVcVcbj:3742:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.VSTjVcVcbj:3746:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.VSTjVcVcbj:3754:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.VSTjVcVcbj:3775:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.VSTjVcVcbj:3801:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.VSTjVcVcbj:3805:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.VSTjVcVcbj:3913:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.VSTjVcVcbj:3924:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.VSTjVcVcbj:3934:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.VSTjVcVcbj:3941:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.VSTjVcVcbj:3944:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.VSTjVcVcbj:3945:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.VSTjVcVcbj:3947:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.VSTjVcVcbj:3948:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.VSTjVcVcbj:3949:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.VSTjVcVcbj:3951:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.VSTjVcVcbj:3960:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.VSTjVcVcbj:3966:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.VSTjVcVcbj:3986:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.VSTjVcVcbj:3990:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.VSTjVcVcbj:3991:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.VSTjVcVcbj:4008:warning: override: reassigning to symbol =
USER_NS
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 51 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/android/binderfs.c:657:41: warning: suggest braces around initi=
alization of subobject [-Wmissing-braces]
    1 warning generated.
    mm/shmem.c:2737:35: warning: variable 'shmem_falloc_waitq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/bus/fsl-mc/fsl-mc-bus.c:718:43: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    drivers/bus/fsl-mc/fsl-mc-bus.c:719:37: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    drivers/bus/fsl-mc/fsl-mc-bus.c:720:37: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    3 warnings generated.
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
    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized when=
 used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/cifs/readdir.c:83:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1 warning generated.
    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitialized=
 when used within its own initialization [-Wuninitialized]
    1 warning generated.
    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when used =
within its own initialization [-Wuninitialized]
    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when used=
 within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/misc/mic/vop/vop_vringh.c:155:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    drivers/misc/mic/vop/vop_vringh.c:399:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    1 warning generated.
    drivers/net/usb/lan78xx.c:2665:34: warning: variable 'unlink_wakeup' is=
 uninitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/scsi/lpfc/lpfc_sli.c:11909:34: warning: variable 'done_q' is un=
initialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/scsi/lpfc/lpfc_scsi.c:4726:34: warning: variable 'waitq' is uni=
nitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:112:62: =
warning: suggest braces around initialization of subobject [-Wmissing-brace=
s]
    drivers/gpu/drm/amd/amdgpu/../display/dc/bios/command_table2.c:303:53: =
warning: suggest braces around initialization of subobject [-Wmissing-brace=
s]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../display/dc/bios/bios_parser2.c:297:41: wa=
rning: suggest braces around initialization of subobject [-Wmissing-braces]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    lib/cpumask.c:302:1: warning: the frame size of 5280 bytes is larger th=
an 2048 bytes [-Wframe-larger-than=3D]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 20 warnings, 0 section =
mismatches

Warnings:
    /tmp/ccZzZ5o7.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccZzZ5o7.s:18191: Warning: using r15 results in unpredictable beha=
viour
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
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
    include/linux/kern_levels.h:5:18: warning: format '%ld' expects argumen=
t of type 'long int', but argument 5 has type 'size_t' {aka 'unsigned int'}=
 [-Wformat=3D]
    warning: same module names found:

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
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

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
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
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
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 4 errors, 4 warnings,=
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
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/staging/octeon/octeon-ethernet.h:94:12: warning: 'union cvmx_he=
lper_link_info' declared inside parameter list will not be visible outside =
of this definition or declaration
    drivers/staging/octeon/ethernet.c:463:30: warning: unused variable 'lin=
k_info' [-Wunused-variable]
    drivers/staging/octeon/ethernet.c:499:30: warning: unused variable 'lin=
k_info' [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3980): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x363c): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 30 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.UcxnCzpE3a:3048:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.UcxnCzpE3a:3051:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.UcxnCzpE3a:3052:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.UcxnCzpE3a:3054:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.UcxnCzpE3a:3055:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.UcxnCzpE3a:3059:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.UcxnCzpE3a:3060:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.UcxnCzpE3a:3115:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.UcxnCzpE3a:3119:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.UcxnCzpE3a:3127:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.UcxnCzpE3a:3148:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.UcxnCzpE3a:3174:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.UcxnCzpE3a:3178:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.UcxnCzpE3a:3286:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.UcxnCzpE3a:3297:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.UcxnCzpE3a:3307:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.UcxnCzpE3a:3314:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.UcxnCzpE3a:3317:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.UcxnCzpE3a:3318:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.UcxnCzpE3a:3320:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.UcxnCzpE3a:3321:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.UcxnCzpE3a:3322:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.UcxnCzpE3a:3324:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.UcxnCzpE3a:3333:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.UcxnCzpE3a:3339:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.UcxnCzpE3a:3359:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.UcxnCzpE3a:3363:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.UcxnCzpE3a:3364:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.UcxnCzpE3a:3381:warning: override: reassigning to symbol =
USER_NS
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 29 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.E0lKvLnGGy:7685:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.E0lKvLnGGy:7688:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.E0lKvLnGGy:7689:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.E0lKvLnGGy:7691:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.E0lKvLnGGy:7692:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.E0lKvLnGGy:7696:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.E0lKvLnGGy:7697:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.E0lKvLnGGy:7752:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.E0lKvLnGGy:7756:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.E0lKvLnGGy:7764:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.E0lKvLnGGy:7785:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.E0lKvLnGGy:7811:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.E0lKvLnGGy:7815:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.E0lKvLnGGy:7923:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.E0lKvLnGGy:7934:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.E0lKvLnGGy:7944:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.E0lKvLnGGy:7951:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.E0lKvLnGGy:7954:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.E0lKvLnGGy:7955:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.E0lKvLnGGy:7957:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.E0lKvLnGGy:7958:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.E0lKvLnGGy:7959:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.E0lKvLnGGy:7961:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.E0lKvLnGGy:7970:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.E0lKvLnGGy:7976:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.E0lKvLnGGy:7996:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.E0lKvLnGGy:8000:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.E0lKvLnGGy:8001:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.E0lKvLnGGy:8018:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
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
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
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
    ./.tmp.config.VW7Zrd6lQJ:4511:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.VW7Zrd6lQJ:4514:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.VW7Zrd6lQJ:4515:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.VW7Zrd6lQJ:4517:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.VW7Zrd6lQJ:4518:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.VW7Zrd6lQJ:4522:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.VW7Zrd6lQJ:4523:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.VW7Zrd6lQJ:4578:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.VW7Zrd6lQJ:4582:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.VW7Zrd6lQJ:4590:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.VW7Zrd6lQJ:4611:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.VW7Zrd6lQJ:4637:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.VW7Zrd6lQJ:4641:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.VW7Zrd6lQJ:4749:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.VW7Zrd6lQJ:4760:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.VW7Zrd6lQJ:4770:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.VW7Zrd6lQJ:4777:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.VW7Zrd6lQJ:4780:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.VW7Zrd6lQJ:4781:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.VW7Zrd6lQJ:4783:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.VW7Zrd6lQJ:4784:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.VW7Zrd6lQJ:4785:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.VW7Zrd6lQJ:4787:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.VW7Zrd6lQJ:4796:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.VW7Zrd6lQJ:4802:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.VW7Zrd6lQJ:4822:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.VW7Zrd6lQJ:4826:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.VW7Zrd6lQJ:4827:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.VW7Zrd6lQJ:4844:warning: override: reassigning to symbol =
USER_NS
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

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
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
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
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

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
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 3 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 =
warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 32 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.1QFAjgFLFe:8291:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.1QFAjgFLFe:8294:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.1QFAjgFLFe:8295:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.1QFAjgFLFe:8297:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.1QFAjgFLFe:8298:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.1QFAjgFLFe:8302:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.1QFAjgFLFe:8303:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.1QFAjgFLFe:8358:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.1QFAjgFLFe:8362:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.1QFAjgFLFe:8370:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.1QFAjgFLFe:8391:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.1QFAjgFLFe:8417:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.1QFAjgFLFe:8421:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.1QFAjgFLFe:8529:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.1QFAjgFLFe:8540:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.1QFAjgFLFe:8550:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.1QFAjgFLFe:8557:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.1QFAjgFLFe:8560:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.1QFAjgFLFe:8561:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.1QFAjgFLFe:8563:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.1QFAjgFLFe:8564:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.1QFAjgFLFe:8565:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.1QFAjgFLFe:8567:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.1QFAjgFLFe:8576:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.1QFAjgFLFe:8582:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.1QFAjgFLFe:8602:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.1QFAjgFLFe:8606:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.1QFAjgFLFe:8607:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.1QFAjgFLFe:8624:warning: override: reassigning to symbol =
USER_NS
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
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
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
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
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

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
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section m=
ismatches

Errors:
    arch/arm/mach-pxa/icontrol.c:92:23: error: 'mcp251x_info' undeclared he=
re (not in a function); did you mean 'mcp251x_board_info'?

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

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
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
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
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
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
    .config:1169:warning: override: UNWINDER_GUESS changes choice state

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
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 29 war=
nings, 0 section mismatches

Warnings:
    ./.tmp.config.4ueO7OGaA4:4574:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.4ueO7OGaA4:4577:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.4ueO7OGaA4:4578:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.4ueO7OGaA4:4580:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.4ueO7OGaA4:4581:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.4ueO7OGaA4:4585:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.4ueO7OGaA4:4586:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.4ueO7OGaA4:4641:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.4ueO7OGaA4:4645:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.4ueO7OGaA4:4653:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.4ueO7OGaA4:4674:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.4ueO7OGaA4:4700:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.4ueO7OGaA4:4704:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.4ueO7OGaA4:4812:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.4ueO7OGaA4:4823:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.4ueO7OGaA4:4833:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.4ueO7OGaA4:4840:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.4ueO7OGaA4:4843:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.4ueO7OGaA4:4844:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.4ueO7OGaA4:4846:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.4ueO7OGaA4:4847:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.4ueO7OGaA4:4848:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.4ueO7OGaA4:4850:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.4ueO7OGaA4:4859:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.4ueO7OGaA4:4865:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.4ueO7OGaA4:4885:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.4ueO7OGaA4:4889:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.4ueO7OGaA4:4890:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.4ueO7OGaA4:4907:warning: override: reassigning to symbol =
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
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---
For more info write to <info@kernelci.org>
