Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8190FF135F
	for <lists+linux-next@lfdr.de>; Wed,  6 Nov 2019 11:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfKFKJg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Nov 2019 05:09:36 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34794 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfKFKJg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Nov 2019 05:09:36 -0500
Received: by mail-wm1-f67.google.com with SMTP id v3so1960760wmh.1
        for <linux-next@vger.kernel.org>; Wed, 06 Nov 2019 02:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=RDJFhs6MSNc4xhxeKUld6xhvXIUx5IUnigd7+qwUhGM=;
        b=B4nf2oxoIkBRkz4q/XIWl6wj6q6aXfMvgsKtkXj+oCSlxLG9iNhuiKn2KU+cRB82rB
         PjVHuD2Do8rGHDm9TTeV8i/0+D6nwzclDKQpiMg5jMLjt8pe8SxncvfL/lNn7LATg5NB
         KzZ4iui0BuoeNi6V37wZhfyM7Xw2Xz0VV7I3zBeG8AO7VMsOQRwOE/4510SeN7fs/a3R
         qywVpGzWRUIW0FvcLYxkPAuIQMcSvQ437Wc6obKx+xRAn8XaMwhaFDoRA5CdcRsMHm0f
         Q0AsVSSORB9TdXbr1/j4SkUSOYk3/gaDJ3fXJQMOwt6mYgMIsPc5TzmiJZ1DduKudbPz
         y4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=RDJFhs6MSNc4xhxeKUld6xhvXIUx5IUnigd7+qwUhGM=;
        b=fTJbDPOj69KtKhZytTk/8+5+yEBD7MqL1pd4am/VRBoQo+tzx8SOzI4DumaHK+OBi2
         anXaCK+UCs/HhWRUOixQ0+wiMZzYO+Zwr3WSnWyXJ9qxbfenyFY+BC3pLx+X/igi91jD
         drH5j7PPGYnBnNJDPtyTSLqzqGURjiwmRxFzTFBbD7c2w4sEArIYqVeJ7elAgpsFngZf
         OWH9ZCulUMZDJFn2jD57GqBcUxtu0NVbiYkuAwYVYxwr+10aIeTDRFYada3NEAGxB9Tw
         V0K2EcZ2gNmAOsxIbhisSNsSWj8+xvzIKLB/8DODvXeyU3SknKd6eIV47pbjJOSCf+5i
         SP4g==
X-Gm-Message-State: APjAAAVqDQbK4M449lDtrLEqDj+Dx9XynNnClvjy1bKNDZuEWFPpf7H8
        MgW6bGm7MU1G6XH9b9BdIxo5o3AzDoq3qQ==
X-Google-Smtp-Source: APXvYqw+XaKfkuLqvNW6qo3t8IuhYNe5W2yZ3HvBsp9YGY58woAHlEU8anRVcgo2sfvX3cVCeLUKWA==
X-Received: by 2002:a7b:c94f:: with SMTP id i15mr1767578wml.31.1573034961098;
        Wed, 06 Nov 2019 02:09:21 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 11sm2304722wmb.34.2019.11.06.02.09.19
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 02:09:20 -0800 (PST)
Message-ID: <5dc29bd0.1c69fb81.31968.c1f5@mx.google.com>
Date:   Wed, 06 Nov 2019 02:09:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20191106
Subject: next/master build: 216 builds: 2 failed, 214 passed, 11 errors,
 682 warnings (next-20191106)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 216 builds: 2 failed, 214 passed, 11 errors, 682 warning=
s (next-20191106)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191106/

Tree: next
Branch: master
Git Describe: next-20191106
Git Commit: dcd34bd234181ec74f081c7d0025204afe6b213e
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    allmodconfig: (gcc-8) FAIL

