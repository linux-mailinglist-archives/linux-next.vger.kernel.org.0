Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07485E1CDA
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2019 15:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390754AbfJWNiP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Oct 2019 09:38:15 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51219 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732361AbfJWNiP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 23 Oct 2019 09:38:15 -0400
Received: by mail-wm1-f68.google.com with SMTP id q70so14117393wme.1
        for <linux-next@vger.kernel.org>; Wed, 23 Oct 2019 06:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=9FpvCUs16EcM0vg2lITdxUMQ/ioPNLsQs/Skze8DVyA=;
        b=a+s8MDDemJwDJzxcF7vCehYiRDtBels6EsZClDFW5ajFVnJsCQ898IBF1d/MZh+X4r
         XNAGp5V+UCNsudDKfdOGAVv+bSqK4FJj5HjjrL2e3osXdzxj8VHNOeIfM80DoyYgwrcD
         8G2XiGYYmQMGXEY+DzQukbfT61yrDtDJbR75lvCDZ4iR2lLyG4BUJg3lkqpCtc+ZXBQE
         /A1cqQBp6Sr2JKd9TgDl0jWfU5mEW++TW/PWMbOfpVMENtB/0ilvcc1CM9o6INxxea8V
         cF+CFmaMx6Q9jAcadKMHMDNgKnTLaitsOxYCTQ7Vc8PMHzHcC2Z8IB2z2y/e8iZ9Qk0t
         hKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=9FpvCUs16EcM0vg2lITdxUMQ/ioPNLsQs/Skze8DVyA=;
        b=d5LYxIhqyZkT+UGydXcFxP4AHYP31i1ETxKmSClpbiMR/1Z3eqN7eA0+an+lul85aI
         6sR+2osQpg7TAxrISdmTcoAngo1adZ7arjWmVxx0TCixJfXsUcJl2JKW4PAov7DK9d0w
         nxs8ISiSsyd3Tgia7sySL5s1nIjZaK/pfil5/zE80EMKTarEDzHWT/wLeU+kplx08d0U
         9vNOkIuzZU1kRStOOULWd6Tb4FmJu6RkuGHKGjd+aWGd5HOCS4k7iFrXdpMq3niOKcoE
         +PfnDROh+Y5EXZIdZr+/NS1odfgUDm1auOUbNcmshir9FXnZRZ85Y7iACtDzOTwbhv8G
         Y67g==
X-Gm-Message-State: APjAAAUWpil4LwG/PXrsade5wyvAWDTNeEsp7IWll+JCG0U6cK9WBsWL
        FN5JS1vQlPxfHsUEJntGcY/gJMMF6G/VUA==
X-Google-Smtp-Source: APXvYqx6x3GvLwbWa4Tt7Ejw6BnKblXOOdPlVOrLNLNTOQ2zPcxDD9eNG+mE8/j2wDhtNczy9nrXYw==
X-Received: by 2002:a1c:a546:: with SMTP id o67mr8073278wme.57.1571837885758;
        Wed, 23 Oct 2019 06:38:05 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id v9sm7627703wro.51.2019.10.23.06.38.04
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2019 06:38:04 -0700 (PDT)
Message-ID: <5db057bc.1c69fb81.f62a1.93bf@mx.google.com>
Date:   Wed, 23 Oct 2019 06:38:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20191023
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 219 builds: 3 failed, 216 passed, 22 errors,
 385 warnings (next-20191023)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 219 builds: 3 failed, 216 passed, 22 errors, 385 warning=
s (next-20191023)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191023/

