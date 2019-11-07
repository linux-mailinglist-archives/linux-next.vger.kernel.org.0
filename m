Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C01A1F30F1
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2019 15:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388854AbfKGONE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Nov 2019 09:13:04 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55375 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729162AbfKGONE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Nov 2019 09:13:04 -0500
Received: by mail-wm1-f68.google.com with SMTP id b11so2631598wmb.5
        for <linux-next@vger.kernel.org>; Thu, 07 Nov 2019 06:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=VK2xlRsSspGGZuWI3Ahx47v5kXHEShoKnovYmqhyrEI=;
        b=If1tqg+8xDaoix8bAsysVbctjn2w404/03G6jV7zD2dFXUBbg79eUyBsvUEfFuF8es
         PtoZPVoo0PIcKk44+oo/CvGXxrdDwgbidZV6jzxSiSpnXXzg6EJv4bgnNl4pCFQBAP8b
         Ml5vN3t/3kmN62uYrfPt8QER92ywmREbp/znvQ9oULvYoAnm46JTpI3W/q43PQA1ZkHK
         WGpBfo6hTWZuJ2eLJT6WmigJcCSwx33qTdP3+snd4q1ZRXhaNNUXvAxTuK0ajMNxnrRg
         7f4HF27Lg+KMoi5tBoWgMxVyS/bkjd1y2t8Nb0ToMscsBqueYbLggOTf7DpstjJYusMp
         nnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=VK2xlRsSspGGZuWI3Ahx47v5kXHEShoKnovYmqhyrEI=;
        b=jIdQYc+2s2j72pzBRE2bTMRV67DP/ZeFfwJadU/sIj7MHTuFY/EHojgMDlXK+FJHFq
         dW4o71tWve5wFgjWtV+l2xAstRJFrLMx655KKkmzkCmM8d1c5ECS6AYI8ENy+9BTm1+i
         0yQWng+WeHHUwyU97hoOCyA/hXG8Y7EMqlWC41rpsIp/7ZVVbUCfheyokk2EY1sgB2pv
         onH2RdAYIWPWi6tqJKxNc8tgq0lEzQObP4/OHdl5xnn13eZvnXISR9/RgtZzeslggtct
         aekD/9KWeafTAOmqhqnHKswswFqwU84apS44zMbdVBYOeTWqIHKVteKJMOafnyAfMVDX
         Eexw==
X-Gm-Message-State: APjAAAU6wr6NiEFkAQ5HVVOpr5aq0crZv5xqLbWnPpBBxlxRC6aDf95M
        7CMl2paVglLYdstOYZOAI6EIPnpcxRGLhw==
X-Google-Smtp-Source: APXvYqxPYNtv5zZSgefFGZ5ha8CYOyWlckdV61BkBhWVmG7J+5SZ3jIOyJJxIyOpPkAk28Kh5s1Fbg==
X-Received: by 2002:a1c:a791:: with SMTP id q139mr3066185wme.155.1573135971858;
        Thu, 07 Nov 2019 06:12:51 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y67sm3317182wmb.38.2019.11.07.06.12.50
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 06:12:50 -0800 (PST)
Message-ID: <5dc42662.1c69fb81.e4871.105e@mx.google.com>
Date:   Thu, 07 Nov 2019 06:12:50 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20191107
Subject: next/master build: 216 builds: 1 failed, 215 passed, 4 errors,
 455 warnings (next-20191107)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 216 builds: 1 failed, 215 passed, 4 errors, 455 warnings=
 (next-20191107)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191107/

Tree: next
Branch: master
Git Describe: next-20191107
Git Commit: c68c5373c504078cc0e0edc7d5c88b47ca308144
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failure Detected:

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
    allmodconfig (clang-8): 46 warnings
    defconfig (gcc-8): 29 warnings

