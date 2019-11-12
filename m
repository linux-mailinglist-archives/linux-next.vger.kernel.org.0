Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97D91F8D5E
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2019 11:55:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbfKLKzw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 Nov 2019 05:55:52 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51772 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfKLKzv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 Nov 2019 05:55:51 -0500
Received: by mail-wm1-f68.google.com with SMTP id q70so2617643wme.1
        for <linux-next@vger.kernel.org>; Tue, 12 Nov 2019 02:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0I/WhClSQKX4mUc3s2vqH2NnXDbyyOpBogf/RAWQEhE=;
        b=Gf/JtWqg7yVsP+LrHLyW0ePenWFJpMmyzFYWGO/UC0WQTOHGXu0ygq6Bk2vD+cEP92
         08BGy5JpCt9uTMq7RlJKcfuKTJ9TVJrUY9xhM9iXD1gSbXZHEdlqeaBv+LOXUJsbmQxV
         jRwcfgnOC7kuFmgslO0W+KqpXe/APttbrThk02hcydidVgb7lGa38KQa5VYQGyKf7Xnq
         cm4RvvBgylEirgv+p82mSEv3QUPYVl8L5GE4W9wI68pGu418WGGFnpkImcr1KJm9eZZD
         BwDuZZ+etLVbB0LD9pw275xbvGz+3XjCKyxmPmkyjYwC/BVjhVsCZHOJYNsIY9j+NIlD
         lpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0I/WhClSQKX4mUc3s2vqH2NnXDbyyOpBogf/RAWQEhE=;
        b=oEYgG/JWK1tPJ4FEZz/VMPbfiMgfD8Gx4Pa2UYmSd6EJsq6orXw5vGD7nYflvvKY5i
         c/k0yxZSt/BUlcQ2NXmcMB8bGHnREf5nBYiboOM9qaXgKAAsHNpS3/T9ivfV/h3BIwC3
         fyJBh0fVfSXb4Yyd4sL22Byy21VFzpeDIldNcUI0X3kiyp3RqoLO5PPwhBRA+NUbYQyY
         kwVZ9SkX/UMZBSHW/90f9YO3dqg1BRHTFfOPAm3j6ZIv/4I/fS1yxRJsDg0MCRxYhKbH
         YKBFs0v2Yj7FFe11EqlKRrNBPYHkkEYNgm6xPLvjIqCpgJipDouh0AJ6NtKmLeo83sIk
         21eA==
X-Gm-Message-State: APjAAAUCgfNDjI7KJGmuxKDdhS0CIzzDB1i8q8thEscsN5X96Jj1DVNf
        EHlBkNOL5FKgu+b49Zz6JFLOU6o+BEl+Zw==
X-Google-Smtp-Source: APXvYqwzR53SdIm/Udvt8smAJQiKtDn1tjVSBLjlEtsOsV/OwLNblYZ19eQWwDeum6U3zauClL6N+w==
X-Received: by 2002:a05:600c:c3:: with SMTP id u3mr3094507wmm.35.1573556140369;
        Tue, 12 Nov 2019 02:55:40 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y6sm18987204wrw.6.2019.11.12.02.55.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 02:55:39 -0800 (PST)
Message-ID: <5dca8fab.1c69fb81.f2605.a9c3@mx.google.com>
Date:   Tue, 12 Nov 2019 02:55:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20191112
Subject: next/master build: 216 builds: 1 failed, 215 passed, 4 errors,
 639 warnings (next-20191112)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 216 builds: 1 failed, 215 passed, 4 errors, 639 warnings=
 (next-20191112)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191112/

Tree: next
Branch: master
Git Describe: next-20191112
Git Commit: fc6d6db1df2cb11bbecc542d67885742e75b4b07
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
    allmodconfig (clang-8): 55 warnings
    defconfig (gcc-8): 1 warning
    defconfig (clang-8): 2 warnings
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 30 warnings