mips:
    cavium_octeon_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 2 warnings
    axs103_defconfig (gcc-8): 4 warnings
    axs103_smp_defconfig (gcc-8): 4 warnings
    haps_hs_defconfig (gcc-8): 3 warnings
    haps_hs_smp_defconfig (gcc-8): 3 warnings
    hsdk_defconfig (gcc-8): 4 warnings
    nsimosci_hs_defconfig (gcc-8): 3 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 3 warnings
    tinyconfig (gcc-8): 2 warnings
    vdk_hs38_defconfig (gcc-8): 3 warnings
    vdk_hs38_smp_defconfig (gcc-8): 3 warnings

arm64:
    allmodconfig (clang-8): 48 warnings
    allmodconfig (gcc-8): 2 warnings
    allnoconfig (gcc-8): 1 warning
    allnoconfig (clang-8): 2 warnings
    defconfig (clang-8): 2 warnings
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 30 warnings
    tinyconfig (gcc-8): 1 warning

arm:
    allmodconfig (gcc-8): 2 errors, 21 warnings
    allnoconfig (gcc-8): 1 warning
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
    cns3420vb_defconfig (gcc-8): 2 warnings
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
    eseries_pxa_defconfig (gcc-8): 4 warnings
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
    magician_defconfig (gcc-8): 3 warnings
    mainstone_defconfig (gcc-8): 1 warning
    milbeaut_m10v_defconfig (gcc-8): 3 warnings
    mini2440_defconfig (gcc-8): 3 warnings
    mmp2_defconfig (gcc-8): 3 warnings
    moxart_defconfig (gcc-8): 2 warnings
    mps2_defconfig (gcc-8): 1 warning
    multi_v4t_defconfig (gcc-8): 1 warning
    multi_v5_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 33 warnings
    mv78xx0_defconfig (gcc-8): 3 warnings
    mvebu_v5_defconfig (gcc-8): 3 warnings
    mvebu_v7_defconfig (gcc-8): 3 warnings
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
    prima2_defconfig (gcc-8): 2 warnings
    pxa168_defconfig (gcc-8): 2 warnings
    pxa255-idp_defconfig (gcc-8): 1 warning
    pxa3xx_defconfig (gcc-8): 2 warnings
    pxa910_defconfig (gcc-8): 2 warnings
    pxa_defconfig (gcc-8): 2 warnings
    qcom_defconfig (gcc-8): 3 warnings
    realview_defconfig (gcc-8): 2 warnings
    rpc_defconfig (gcc-8): 2 warnings
    s3c2410_defconfig (gcc-8): 3 warnings
    s3c6400_defconfig (gcc-8): 4 warnings
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
    stm32_defconfig (gcc-8): 2 warnings
    sunxi_defconfig (gcc-8): 3 warnings
    tango4_defconfig (gcc-8): 3 warnings
    tct_hammer_defconfig (gcc-8): 1 warning
    tegra_defconfig (gcc-8): 3 warnings
    tinyconfig (gcc-8): 1 warning
    trizeps4_defconfig (gcc-8): 3 warnings
    u300_defconfig (gcc-8): 2 warnings
    u8500_defconfig (gcc-8): 3 warnings
    versatile_defconfig (gcc-8): 2 warnings
    vexpress_defconfig (gcc-8): 3 warnings
    vf610m4_defconfig (gcc-8): 2 warnings
    viper_defconfig (gcc-8): 3 warnings
    vt8500_v6_v7_defconfig (gcc-8): 2 warnings
    xcep_defconfig (gcc-8): 2 warnings
    zeus_defconfig (gcc-8): 4 warnings
    zx_defconfig (gcc-8): 2 warnings

i386:
    allnoconfig (gcc-8): 1 warning
    i386_defconfig (gcc-8): 1 warning
    i386_defconfig (gcc-8): 32 warnings
    tinyconfig (gcc-8): 1 warning