arm:
    allmodconfig (gcc-8): 20 warnings
    am200epdkit_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (gcc-8): 2 warnings
    axm55xx_defconfig (gcc-8): 2 warnings
    badge4_defconfig (gcc-8): 1 warning
    bcm2835_defconfig (gcc-8): 1 warning
    cerfcube_defconfig (gcc-8): 1 warning
    cm_x2xx_defconfig (gcc-8): 2 warnings
    cm_x300_defconfig (gcc-8): 2 warnings
    cns3420vb_defconfig (gcc-8): 1 warning
    colibri_pxa270_defconfig (gcc-8): 1 warning
    colibri_pxa300_defconfig (gcc-8): 2 warnings
    davinci_all_defconfig (gcc-8): 2 warnings
    dove_defconfig (gcc-8): 2 warnings
    em_x270_defconfig (gcc-8): 2 warnings
    ep93xx_defconfig (gcc-8): 2 warnings
    eseries_pxa_defconfig (gcc-8): 3 warnings
    exynos_defconfig (gcc-8): 2 warnings
    ezx_defconfig (gcc-8): 2 warnings
    h5000_defconfig (gcc-8): 1 warning
    hisi_defconfig (gcc-8): 1 warning
    imote2_defconfig (gcc-8): 2 warnings
    imx_v4_v5_defconfig (gcc-8): 2 warnings
    imx_v6_v7_defconfig (gcc-8): 1 warning
    integrator_defconfig (gcc-8): 1 warning
    iop32x_defconfig (gcc-8): 1 warning
    ixp4xx_defconfig (gcc-8): 2 warnings
    keystone_defconfig (gcc-8): 2 warnings
    lart_defconfig (gcc-8): 1 warning
    lpc32xx_defconfig (gcc-8): 1 warning
    magician_defconfig (gcc-8): 2 warnings
    milbeaut_m10v_defconfig (gcc-8): 2 warnings
    mini2440_defconfig (gcc-8): 2 warnings
    mmp2_defconfig (gcc-8): 2 warnings
    moxart_defconfig (gcc-8): 1 warning
    multi_v5_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 32 warnings
    mv78xx0_defconfig (gcc-8): 2 warnings
    mvebu_v5_defconfig (gcc-8): 2 warnings
    mvebu_v7_defconfig (gcc-8): 2 warnings
    mxs_defconfig (gcc-8): 2 warnings
    nhk8815_defconfig (gcc-8): 2 warnings
    omap1_defconfig (gcc-8): 2 warnings
    omap2plus_defconfig (gcc-8): 1 warning
    orion5x_defconfig (gcc-8): 2 warnings
    oxnas_v6_defconfig (gcc-8): 2 warnings
    palmz72_defconfig (gcc-8): 2 warnings
    pcm027_defconfig (gcc-8): 2 warnings
    pleb_defconfig (gcc-8): 1 warning
    prima2_defconfig (gcc-8): 1 warning
    pxa168_defconfig (gcc-8): 1 warning
    pxa3xx_defconfig (gcc-8): 1 warning
    pxa910_defconfig (gcc-8): 1 warning
    pxa_defconfig (gcc-8): 1 warning
    qcom_defconfig (gcc-8): 2 warnings
    realview_defconfig (gcc-8): 1 warning
    rpc_defconfig (gcc-8): 1 warning
    s3c2410_defconfig (gcc-8): 2 warnings
    s3c6400_defconfig (gcc-8): 3 warnings
    s5pv210_defconfig (gcc-8): 2 warnings
    sama5_defconfig (gcc-8): 2 warnings
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
    vexpress_defconfig (gcc-8): 2 warnings
    vf610m4_defconfig (gcc-8): 1 warning
    viper_defconfig (gcc-8): 2 warnings
    vt8500_v6_v7_defconfig (gcc-8): 1 warning
    xcep_defconfig (gcc-8): 1 warning
    zeus_defconfig (gcc-8): 3 warnings
    zx_defconfig (gcc-8): 1 warning

i386:
    i386_defconfig (gcc-8): 31 warnings

