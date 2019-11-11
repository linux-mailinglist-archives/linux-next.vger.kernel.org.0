Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74014F72AE
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2019 12:01:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbfKKLBu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Nov 2019 06:01:50 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39288 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726768AbfKKLBt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Nov 2019 06:01:49 -0500
Received: by mail-wm1-f65.google.com with SMTP id t26so12722893wmi.4
        for <linux-next@vger.kernel.org>; Mon, 11 Nov 2019 03:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=77mWfB77mutaoEoQPEqoz3wpSilDfYTx8jV7UBsOmGE=;
        b=Keuos5NxxZWRxB/nHqaNK2Ig2xu2o8Ta1N93iXI0VWgC5Pk33P9odnhhc/83omH82p
         o87ng4ECn88NOzEO265ZPpgfigQWHK6yGazRgZFaaOLv8r+tHwAMSU+5sYHBGzbxmeJL
         Yjktiyhx2Y4ivRLhR9TL2cySvHNB/sMuImUMhKP1UwMA2gT0FVhgK3vNbPPmxUxfDDuU
         kz/FRBJIERaPXyWgNRMYDCxpVjjRgI88LIdbZ/Bh/bBiMN+he/SZ/SC0b5VOJDHDaS1T
         zmFciMd99CBgAk75r9SmLLc0t0fJq88wEI7UafIDvHnks32ALdQ7AHE3Up7LsA1rnKAi
         hQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=77mWfB77mutaoEoQPEqoz3wpSilDfYTx8jV7UBsOmGE=;
        b=OrbYz4ii29blXXsbs3AEk+LOoGHMskDNtzhFSm+162noF1DmgASLQyQTedbuwqYzlI
         q5uUciklq0mS+z/LVQzZItkndRjAJ66lhmuwoS0T4NJGWFr83Owx0AjktK/UicfjmwMq
         DJWjHk6UGymATLM5kcvFZFDPwn5u9MmTXDO2soHMeRxfBfrhRigBc3KMzPH/x/Ubgfyn
         8pk20eLJcNGn3tMFrf2U5w2AoI3xKUOZzl+WoyLsrgt99dsDpHzykzNUp4o6M7emr7mq
         wKY9Rd7clSFaJwjgWBgPtvpnHzCjJ++J9kerJZYj0CmZXhD9NDzaY+cMSwXbLeoa7UZQ
         4+Gw==
X-Gm-Message-State: APjAAAXjs+1rqHjK3Y6O8Tj8448hrA20HlTvxMcn51PXsBlOIzhppTO2
        svsE2UtNrcjdt/FGPTgbSVLXvWrEaKMuqw==
X-Google-Smtp-Source: APXvYqxc4/NWuKXVQ0PFTpe5lhFhT3GhjA1fgF4wgYKy7IejcvhRwdpany1+we4jAAqoWf/pJh+7Xw==
X-Received: by 2002:a1c:1d48:: with SMTP id d69mr18587367wmd.160.1573470097566;
        Mon, 11 Nov 2019 03:01:37 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b186sm14732157wmb.21.2019.11.11.03.01.35
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 03:01:35 -0800 (PST)
Message-ID: <5dc93f8f.1c69fb81.e33bb.39df@mx.google.com>
Date:   Mon, 11 Nov 2019 03:01:35 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20191111
Subject: next/master build: 216 builds: 1 failed, 215 passed, 4 errors,
 641 warnings (next-20191111)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 216 builds: 1 failed, 215 passed, 4 errors, 641 warnings=
 (next-20191111)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191111/

Tree: next
Branch: master
Git Describe: next-20191111
Git Commit: 6980b7f6f9db7d5f344ae202012460e9d8869d89
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failure Detected:

mips:
    cavium_octeon_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 4 warnings
    axs103_smp_defconfig (gcc-8): 4 warnings
    haps_hs_defconfig (gcc-8): 3 warnings
    haps_hs_smp_defconfig (gcc-8): 3 warnings
    hsdk_defconfig (gcc-8): 4 warnings
    nsimosci_hs_defconfig (gcc-8): 3 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 3 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 3 warnings
    vdk_hs38_smp_defconfig (gcc-8): 3 warnings