Tree: next
Branch: master
Git Describe: next-20191023
Git Commit: f3c452cfc59c817950b150b51ec2b33409d7640b
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-8) FAIL
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
    nsim_hs_defconfig (gcc-8): 2 warnings
    nsim_hs_defconfig (gcc-8): 30 warnings
    nsim_hs_smp_defconfig (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (clang-8): 9 errors, 48 warnings
    allmodconfig (gcc-8): 9 errors, 2 warnings
    defconfig (gcc-8): 27 warnings

arm:
    allmodconfig (gcc-8): 19 warnings
    am200epdkit_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (gcc-8): 1 warning
    axm55xx_defconfig (gcc-8): 1 warning
    bcm2835_defconfig (gcc-8): 3 warnings
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
    multi_v7_defconfig (gcc-8): 28 warnings
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
    i386_defconfig (gcc-8): 28 warnings

mips:
    32r2el_defconfig (gcc-8): 28 warnings
    cavium_octeon_defconfig (gcc-8): 4 errors, 3 warnings
    db1xxx_defconfig (gcc-8): 1 warning
    ip27_defconfig (gcc-8): 2 warnings
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    nlm_xlp_defconfig (gcc-8): 2 warnings
    nlm_xlr_defconfig (gcc-8): 3 warnings
    rbtx49xx_defconfig (gcc-8): 1 warning

riscv:
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 29 warnings
    rv32_defconfig (gcc-8): 8 warnings

x86_64:
    allmodconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 27 warnings

Errors summary:

    2    ERROR: "dpdmai_set_rx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdm=
a.ko] undefined!
    2    ERROR: "dpdmai_reset" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] u=
ndefined!
    2    ERROR: "dpdmai_open" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] un=
defined!
    2    ERROR: "dpdmai_get_tx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdm=
a.ko] undefined!
    2    ERROR: "dpdmai_get_rx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdm=
a.ko] undefined!
    2    ERROR: "dpdmai_get_attributes" [drivers/dma/fsl-dpaa2-qdma/dpaa2-q=
dma.ko] undefined!
    2    ERROR: "dpdmai_enable" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] =
undefined!
    2    ERROR: "dpdmai_disable" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko]=
 undefined!
    2    ERROR: "dpdmai_close" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] u=
ndefined!
    1    drivers/staging/octeon/ethernet.c:516:29: error: type of formal pa=
rameter 2 is incomplete
    1    drivers/staging/octeon/ethernet.c:499:30: error: storage size of '=
link_info' isn't known
    1    drivers/staging/octeon/ethernet.c:463:30: error: storage size of '=
link_info' isn't known
    1    drivers/staging/octeon/ethernet.c:177:21: error: dereferencing poi=
nter to incomplete type 'struct cvmx_wqe'

Warnings summary:

    64   WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    26   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    16   1 warning generated.
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    6    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunu=
sed-variable]
    6    include/linux/kern_levels.h:5:18: warning: format '%lu' expects ar=
gument of type 'long unsigned int', but argument 8 has type 'unsigned int' =
[-Wformat=3D]
    6    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e100=
0e_s0ix_exit_flow' defined but not used [-Wunused-function]
    6    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e100=
0e_s0ix_entry_flow' defined but not used [-Wunused-function]
    5    2 warnings generated.
    4    sound/soc/codecs/rt5677-spi.c:114:30: warning: unused variable 'rt=
d' [-Wunused-variable]
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    2    WARNING: modpost: missing MODULE_LICENSE() in drivers/dma/fsl-dpaa=
2-qdma/dpdmai.o
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
    1    kernel/debug/debug_core.c:470:18: warning: array subscript [0, 0] =
is outside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]
    1    kernel/debug/debug_core.c:469:33: warning: array subscript [0, 0] =
is outside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]
    1    kernel/debug/debug_core.c:452:17: warning: array subscript [0, 0] =
is outside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]
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
    1    drivers/scsi/lpfc/lpfc_sli.c:11855:34: warning: variable 'done_q' =
is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/lpfc/lpfc_scsi.c:4722:34: warning: variable 'waitq' i=
s uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1    drivers/net/usb/lan78xx.c:2662:34: warning: variable 'unlink_wakeu=
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
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/renoir_ppt.c:182:26: warni=
ng: suggest braces around initialization of subobject [-Wmissing-braces]
    1    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:148:25: warning: variable 'cfg=
