Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 721C2E301D
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2019 13:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408093AbfJXLR0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Oct 2019 07:17:26 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54638 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408056AbfJXLR0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 24 Oct 2019 07:17:26 -0400
Received: by mail-wm1-f66.google.com with SMTP id g7so2364731wmk.4
        for <linux-next@vger.kernel.org>; Thu, 24 Oct 2019 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7E0iLBLJLWXi+7KFtHwm/23XFSrz0/zD9w2R/2BurLU=;
        b=qWRWr45hFnuueWIpAmKEAcMO9mGOhkFOCEjPTb5Qw3EYpunOKh+mxpo2vEvhpuuJB8
         2N4pUjO/DgGrMwp0py0H1Y2DFalK95rUEaTKU87zt+5PX25C5sbR4viDfr5NhIEDZuhE
         k55lXq9KFpivXZIES/baACLTEbaMPUK9YnzMOEZN2cxaHmJ3DK+LEJKwyiX/wiPWnj45
         83nTx3dh8RQ3p1rSVLAFY8l24c0StgcWVrAeVcp2CdTPbH9qJq0mybqkXmeWijEVvihv
         xJkkYhqg8jvpMb5gHp2V0MkJUCawpSUoZ9rL+l7eniRddnpqzvAWFIp4brzVBnVbkSQS
         Yt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7E0iLBLJLWXi+7KFtHwm/23XFSrz0/zD9w2R/2BurLU=;
        b=qJ8GfScsX5ncbkJx2O0UtvlthD1Cy6tVUFds3jHGR3GIIKbX+79b7B/rVaYyz5qaCg
         /JwpHu1xX1TOVduxIeziH4y9vVW54FA2X4Ri0CSnV9ojGu60QMGIMJL2aAqPmro6lGbL
         v09fov8YGjDJ7rnsdtA3Ejeh59DuuMyccz9ZF1N6Cp8VnK4+KOuMZex0X11u52/Epz/Y
         MWf4ETcau/pwTRN4Wgwzg7XvkXST2zPeC2uWpPdPkAnPB1eBGm4CjgU5JwYpWX/4+umH
         JJNIndKeVEyoiBFEm/37iWfsbgK+VkJtuOV25LVc5KViViLKt7us1tat1wSYPXlTrihO
         Hs1Q==
X-Gm-Message-State: APjAAAVGT5SFRnmRU3X+x0upEPnfUcZXHRMI+TrR8i/vuh3JP7iDXrX/
        t0NhsaLqVLCrtz3he78qnpZvat5IpNX5LQ==
X-Google-Smtp-Source: APXvYqygdyo9LifpXEZqr2705Gctbe/iMPgDu9eE+aKTXQ6T5MeqoynCytbOiu4anKYVzL3lS1UbVQ==
X-Received: by 2002:a1c:a684:: with SMTP id p126mr4227502wme.156.1571915832878;
        Thu, 24 Oct 2019 04:17:12 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w18sm7408488wrl.75.2019.10.24.04.17.11
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2019 04:17:11 -0700 (PDT)
Message-ID: <5db18837.1c69fb81.e9a06.8d75@mx.google.com>
Date:   Thu, 24 Oct 2019 04:17:11 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20191024
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master build: 216 builds: 1 failed, 215 passed, 4 errors,
 349 warnings (next-20191024)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 216 builds: 1 failed, 215 passed, 4 errors, 349 warnings=
 (next-20191024)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191024/

Tree: next
Branch: master
Git Describe: next-20191024
Git Commit: 12d61c6996999e6562cbbed5f270d572248a11c5
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
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (gcc-8): 1 warning
    allmodconfig (clang-8): 47 warnings
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
    20   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    16   1 warning generated.
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
    5    2 warnings generated.
    4    sound/soc/codecs/rt5677-spi.c:114:30: warning: unused variable 'rt=
d' [-Wunused-variable]
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
    1    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:151:25: warning: variable 'cfg=