mips:
    32r2el_defconfig (gcc-8): 1 warning
    32r2el_defconfig (gcc-8): 32 warnings
    bmips_be_defconfig (gcc-8): 1 warning
    bmips_stb_defconfig (gcc-8): 1 warning
    capcella_defconfig (gcc-8): 1 warning
    cavium_octeon_defconfig (gcc-8): 4 errors, 4 warnings
    ci20_defconfig (gcc-8): 1 warning
    cobalt_defconfig (gcc-8): 1 warning
    db1xxx_defconfig (gcc-8): 2 warnings
    decstation_64_defconfig (gcc-8): 1 warning
    decstation_defconfig (gcc-8): 1 warning
    decstation_r4k_defconfig (gcc-8): 1 warning
    e55_defconfig (gcc-8): 1 warning
    fuloong2e_defconfig (gcc-8): 1 warning
    ip27_defconfig (gcc-8): 1 warning
    jazz_defconfig (gcc-8): 1 warning
    lasat_defconfig (gcc-8): 1 warning
    loongson1b_defconfig (gcc-8): 1 warning
    loongson1c_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    markeins_defconfig (gcc-8): 1 warning
    mips_paravirt_defconfig (gcc-8): 1 warning
    nlm_xlp_defconfig (gcc-8): 1 warning
    nlm_xlr_defconfig (gcc-8): 2 warnings
    pic32mzda_defconfig (gcc-8): 1 warning
    pistachio_defconfig (gcc-8): 1 warning
    qi_lb60_defconfig (gcc-8): 1 warning
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

Warnings summary:

    105  fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-=
variable]
    64   WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    20   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    15   1 warning generated.
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    6    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunu=
sed-variable]
    5    include/linux/kern_levels.h:5:18: warning: format '%lu' expects ar=
gument of type 'long unsigned int', but argument 8 has type 'unsigned int' =
[-Wformat=3D]
    5    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argu=