' is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:148:20: warning: variable 'cmd=
' is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/android/binderfs.c:657:41: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    1    /tmp/ccWqXYtW.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccWqXYtW.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1165:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.xS81TWvZ7g:4889:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xS81TWvZ7g:4872:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.xS81TWvZ7g:4871:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.xS81TWvZ7g:4867:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.xS81TWvZ7g:4847:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.xS81TWvZ7g:4841:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.xS81TWvZ7g:4832:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.xS81TWvZ7g:4830:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.xS81TWvZ7g:4829:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.xS81TWvZ7g:4828:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.xS81TWvZ7g:4826:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.xS81TWvZ7g:4825:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.xS81TWvZ7g:4822:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.xS81TWvZ7g:4815:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.xS81TWvZ7g:4805:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.xS81TWvZ7g:4794:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xS81TWvZ7g:4686:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.xS81TWvZ7g:4682:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xS81TWvZ7g:4657:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.xS81TWvZ7g:4636:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.xS81TWvZ7g:4578:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.xS81TWvZ7g:4577:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.xS81TWvZ7g:4573:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.xS81TWvZ7g:4572:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.xS81TWvZ7g:4570:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.xS81TWvZ7g:4569:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.xS81TWvZ7g:4566:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.rRnaRmJqkB:7968:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.rRnaRmJqkB:7951:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.rRnaRmJqkB:7950:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.rRnaRmJqkB:7946:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.rRnaRmJqkB:7926:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.rRnaRmJqkB:7920:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.rRnaRmJqkB:7911:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.rRnaRmJqkB:7909:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.rRnaRmJqkB:7908:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.rRnaRmJqkB:7907:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.rRnaRmJqkB:7905:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.rRnaRmJqkB:7904:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.rRnaRmJqkB:7901:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.rRnaRmJqkB:7894:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.rRnaRmJqkB:7884:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.rRnaRmJqkB:7873:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.rRnaRmJqkB:7765:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.rRnaRmJqkB:7761:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.rRnaRmJqkB:7736:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.rRnaRmJqkB:7715:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.rRnaRmJqkB:7657:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.rRnaRmJqkB:7656:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.rRnaRmJqkB:7652:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.rRnaRmJqkB:7651:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.rRnaRmJqkB:7649:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.rRnaRmJqkB:7648:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.rRnaRmJqkB:7645:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Sh6OL8tr7w:8567:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Sh6OL8tr7w:8550:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Sh6OL8tr7w:8549:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.Sh6OL8tr7w:8545:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.Sh6OL8tr7w:8525:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.Sh6OL8tr7w:8519:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.Sh6OL8tr7w:8510:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.Sh6OL8tr7w:8508:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Sh6OL8tr7w:8507:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.Sh6OL8tr7w:8506:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.Sh6OL8tr7w:8504:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.Sh6OL8tr7w:8503:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.Sh6OL8tr7w:8500:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Sh6OL8tr7w:8493:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Sh6OL8tr7w:8483:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.Sh6OL8tr7w:8472:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Sh6OL8tr7w:8364:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.Sh6OL8tr7w:8360:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Sh6OL8tr7w:8335:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.Sh6OL8tr7w:8314:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Sh6OL8tr7w:8256:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.Sh6OL8tr7w:8255:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.Sh6OL8tr7w:8251:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.Sh6OL8tr7w:8250:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.Sh6OL8tr7w:8248:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.Sh6OL8tr7w:8247:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.Sh6OL8tr7w:8244:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.F2JOsCoGYv:1745:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.F2JOsCoGYv:1728:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.F2JOsCoGYv:1727:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.F2JOsCoGYv:1723:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.F2JOsCoGYv:1703:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.F2JOsCoGYv:1697:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.F2JOsCoGYv:1688:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.F2JOsCoGYv:1686:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.F2JOsCoGYv:1685:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.F2JOsCoGYv:1684:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.F2JOsCoGYv:1682:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.F2JOsCoGYv:1681:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.F2JOsCoGYv:1678:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.F2JOsCoGYv:1671:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.F2JOsCoGYv:1661:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.F2JOsCoGYv:1650:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.F2JOsCoGYv:1542:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.F2JOsCoGYv:1538:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.F2JOsCoGYv:1513:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.F2JOsCoGYv:1492:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.F2JOsCoGYv:1434:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.F2JOsCoGYv:1433:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.F2JOsCoGYv:1429:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.F2JOsCoGYv:1428:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.F2JOsCoGYv:1426:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.F2JOsCoGYv:1425:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.F2JOsCoGYv:1422:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.E7aIuocGWT:3979:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.E7aIuocGWT:3962:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.E7aIuocGWT:3961:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.E7aIuocGWT:3957:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.E7aIuocGWT:3937:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.E7aIuocGWT:3931:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.E7aIuocGWT:3922:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.E7aIuocGWT:3920:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.E7aIuocGWT:3919:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.E7aIuocGWT:3918:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.E7aIuocGWT:3916:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.E7aIuocGWT:3915:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.E7aIuocGWT:3912:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.E7aIuocGWT:3905:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.E7aIuocGWT:3895:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.E7aIuocGWT:3884:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.E7aIuocGWT:3776:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.E7aIuocGWT:3772:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.E7aIuocGWT:3747:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.E7aIuocGWT:3726:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.E7aIuocGWT:3668:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.E7aIuocGWT:3667:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.E7aIuocGWT:3663:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.E7aIuocGWT:3662:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.E7aIuocGWT:3660:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.E7aIuocGWT:3659:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.E7aIuocGWT:3656:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.DdFVv0mEMi:4826:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.DdFVv0mEMi:4809:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.DdFVv0mEMi:4808:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.DdFVv0mEMi:4804:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.DdFVv0mEMi:4784:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.DdFVv0mEMi:4778:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.DdFVv0mEMi:4769:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.DdFVv0mEMi:4767:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.DdFVv0mEMi:4766:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.DdFVv0mEMi:4765:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.DdFVv0mEMi:4763:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.DdFVv0mEMi:4762:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.DdFVv0mEMi:4759:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.DdFVv0mEMi:4752:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.DdFVv0mEMi:4742:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.DdFVv0mEMi:4731:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.DdFVv0mEMi:4623:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.DdFVv0mEMi:4619:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.DdFVv0mEMi:4594:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.DdFVv0mEMi:4573:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.DdFVv0mEMi:4515:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.DdFVv0mEMi:4514:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.DdFVv0mEMi:4510:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.DdFVv0mEMi:4509:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.DdFVv0mEMi:4507:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.DdFVv0mEMi:4506:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.DdFVv0mEMi:4503:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.0Dg98F3fQN:3365:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0Dg98F3fQN:3348:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.0Dg98F3fQN:3347:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.0Dg98F3fQN:3343:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.0Dg98F3fQN:3323:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.0Dg98F3fQN:3317:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.0Dg98F3fQN:3308:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.0Dg98F3fQN:3306:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.0Dg98F3fQN:3305:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.0Dg98F3fQN:3304:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.0Dg98F3fQN:3302:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.0Dg98F3fQN:3301:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.0Dg98F3fQN:3298:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.0Dg98F3fQN:3291:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.0Dg98F3fQN:3281:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.0Dg98F3fQN:3270:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0Dg98F3fQN:3162:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.0Dg98F3fQN:3158:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0Dg98F3fQN:3133:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.0Dg98F3fQN:3112:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.0Dg98F3fQN:3054:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.0Dg98F3fQN:3053:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.0Dg98F3fQN:3049:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.0Dg98F3fQN:3048:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.0Dg98F3fQN:3046:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.0Dg98F3fQN:3045:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.0Dg98F3fQN:3042:warning: override: reassigning to sy=
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
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 28 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.E7aIuocGWT:3656:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.E7aIuocGWT:3659:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.E7aIuocGWT:3660:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.E7aIuocGWT:3662:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.E7aIuocGWT:3663:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.E7aIuocGWT:3667:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.E7aIuocGWT:3668:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.E7aIuocGWT:3726:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.E7aIuocGWT:3747:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.E7aIuocGWT:3772:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.E7aIuocGWT:3776:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.E7aIuocGWT:3884:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.E7aIuocGWT:3895:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.E7aIuocGWT:3905:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.E7aIuocGWT:3912:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.E7aIuocGWT:3915:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.E7aIuocGWT:3916:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.E7aIuocGWT:3918:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.E7aIuocGWT:3919:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.E7aIuocGWT:3920:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.E7aIuocGWT:3922:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.E7aIuocGWT:3931:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.E7aIuocGWT:3937:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.E7aIuocGWT:3957:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.E7aIuocGWT:3961:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.E7aIuocGWT:3962:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.E7aIuocGWT:3979:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 19 warnings, 0 section =
mismatches