' is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:151:20: warning: variable 'cmd=
' is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/android/binderfs.c:657:41: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    1    /tmp/ccygpJU8.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccygpJU8.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1165:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.rrjgYa4qnP:3365:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.rrjgYa4qnP:3348:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.rrjgYa4qnP:3347:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.rrjgYa4qnP:3343:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.rrjgYa4qnP:3323:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.rrjgYa4qnP:3317:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.rrjgYa4qnP:3308:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.rrjgYa4qnP:3306:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.rrjgYa4qnP:3305:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.rrjgYa4qnP:3304:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.rrjgYa4qnP:3302:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.rrjgYa4qnP:3301:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.rrjgYa4qnP:3298:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.rrjgYa4qnP:3291:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.rrjgYa4qnP:3281:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.rrjgYa4qnP:3270:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.rrjgYa4qnP:3162:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.rrjgYa4qnP:3158:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.rrjgYa4qnP:3133:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.rrjgYa4qnP:3112:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.rrjgYa4qnP:3054:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.rrjgYa4qnP:3053:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.rrjgYa4qnP:3049:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.rrjgYa4qnP:3048:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.rrjgYa4qnP:3046:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.rrjgYa4qnP:3045:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.rrjgYa4qnP:3042:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.PODRA17WFs:7968:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.PODRA17WFs:7951:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.PODRA17WFs:7950:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.PODRA17WFs:7946:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.PODRA17WFs:7926:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.PODRA17WFs:7920:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.PODRA17WFs:7911:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.PODRA17WFs:7909:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.PODRA17WFs:7908:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.PODRA17WFs:7907:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.PODRA17WFs:7905:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.PODRA17WFs:7904:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.PODRA17WFs:7901:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.PODRA17WFs:7894:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.PODRA17WFs:7884:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.PODRA17WFs:7873:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.PODRA17WFs:7765:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.PODRA17WFs:7761:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.PODRA17WFs:7736:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.PODRA17WFs:7715:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.PODRA17WFs:7657:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.PODRA17WFs:7656:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.PODRA17WFs:7652:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.PODRA17WFs:7651:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.PODRA17WFs:7649:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.PODRA17WFs:7648:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.PODRA17WFs:7645:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.FycgTjdDk7:3979:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.FycgTjdDk7:3962:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.FycgTjdDk7:3961:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.FycgTjdDk7:3957:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.FycgTjdDk7:3937:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.FycgTjdDk7:3931:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.FycgTjdDk7:3922:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.FycgTjdDk7:3920:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.FycgTjdDk7:3919:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.FycgTjdDk7:3918:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.FycgTjdDk7:3916:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.FycgTjdDk7:3915:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.FycgTjdDk7:3912:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.FycgTjdDk7:3905:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.FycgTjdDk7:3895:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.FycgTjdDk7:3884:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.FycgTjdDk7:3776:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.FycgTjdDk7:3772:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.FycgTjdDk7:3747:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.FycgTjdDk7:3726:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.FycgTjdDk7:3668:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.FycgTjdDk7:3667:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.FycgTjdDk7:3663:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.FycgTjdDk7:3662:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.FycgTjdDk7:3660:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.FycgTjdDk7:3659:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.FycgTjdDk7:3656:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.EZjBlGuLCc:4826:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.EZjBlGuLCc:4809:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.EZjBlGuLCc:4808:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.EZjBlGuLCc:4804:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.EZjBlGuLCc:4784:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.EZjBlGuLCc:4778:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.EZjBlGuLCc:4769:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.EZjBlGuLCc:4767:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.EZjBlGuLCc:4766:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.EZjBlGuLCc:4765:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.EZjBlGuLCc:4763:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.EZjBlGuLCc:4762:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.EZjBlGuLCc:4759:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.EZjBlGuLCc:4752:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.EZjBlGuLCc:4742:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.EZjBlGuLCc:4731:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.EZjBlGuLCc:4623:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.EZjBlGuLCc:4619:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.EZjBlGuLCc:4594:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.EZjBlGuLCc:4573:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.EZjBlGuLCc:4515:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.EZjBlGuLCc:4514:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.EZjBlGuLCc:4510:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.EZjBlGuLCc:4509:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.EZjBlGuLCc:4507:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.EZjBlGuLCc:4506:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.EZjBlGuLCc:4503:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.BkiLKVagqf:8569:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.BkiLKVagqf:8552:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.BkiLKVagqf:8551:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.BkiLKVagqf:8547:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.BkiLKVagqf:8527:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.BkiLKVagqf:8521:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.BkiLKVagqf:8512:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.BkiLKVagqf:8510:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.BkiLKVagqf:8509:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.BkiLKVagqf:8508:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.BkiLKVagqf:8506:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.BkiLKVagqf:8505:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.BkiLKVagqf:8502:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.BkiLKVagqf:8495:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.BkiLKVagqf:8485:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.BkiLKVagqf:8474:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.BkiLKVagqf:8366:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.BkiLKVagqf:8362:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.BkiLKVagqf:8337:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.BkiLKVagqf:8316:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.BkiLKVagqf:8258:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.BkiLKVagqf:8257:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.BkiLKVagqf:8253:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.BkiLKVagqf:8252:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.BkiLKVagqf:8250:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.BkiLKVagqf:8249:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.BkiLKVagqf:8246:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.6aLYcOxJFN:4889:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6aLYcOxJFN:4872:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.6aLYcOxJFN:4871:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.6aLYcOxJFN:4867:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.6aLYcOxJFN:4847:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.6aLYcOxJFN:4841:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.6aLYcOxJFN:4832:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.6aLYcOxJFN:4830:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.6aLYcOxJFN:4829:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.6aLYcOxJFN:4828:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.6aLYcOxJFN:4826:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.6aLYcOxJFN:4825:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.6aLYcOxJFN:4822:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.6aLYcOxJFN:4815:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.6aLYcOxJFN:4805:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.6aLYcOxJFN:4794:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6aLYcOxJFN:4686:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.6aLYcOxJFN:4682:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6aLYcOxJFN:4657:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.6aLYcOxJFN:4636:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.6aLYcOxJFN:4578:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.6aLYcOxJFN:4577:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.6aLYcOxJFN:4573:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.6aLYcOxJFN:4572:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.6aLYcOxJFN:4570:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.6aLYcOxJFN:4569:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.6aLYcOxJFN:4566:warning: override: reassigning to sy=
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
    ./.tmp.config.FycgTjdDk7:3656:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.FycgTjdDk7:3659:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.FycgTjdDk7:3660:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.FycgTjdDk7:3662:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.FycgTjdDk7:3663:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.FycgTjdDk7:3667:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.FycgTjdDk7:3668:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.FycgTjdDk7:3726:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.FycgTjdDk7:3747:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.FycgTjdDk7:3772:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.FycgTjdDk7:3776:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.FycgTjdDk7:3884:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.FycgTjdDk7:3895:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.FycgTjdDk7:3905:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.FycgTjdDk7:3912:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.FycgTjdDk7:3915:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.FycgTjdDk7:3916:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.FycgTjdDk7:3918:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.FycgTjdDk7:3919:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.FycgTjdDk7:3920:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.FycgTjdDk7:3922:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.FycgTjdDk7:3931:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.FycgTjdDk7:3937:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.FycgTjdDk7:3957:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.FycgTjdDk7:3961:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.FycgTjdDk7:3962:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.FycgTjdDk7:3979:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 19 warnings, 0 section =