arm:
    allmodconfig (gcc-8): 19 warnings
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
    multi_v7_defconfig (gcc-8): 32 warnings
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
    i386_defconfig (gcc-8): 31 warnings

mips:
    32r2el_defconfig (gcc-8): 2 warnings
    32r2el_defconfig (gcc-8): 33 warnings
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
    nlm_xlr_defconfig (gcc-8): 2 warnings
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
    18   1 warning generated.
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
    1    drivers/net/dsa/mv88e6xxx/chip.c:5320:23: warning: if statement ha=
s empty body [-Wempty-body]
    1    drivers/net/dsa/mv88e6xxx/chip.c:5320:23: note: put the semicolon =
on a separate line to silence this warning
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
    1    /tmp/cclxoBKu.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/cclxoBKu.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1167:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.wQUNLdi45e:4008:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.wQUNLdi45e:3991:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.wQUNLdi45e:3990:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.wQUNLdi45e:3986:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.wQUNLdi45e:3966:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.wQUNLdi45e:3960:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.wQUNLdi45e:3951:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.wQUNLdi45e:3949:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.wQUNLdi45e:3948:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.wQUNLdi45e:3947:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.wQUNLdi45e:3945:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.wQUNLdi45e:3944:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.wQUNLdi45e:3941:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.wQUNLdi45e:3934:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.wQUNLdi45e:3924:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.wQUNLdi45e:3913:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.wQUNLdi45e:3805:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.wQUNLdi45e:3801:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.wQUNLdi45e:3775:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.wQUNLdi45e:3754:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.wQUNLdi45e:3746:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.wQUNLdi45e:3742:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.wQUNLdi45e:3687:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.wQUNLdi45e:3686:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.wQUNLdi45e:3682:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.wQUNLdi45e:3681:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.wQUNLdi45e:3679:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.wQUNLdi45e:3678:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.wQUNLdi45e:3675:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.lgHrnZwHXY:4841:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.lgHrnZwHXY:4824:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.lgHrnZwHXY:4823:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.lgHrnZwHXY:4819:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.lgHrnZwHXY:4799:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.lgHrnZwHXY:4793:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.lgHrnZwHXY:4784:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.lgHrnZwHXY:4782:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.lgHrnZwHXY:4781:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.lgHrnZwHXY:4780:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.lgHrnZwHXY:4778:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.lgHrnZwHXY:4777:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.lgHrnZwHXY:4774:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.lgHrnZwHXY:4767:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.lgHrnZwHXY:4757:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.lgHrnZwHXY:4746:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.lgHrnZwHXY:4638:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.lgHrnZwHXY:4634:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.lgHrnZwHXY:4608:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.lgHrnZwHXY:4587:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.lgHrnZwHXY:4579:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.lgHrnZwHXY:4575:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.lgHrnZwHXY:4520:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.lgHrnZwHXY:4519:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.lgHrnZwHXY:4515:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.lgHrnZwHXY:4514:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.lgHrnZwHXY:4512:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.lgHrnZwHXY:4511:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.lgHrnZwHXY:4508:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.TtxOdktTnB:8017:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.TtxOdktTnB:8000:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.TtxOdktTnB:7999:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.TtxOdktTnB:7995:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.TtxOdktTnB:7975:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.TtxOdktTnB:7969:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.TtxOdktTnB:7960:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.TtxOdktTnB:7958:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.TtxOdktTnB:7957:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.TtxOdktTnB:7956:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.TtxOdktTnB:7954:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.TtxOdktTnB:7953:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.TtxOdktTnB:7950:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.TtxOdktTnB:7943:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.TtxOdktTnB:7933:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.TtxOdktTnB:7922:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.TtxOdktTnB:7814:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.TtxOdktTnB:7810:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.TtxOdktTnB:7784:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.TtxOdktTnB:7763:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.TtxOdktTnB:7755:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.TtxOdktTnB:7751:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.TtxOdktTnB:7696:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.TtxOdktTnB:7695:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.TtxOdktTnB:7691:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.TtxOdktTnB:7690:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.TtxOdktTnB:7688:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.TtxOdktTnB:7687:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.TtxOdktTnB:7684:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.N4SIKC7XZC:3382:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.N4SIKC7XZC:3365:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.N4SIKC7XZC:3364:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.N4SIKC7XZC:3360:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.N4SIKC7XZC:3340:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.N4SIKC7XZC:3334:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.N4SIKC7XZC:3325:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.N4SIKC7XZC:3323:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.N4SIKC7XZC:3322:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.N4SIKC7XZC:3321:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.N4SIKC7XZC:3319:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.N4SIKC7XZC:3318:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.N4SIKC7XZC:3315:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.N4SIKC7XZC:3308:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.N4SIKC7XZC:3298:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.N4SIKC7XZC:3287:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.N4SIKC7XZC:3179:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.N4SIKC7XZC:3175:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.N4SIKC7XZC:3149:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.N4SIKC7XZC:3128:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.N4SIKC7XZC:3120:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.N4SIKC7XZC:3116:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.N4SIKC7XZC:3061:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.N4SIKC7XZC:3060:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.N4SIKC7XZC:3056:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.N4SIKC7XZC:3055:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.N4SIKC7XZC:3053:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.N4SIKC7XZC:3052:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.N4SIKC7XZC:3049:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.HKD2ONwF0W:8615:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.HKD2ONwF0W:8598:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.HKD2ONwF0W:8597:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.HKD2ONwF0W:8593:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.HKD2ONwF0W:8573:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.HKD2ONwF0W:8567:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.HKD2ONwF0W:8558:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.HKD2ONwF0W:8556:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.HKD2ONwF0W:8555:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.HKD2ONwF0W:8554:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.HKD2ONwF0W:8552:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.HKD2ONwF0W:8551:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.HKD2ONwF0W:8548:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.HKD2ONwF0W:8541:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.HKD2ONwF0W:8531:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.HKD2ONwF0W:8520:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.HKD2ONwF0W:8412:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.HKD2ONwF0W:8408:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.HKD2ONwF0W:8382:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.HKD2ONwF0W:8361:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.HKD2ONwF0W:8353:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.HKD2ONwF0W:8349:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.HKD2ONwF0W:8294:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.HKD2ONwF0W:8293:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.HKD2ONwF0W:8289:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.HKD2ONwF0W:8288:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.HKD2ONwF0W:8286:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.HKD2ONwF0W:8285:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.HKD2ONwF0W:8282:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Dr319m425a:4904:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Dr319m425a:4887:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Dr319m425a:4886:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.Dr319m425a:4882:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.Dr319m425a:4862:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.Dr319m425a:4856:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.Dr319m425a:4847:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.Dr319m425a:4845:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Dr319m425a:4844:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.Dr319m425a:4843:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.Dr319m425a:4841:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.Dr319m425a:4840:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.Dr319m425a:4837:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Dr319m425a:4830:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Dr319m425a:4820:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.Dr319m425a:4809:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Dr319m425a:4701:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.Dr319m425a:4697:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Dr319m425a:4671:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.Dr319m425a:4650:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Dr319m425a:4642:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.Dr319m425a:4638:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.Dr319m425a:4583:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.Dr319m425a:4582:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.Dr319m425a:4578:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.Dr319m425a:4577:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.Dr319m425a:4575:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.Dr319m425a:4574:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.Dr319m425a:4571:warning: override: reassigning to sy=
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
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 33 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.wQUNLdi45e:3675:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.wQUNLdi45e:3678:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.wQUNLdi45e:3679:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.wQUNLdi45e:3681:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.wQUNLdi45e:3682:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.wQUNLdi45e:3686:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.wQUNLdi45e:3687:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.wQUNLdi45e:3742:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.wQUNLdi45e:3746:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.wQUNLdi45e:3754:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.wQUNLdi45e:3775:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.wQUNLdi45e:3801:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.wQUNLdi45e:3805:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.wQUNLdi45e:3913:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.wQUNLdi45e:3924:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.wQUNLdi45e:3934:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.wQUNLdi45e:3941:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.wQUNLdi45e:3944:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.wQUNLdi45e:3945:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.wQUNLdi45e:3947:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.wQUNLdi45e:3948:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.wQUNLdi45e:3949:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.wQUNLdi45e:3951:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.wQUNLdi45e:3960:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.wQUNLdi45e:3966:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.wQUNLdi45e:3986:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.wQUNLdi45e:3990:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.wQUNLdi45e:3991:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.wQUNLdi45e:4008:warning: override: reassigning to symbol =
USER_NS
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
allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 55 warnings, 0 sect=
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
    fs/cifs/readdir.c:83:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
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
    net/tipc/crypto.c:466:3: warning: variable 'err' is uninitialized when =