Warnings:
    /tmp/ccWqXYtW.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccWqXYtW.s:18191: Warning: using r15 results in unpredictable beha=
viour
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
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
    warning: same module names found:

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 FAIL, 9 errors, 48 warnings, 0 sect=
ion mismatches

Errors:
    ERROR: "dpdmai_reset" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] undefi=
ned!
    ERROR: "dpdmai_set_rx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko]=
 undefined!
    ERROR: "dpdmai_get_tx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko]=
 undefined!
    ERROR: "dpdmai_get_rx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko]=
 undefined!
    ERROR: "dpdmai_get_attributes" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.k=
o] undefined!
    ERROR: "dpdmai_open" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] undefin=
ed!
    ERROR: "dpdmai_disable" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] unde=
fined!
    ERROR: "dpdmai_close" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] undefi=
ned!
    ERROR: "dpdmai_enable" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] undef=
ined!

Warnings:
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
    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:148:20: warning: variable 'cmd' is =
uninitialized when used within its own initialization [-Wuninitialized]
    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:148:25: warning: variable 'cfg' is =
uninitialized when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    sound/soc/codecs/rt5677-spi.c:114:30: warning: unused variable 'rtd' [-=
Wunused-variable]
    1 warning generated.
    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../powerplay/renoir_ppt.c:182:26: warning: s=