mips:
    32r2el_defconfig (gcc-8): 3 warnings
    32r2el_defconfig (gcc-8): 34 warnings
    allnoconfig (gcc-8): 1 warning
    ar7_defconfig (gcc-8): 1 warning
    ath25_defconfig (gcc-8): 1 warning
    ath79_defconfig (gcc-8): 1 warning
    bcm47xx_defconfig (gcc-8): 1 warning
    bcm63xx_defconfig (gcc-8): 1 warning
    bigsur_defconfig (gcc-8): 1 warning
    bmips_be_defconfig (gcc-8): 2 warnings
    bmips_stb_defconfig (gcc-8): 2 warnings
    capcella_defconfig (gcc-8): 2 warnings
    cavium_octeon_defconfig (gcc-8): 9 errors, 9 warnings
    ci20_defconfig (gcc-8): 2 warnings
    cobalt_defconfig (gcc-8): 2 warnings
    db1xxx_defconfig (gcc-8): 3 warnings
    decstation_64_defconfig (gcc-8): 2 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
    e55_defconfig (gcc-8): 2 warnings
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
    pic32mzda_defconfig (gcc-8): 2 warnings
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
    tinyconfig (gcc-8): 1 warning
    vocore2_defconfig (gcc-8): 1 warning
    workpad_defconfig (gcc-8): 2 warnings
    xway_defconfig (gcc-8): 1 warning

riscv:
    allnoconfig (gcc-8): 1 warning
    defconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 31 warnings
    rv32_defconfig (gcc-8): 8 warnings
    tinyconfig (gcc-8): 1 warning

x86_64:
    allmodconfig (gcc-8): 4 warnings
    allnoconfig (gcc-8): 1 warning
    tinyconfig (gcc-8): 2 warnings
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
    1    drivers/staging/octeon/ethernet-mdio.c:84:30: error: storage size =
of 'link_info' isn't known
    1    drivers/staging/octeon/ethernet-mdio.c:68:34: error: parameter 2 (=
'li') has incomplete type
    1    drivers/staging/octeon/ethernet-mdio.c:127:30: error: type of form=
al parameter 2 is incomplete
    1    drivers/staging/octeon/ethernet-mdio.c:109:30: error: storage size=
 of 'link_info' isn't known
    1    drivers/staging/octeon/ethernet-mdio.c:101:30: error: type of form=
al parameter 2 is incomplete
    1    ERROR: "__aeabi_uldivmod" [drivers/gpu/drm/drm_kms_helper.ko] unde=
fined!
    1    ERROR: "__aeabi_ldivmod" [drivers/gpu/drm/drm_kms_helper.ko] undef=
ined!

Warnings summary:

    218  lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-va=
riable]
    105  fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-=
variable]
    64   WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    20   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    18   1 warning generated.
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
    3    drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1356:2: warning:=
 'spec' may be used uninitialized in this function [-Wmaybe-uninitialized]
    2    drivers/staging/octeon/octeon-ethernet.h:94:12: warning: 'union cv=
mx_helper_link_info' declared inside parameter list will not be visible out=
side of this definition or declaration
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:134: Warning: macro instruction expanded into mul=
tiple instructions
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
    1    drivers/staging/octeon/ethernet.c:499:30: warning: unused variable=
 'link_info' [-Wunused-variable]
    1    drivers/staging/octeon/ethernet.c:463:30: warning: unused variable=
 'link_info' [-Wunused-variable]
    1    drivers/staging/octeon/ethernet-mdio.c:84:30: warning: unused vari=
able 'link_info' [-Wunused-variable]
    1    drivers/staging/octeon/ethernet-mdio.c:68:12: warning: 'union cvmx=
_helper_link_info' declared inside parameter list will not be visible outsi=
de of this definition or declaration
    1    drivers/staging/octeon/ethernet-mdio.c:109:30: warning: unused var=