mismatches

Warnings:
    /tmp/ccygpJU8.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccygpJU8.s:18191: Warning: using r15 results in unpredictable beha=
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
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    sound/soc/codecs/rt5677-spi.c:114:30: warning: unused variable 'rtd' [-=
Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    sound/soc/codecs/rt5677-spi.c:114:30: warning: unused variable 'rtd' [-=
Wunused-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 47 warnings, 0 sect=
ion mismatches

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
    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
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
    drivers/gpu/drm/amd/amdgpu/../powerplay/renoir_ppt.c:182:26: warning: s=
uggest braces around initialization of subobject [-Wmissing-braces]
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
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
    ./.tmp.config.rrjgYa4qnP:3042:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.rrjgYa4qnP:3045:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.rrjgYa4qnP:3046:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.rrjgYa4qnP:3048:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.rrjgYa4qnP:3049:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.rrjgYa4qnP:3053:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.rrjgYa4qnP:3054:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.rrjgYa4qnP:3112:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.rrjgYa4qnP:3133:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.rrjgYa4qnP:3158:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.rrjgYa4qnP:3162:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.rrjgYa4qnP:3270:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.rrjgYa4qnP:3281:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.rrjgYa4qnP:3291:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.rrjgYa4qnP:3298:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.rrjgYa4qnP:3301:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.rrjgYa4qnP:3302:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.rrjgYa4qnP:3304:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.rrjgYa4qnP:3305:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.rrjgYa4qnP:3306:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.rrjgYa4qnP:3308:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.rrjgYa4qnP:3317:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.rrjgYa4qnP:3323:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.rrjgYa4qnP:3343:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.rrjgYa4qnP:3347:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.rrjgYa4qnP:3348:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.rrjgYa4qnP:3365:warning: override: reassigning to symbol =
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
    ./.tmp.config.PODRA17WFs:7645:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.PODRA17WFs:7648:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.PODRA17WFs:7649:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.PODRA17WFs:7651:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.PODRA17WFs:7652:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.PODRA17WFs:7656:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.PODRA17WFs:7657:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.PODRA17WFs:7715:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.PODRA17WFs:7736:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.PODRA17WFs:7761:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.PODRA17WFs:7765:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.PODRA17WFs:7873:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.PODRA17WFs:7884:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.PODRA17WFs:7894:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.PODRA17WFs:7901:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.PODRA17WFs:7904:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.PODRA17WFs:7905:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.PODRA17WFs:7907:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.PODRA17WFs:7908:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.PODRA17WFs:7909:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.PODRA17WFs:7911:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.PODRA17WFs:7920:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.PODRA17WFs:7926:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.PODRA17WFs:7946:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.PODRA17WFs:7950:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.PODRA17WFs:7951:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.PODRA17WFs:7968:warning: override: reassigning to symbol =
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
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 28 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.EZjBlGuLCc:4503:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.EZjBlGuLCc:4506:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.EZjBlGuLCc:4507:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.EZjBlGuLCc:4509:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.EZjBlGuLCc:4510:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.EZjBlGuLCc:4514:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.EZjBlGuLCc:4515:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.EZjBlGuLCc:4573:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.EZjBlGuLCc:4594:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.EZjBlGuLCc:4619:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.EZjBlGuLCc:4623:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.EZjBlGuLCc:4731:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.EZjBlGuLCc:4742:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.EZjBlGuLCc:4752:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.EZjBlGuLCc:4759:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.EZjBlGuLCc:4762:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.EZjBlGuLCc:4763:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.EZjBlGuLCc:4765:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.EZjBlGuLCc:4766:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.EZjBlGuLCc:4767:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.EZjBlGuLCc:4769:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.EZjBlGuLCc:4778:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.EZjBlGuLCc:4784:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.EZjBlGuLCc:4804:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.EZjBlGuLCc:4808:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.EZjBlGuLCc:4809:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.EZjBlGuLCc:4826:warning: override: reassigning to symbol =
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
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 28 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.BkiLKVagqf:8246:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.BkiLKVagqf:8249:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.BkiLKVagqf:8250:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.BkiLKVagqf:8252:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.BkiLKVagqf:8253:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.BkiLKVagqf:8257:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.BkiLKVagqf:8258:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.BkiLKVagqf:8316:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.BkiLKVagqf:8337:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.BkiLKVagqf:8362:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.BkiLKVagqf:8366:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.BkiLKVagqf:8474:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.BkiLKVagqf:8485:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.BkiLKVagqf:8495:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.BkiLKVagqf:8502:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.BkiLKVagqf:8505:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.BkiLKVagqf:8506:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.BkiLKVagqf:8508:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.BkiLKVagqf:8509:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.BkiLKVagqf:8510:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.BkiLKVagqf:8512:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.BkiLKVagqf:8521:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.BkiLKVagqf:8527:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.BkiLKVagqf:8547:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.BkiLKVagqf:8551:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.BkiLKVagqf:8552:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.BkiLKVagqf:8569:warning: override: reassigning to symbol =
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
    .config:1165:warning: override: UNWINDER_GUESS changes choice state

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
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
    ./.tmp.config.6aLYcOxJFN:4566:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.6aLYcOxJFN:4569:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.6aLYcOxJFN:4570:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.6aLYcOxJFN:4572:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.6aLYcOxJFN:4573:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.6aLYcOxJFN:4577:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.6aLYcOxJFN:4578:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.6aLYcOxJFN:4636:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.6aLYcOxJFN:4657:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.6aLYcOxJFN:4682:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.6aLYcOxJFN:4686:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.6aLYcOxJFN:4794:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.6aLYcOxJFN:4805:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.6aLYcOxJFN:4815:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.6aLYcOxJFN:4822:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.6aLYcOxJFN:4825:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.6aLYcOxJFN:4826:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.6aLYcOxJFN:4828:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.6aLYcOxJFN:4829:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.6aLYcOxJFN:4830:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.6aLYcOxJFN:4832:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.6aLYcOxJFN:4841:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.6aLYcOxJFN:4847:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.6aLYcOxJFN:4867:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.6aLYcOxJFN:4871:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.6aLYcOxJFN:4872:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.6aLYcOxJFN:4889:warning: override: reassigning to symbol =
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