uggest braces around initialization of subobject [-Wmissing-braces]
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
    drivers/net/usb/lan78xx.c:2662:34: warning: variable 'unlink_wakeup' is=
 uninitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/scsi/lpfc/lpfc_sli.c:11855:34: warning: variable 'done_q' is un=
initialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/scsi/lpfc/lpfc_scsi.c:4722:34: warning: variable 'waitq' is uni=
nitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    WARNING: modpost: missing MODULE_LICENSE() in drivers/dma/fsl-dpaa2-qdm=
a/dpdmai.o

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 9 errors, 2 warnings, 0 section=
 mismatches

Errors:
    ERROR: "dpdmai_enable" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] undef=
ined!
    ERROR: "dpdmai_set_rx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko]=
 undefined!
    ERROR: "dpdmai_get_tx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko]=
 undefined!
    ERROR: "dpdmai_get_rx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko]=
 undefined!
    ERROR: "dpdmai_get_attributes" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.k=
o] undefined!
    ERROR: "dpdmai_open" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] undefin=
ed!
    ERROR: "dpdmai_close" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] undefi=
ned!
    ERROR: "dpdmai_disable" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] unde=
fined!
    ERROR: "dpdmai_reset" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] undefi=
ned!

Warnings:
    sound/soc/codecs/rt5677-spi.c:114:30: warning: unused variable 'rtd' [-=
Wunused-variable]
    WARNING: modpost: missing MODULE_LICENSE() in drivers/dma/fsl-dpaa2-qdm=