ment of type 'long unsigned int', but argument 5 has type 'unsigned int' [-=
Wformat=3D]
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    4    2 warnings generated.
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
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/renoir_ppt.c:183:26: warni=
ng: suggest braces around initialization of subobject [-Wmissing-braces]
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
    1    WARNING: unmet direct dependencies detected for FSL_RCPM
    1    3 warnings generated.
    1    /tmp/ccXfJHTv.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccXfJHTv.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1167:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.th92r37X56:8610:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.th92r37X56:8593:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.th92r37X56:8592:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.th92r37X56:8588:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.th92r37X56:8568:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.th92r37X56:8562:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.th92r37X56:8553:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.th92r37X56:8551:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.th92r37X56:8550:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.th92r37X56:8549:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.th92r37X56:8547:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.th92r37X56:8546:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.th92r37X56:8543:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.th92r37X56:8536:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.th92r37X56:8526:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.th92r37X56:8515:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.th92r37X56:8407:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.th92r37X56:8403:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.th92r37X56:8377:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.th92r37X56:8356:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.th92r37X56:8348:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.th92r37X56:8344:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.th92r37X56:8289:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.th92r37X56:8288:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.th92r37X56:8284:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.th92r37X56:8283:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.th92r37X56:8281:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.th92r37X56:8280:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.th92r37X56:8277:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.VF1qHZ6WtA:3381:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VF1qHZ6WtA:3364:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.VF1qHZ6WtA:3363:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.VF1qHZ6WtA:3359:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.VF1qHZ6WtA:3339:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.VF1qHZ6WtA:3333:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.VF1qHZ6WtA:3324:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.VF1qHZ6WtA:3322:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.VF1qHZ6WtA:3321:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.VF1qHZ6WtA:3320:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.VF1qHZ6WtA:3318:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.VF1qHZ6WtA:3317:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.VF1qHZ6WtA:3314:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.VF1qHZ6WtA:3307:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.VF1qHZ6WtA:3297:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.VF1qHZ6WtA:3286:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VF1qHZ6WtA:3178:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.VF1qHZ6WtA:3174:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VF1qHZ6WtA:3148:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.VF1qHZ6WtA:3127:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.VF1qHZ6WtA:3119:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.VF1qHZ6WtA:3115:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.VF1qHZ6WtA:3060:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.VF1qHZ6WtA:3059:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.VF1qHZ6WtA:3055:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.VF1qHZ6WtA:3054:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.VF1qHZ6WtA:3052:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.VF1qHZ6WtA:3051:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.VF1qHZ6WtA:3048:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Dsjn8fWLnw:4843:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Dsjn8fWLnw:4826:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Dsjn8fWLnw:4825:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.Dsjn8fWLnw:4821:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.Dsjn8fWLnw:4801:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.Dsjn8fWLnw:4795:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.Dsjn8fWLnw:4786:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.Dsjn8fWLnw:4784:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Dsjn8fWLnw:4783:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.Dsjn8fWLnw:4782:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.Dsjn8fWLnw:4780:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.Dsjn8fWLnw:4779:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.Dsjn8fWLnw:4776:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Dsjn8fWLnw:4769:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Dsjn8fWLnw:4759:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.Dsjn8fWLnw:4748:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Dsjn8fWLnw:4640:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.Dsjn8fWLnw:4636:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Dsjn8fWLnw:4610:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.Dsjn8fWLnw:4589:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Dsjn8fWLnw:4581:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.Dsjn8fWLnw:4577:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.Dsjn8fWLnw:4522:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.Dsjn8fWLnw:4521:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.Dsjn8fWLnw:4517:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.Dsjn8fWLnw:4516:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.Dsjn8fWLnw:4514:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.Dsjn8fWLnw:4513:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.Dsjn8fWLnw:4510:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.6nIpi6cFbZ:4906:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6nIpi6cFbZ:4889:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.6nIpi6cFbZ:4888:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.6nIpi6cFbZ:4884:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.6nIpi6cFbZ:4864:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.6nIpi6cFbZ:4858:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.6nIpi6cFbZ:4849:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.6nIpi6cFbZ:4847:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.6nIpi6cFbZ:4846:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.6nIpi6cFbZ:4845:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.6nIpi6cFbZ:4843:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.6nIpi6cFbZ:4842:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.6nIpi6cFbZ:4839:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.6nIpi6cFbZ:4832:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.6nIpi6cFbZ:4822:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.6nIpi6cFbZ:4811:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6nIpi6cFbZ:4703:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.6nIpi6cFbZ:4699:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6nIpi6cFbZ:4673:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.6nIpi6cFbZ:4652:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.6nIpi6cFbZ:4644:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.6nIpi6cFbZ:4640:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.6nIpi6cFbZ:4585:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.6nIpi6cFbZ:4584:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.6nIpi6cFbZ:4580:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.6nIpi6cFbZ:4579:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.6nIpi6cFbZ:4577:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.6nIpi6cFbZ:4576:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.6nIpi6cFbZ:4573:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.5nTcZM4sVf:4000:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.5nTcZM4sVf:3983:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.5nTcZM4sVf:3982:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.5nTcZM4sVf:3978:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.5nTcZM4sVf:3958:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.5nTcZM4sVf:3952:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.5nTcZM4sVf:3943:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.5nTcZM4sVf:3941:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.5nTcZM4sVf:3940:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.5nTcZM4sVf:3939:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.5nTcZM4sVf:3937:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.5nTcZM4sVf:3936:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.5nTcZM4sVf:3933:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.5nTcZM4sVf:3926:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.5nTcZM4sVf:3916:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.5nTcZM4sVf:3905:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.5nTcZM4sVf:3797:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.5nTcZM4sVf:3793:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.5nTcZM4sVf:3767:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.5nTcZM4sVf:3746:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.5nTcZM4sVf:3738:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.5nTcZM4sVf:3734:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.5nTcZM4sVf:3679:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.5nTcZM4sVf:3678:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.5nTcZM4sVf:3674:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.5nTcZM4sVf:3673:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.5nTcZM4sVf:3671:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.5nTcZM4sVf:3670:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.5nTcZM4sVf:3667:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.0oJEciXxBi:8011:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0oJEciXxBi:7994:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.0oJEciXxBi:7993:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.0oJEciXxBi:7989:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.0oJEciXxBi:7969:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.0oJEciXxBi:7963:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.0oJEciXxBi:7954:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.0oJEciXxBi:7952:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.0oJEciXxBi:7951:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.0oJEciXxBi:7950:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.0oJEciXxBi:7948:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.0oJEciXxBi:7947:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.0oJEciXxBi:7944:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.0oJEciXxBi:7937:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.0oJEciXxBi:7927:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.0oJEciXxBi:7916:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0oJEciXxBi:7808:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.0oJEciXxBi:7804:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0oJEciXxBi:7778:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.0oJEciXxBi:7757:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.0oJEciXxBi:7749:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.0oJEciXxBi:7745:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.0oJEciXxBi:7690:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.0oJEciXxBi:7689:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.0oJEciXxBi:7685:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.0oJEciXxBi:7684:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.0oJEciXxBi:7682:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.0oJEciXxBi:7681:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.0oJEciXxBi:7678:warning: override: reassigning to sy=