arm64:
    allmodconfig (clang-8): 52 warnings
    defconfig (gcc-8): 1 warning
    defconfig (clang-8): 2 warnings
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 30 warnings

arm:
    allmodconfig (gcc-8): 20 warnings
    am200epdkit_defconfig (gcc-8): 2 warnings
    aspeed_g4_defconfig (gcc-8): 1 warning
    aspeed_g5_defconfig (gcc-8): 1 warning
    assabet_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (gcc-8): 3 warnings
    axm55xx_defconfig (gcc-8): 3 warnings
    badge4_defconfig (gcc-8): 2 warnings
    bcm2835_defconfig (gcc-8): 2 warnings
    cerfcube_defconfig (gcc-8): 2 warnings
    clps711x_defconfig (gcc-8): 1 warning
    cm_x2xx_defconfig (gcc-8): 3 warnings
    cm_x300_defconfig (gcc-8): 3 warnings
    cns3420vb_defconfig (gcc-8): 1 warning
    colibri_pxa270_defconfig (gcc-8): 2 warnings
    colibri_pxa300_defconfig (gcc-8): 3 warnings
    collie_defconfig (gcc-8): 1 warning
    corgi_defconfig (gcc-8): 1 warning
    davinci_all_defconfig (gcc-8): 3 warnings
    dove_defconfig (gcc-8): 3 warnings
    ebsa110_defconfig (gcc-8): 1 warning
    efm32_defconfig (gcc-8): 1 warning
    em_x270_defconfig (gcc-8): 3 warnings
    ep93xx_defconfig (gcc-8): 3 warnings
    eseries_pxa_defconfig (gcc-8): 3 warnings
    exynos_defconfig (gcc-8): 3 warnings
    ezx_defconfig (gcc-8): 3 warnings
    footbridge_defconfig (gcc-8): 1 warning
    gemini_defconfig (gcc-8): 1 warning
    h3600_defconfig (gcc-8): 1 warning
    h5000_defconfig (gcc-8): 2 warnings
    hackkit_defconfig (gcc-8): 1 warning
    hisi_defconfig (gcc-8): 2 warnings
    imote2_defconfig (gcc-8): 3 warnings
    imx_v4_v5_defconfig (gcc-8): 3 warnings
    imx_v6_v7_defconfig (gcc-8): 2 warnings
    integrator_defconfig (gcc-8): 2 warnings
    iop32x_defconfig (gcc-8): 2 warnings
    ixp4xx_defconfig (gcc-8): 3 warnings
    jornada720_defconfig (gcc-8): 1 warning
    keystone_defconfig (gcc-8): 3 warnings
    lart_defconfig (gcc-8): 2 warnings
    lpc18xx_defconfig (gcc-8): 1 warning
    lpc32xx_defconfig (gcc-8): 2 warnings
    lpd270_defconfig (gcc-8): 1 warning
    lubbock_defconfig (gcc-8): 1 warning
    magician_defconfig (gcc-8): 2 warnings
    mainstone_defconfig (gcc-8): 1 warning
    milbeaut_m10v_defconfig (gcc-8): 2 warnings
    mini2440_defconfig (gcc-8): 3 warnings
    mmp2_defconfig (gcc-8): 3 warnings
    moxart_defconfig (gcc-8): 2 warnings
    mps2_defconfig (gcc-8): 1 warning
    multi_v5_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 33 warnings
    mv78xx0_defconfig (gcc-8): 3 warnings
    mvebu_v5_defconfig (gcc-8): 3 warnings
    mvebu_v7_defconfig (gcc-8): 2 warnings
    mxs_defconfig (gcc-8): 3 warnings
    neponset_defconfig (gcc-8): 1 warning
    netwinder_defconfig (gcc-8): 1 warning
    nhk8815_defconfig (gcc-8): 3 warnings
    omap1_defconfig (gcc-8): 3 warnings
    omap2plus_defconfig (gcc-8): 2 warnings
    orion5x_defconfig (gcc-8): 3 warnings
    oxnas_v6_defconfig (gcc-8): 3 warnings
    palmz72_defconfig (gcc-8): 3 warnings
    pcm027_defconfig (gcc-8): 3 warnings
    pleb_defconfig (gcc-8): 2 warnings
    prima2_defconfig (gcc-8): 1 warning
    pxa168_defconfig (gcc-8): 2 warnings
    pxa255-idp_defconfig (gcc-8): 1 warning
    pxa3xx_defconfig (gcc-8): 2 warnings
    pxa910_defconfig (gcc-8): 2 warnings
    pxa_defconfig (gcc-8): 2 warnings
    qcom_defconfig (gcc-8): 3 warnings
    realview_defconfig (gcc-8): 2 warnings
    rpc_defconfig (gcc-8): 2 warnings
    s3c2410_defconfig (gcc-8): 2 warnings
    s3c6400_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (gcc-8): 3 warnings
    sama5_defconfig (gcc-8): 3 warnings
    shannon_defconfig (gcc-8): 1 warning
    shmobile_defconfig (gcc-8): 1 warning
    simpad_defconfig (gcc-8): 2 warnings
    socfpga_defconfig (gcc-8): 2 warnings
    spear13xx_defconfig (gcc-8): 3 warnings
    spear3xx_defconfig (gcc-8): 2 warnings
    spear6xx_defconfig (gcc-8): 2 warnings
    spitz_defconfig (gcc-8): 2 warnings
    stm32_defconfig (gcc-8): 1 warning
    sunxi_defconfig (gcc-8): 3 warnings
    tango4_defconfig (gcc-8): 3 warnings
    tct_hammer_defconfig (gcc-8): 1 warning
    tegra_defconfig (gcc-8): 3 warnings
    trizeps4_defconfig (gcc-8): 3 warnings
    u300_defconfig (gcc-8): 1 warning
    u8500_defconfig (gcc-8): 3 warnings
    versatile_defconfig (gcc-8): 2 warnings
    vexpress_defconfig (gcc-8): 3 warnings
    vf610m4_defconfig (gcc-8): 1 warning
    viper_defconfig (gcc-8): 3 warnings
    vt8500_v6_v7_defconfig (gcc-8): 2 warnings
    xcep_defconfig (gcc-8): 2 warnings
    zeus_defconfig (gcc-8): 3 warnings
    zx_defconfig (gcc-8): 1 warning