used here [-Wuninitialized]
    net/tipc/crypto.c:430:17: note: initialize the variable 'err' to silenc=
e this warning
    1 warning generated.
    drivers/net/dsa/mv88e6xxx/chip.c:5320:23: warning: if statement has emp=
ty body [-Wempty-body]
    drivers/net/dsa/mv88e6xxx/chip.c:5320:23: note: put the semicolon on a =
separate line to silence this warning
    1 warning generated.
    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/net/usb/lan78xx.c:2665:34: warning: variable 'unlink_wakeup' is=
 uninitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
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
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 19 warnings, 0 section =
mismatches

Warnings:
    /tmp/cclxoBKu.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/cclxoBKu.s:18191: Warning: using r15 results in unpredictable beha=
viour
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
    WARNING: vmlinux.o(.text.unlikely+0x3980): Section mismatch in referenc=
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
    WARNING: vmlinux.o(.text.unlikely+0x363c): Section mismatch in referenc=
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
    ./.tmp.config.N4SIKC7XZC:3049:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.N4SIKC7XZC:3052:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.N4SIKC7XZC:3053:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.N4SIKC7XZC:3055:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.N4SIKC7XZC:3056:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.N4SIKC7XZC:3060:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.N4SIKC7XZC:3061:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.N4SIKC7XZC:3116:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.N4SIKC7XZC:3120:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.N4SIKC7XZC:3128:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.N4SIKC7XZC:3149:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.N4SIKC7XZC:3175:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.N4SIKC7XZC:3179:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.N4SIKC7XZC:3287:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.N4SIKC7XZC:3298:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.N4SIKC7XZC:3308:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.N4SIKC7XZC:3315:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.N4SIKC7XZC:3318:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.N4SIKC7XZC:3319:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.N4SIKC7XZC:3321:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.N4SIKC7XZC:3322:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.N4SIKC7XZC:3323:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.N4SIKC7XZC:3325:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.N4SIKC7XZC:3334:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.N4SIKC7XZC:3340:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.N4SIKC7XZC:3360:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.N4SIKC7XZC:3364:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.N4SIKC7XZC:3365:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.N4SIKC7XZC:3382:warning: override: reassigning to symbol =
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
    ./.tmp.config.TtxOdktTnB:7684:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.TtxOdktTnB:7687:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.TtxOdktTnB:7688:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.TtxOdktTnB:7690:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.TtxOdktTnB:7691:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.TtxOdktTnB:7695:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.TtxOdktTnB:7696:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.TtxOdktTnB:7751:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.TtxOdktTnB:7755:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.TtxOdktTnB:7763:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.TtxOdktTnB:7784:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.TtxOdktTnB:7810:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.TtxOdktTnB:7814:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.TtxOdktTnB:7922:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.TtxOdktTnB:7933:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.TtxOdktTnB:7943:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.TtxOdktTnB:7950:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.TtxOdktTnB:7953:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.TtxOdktTnB:7954:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.TtxOdktTnB:7956:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.TtxOdktTnB:7957:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.TtxOdktTnB:7958:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.TtxOdktTnB:7960:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.TtxOdktTnB:7969:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.TtxOdktTnB:7975:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.TtxOdktTnB:7995:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.TtxOdktTnB:7999:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.TtxOdktTnB:8000:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.TtxOdktTnB:8017:warning: override: reassigning to symbol =
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
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 31 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.lgHrnZwHXY:4508:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.lgHrnZwHXY:4511:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.lgHrnZwHXY:4512:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.lgHrnZwHXY:4514:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.lgHrnZwHXY:4515:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.lgHrnZwHXY:4519:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.lgHrnZwHXY:4520:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.lgHrnZwHXY:4575:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.lgHrnZwHXY:4579:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.lgHrnZwHXY:4587:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.lgHrnZwHXY:4608:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.lgHrnZwHXY:4634:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.lgHrnZwHXY:4638:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.lgHrnZwHXY:4746:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.lgHrnZwHXY:4757:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.lgHrnZwHXY:4767:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.lgHrnZwHXY:4774:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.lgHrnZwHXY:4777:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.lgHrnZwHXY:4778:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.lgHrnZwHXY:4780:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.lgHrnZwHXY:4781:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.lgHrnZwHXY:4782:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.lgHrnZwHXY:4784:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.lgHrnZwHXY:4793:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.lgHrnZwHXY:4799:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.lgHrnZwHXY:4819:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.lgHrnZwHXY:4823:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.lgHrnZwHXY:4824:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.lgHrnZwHXY:4841:warning: override: reassigning to symbol =
USER_NS
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
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 32 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.HKD2ONwF0W:8282:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.HKD2ONwF0W:8285:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.HKD2ONwF0W:8286:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.HKD2ONwF0W:8288:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.HKD2ONwF0W:8289:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.HKD2ONwF0W:8293:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.HKD2ONwF0W:8294:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.HKD2ONwF0W:8349:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.HKD2ONwF0W:8353:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.HKD2ONwF0W:8361:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.HKD2ONwF0W:8382:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.HKD2ONwF0W:8408:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.HKD2ONwF0W:8412:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.HKD2ONwF0W:8520:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.HKD2ONwF0W:8531:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.HKD2ONwF0W:8541:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.HKD2ONwF0W:8548:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.HKD2ONwF0W:8551:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.HKD2ONwF0W:8552:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.HKD2ONwF0W:8554:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.HKD2ONwF0W:8555:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.HKD2ONwF0W:8556:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.HKD2ONwF0W:8558:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.HKD2ONwF0W:8567:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.HKD2ONwF0W:8573:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.HKD2ONwF0W:8593:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.HKD2ONwF0W:8597:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.HKD2ONwF0W:8598:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.HKD2ONwF0W:8615:warning: override: reassigning to symbol =
USER_NS
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]
    include/linux/sfp.h:566:12: warning: 'sfp_bus_add_upstream' defined but=
 not used [-Wunused-function]
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
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
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
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1167:warning: override: UNWINDER_GUESS changes choice state

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
    ./.tmp.config.Dr319m425a:4571:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Dr319m425a:4574:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.Dr319m425a:4575:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.Dr319m425a:4577:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.Dr319m425a:4578:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.Dr319m425a:4582:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.Dr319m425a:4583:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.Dr319m425a:4638:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.Dr319m425a:4642:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.Dr319m425a:4650:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Dr319m425a:4671:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.Dr319m425a:4697:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Dr319m425a:4701:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.Dr319m425a:4809:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Dr319m425a:4820:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.Dr319m425a:4830:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Dr319m425a:4837:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Dr319m425a:4840:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.Dr319m425a:4841:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.Dr319m425a:4843:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.Dr319m425a:4844:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.Dr319m425a:4845:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Dr319m425a:4847:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.Dr319m425a:4856:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.Dr319m425a:4862:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.Dr319m425a:4882:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.Dr319m425a:4886:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.Dr319m425a:4887:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Dr319m425a:4904:warning: override: reassigning to symbol =
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