mbol BPF_SYSCALL

Section mismatches summary:

    5    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    4    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x50): Section mismat=
ch in reference from the variable bcm_iproc_gpio_driver to the variable .in=
it.rodata:bcm_iproc_gpio_of_match
    3    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    3    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    2    WARNING: vmlinux.o(.data+0xbe100): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the (unknown reference) .init.rod=
ata:(unknown)
    2    WARNING: vmlinux.o(.data+0x83e50): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_ipr=
oc_gpio_of_match
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
    1    WARNING: vmlinux.o(.data+0xddeac): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the (unknown reference) .init.rod=
ata:(unknown)
    1    WARNING: vmlinux.o(.data+0xc60a8): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the (unknown reference) .init.rod=
ata:(unknown)
    1    WARNING: vmlinux.o(.data+0xbe3c0): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the (unknown reference) .init.rod=
ata:(unknown)
    1    WARNING: vmlinux.o(.data+0x83970): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_ipr=
oc_gpio_of_match
    1    WARNING: vmlinux.o(.data+0x834a8): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_ipr=
oc_gpio_of_match
    1    WARNING: vmlinux.o(.data+0x110fa0): Section mismatch in reference =
from the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_ip=
roc_gpio_of_match
    1    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x2c): Section mismat=
ch in reference from the variable bcm_iproc_gpio_driver to the (unknown ref=
erence) .init.rodata:(unknown)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 32 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.5nTcZM4sVf:3667:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.5nTcZM4sVf:3670:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.5nTcZM4sVf:3671:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.5nTcZM4sVf:3673:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.5nTcZM4sVf:3674:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.5nTcZM4sVf:3678:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.5nTcZM4sVf:3679:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.5nTcZM4sVf:3734:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.5nTcZM4sVf:3738:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.5nTcZM4sVf:3746:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.5nTcZM4sVf:3767:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.5nTcZM4sVf:3793:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.5nTcZM4sVf:3797:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.5nTcZM4sVf:3905:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.5nTcZM4sVf:3916:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.5nTcZM4sVf:3926:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.5nTcZM4sVf:3933:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.5nTcZM4sVf:3936:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.5nTcZM4sVf:3937:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.5nTcZM4sVf:3939:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.5nTcZM4sVf:3940:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.5nTcZM4sVf:3941:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.5nTcZM4sVf:3943:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.5nTcZM4sVf:3952:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.5nTcZM4sVf:3958:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.5nTcZM4sVf:3978:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.5nTcZM4sVf:3982:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.5nTcZM4sVf:3983:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.5nTcZM4sVf:4000:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 46 warnings, 0 sect=
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
    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when used =
within its own initialization [-Wuninitialized]
    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when used=
 within its own initialization [-Wuninitialized]
    2 warnings generated.
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
    drivers/gpu/drm/amd/amdgpu/../powerplay/renoir_ppt.c:183:26: warning: s=
uggest braces around initialization of subobject [-Wmissing-braces]
    1 warning generated.

Section mismatches:
    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x50): Section mismatch in=
 reference from the variable bcm_iproc_gpio_driver to the variable .init.ro=
data:bcm_iproc_gpio_of_match

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: unmet direct dependencies detected for FSL_RCPM
    lib/cpumask.c:302:1: warning: the frame size of 5280 bytes is larger th=
an 2048 bytes [-Wframe-larger-than=3D]