iable 'link_info' [-Wunused-variable]
    1    drivers/scsi/lpfc/lpfc_sli.c:11878:34: warning: variable 'done_q' =
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
    1    /tmp/ccdDTKuB.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccdDTKuB.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1167:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.yuDhXcLHOp:3381:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.yuDhXcLHOp:3364:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.yuDhXcLHOp:3363:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.yuDhXcLHOp:3359:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.yuDhXcLHOp:3339:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.yuDhXcLHOp:3333:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.yuDhXcLHOp:3324:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.yuDhXcLHOp:3322:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.yuDhXcLHOp:3321:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.yuDhXcLHOp:3320:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.yuDhXcLHOp:3318:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.yuDhXcLHOp:3317:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.yuDhXcLHOp:3314:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.yuDhXcLHOp:3307:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.yuDhXcLHOp:3297:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.yuDhXcLHOp:3286:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.yuDhXcLHOp:3178:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.yuDhXcLHOp:3174:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.yuDhXcLHOp:3148:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.yuDhXcLHOp:3127:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.yuDhXcLHOp:3119:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.yuDhXcLHOp:3115:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.yuDhXcLHOp:3060:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.yuDhXcLHOp:3059:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.yuDhXcLHOp:3055:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.yuDhXcLHOp:3054:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.yuDhXcLHOp:3052:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.yuDhXcLHOp:3051:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.yuDhXcLHOp:3048:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.oPKrkA9KRR:8009:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.oPKrkA9KRR:7992:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.oPKrkA9KRR:7991:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.oPKrkA9KRR:7987:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.oPKrkA9KRR:7967:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.oPKrkA9KRR:7961:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.oPKrkA9KRR:7952:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.oPKrkA9KRR:7950:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.oPKrkA9KRR:7949:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.oPKrkA9KRR:7948:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.oPKrkA9KRR:7946:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.oPKrkA9KRR:7945:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.oPKrkA9KRR:7942:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.oPKrkA9KRR:7935:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.oPKrkA9KRR:7925:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.oPKrkA9KRR:7914:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.oPKrkA9KRR:7806:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.oPKrkA9KRR:7802:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.oPKrkA9KRR:7776:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.oPKrkA9KRR:7755:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.oPKrkA9KRR:7747:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.oPKrkA9KRR:7743:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.oPKrkA9KRR:7688:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.oPKrkA9KRR:7687:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.oPKrkA9KRR:7683:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.oPKrkA9KRR:7682:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.oPKrkA9KRR:7680:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.oPKrkA9KRR:7679:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.oPKrkA9KRR:7676:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.7L4YIm0vMs:4000:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7L4YIm0vMs:3983:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.7L4YIm0vMs:3982:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.7L4YIm0vMs:3978:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.7L4YIm0vMs:3958:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.7L4YIm0vMs:3952:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.7L4YIm0vMs:3943:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.7L4YIm0vMs:3941:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.7L4YIm0vMs:3940:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.7L4YIm0vMs:3939:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.7L4YIm0vMs:3937:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.7L4YIm0vMs:3936:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.7L4YIm0vMs:3933:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.7L4YIm0vMs:3926:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.7L4YIm0vMs:3916:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.7L4YIm0vMs:3905:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7L4YIm0vMs:3797:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.7L4YIm0vMs:3793:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7L4YIm0vMs:3767:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.7L4YIm0vMs:3746:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.7L4YIm0vMs:3738:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.7L4YIm0vMs:3734:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.7L4YIm0vMs:3679:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.7L4YIm0vMs:3678:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.7L4YIm0vMs:3674:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.7L4YIm0vMs:3673:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.7L4YIm0vMs:3671:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.7L4YIm0vMs:3670:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.7L4YIm0vMs:3667:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.6sQLOiagFo:8611:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6sQLOiagFo:8594:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.6sQLOiagFo:8593:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.6sQLOiagFo:8589:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.6sQLOiagFo:8569:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.6sQLOiagFo:8563:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.6sQLOiagFo:8554:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.6sQLOiagFo:8552:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.6sQLOiagFo:8551:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.6sQLOiagFo:8550:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.6sQLOiagFo:8548:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.6sQLOiagFo:8547:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.6sQLOiagFo:8544:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.6sQLOiagFo:8537:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.6sQLOiagFo:8527:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.6sQLOiagFo:8516:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6sQLOiagFo:8408:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.6sQLOiagFo:8404:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6sQLOiagFo:8378:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.6sQLOiagFo:8357:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.6sQLOiagFo:8349:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.6sQLOiagFo:8345:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.6sQLOiagFo:8290:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.6sQLOiagFo:8289:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.6sQLOiagFo:8285:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.6sQLOiagFo:8284:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.6sQLOiagFo:8282:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.6sQLOiagFo:8281:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.6sQLOiagFo:8278:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.2mMpjHCQDm:4843:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.2mMpjHCQDm:4826:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.2mMpjHCQDm:4825:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.2mMpjHCQDm:4821:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.2mMpjHCQDm:4801:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.2mMpjHCQDm:4795:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.2mMpjHCQDm:4786:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.2mMpjHCQDm:4784:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.2mMpjHCQDm:4783:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.2mMpjHCQDm:4782:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.2mMpjHCQDm:4780:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.2mMpjHCQDm:4779:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.2mMpjHCQDm:4776:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.2mMpjHCQDm:4769:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.2mMpjHCQDm:4759:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.2mMpjHCQDm:4748:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.2mMpjHCQDm:4640:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.2mMpjHCQDm:4636:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.2mMpjHCQDm:4610:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.2mMpjHCQDm:4589:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.2mMpjHCQDm:4581:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.2mMpjHCQDm:4577:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.2mMpjHCQDm:4522:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.2mMpjHCQDm:4521:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.2mMpjHCQDm:4517:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.2mMpjHCQDm:4516:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.2mMpjHCQDm:4514:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.2mMpjHCQDm:4513:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.2mMpjHCQDm:4510:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.1QpC99ztW0:4906:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.1QpC99ztW0:4889:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.1QpC99ztW0:4888:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.1QpC99ztW0:4884:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.1QpC99ztW0:4864:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.1QpC99ztW0:4858:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.1QpC99ztW0:4849:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.1QpC99ztW0:4847:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.1QpC99ztW0:4846:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.1QpC99ztW0:4845:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.1QpC99ztW0:4843:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.1QpC99ztW0:4842:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.1QpC99ztW0:4839:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.1QpC99ztW0:4832:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.1QpC99ztW0:4822:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.1QpC99ztW0:4811:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.1QpC99ztW0:4703:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.1QpC99ztW0:4699:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.1QpC99ztW0:4673:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.1QpC99ztW0:4652:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.1QpC99ztW0:4644:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.1QpC99ztW0:4640:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.1QpC99ztW0:4585:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.1QpC99ztW0:4584:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.1QpC99ztW0:4580:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.1QpC99ztW0:4579:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.1QpC99ztW0:4577:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.1QpC99ztW0:4576:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.1QpC99ztW0:4573:warning: override: reassigning to sy=
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
    2    WARNING: vmlinux.o(.data+0xbe080): Section mismatch in reference f=
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
    1    WARNING: vmlinux.o(.data+0xdde6c): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the (unknown reference) .init.rod=