i386:
    i386_defconfig (gcc-8): 1 warning
    i386_defconfig (gcc-8): 32 warnings

mips:
    32r2el_defconfig (gcc-8): 2 warnings
    32r2el_defconfig (gcc-8): 34 warnings
    ar7_defconfig (gcc-8): 1 warning
    ath25_defconfig (gcc-8): 1 warning
    ath79_defconfig (gcc-8): 1 warning
    bcm47xx_defconfig (gcc-8): 1 warning
    bcm63xx_defconfig (gcc-8): 1 warning
    bigsur_defconfig (gcc-8): 1 warning
    bmips_be_defconfig (gcc-8): 2 warnings
    bmips_stb_defconfig (gcc-8): 2 warnings
    capcella_defconfig (gcc-8): 2 warnings
    cavium_octeon_defconfig (gcc-8): 4 errors, 5 warnings
    ci20_defconfig (gcc-8): 2 warnings
    cobalt_defconfig (gcc-8): 2 warnings
    db1xxx_defconfig (gcc-8): 2 warnings
    decstation_64_defconfig (gcc-8): 2 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
    e55_defconfig (gcc-8): 1 warning
    fuloong2e_defconfig (gcc-8): 2 warnings
    gcw0_defconfig (gcc-8): 1 warning
    gpr_defconfig (gcc-8): 1 warning
    ip22_defconfig (gcc-8): 1 warning
    ip27_defconfig (gcc-8): 2 warnings
    ip28_defconfig (gcc-8): 1 warning
    ip32_defconfig (gcc-8): 1 warning
    jazz_defconfig (gcc-8): 2 warnings
    jmr3927_defconfig (gcc-8): 1 warning
    lasat_defconfig (gcc-8): 2 warnings
    lemote2f_defconfig (gcc-8): 1 warning
    loongson1b_defconfig (gcc-8): 2 warnings
    loongson1c_defconfig (gcc-8): 2 warnings
    loongson3_defconfig (gcc-8): 1 warning
    malta_defconfig (gcc-8): 1 warning
    malta_kvm_defconfig (gcc-8): 1 warning
    malta_kvm_guest_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 2 warnings
    maltaaprp_defconfig (gcc-8): 1 warning
    maltasmvp_defconfig (gcc-8): 1 warning
    maltasmvp_eva_defconfig (gcc-8): 1 warning
    maltaup_defconfig (gcc-8): 1 warning
    maltaup_xpa_defconfig (gcc-8): 1 warning
    markeins_defconfig (gcc-8): 2 warnings
    mips_paravirt_defconfig (gcc-8): 2 warnings
    mpc30x_defconfig (gcc-8): 1 warning
    msp71xx_defconfig (gcc-8): 1 warning
    mtx1_defconfig (gcc-8): 1 warning
    nlm_xlp_defconfig (gcc-8): 2 warnings
    nlm_xlr_defconfig (gcc-8): 3 warnings
    omega2p_defconfig (gcc-8): 1 warning
    pic32mzda_defconfig (gcc-8): 1 warning
    pistachio_defconfig (gcc-8): 2 warnings
    pnx8335_stb225_defconfig (gcc-8): 1 warning
    qi_lb60_defconfig (gcc-8): 2 warnings
    rb532_defconfig (gcc-8): 1 warning
    rbtx49xx_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 2 warnings
    rt305x_defconfig (gcc-8): 1 warning
    sb1250_swarm_defconfig (gcc-8): 1 warning
    tb0219_defconfig (gcc-8): 2 warnings
    tb0226_defconfig (gcc-8): 1 warning
    tb0287_defconfig (gcc-8): 2 warnings
    vocore2_defconfig (gcc-8): 1 warning
    workpad_defconfig (gcc-8): 2 warnings
    xway_defconfig (gcc-8): 1 warning