Section mismatches:
    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x50): Section mismatch in=
 reference from the variable bcm_iproc_gpio_driver to the variable .init.ro=
data:bcm_iproc_gpio_of_match
    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x50): Section mismatch in=
 reference from the variable bcm_iproc_gpio_driver to the variable .init.ro=
data:bcm_iproc_gpio_of_match

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

Section mismatches:
    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x50): Section mismatch in=
 reference from the variable bcm_iproc_gpio_driver to the variable .init.ro=
data:bcm_iproc_gpio_of_match

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 20 warnings, 0 section =
mismatches

Warnings:
    /tmp/ccXfJHTv.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccXfJHTv.s:18191: Warning: using r15 results in unpredictable beha=
viour
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]
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

Section mismatches:
    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x2c): Section mismatch in=
 reference from the variable bcm_iproc_gpio_driver to the (unknown referenc=
e) .init.rodata:(unknown)

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
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
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
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
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
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

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
    WARNING: vmlinux.o(.text.unlikely+0x3630): Section mismatch in referenc=
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
    WARNING: vmlinux.o(.text.unlikely+0x3320): Section mismatch in referenc=
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
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

Section mismatches:
    WARNING: vmlinux.o(.data+0x834a8): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gp=
io_of_match

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

Section mismatches:
    WARNING: vmlinux.o(.data+0x83e50): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gp=
io_of_match

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: vmlinux.o(.data+0x83970): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gp=
io_of_match

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 0 warnings, 0 section mismatches

Section mismatches:
    WARNING: vmlinux.o(.data+0x83e50): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gp=
io_of_match

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 30 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.VF1qHZ6WtA:3048:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.VF1qHZ6WtA:3051:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.VF1qHZ6WtA:3052:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.VF1qHZ6WtA:3054:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.VF1qHZ6WtA:3055:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.VF1qHZ6WtA:3059:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.VF1qHZ6WtA:3060:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.VF1qHZ6WtA:3115:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.VF1qHZ6WtA:3119:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.VF1qHZ6WtA:3127:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.VF1qHZ6WtA:3148:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.VF1qHZ6WtA:3174:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.VF1qHZ6WtA:3178:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.VF1qHZ6WtA:3286:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.VF1qHZ6WtA:3297:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.VF1qHZ6WtA:3307:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.VF1qHZ6WtA:3314:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.VF1qHZ6WtA:3317:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.VF1qHZ6WtA:3318:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.VF1qHZ6WtA:3320:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.VF1qHZ6WtA:3321:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.VF1qHZ6WtA:3322:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.VF1qHZ6WtA:3324:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.VF1qHZ6WtA:3333:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.VF1qHZ6WtA:3339:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.VF1qHZ6WtA:3359:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.VF1qHZ6WtA:3363:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.VF1qHZ6WtA:3364:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.VF1qHZ6WtA:3381:warning: override: reassigning to symbol =
USER_NS
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 29 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.0oJEciXxBi:7678:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.0oJEciXxBi:7681:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.0oJEciXxBi:7682:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.0oJEciXxBi:7684:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.0oJEciXxBi:7685:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.0oJEciXxBi:7689:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.0oJEciXxBi:7690:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.0oJEciXxBi:7745:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.0oJEciXxBi:7749:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.0oJEciXxBi:7757:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.0oJEciXxBi:7778:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.0oJEciXxBi:7804:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.0oJEciXxBi:7808:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.0oJEciXxBi:7916:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.0oJEciXxBi:7927:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.0oJEciXxBi:7937:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.0oJEciXxBi:7944:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.0oJEciXxBi:7947:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.0oJEciXxBi:7948:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.0oJEciXxBi:7950:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.0oJEciXxBi:7951:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.0oJEciXxBi:7952:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.0oJEciXxBi:7954:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.0oJEciXxBi:7963:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.0oJEciXxBi:7969:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.0oJEciXxBi:7989:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.0oJEciXxBi:7993:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.0oJEciXxBi:7994:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.0oJEciXxBi:8011:warning: override: reassigning to symbol =
USER_NS