ata:(unknown)
    1    WARNING: vmlinux.o(.data+0xc6068): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the (unknown reference) .init.rod=
ata:(unknown)
    1    WARNING: vmlinux.o(.data+0xbe380): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the (unknown reference) .init.rod=
ata:(unknown)
    1    WARNING: vmlinux.o(.data+0x83970): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_ipr=
oc_gpio_of_match
    1    WARNING: vmlinux.o(.data+0x834a8): Section mismatch in reference f=
rom the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_ipr=
oc_gpio_of_match
    1    WARNING: vmlinux.o(.data+0x110f20): Section mismatch in reference =
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
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 34 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.7L4YIm0vMs:3667:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.7L4YIm0vMs:3670:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.7L4YIm0vMs:3671:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.7L4YIm0vMs:3673:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.7L4YIm0vMs:3674:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.7L4YIm0vMs:3678:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.7L4YIm0vMs:3679:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.7L4YIm0vMs:3734:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.7L4YIm0vMs:3738:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.7L4YIm0vMs:3746:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.7L4YIm0vMs:3767:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.7L4YIm0vMs:3793:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.7L4YIm0vMs:3797:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.7L4YIm0vMs:3905:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.7L4YIm0vMs:3916:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.7L4YIm0vMs:3926:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.7L4YIm0vMs:3933:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.7L4YIm0vMs:3936:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.7L4YIm0vMs:3937:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.7L4YIm0vMs:3939:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.7L4YIm0vMs:3940:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.7L4YIm0vMs:3941:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.7L4YIm0vMs:3943:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.7L4YIm0vMs:3952:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.7L4YIm0vMs:3958:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.7L4YIm0vMs:3978:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.7L4YIm0vMs:3982:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.7L4YIm0vMs:3983:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.7L4YIm0vMs:4000:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 48 warnings, 0 sect=
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
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    1 warning generated.
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
    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitialized=
 when used within its own initialization [-Wuninitialized]
    1 warning generated.
    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/misc/mic/vop/vop_vringh.c:155:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    drivers/misc/mic/vop/vop_vringh.c:399:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when used =