riscv:
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 31 warnings
    rv32_defconfig (gcc-8): 8 warnings

x86_64:
    allmodconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 30 warnings
    x86_64_defconfig (gcc-8): 1 warning

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

    185  include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' define=
d but not used [-Wunused-function]
    105  fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-=
variable]
    64   WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    20   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    17   1 warning generated.
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    5    include/linux/kern_levels.h:5:18: warning: format '%lu' expects ar=
gument of type 'long unsigned int', but argument 8 has type 'unsigned int' =
[-Wformat=3D]
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
    1    net/tipc/crypto.c:466:3: warning: variable 'err' is uninitialized =
when used here [-Wuninitialized]
    1    net/tipc/crypto.c:430:17: note: initialize the variable 'err' to s=
ilence this warning
    1    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitia=
lized when used within its own initialization [-Wuninitialized]
    1    mm/shmem.c:2737:35: warning: variable 'shmem_falloc_waitq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    lib/cpumask.c:302:1: warning: the frame size of 5280 bytes is larg=
er than 2048 bytes [-Wframe-larger-than=3D]
    1    include/linux/sfp.h:566:12: warning: unused function 'sfp_bus_add_=
upstream' [-Wunused-function]
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
    1    /tmp/ccivT6dM.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccivT6dM.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1167:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.sA453kh8pS:8614:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.sA453kh8pS:8597:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.sA453kh8pS:8596:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.sA453kh8pS:8592:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.sA453kh8pS:8572:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.sA453kh8pS:8566:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.sA453kh8pS:8557:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.sA453kh8pS:8555:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.sA453kh8pS:8554:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.sA453kh8pS:8553:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.sA453kh8pS:8551:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.sA453kh8pS:8550:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.sA453kh8pS:8547:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.sA453kh8pS:8540:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.sA453kh8pS:8530:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.sA453kh8pS:8519:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.sA453kh8pS:8411:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.sA453kh8pS:8407:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.sA453kh8pS:8381:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.sA453kh8pS:8360:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.sA453kh8pS:8352:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.sA453kh8pS:8348:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.sA453kh8pS:8293:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.sA453kh8pS:8292:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.sA453kh8pS:8288:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.sA453kh8pS:8287:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.sA453kh8pS:8285:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.sA453kh8pS:8284:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.sA453kh8pS:8281:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ez91MizXhR:4904:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ez91MizXhR:4887:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ez91MizXhR:4886:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.ez91MizXhR:4882:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.ez91MizXhR:4862:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.ez91MizXhR:4856:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.ez91MizXhR:4847:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.ez91MizXhR:4845:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ez91MizXhR:4844:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.ez91MizXhR:4843:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.ez91MizXhR:4841:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.ez91MizXhR:4840:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.ez91MizXhR:4837:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ez91MizXhR:4830:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ez91MizXhR:4820:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.ez91MizXhR:4809:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ez91MizXhR:4701:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.ez91MizXhR:4697:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ez91MizXhR:4671:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.ez91MizXhR:4650:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ez91MizXhR:4642:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.ez91MizXhR:4638:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.ez91MizXhR:4583:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.ez91MizXhR:4582:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.ez91MizXhR:4578:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.ez91MizXhR:4577:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.ez91MizXhR:4575:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.ez91MizXhR:4574:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.ez91MizXhR:4571:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.YTKpvbTFLU:4005:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.YTKpvbTFLU:3988:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.YTKpvbTFLU:3987:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.YTKpvbTFLU:3983:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.YTKpvbTFLU:3963:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.YTKpvbTFLU:3957:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.YTKpvbTFLU:3948:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.YTKpvbTFLU:3946:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.YTKpvbTFLU:3945:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.YTKpvbTFLU:3944:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.YTKpvbTFLU:3942:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.YTKpvbTFLU:3941:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.YTKpvbTFLU:3938:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.YTKpvbTFLU:3931:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.YTKpvbTFLU:3921:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.YTKpvbTFLU:3910:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.YTKpvbTFLU:3802:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.YTKpvbTFLU:3798:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.YTKpvbTFLU:3772:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.YTKpvbTFLU:3751:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.YTKpvbTFLU:3743:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.YTKpvbTFLU:3739:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.YTKpvbTFLU:3684:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.YTKpvbTFLU:3683:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.YTKpvbTFLU:3679:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.YTKpvbTFLU:3678:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.YTKpvbTFLU:3676:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.YTKpvbTFLU:3675:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.YTKpvbTFLU:3672:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.NNXd2eMkTf:3382:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.NNXd2eMkTf:3365:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.NNXd2eMkTf:3364:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.NNXd2eMkTf:3360:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.NNXd2eMkTf:3340:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.NNXd2eMkTf:3334:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.NNXd2eMkTf:3325:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.NNXd2eMkTf:3323:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.NNXd2eMkTf:3322:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.NNXd2eMkTf:3321:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.NNXd2eMkTf:3319:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.NNXd2eMkTf:3318:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.NNXd2eMkTf:3315:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.NNXd2eMkTf:3308:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.NNXd2eMkTf:3298:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.NNXd2eMkTf:3287:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.NNXd2eMkTf:3179:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.NNXd2eMkTf:3175:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.NNXd2eMkTf:3149:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.NNXd2eMkTf:3128:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.NNXd2eMkTf:3120:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.NNXd2eMkTf:3116:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.NNXd2eMkTf:3061:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.NNXd2eMkTf:3060:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.NNXd2eMkTf:3056:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.NNXd2eMkTf:3055:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.NNXd2eMkTf:3053:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.NNXd2eMkTf:3052:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.NNXd2eMkTf:3049:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.90QJ6kdfg4:8017:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.90QJ6kdfg4:8000:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.90QJ6kdfg4:7999:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.90QJ6kdfg4:7995:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.90QJ6kdfg4:7975:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.90QJ6kdfg4:7969:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.90QJ6kdfg4:7960:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.90QJ6kdfg4:7958:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.90QJ6kdfg4:7957:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.90QJ6kdfg4:7956:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.90QJ6kdfg4:7954:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.90QJ6kdfg4:7953:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.90QJ6kdfg4:7950:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.90QJ6kdfg4:7943:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.90QJ6kdfg4:7933:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.90QJ6kdfg4:7922:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.90QJ6kdfg4:7814:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.90QJ6kdfg4:7810:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.90QJ6kdfg4:7784:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.90QJ6kdfg4:7763:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.90QJ6kdfg4:7755:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.90QJ6kdfg4:7751:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.90QJ6kdfg4:7696:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.90QJ6kdfg4:7695:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.90QJ6kdfg4:7691:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.90QJ6kdfg4:7690:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.90QJ6kdfg4:7688:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.90QJ6kdfg4:7687:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.90QJ6kdfg4:7684:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.8gvp2e3CmZ:4841:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.8gvp2e3CmZ:4824:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.8gvp2e3CmZ:4823:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.8gvp2e3CmZ:4819:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.8gvp2e3CmZ:4799:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.8gvp2e3CmZ:4793:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.8gvp2e3CmZ:4784:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.8gvp2e3CmZ:4782:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.8gvp2e3CmZ:4781:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.8gvp2e3CmZ:4780:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.8gvp2e3CmZ:4778:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.8gvp2e3CmZ:4777:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.8gvp2e3CmZ:4774:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.8gvp2e3CmZ:4767:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.8gvp2e3CmZ:4757:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.8gvp2e3CmZ:4746:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.8gvp2e3CmZ:4638:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.8gvp2e3CmZ:4634:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.8gvp2e3CmZ:4608:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.8gvp2e3CmZ:4587:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.8gvp2e3CmZ:4579:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.8gvp2e3CmZ:4575:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.8gvp2e3CmZ:4520:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.8gvp2e3CmZ:4519:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.8gvp2e3CmZ:4515:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.8gvp2e3CmZ:4514:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.8gvp2e3CmZ:4512:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.8gvp2e3CmZ:4511:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.8gvp2e3CmZ:4508:warning: override: reassigning to sy=
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
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 34 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.YTKpvbTFLU:3672:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.YTKpvbTFLU:3675:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.YTKpvbTFLU:3676:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.YTKpvbTFLU:3678:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.YTKpvbTFLU:3679:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.YTKpvbTFLU:3683:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.YTKpvbTFLU:3684:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.YTKpvbTFLU:3739:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.YTKpvbTFLU:3743:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.YTKpvbTFLU:3751:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.YTKpvbTFLU:3772:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.YTKpvbTFLU:3798:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.YTKpvbTFLU:3802:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.YTKpvbTFLU:3910:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.YTKpvbTFLU:3921:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.YTKpvbTFLU:3931:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.YTKpvbTFLU:3938:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.YTKpvbTFLU:3941:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.YTKpvbTFLU:3942:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.YTKpvbTFLU:3944:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.YTKpvbTFLU:3945:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.YTKpvbTFLU:3946:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.YTKpvbTFLU:3948:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.YTKpvbTFLU:3957:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.YTKpvbTFLU:3963:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.YTKpvbTFLU:3983:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.YTKpvbTFLU:3987:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.YTKpvbTFLU:3988:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.YTKpvbTFLU:4005:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 52 warnings, 0 sect=
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
    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized when=
 used within its own initialization [-Wuninitialized]
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
    drivers/net/usb/lan78xx.c:2665:34: warning: variable 'unlink_wakeup' is=
 uninitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    net/tipc/crypto.c:466:3: warning: variable 'err' is uninitialized when =