Section mismatches:
    WARNING: vmlinux.o(.data+0x110fa0): Section mismatch in reference from =
the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_g=
pio_of_match

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
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]
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
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 31 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.Dsjn8fWLnw:4510:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Dsjn8fWLnw:4513:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.Dsjn8fWLnw:4514:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.Dsjn8fWLnw:4516:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.Dsjn8fWLnw:4517:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.Dsjn8fWLnw:4521:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.Dsjn8fWLnw:4522:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.Dsjn8fWLnw:4577:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.Dsjn8fWLnw:4581:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.Dsjn8fWLnw:4589:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Dsjn8fWLnw:4610:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.Dsjn8fWLnw:4636:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Dsjn8fWLnw:4640:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.Dsjn8fWLnw:4748:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Dsjn8fWLnw:4759:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.Dsjn8fWLnw:4769:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Dsjn8fWLnw:4776:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Dsjn8fWLnw:4779:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.Dsjn8fWLnw:4780:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.Dsjn8fWLnw:4782:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.Dsjn8fWLnw:4783:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.Dsjn8fWLnw:4784:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Dsjn8fWLnw:4786:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.Dsjn8fWLnw:4795:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.Dsjn8fWLnw:4801:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.Dsjn8fWLnw:4821:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.Dsjn8fWLnw:4825:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.Dsjn8fWLnw:4826:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Dsjn8fWLnw:4843:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
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
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
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
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
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
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.data+0xbe100): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 2 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.data+0xbe100): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 2 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.data+0xbe3c0): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 =
warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.data+0xc60a8): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 32 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.th92r37X56:8277:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.th92r37X56:8280:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.th92r37X56:8281:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.th92r37X56:8283:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.th92r37X56:8284:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.th92r37X56:8288:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.th92r37X56:8289:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.th92r37X56:8344:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.th92r37X56:8348:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.th92r37X56:8356:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.th92r37X56:8377:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.th92r37X56:8403:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.th92r37X56:8407:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.th92r37X56:8515:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.th92r37X56:8526:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.th92r37X56:8536:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.th92r37X56:8543:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.th92r37X56:8546:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.th92r37X56:8547:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.th92r37X56:8549:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.th92r37X56:8550:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.th92r37X56:8551:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.th92r37X56:8553:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.th92r37X56:8562:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.th92r37X56:8568:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.th92r37X56:8588:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.th92r37X56:8592:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.th92r37X56:8593:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.th92r37X56:8610:warning: override: reassigning to symbol =
USER_NS
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]

Section mismatches:
    WARNING: vmlinux.o(.data+0xddeac): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

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
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
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
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
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
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
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
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

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
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
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
    .config:1167:warning: override: UNWINDER_GUESS changes choice state

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
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
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
    ./.tmp.config.6nIpi6cFbZ:4573:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.6nIpi6cFbZ:4576:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.6nIpi6cFbZ:4577:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.6nIpi6cFbZ:4579:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.6nIpi6cFbZ:4580:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.6nIpi6cFbZ:4584:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.6nIpi6cFbZ:4585:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.6nIpi6cFbZ:4640:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.6nIpi6cFbZ:4644:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.6nIpi6cFbZ:4652:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.6nIpi6cFbZ:4673:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.6nIpi6cFbZ:4699:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.6nIpi6cFbZ:4703:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.6nIpi6cFbZ:4811:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.6nIpi6cFbZ:4822:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.6nIpi6cFbZ:4832:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.6nIpi6cFbZ:4839:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.6nIpi6cFbZ:4842:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.6nIpi6cFbZ:4843:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.6nIpi6cFbZ:4845:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.6nIpi6cFbZ:4846:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.6nIpi6cFbZ:4847:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.6nIpi6cFbZ:4849:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.6nIpi6cFbZ:4858:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.6nIpi6cFbZ:4864:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.6nIpi6cFbZ:4884:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.6nIpi6cFbZ:4888:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.6nIpi6cFbZ:4889:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.6nIpi6cFbZ:4906:warning: override: reassigning to symbol =
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
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---
For more info write to <info@kernelci.org>