a/dpdmai.o

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    sound/soc/codecs/rt5677-spi.c:114:30: warning: unused variable 'rtd' [-=
Wunused-variable]

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
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/debug/debug_core.c:452:17: warning: array subscript [0, 0] is ou=
tside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]
    kernel/debug/debug_core.c:469:33: warning: array subscript [0, 0] is ou=
tside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]
    kernel/debug/debug_core.c:470:18: warning: array subscript [0, 0] is ou=
tside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]

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
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
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
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 29 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.0Dg98F3fQN:3042:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.0Dg98F3fQN:3045:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.0Dg98F3fQN:3046:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.0Dg98F3fQN:3048:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.0Dg98F3fQN:3049:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.0Dg98F3fQN:3053:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.0Dg98F3fQN:3054:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.0Dg98F3fQN:3112:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.0Dg98F3fQN:3133:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.0Dg98F3fQN:3158:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.0Dg98F3fQN:3162:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.0Dg98F3fQN:3270:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.0Dg98F3fQN:3281:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.0Dg98F3fQN:3291:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.0Dg98F3fQN:3298:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.0Dg98F3fQN:3301:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.0Dg98F3fQN:3302:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.0Dg98F3fQN:3304:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.0Dg98F3fQN:3305:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.0Dg98F3fQN:3306:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.0Dg98F3fQN:3308:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.0Dg98F3fQN:3317:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.0Dg98F3fQN:3323:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.0Dg98F3fQN:3343:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.0Dg98F3fQN:3347:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.0Dg98F3fQN:3348:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.0Dg98F3fQN:3365:warning: override: reassigning to symbol =
USER_NS
    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e1000e_s0=
ix_exit_flow' defined but not used [-Wunused-function]
    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e1000e_s0=
ix_entry_flow' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.rRnaRmJqkB:7645:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.rRnaRmJqkB:7648:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.rRnaRmJqkB:7649:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.rRnaRmJqkB:7651:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.rRnaRmJqkB:7652:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.rRnaRmJqkB:7656:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.rRnaRmJqkB:7657:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.rRnaRmJqkB:7715:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.rRnaRmJqkB:7736:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.rRnaRmJqkB:7761:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.rRnaRmJqkB:7765:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.rRnaRmJqkB:7873:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.rRnaRmJqkB:7884:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.rRnaRmJqkB:7894:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.rRnaRmJqkB:7901:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.rRnaRmJqkB:7904:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.rRnaRmJqkB:7905:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.rRnaRmJqkB:7907:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.rRnaRmJqkB:7908:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.rRnaRmJqkB:7909:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.rRnaRmJqkB:7911:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.rRnaRmJqkB:7920:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.rRnaRmJqkB:7926:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.rRnaRmJqkB:7946:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.rRnaRmJqkB:7950:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.rRnaRmJqkB:7951:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.rRnaRmJqkB:7968:warning: override: reassigning to symbol =
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
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
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
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 28 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.DdFVv0mEMi:4503:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.DdFVv0mEMi:4506:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.DdFVv0mEMi:4507:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.DdFVv0mEMi:4509:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.DdFVv0mEMi:4510:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.DdFVv0mEMi:4514:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.DdFVv0mEMi:4515:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.DdFVv0mEMi:4573:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.DdFVv0mEMi:4594:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.DdFVv0mEMi:4619:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.DdFVv0mEMi:4623:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.DdFVv0mEMi:4731:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.DdFVv0mEMi:4742:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.DdFVv0mEMi:4752:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.DdFVv0mEMi:4759:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.DdFVv0mEMi:4762:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.DdFVv0mEMi:4763:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.DdFVv0mEMi:4765:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.DdFVv0mEMi:4766:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.DdFVv0mEMi:4767:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.DdFVv0mEMi:4769:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.DdFVv0mEMi:4778:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.DdFVv0mEMi:4784:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.DdFVv0mEMi:4804:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.DdFVv0mEMi:4808:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.DdFVv0mEMi:4809:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.DdFVv0mEMi:4826:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]

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
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
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
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 28 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.Sh6OL8tr7w:8244:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Sh6OL8tr7w:8247:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.Sh6OL8tr7w:8248:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.Sh6OL8tr7w:8250:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.Sh6OL8tr7w:8251:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.Sh6OL8tr7w:8255:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.Sh6OL8tr7w:8256:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.Sh6OL8tr7w:8314:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Sh6OL8tr7w:8335:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.Sh6OL8tr7w:8360:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Sh6OL8tr7w:8364:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.Sh6OL8tr7w:8472:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Sh6OL8tr7w:8483:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.Sh6OL8tr7w:8493:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Sh6OL8tr7w:8500:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Sh6OL8tr7w:8503:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.Sh6OL8tr7w:8504:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.Sh6OL8tr7w:8506:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.Sh6OL8tr7w:8507:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.Sh6OL8tr7w:8508:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Sh6OL8tr7w:8510:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.Sh6OL8tr7w:8519:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.Sh6OL8tr7w:8525:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.Sh6OL8tr7w:8545:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.Sh6OL8tr7w:8549:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.Sh6OL8tr7w:8550:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Sh6OL8tr7w:8567:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]

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
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    drivers/net/ethernet/intel/e1000e/netdev.c:6405:13: warning: 'e1000e_s0=
ix_exit_flow' defined but not used [-Wunused-function]
    drivers/net/ethernet/intel/e1000e/netdev.c:6298:13: warning: 'e1000e_s0=