within its own initialization [-Wuninitialized]
    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when used=
 within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/net/usb/lan78xx.c:2665:34: warning: variable 'unlink_wakeup' is=
 uninitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/scsi/lpfc/lpfc_sli.c:11878:34: warning: variable 'done_q' is un=
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
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: unmet direct dependencies detected for FSL_RCPM
    lib/cpumask.c:302:1: warning: the frame size of 5280 bytes is larger th=
an 2048 bytes [-Wframe-larger-than=3D]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1356:2: warning: 'spe=
c' may be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x50): Section mismatch in=
 reference from the variable bcm_iproc_gpio_driver to the variable .init.ro=
data:bcm_iproc_gpio_of_match
    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x50): Section mismatch in=
 reference from the variable bcm_iproc_gpio_driver to the variable .init.ro=
data:bcm_iproc_gpio_of_match

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1356:2: warning: 'spe=
c' may be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x50): Section mismatch in=
 reference from the variable bcm_iproc_gpio_driver to the variable .init.ro=
data:bcm_iproc_gpio_of_match

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 21 warnings, 0 section =
mismatches

Errors:
    ERROR: "__aeabi_ldivmod" [drivers/gpu/drm/drm_kms_helper.ko] undefined!
    ERROR: "__aeabi_uldivmod" [drivers/gpu/drm/drm_kms_helper.ko] undefined!

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    /tmp/ccdDTKuB.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccdDTKuB.s:18191: Warning: using r15 results in unpredictable beha=
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
    drivers/net/ethernet/mellanox/mlx5/core/eswitch.c:1356:2: warning: 'spe=
c' may be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: drivers/gpio/gpio-xgs-iproc.o(.data+0x2c): Section mismatch in=
 reference from the variable bcm_iproc_gpio_driver to the (unknown referenc=
e) .init.rodata:(unknown)

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
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
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 9 errors, 9 warnings,=
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
    drivers/staging/octeon/ethernet-mdio.c:68:34: error: parameter 2 ('li')=
 has incomplete type
    drivers/staging/octeon/ethernet-mdio.c:84:30: error: storage size of 'l=
ink_info' isn't known
    drivers/staging/octeon/ethernet-mdio.c:101:30: error: type of formal pa=
rameter 2 is incomplete
    drivers/staging/octeon/ethernet-mdio.c:109:30: error: storage size of '=
link_info' isn't known
    drivers/staging/octeon/ethernet-mdio.c:127:30: error: type of formal pa=
rameter 2 is incomplete

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    drivers/staging/octeon/octeon-ethernet.h:94:12: warning: 'union cvmx_he=
lper_link_info' declared inside parameter list will not be visible outside =
of this definition or declaration
    drivers/staging/octeon/ethernet.c:463:30: warning: unused variable 'lin=
k_info' [-Wunused-variable]
    drivers/staging/octeon/ethernet.c:499:30: warning: unused variable 'lin=
k_info' [-Wunused-variable]
    drivers/staging/octeon/octeon-ethernet.h:94:12: warning: 'union cvmx_he=
lper_link_info' declared inside parameter list will not be visible outside =
of this definition or declaration
    drivers/staging/octeon/ethernet-mdio.c:68:12: warning: 'union cvmx_help=