used here [-Wuninitialized]
    net/tipc/crypto.c:430:17: note: initialize the variable 'err' to silenc=
e this warning
    1 warning generated.
    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    2 warnings generated.
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
    drivers/scsi/lpfc/lpfc_sli.c:11909:34: warning: variable 'done_q' is un=
initialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/scsi/lpfc/lpfc_scsi.c:4726:34: warning: variable 'waitq' is uni=
nitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    lib/cpumask.c:302:1: warning: the frame size of 5280 bytes is larger th=
an 2048 bytes [-Wframe-larger-than=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 20 warnings, 0 section =
mismatches

Warnings:
    /tmp/ccivT6dM.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccivT6dM.s:18191: Warning: using r15 results in unpredictable beha=
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
allnoconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

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
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 4 errors, 5 warnings,=
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
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    drivers/staging/octeon/octeon-ethernet.h:94:12: warning: 'union cvmx_he=
lper_link_info' declared inside parameter list will not be visible outside =
of this definition or declaration
    drivers/staging/octeon/ethernet.c:463:30: warning: unused variable 'lin=
k_info' [-Wunused-variable]
    drivers/staging/octeon/ethernet.c:499:30: warning: unused variable 'lin=
k_info' [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
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
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3630): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3320): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: unused function 'sfp_bus_add_upstr=
eam' [-Wunused-function]
    1 warning generated.

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 31 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.NNXd2eMkTf:3049:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.NNXd2eMkTf:3052:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.NNXd2eMkTf:3053:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.NNXd2eMkTf:3055:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.NNXd2eMkTf:3056:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.NNXd2eMkTf:3060:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.NNXd2eMkTf:3061:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.NNXd2eMkTf:3116:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.NNXd2eMkTf:3120:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.NNXd2eMkTf:3128:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.NNXd2eMkTf:3149:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.NNXd2eMkTf:3175:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.NNXd2eMkTf:3179:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.NNXd2eMkTf:3287:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.NNXd2eMkTf:3298:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.NNXd2eMkTf:3308:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.NNXd2eMkTf:3315:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.NNXd2eMkTf:3318:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.NNXd2eMkTf:3319:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.NNXd2eMkTf:3321:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.NNXd2eMkTf:3322:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.NNXd2eMkTf:3323:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.NNXd2eMkTf:3325:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.NNXd2eMkTf:3334:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.NNXd2eMkTf:3340:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.NNXd2eMkTf:3360:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.NNXd2eMkTf:3364:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.NNXd2eMkTf:3365:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.NNXd2eMkTf:3382:warning: override: reassigning to symbol =
USER_NS
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 30 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.90QJ6kdfg4:7684:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.90QJ6kdfg4:7687:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.90QJ6kdfg4:7688:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.90QJ6kdfg4:7690:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.90QJ6kdfg4:7691:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.90QJ6kdfg4:7695:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.90QJ6kdfg4:7696:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.90QJ6kdfg4:7751:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.90QJ6kdfg4:7755:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.90QJ6kdfg4:7763:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.90QJ6kdfg4:7784:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.90QJ6kdfg4:7810:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.90QJ6kdfg4:7814:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.90QJ6kdfg4:7922:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.90QJ6kdfg4:7933:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.90QJ6kdfg4:7943:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.90QJ6kdfg4:7950:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.90QJ6kdfg4:7953:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.90QJ6kdfg4:7954:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.90QJ6kdfg4:7956:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.90QJ6kdfg4:7957:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.90QJ6kdfg4:7958:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.90QJ6kdfg4:7960:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.90QJ6kdfg4:7969:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.90QJ6kdfg4:7975:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.90QJ6kdfg4:7995:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.90QJ6kdfg4:7999:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.90QJ6kdfg4:8000:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.90QJ6kdfg4:8017:warning: override: reassigning to symbol =
USER_NS
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
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
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
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
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 32 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.8gvp2e3CmZ:4508:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.8gvp2e3CmZ:4511:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.8gvp2e3CmZ:4512:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.8gvp2e3CmZ:4514:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.8gvp2e3CmZ:4515:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.8gvp2e3CmZ:4519:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.8gvp2e3CmZ:4520:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.8gvp2e3CmZ:4575:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.8gvp2e3CmZ:4579:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.8gvp2e3CmZ:4587:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.8gvp2e3CmZ:4608:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.8gvp2e3CmZ:4634:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.8gvp2e3CmZ:4638:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.8gvp2e3CmZ:4746:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.8gvp2e3CmZ:4757:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.8gvp2e3CmZ:4767:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.8gvp2e3CmZ:4774:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.8gvp2e3CmZ:4777:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.8gvp2e3CmZ:4778:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.8gvp2e3CmZ:4780:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.8gvp2e3CmZ:4781:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.8gvp2e3CmZ:4782:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.8gvp2e3CmZ:4784:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.8gvp2e3CmZ:4793:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.8gvp2e3CmZ:4799:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.8gvp2e3CmZ:4819:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.8gvp2e3CmZ:4823:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.8gvp2e3CmZ:4824:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.8gvp2e3CmZ:4841:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
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
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

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
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    {standard input}:134: Warning: macro instruction expanded into multiple=
 instructions

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

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
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

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
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 3 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 =
warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 33 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.sA453kh8pS:8281:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.sA453kh8pS:8284:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.sA453kh8pS:8285:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.sA453kh8pS:8287:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.sA453kh8pS:8288:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.sA453kh8pS:8292:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.sA453kh8pS:8293:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.sA453kh8pS:8348:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.sA453kh8pS:8352:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.sA453kh8pS:8360:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.sA453kh8pS:8381:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.sA453kh8pS:8407:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.sA453kh8pS:8411:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.sA453kh8pS:8519:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.sA453kh8pS:8530:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.sA453kh8pS:8540:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.sA453kh8pS:8547:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.sA453kh8pS:8550:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.sA453kh8pS:8551:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.sA453kh8pS:8553:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.sA453kh8pS:8554:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.sA453kh8pS:8555:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.sA453kh8pS:8557:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.sA453kh8pS:8566:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.sA453kh8pS:8572:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.sA453kh8pS:8592:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.sA453kh8pS:8596:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.sA453kh8pS:8597:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.sA453kh8pS:8614:warning: override: reassigning to symbol =
USER_NS
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
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
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
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
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable 'rtd' [-Wunus=
ed-variable]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
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
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

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
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
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
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
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
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 30 war=
nings, 0 section mismatches

Warnings:
    ./.tmp.config.ez91MizXhR:4571:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.ez91MizXhR:4574:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.ez91MizXhR:4575:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.ez91MizXhR:4577:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.ez91MizXhR:4578:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.ez91MizXhR:4582:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.ez91MizXhR:4583:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.ez91MizXhR:4638:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.ez91MizXhR:4642:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.ez91MizXhR:4650:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.ez91MizXhR:4671:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.ez91MizXhR:4697:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.ez91MizXhR:4701:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.ez91MizXhR:4809:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.ez91MizXhR:4820:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.ez91MizXhR:4830:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.ez91MizXhR:4837:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.ez91MizXhR:4840:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.ez91MizXhR:4841:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.ez91MizXhR:4843:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.ez91MizXhR:4844:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.ez91MizXhR:4845:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.ez91MizXhR:4847:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.ez91MizXhR:4856:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.ez91MizXhR:4862:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.ez91MizXhR:4882:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.ez91MizXhR:4886:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.ez91MizXhR:4887:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.ez91MizXhR:4904:warning: override: reassigning to symbol =
USER_NS
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
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