ix_entry_flow' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 30 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.F2JOsCoGYv:1422:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.F2JOsCoGYv:1425:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.F2JOsCoGYv:1426:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.F2JOsCoGYv:1428:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.F2JOsCoGYv:1429:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.F2JOsCoGYv:1433:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.F2JOsCoGYv:1434:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.F2JOsCoGYv:1492:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.F2JOsCoGYv:1513:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.F2JOsCoGYv:1538:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.F2JOsCoGYv:1542:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.F2JOsCoGYv:1650:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.F2JOsCoGYv:1661:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.F2JOsCoGYv:1671:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.F2JOsCoGYv:1678:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.F2JOsCoGYv:1681:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.F2JOsCoGYv:1682:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.F2JOsCoGYv:1684:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.F2JOsCoGYv:1685:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.F2JOsCoGYv:1686:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.F2JOsCoGYv:1688:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.F2JOsCoGYv:1697:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.F2JOsCoGYv:1703:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.F2JOsCoGYv:1723:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.F2JOsCoGYv:1727:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.F2JOsCoGYv:1728:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.F2JOsCoGYv:1745:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]

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
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
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
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1165:warning: override: UNWINDER_GUESS changes choice state

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
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 27 war=
nings, 0 section mismatches

Warnings:
    ./.tmp.config.xS81TWvZ7g:4566:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.xS81TWvZ7g:4569:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.xS81TWvZ7g:4570:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.xS81TWvZ7g:4572:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.xS81TWvZ7g:4573:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.xS81TWvZ7g:4577:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.xS81TWvZ7g:4578:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.xS81TWvZ7g:4636:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.xS81TWvZ7g:4657:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.xS81TWvZ7g:4682:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.xS81TWvZ7g:4686:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.xS81TWvZ7g:4794:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.xS81TWvZ7g:4805:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.xS81TWvZ7g:4815:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.xS81TWvZ7g:4822:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.xS81TWvZ7g:4825:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.xS81TWvZ7g:4826:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.xS81TWvZ7g:4828:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.xS81TWvZ7g:4829:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.xS81TWvZ7g:4830:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.xS81TWvZ7g:4832:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.xS81TWvZ7g:4841:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.xS81TWvZ7g:4847:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.xS81TWvZ7g:4867:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.xS81TWvZ7g:4871:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.xS81TWvZ7g:4872:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.xS81TWvZ7g:4889:warning: override: reassigning to symbol =
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
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