er_link_info' declared inside parameter list will not be visible outside of=
 this definition or declaration
    drivers/staging/octeon/ethernet-mdio.c:84:30: warning: unused variable =
'link_info' [-Wunused-variable]
    drivers/staging/octeon/ethernet-mdio.c:109:30: warning: unused variable=
 'link_info' [-Wunused-variable]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
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
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3630): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3320): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    1 warning generated.

Section mismatches:
    WARNING: vmlinux.o(.data+0x834a8): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gp=
io_of_match

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

Section mismatches:
    WARNING: vmlinux.o(.data+0x83e50): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gp=
io_of_match

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

Section mismatches:
    WARNING: vmlinux.o(.data+0x83970): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gp=
io_of_match

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

Section mismatches:
    WARNING: vmlinux.o(.data+0x83e50): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_gp=
io_of_match

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 31 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.yuDhXcLHOp:3048:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.yuDhXcLHOp:3051:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.yuDhXcLHOp:3052:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.yuDhXcLHOp:3054:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.yuDhXcLHOp:3055:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.yuDhXcLHOp:3059:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.yuDhXcLHOp:3060:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.yuDhXcLHOp:3115:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.yuDhXcLHOp:3119:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.yuDhXcLHOp:3127:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.yuDhXcLHOp:3148:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.yuDhXcLHOp:3174:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.yuDhXcLHOp:3178:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.yuDhXcLHOp:3286:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.yuDhXcLHOp:3297:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.yuDhXcLHOp:3307:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.yuDhXcLHOp:3314:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.yuDhXcLHOp:3317:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.yuDhXcLHOp:3318:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.yuDhXcLHOp:3320:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.yuDhXcLHOp:3321:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.yuDhXcLHOp:3322:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.yuDhXcLHOp:3324:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.yuDhXcLHOp:3333:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.yuDhXcLHOp:3339:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.yuDhXcLHOp:3359:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.yuDhXcLHOp:3363:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.yuDhXcLHOp:3364:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.yuDhXcLHOp:3381:warning: override: reassigning to symbol =
USER_NS
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 30 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.oPKrkA9KRR:7676:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.oPKrkA9KRR:7679:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.oPKrkA9KRR:7680:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.oPKrkA9KRR:7682:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.oPKrkA9KRR:7683:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.oPKrkA9KRR:7687:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.oPKrkA9KRR:7688:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.oPKrkA9KRR:7743:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.oPKrkA9KRR:7747:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.oPKrkA9KRR:7755:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.oPKrkA9KRR:7776:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.oPKrkA9KRR:7802:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.oPKrkA9KRR:7806:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.oPKrkA9KRR:7914:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.oPKrkA9KRR:7925:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.oPKrkA9KRR:7935:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.oPKrkA9KRR:7942:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.oPKrkA9KRR:7945:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.oPKrkA9KRR:7946:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.oPKrkA9KRR:7948:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.oPKrkA9KRR:7949:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.oPKrkA9KRR:7950:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.oPKrkA9KRR:7952:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.oPKrkA9KRR:7961:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.oPKrkA9KRR:7967:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.oPKrkA9KRR:7987:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.oPKrkA9KRR:7991:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.oPKrkA9KRR:7992:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.oPKrkA9KRR:8009:warning: override: reassigning to symbol =
USER_NS
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

Section mismatches:
    WARNING: vmlinux.o(.data+0x110f20): Section mismatch in reference from =
the variable bcm_iproc_gpio_driver to the variable .init.rodata:bcm_iproc_g=
pio_of_match

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x710): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

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
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 32 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.2mMpjHCQDm:4510:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.2mMpjHCQDm:4513:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.2mMpjHCQDm:4514:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.2mMpjHCQDm:4516:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.2mMpjHCQDm:4517:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.2mMpjHCQDm:4521:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.2mMpjHCQDm:4522:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.2mMpjHCQDm:4577:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.2mMpjHCQDm:4581:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.2mMpjHCQDm:4589:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.2mMpjHCQDm:4610:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.2mMpjHCQDm:4636:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.2mMpjHCQDm:4640:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.2mMpjHCQDm:4748:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.2mMpjHCQDm:4759:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.2mMpjHCQDm:4769:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.2mMpjHCQDm:4776:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.2mMpjHCQDm:4779:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.2mMpjHCQDm:4780:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.2mMpjHCQDm:4782:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.2mMpjHCQDm:4783:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.2mMpjHCQDm:4784:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.2mMpjHCQDm:4786:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.2mMpjHCQDm:4795:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.2mMpjHCQDm:4801:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.2mMpjHCQDm:4821:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.2mMpjHCQDm:4825:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.2mMpjHCQDm:4826:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.2mMpjHCQDm:4843:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x7c8): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
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
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    {standard input}:134: Warning: macro instruction expanded into multiple=
 instructions
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, =
0 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.data+0xbe080): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 3 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.data+0xbe080): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.data+0xbe380): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 =
warnings, 0 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.data+0xc6068): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 33 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.6sQLOiagFo:8278:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.6sQLOiagFo:8281:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.6sQLOiagFo:8282:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.6sQLOiagFo:8284:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.6sQLOiagFo:8285:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.6sQLOiagFo:8289:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.6sQLOiagFo:8290:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.6sQLOiagFo:8345:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.6sQLOiagFo:8349:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.6sQLOiagFo:8357:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.6sQLOiagFo:8378:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.6sQLOiagFo:8404:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.6sQLOiagFo:8408:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.6sQLOiagFo:8516:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.6sQLOiagFo:8527:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.6sQLOiagFo:8537:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.6sQLOiagFo:8544:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.6sQLOiagFo:8547:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.6sQLOiagFo:8548:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.6sQLOiagFo:8550:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.6sQLOiagFo:8551:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.6sQLOiagFo:8552:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.6sQLOiagFo:8554:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.6sQLOiagFo:8563:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.6sQLOiagFo:8569:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.6sQLOiagFo:8589:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.6sQLOiagFo:8593:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.6sQLOiagFo:8594:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.6sQLOiagFo:8611:warning: override: reassigning to symbol =
USER_NS
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]

Section mismatches:
    WARNING: vmlinux.o(.data+0xdde6c): Section mismatch in reference from t=
he variable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(=
unknown)

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

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
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable 'rtd' [-Wunus=
ed-variable]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
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
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    .config:1167:warning: override: UNWINDER_GUESS changes choice state
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mis=
matches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 30 war=
nings, 0 section mismatches

Warnings:
    ./.tmp.config.1QpC99ztW0:4573:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.1QpC99ztW0:4576:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.1QpC99ztW0:4577:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.1QpC99ztW0:4579:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.1QpC99ztW0:4580:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.1QpC99ztW0:4584:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.1QpC99ztW0:4585:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.1QpC99ztW0:4640:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.1QpC99ztW0:4644:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.1QpC99ztW0:4652:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.1QpC99ztW0:4673:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.1QpC99ztW0:4699:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.1QpC99ztW0:4703:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.1QpC99ztW0:4811:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.1QpC99ztW0:4822:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.1QpC99ztW0:4832:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.1QpC99ztW0:4839:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.1QpC99ztW0:4842:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.1QpC99ztW0:4843:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.1QpC99ztW0:4845:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.1QpC99ztW0:4846:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.1QpC99ztW0:4847:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.1QpC99ztW0:4849:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.1QpC99ztW0:4858:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.1QpC99ztW0:4864:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.1QpC99ztW0:4884:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.1QpC99ztW0:4888:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.1QpC99ztW0:4889:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.1QpC99ztW0:4906:warning: override: reassigning to symbol =
USER_NS
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warn=
ing, 0 section mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1185:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section m=
ismatches

Warnings:
    fs/ext4/super.c:2054:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    lib/vsprintf.c:766:14: warning: unused variable 'str' [-Wunused-variabl=
e]

---
For more info write to <info@kernelci.org>
