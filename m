Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA507FC8DE
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 15:27:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbfKNO10 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 09:27:26 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:55933 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbfKNO10 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Nov 2019 09:27:26 -0500
Received: by mail-wm1-f68.google.com with SMTP id b11so5875532wmb.5
        for <linux-next@vger.kernel.org>; Thu, 14 Nov 2019 06:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=egTxlhEyvosr/nxBstTwMu8YAxqpwxuSoBIrI79b2zk=;
        b=I1OPh4zA8wurKR2weqPZEcoCOq3vaYrYGmm/afm76Pp0EvnDGrBKP0LUfi0gNU8ggD
         z+lzI/rFPMbEj8ydWRaGskdxI1ato0MI+iFV76hLm7FYCHmybGFgMm/R6a4VIA5uZ5qB
         PGv2AstMEPdpx1H6g8Cc/2iA3H/biMm3NaRT+3rjYxJPorW4Hfm8rGgTx6HIU8+6A9KS
         /2BlwOBYTNQZTH1pxDaO67oYTOtRvBjc7rk8g2C5NVNB0i6RUR4A7GLUxLSbQJ5cnHAt
         jdlde4Ara469vvWDEebcqysTioqcsxqMp/J6Mh413BnZJcd93wWGHxXOogZV8bf8vtnm
         Nzow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=egTxlhEyvosr/nxBstTwMu8YAxqpwxuSoBIrI79b2zk=;
        b=VH1LIIiU7B/hOQtlWbMdl3eP4qFmz5Rl97DDbq03o0TtROt9f/gylLdSbiTyIX+vx+
         moGlMGYEHnr5nRK5QUhBqEqrb4ZUVwhGZIL2MDrW7ZX8QPTcdObpOu70TvlyljBWXX/1
         1d6T/bFv0jL4YOzT+1u3QAvyBKWVw3snBuequeuC71xJjdzltSO2pl7qKw9UIacINM4p
         B6A1ppwSykHZxndOJEdsD+1Z6/YS/uTcihNR+k0O01cs84HaLJv1LWHVGNuwvKSaB0+O
         BuWFo6EOgnkfwlo3XA9hFzSamDlL3xC00zESQ6ZhR8WueoB9bYoHsMhsc+Oi5eGhGtc0
         XjPQ==
X-Gm-Message-State: APjAAAVKJdPmAvbBfCt7CMALXE5zSaJYZVP4SZ6ZCiCvBvd6lDAKL+Bt
        u0J9eY2O93FoeKOKb5kP2uIrJLU5g2hUXw==
X-Google-Smtp-Source: APXvYqwSEyY4dZyFGX8ImTMg/XWxywqd2gNdmcDC9ANy4/59BX23n3Nd035fGjHuRK8oSADW4c+l9Q==
X-Received: by 2002:a05:600c:295:: with SMTP id 21mr7897593wmk.43.1573741636070;
        Thu, 14 Nov 2019 06:27:16 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id j10sm7512871wrx.30.2019.11.14.06.27.14
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 06:27:14 -0800 (PST)
Message-ID: <5dcd6442.1c69fb81.5271f.3d9f@mx.google.com>
Date:   Thu, 14 Nov 2019 06:27:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20191114
Subject: next/master build: 216 builds: 2 failed, 214 passed, 5 errors,
 493 warnings (next-20191114)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 216 builds: 2 failed, 214 passed, 5 errors, 493 warnings=
 (next-20191114)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191114/

Tree: next
Branch: master
Git Describe: next-20191114
Git Commit: 8466d23e6e677cb58e237d1f35588497b8dd5c5c
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
    allmodconfig (clang-8): 57 warnings
    allmodconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 29 warnings

arm:
    allmodconfig (gcc-8): 21 warnings
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
    pleb_defconfig (gcc-8): 1 warning
    prima2_defconfig (gcc-8): 1 warning
    pxa168_defconfig (gcc-8): 1 warning
    pxa3xx_defconfig (gcc-8): 1 warning
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
    allmodconfig (gcc-8): 5 warnings
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

    104  fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-=
variable]
    64   WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
    2    net/netfilter/nf_flow_table_offload.c:80:21: warning: unsigned con=
version from 'int' to '__be16' {aka 'short unsigned int'} changes value fro=
m '327680' to '0' [-Woverflow]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    3 warnings generated.
    1    {standard input}:134: Warning: macro instruction expanded into mul=
tiple instructions
    1    warning: same module names found:
    1    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable 'rtd' [-=
Wunused-variable]
    1    security/integrity/platform_certs/load_uefi.c:17:19: warning: 'efi=
_cert_sha256_guid' defined but not used [-Wunused-variable]
    1    security/integrity/platform_certs/load_uefi.c:15:19: warning: 'efi=
_cert_x509_sha256_guid' defined but not used [-Wunused-variable]
    1    security/integrity/platform_certs/load_uefi.c:14:19: warning: 'efi=
_cert_x509_guid' defined but not used [-Wunused-variable]
    1    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitia=
lized when used within its own initialization [-Wuninitialized]
    1    net/netfilter/nf_flow_table_offload.c:80:34: warning: implicit con=
version from 'int' to '__be16' (aka 'unsigned short') changes value from 32=
7680 to 0 [-Wconstant-conversion]
    1    net/netfilter/nf_flow_table_offload.c:290:2: warning: variable 'of=
fset' is used uninitialized whenever switch default is taken [-Wsometimes-u=
ninitialized]
    1    net/netfilter/nf_flow_table_offload.c:279:12: note: initialize the=
 variable 'offset' to silence this warning
    1    net/netfilter/nf_flow_table_offload.c:264:2: warning: variable 'of=
fset' is used uninitialized whenever switch default is taken [-Wsometimes-u=
ninitialized]
    1    net/netfilter/nf_flow_table_offload.c:253:12: note: initialize the=
 variable 'offset' to silence this warning
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
    1    /tmp/ccjYtX2y.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccjYtX2y.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1169:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.pR1cKPLo28:3385:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.pR1cKPLo28:3368:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.pR1cKPLo28:3367:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.pR1cKPLo28:3363:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.pR1cKPLo28:3343:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.pR1cKPLo28:3337:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.pR1cKPLo28:3328:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.pR1cKPLo28:3326:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.pR1cKPLo28:3325:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.pR1cKPLo28:3324:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.pR1cKPLo28:3322:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.pR1cKPLo28:3321:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.pR1cKPLo28:3318:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.pR1cKPLo28:3311:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.pR1cKPLo28:3301:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.pR1cKPLo28:3290:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.pR1cKPLo28:3182:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.pR1cKPLo28:3178:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.pR1cKPLo28:3152:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.pR1cKPLo28:3131:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.pR1cKPLo28:3123:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.pR1cKPLo28:3119:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.pR1cKPLo28:3064:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.pR1cKPLo28:3063:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.pR1cKPLo28:3059:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.pR1cKPLo28:3058:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.pR1cKPLo28:3056:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.pR1cKPLo28:3055:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.pR1cKPLo28:3052:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.hScPJ1bbf8:4007:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.hScPJ1bbf8:3990:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.hScPJ1bbf8:3989:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.hScPJ1bbf8:3985:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.hScPJ1bbf8:3965:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.hScPJ1bbf8:3959:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.hScPJ1bbf8:3950:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.hScPJ1bbf8:3948:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.hScPJ1bbf8:3947:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.hScPJ1bbf8:3946:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.hScPJ1bbf8:3944:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.hScPJ1bbf8:3943:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.hScPJ1bbf8:3940:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.hScPJ1bbf8:3933:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.hScPJ1bbf8:3923:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.hScPJ1bbf8:3912:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.hScPJ1bbf8:3804:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.hScPJ1bbf8:3800:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.hScPJ1bbf8:3774:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.hScPJ1bbf8:3753:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.hScPJ1bbf8:3745:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.hScPJ1bbf8:3741:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.hScPJ1bbf8:3686:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.hScPJ1bbf8:3685:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.hScPJ1bbf8:3681:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.hScPJ1bbf8:3680:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.hScPJ1bbf8:3678:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.hScPJ1bbf8:3677:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.hScPJ1bbf8:3674:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.aCODHAWXRn:4843:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.aCODHAWXRn:4826:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.aCODHAWXRn:4825:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.aCODHAWXRn:4821:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.aCODHAWXRn:4801:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.aCODHAWXRn:4795:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.aCODHAWXRn:4786:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.aCODHAWXRn:4784:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.aCODHAWXRn:4783:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.aCODHAWXRn:4782:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.aCODHAWXRn:4780:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.aCODHAWXRn:4779:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.aCODHAWXRn:4776:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.aCODHAWXRn:4769:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.aCODHAWXRn:4759:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.aCODHAWXRn:4748:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.aCODHAWXRn:4640:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.aCODHAWXRn:4636:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.aCODHAWXRn:4610:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.aCODHAWXRn:4589:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.aCODHAWXRn:4581:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.aCODHAWXRn:4577:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.aCODHAWXRn:4522:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.aCODHAWXRn:4521:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.aCODHAWXRn:4517:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.aCODHAWXRn:4516:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.aCODHAWXRn:4514:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.aCODHAWXRn:4513:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.aCODHAWXRn:4510:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.VbD7Pa1Q9O:4906:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VbD7Pa1Q9O:4889:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.VbD7Pa1Q9O:4888:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.VbD7Pa1Q9O:4884:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.VbD7Pa1Q9O:4864:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.VbD7Pa1Q9O:4858:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.VbD7Pa1Q9O:4849:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.VbD7Pa1Q9O:4847:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.VbD7Pa1Q9O:4846:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.VbD7Pa1Q9O:4845:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.VbD7Pa1Q9O:4843:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.VbD7Pa1Q9O:4842:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.VbD7Pa1Q9O:4839:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.VbD7Pa1Q9O:4832:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.VbD7Pa1Q9O:4822:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.VbD7Pa1Q9O:4811:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VbD7Pa1Q9O:4703:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.VbD7Pa1Q9O:4699:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VbD7Pa1Q9O:4673:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.VbD7Pa1Q9O:4652:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.VbD7Pa1Q9O:4644:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.VbD7Pa1Q9O:4640:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.VbD7Pa1Q9O:4585:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.VbD7Pa1Q9O:4584:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.VbD7Pa1Q9O:4580:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.VbD7Pa1Q9O:4579:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.VbD7Pa1Q9O:4577:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.VbD7Pa1Q9O:4576:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.VbD7Pa1Q9O:4573:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.CThNBwBDaB:8624:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.CThNBwBDaB:8607:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.CThNBwBDaB:8606:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.CThNBwBDaB:8602:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.CThNBwBDaB:8582:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.CThNBwBDaB:8576:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.CThNBwBDaB:8567:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.CThNBwBDaB:8565:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.CThNBwBDaB:8564:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.CThNBwBDaB:8563:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.CThNBwBDaB:8561:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.CThNBwBDaB:8560:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.CThNBwBDaB:8557:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.CThNBwBDaB:8550:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.CThNBwBDaB:8540:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.CThNBwBDaB:8529:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.CThNBwBDaB:8421:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.CThNBwBDaB:8417:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.CThNBwBDaB:8391:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.CThNBwBDaB:8370:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.CThNBwBDaB:8362:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.CThNBwBDaB:8358:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.CThNBwBDaB:8303:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.CThNBwBDaB:8302:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.CThNBwBDaB:8298:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.CThNBwBDaB:8297:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.CThNBwBDaB:8295:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.CThNBwBDaB:8294:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.CThNBwBDaB:8291:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.2ZvoqwlOPL:8021:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.2ZvoqwlOPL:8004:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.2ZvoqwlOPL:8003:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.2ZvoqwlOPL:7999:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.2ZvoqwlOPL:7979:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.2ZvoqwlOPL:7973:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.2ZvoqwlOPL:7964:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.2ZvoqwlOPL:7962:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.2ZvoqwlOPL:7961:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.2ZvoqwlOPL:7960:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.2ZvoqwlOPL:7958:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.2ZvoqwlOPL:7957:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.2ZvoqwlOPL:7954:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.2ZvoqwlOPL:7947:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.2ZvoqwlOPL:7937:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.2ZvoqwlOPL:7926:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.2ZvoqwlOPL:7818:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.2ZvoqwlOPL:7814:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.2ZvoqwlOPL:7788:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.2ZvoqwlOPL:7767:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.2ZvoqwlOPL:7759:warning: override: reassigning to sy=
mbol NF_NAT
    1    ./.tmp.config.2ZvoqwlOPL:7755:warning: override: reassigning to sy=
mbol NF_CONNTRACK
    1    ./.tmp.config.2ZvoqwlOPL:7700:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.2ZvoqwlOPL:7699:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.2ZvoqwlOPL:7695:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.2ZvoqwlOPL:7694:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.2ZvoqwlOPL:7692:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.2ZvoqwlOPL:7691:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.2ZvoqwlOPL:7688:warning: override: reassigning to sy=
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
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 32 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.hScPJ1bbf8:3674:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.hScPJ1bbf8:3677:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.hScPJ1bbf8:3678:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.hScPJ1bbf8:3680:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.hScPJ1bbf8:3681:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.hScPJ1bbf8:3685:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.hScPJ1bbf8:3686:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.hScPJ1bbf8:3741:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.hScPJ1bbf8:3745:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.hScPJ1bbf8:3753:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.hScPJ1bbf8:3774:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.hScPJ1bbf8:3800:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.hScPJ1bbf8:3804:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.hScPJ1bbf8:3912:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.hScPJ1bbf8:3923:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.hScPJ1bbf8:3933:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.hScPJ1bbf8:3940:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.hScPJ1bbf8:3943:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.hScPJ1bbf8:3944:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.hScPJ1bbf8:3946:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.hScPJ1bbf8:3947:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.hScPJ1bbf8:3948:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.hScPJ1bbf8:3950:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.hScPJ1bbf8:3959:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.hScPJ1bbf8:3965:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.hScPJ1bbf8:3985:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.hScPJ1bbf8:3989:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.hScPJ1bbf8:3990:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.hScPJ1bbf8:4007:warning: override: reassigning to symbol =
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
allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 57 warnings, 0 sect=
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
    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
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
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    1 warning generated.
    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/net/usb/lan78xx.c:2665:34: warning: variable 'unlink_wakeup' is=
 uninitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    net/netfilter/nf_flow_table_offload.c:80:34: warning: implicit conversi=
on from 'int' to '__be16' (aka 'unsigned short') changes value from 327680 =
to 0 [-Wconstant-conversion]
    net/netfilter/nf_flow_table_offload.c:264:2: warning: variable 'offset'=
 is used uninitialized whenever switch default is taken [-Wsometimes-uninit=
ialized]
    net/netfilter/nf_flow_table_offload.c:253:12: note: initialize the vari=
able 'offset' to silence this warning
    net/netfilter/nf_flow_table_offload.c:290:2: warning: variable 'offset'=
 is used uninitialized whenever switch default is taken [-Wsometimes-uninit=
ialized]
    net/netfilter/nf_flow_table_offload.c:279:12: note: initialize the vari=
able 'offset' to silence this warning
    3 warnings generated.
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
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sectio=
n mismatches

Warnings:
    security/integrity/platform_certs/load_uefi.c:17:19: warning: 'efi_cert=
_sha256_guid' defined but not used [-Wunused-variable]
    security/integrity/platform_certs/load_uefi.c:15:19: warning: 'efi_cert=
_x509_sha256_guid' defined but not used [-Wunused-variable]
    security/integrity/platform_certs/load_uefi.c:14:19: warning: 'efi_cert=
_x509_guid' defined but not used [-Wunused-variable]
    lib/cpumask.c:302:1: warning: the frame size of 5280 bytes is larger th=
an 2048 bytes [-Wframe-larger-than=3D]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    net/netfilter/nf_flow_table_offload.c:80:21: warning: unsigned conversi=
on from 'int' to '__be16' {aka 'short unsigned int'} changes value from '32=
7680' to '0' [-Woverflow]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 21 warnings, 0 section =
mismatches

Warnings:
    /tmp/ccjYtX2y.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccjYtX2y.s:18191: Warning: using r15 results in unpredictable beha=
viour
    fs/btrfs/tree-checker.c:230:43: warning: format '%lu' expects argument =
of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wform=
at=3D]
    drivers/mtd/ubi/debug.c:512:6: warning: unused variable 'err' [-Wunused=
-variable]
    net/netfilter/nf_flow_table_offload.c:80:21: warning: unsigned conversi=
on from 'int' to '__be16' {aka 'short unsigned int'} changes value from '32=
7680' to '0' [-Woverflow]
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
    ./.tmp.config.pR1cKPLo28:3052:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.pR1cKPLo28:3055:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.pR1cKPLo28:3056:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.pR1cKPLo28:3058:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.pR1cKPLo28:3059:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.pR1cKPLo28:3063:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.pR1cKPLo28:3064:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.pR1cKPLo28:3119:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.pR1cKPLo28:3123:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.pR1cKPLo28:3131:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.pR1cKPLo28:3152:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.pR1cKPLo28:3178:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.pR1cKPLo28:3182:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.pR1cKPLo28:3290:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.pR1cKPLo28:3301:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.pR1cKPLo28:3311:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.pR1cKPLo28:3318:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.pR1cKPLo28:3321:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.pR1cKPLo28:3322:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.pR1cKPLo28:3324:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.pR1cKPLo28:3325:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.pR1cKPLo28:3326:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.pR1cKPLo28:3328:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.pR1cKPLo28:3337:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.pR1cKPLo28:3343:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.pR1cKPLo28:3363:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.pR1cKPLo28:3367:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.pR1cKPLo28:3368:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.pR1cKPLo28:3385:warning: override: reassigning to symbol =
USER_NS
    fs/ext4/super.c:2068:23: warning: unused variable 'sbi' [-Wunused-varia=
ble]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 29 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.2ZvoqwlOPL:7688:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.2ZvoqwlOPL:7691:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.2ZvoqwlOPL:7692:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.2ZvoqwlOPL:7694:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.2ZvoqwlOPL:7695:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.2ZvoqwlOPL:7699:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.2ZvoqwlOPL:7700:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.2ZvoqwlOPL:7755:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.2ZvoqwlOPL:7759:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.2ZvoqwlOPL:7767:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.2ZvoqwlOPL:7788:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.2ZvoqwlOPL:7814:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.2ZvoqwlOPL:7818:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.2ZvoqwlOPL:7926:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.2ZvoqwlOPL:7937:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.2ZvoqwlOPL:7947:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.2ZvoqwlOPL:7954:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.2ZvoqwlOPL:7957:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.2ZvoqwlOPL:7958:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.2ZvoqwlOPL:7960:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.2ZvoqwlOPL:7961:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.2ZvoqwlOPL:7962:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.2ZvoqwlOPL:7964:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.2ZvoqwlOPL:7973:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.2ZvoqwlOPL:7979:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.2ZvoqwlOPL:7999:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.2ZvoqwlOPL:8003:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.2ZvoqwlOPL:8004:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.2ZvoqwlOPL:8021:warning: override: reassigning to symbol =
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
    ./.tmp.config.aCODHAWXRn:4510:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.aCODHAWXRn:4513:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.aCODHAWXRn:4514:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.aCODHAWXRn:4516:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.aCODHAWXRn:4517:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.aCODHAWXRn:4521:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.aCODHAWXRn:4522:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.aCODHAWXRn:4577:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.aCODHAWXRn:4581:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.aCODHAWXRn:4589:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.aCODHAWXRn:4610:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.aCODHAWXRn:4636:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.aCODHAWXRn:4640:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.aCODHAWXRn:4748:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.aCODHAWXRn:4759:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.aCODHAWXRn:4769:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.aCODHAWXRn:4776:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.aCODHAWXRn:4779:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.aCODHAWXRn:4780:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.aCODHAWXRn:4782:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.aCODHAWXRn:4783:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.aCODHAWXRn:4784:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.aCODHAWXRn:4786:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.aCODHAWXRn:4795:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.aCODHAWXRn:4801:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.aCODHAWXRn:4821:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.aCODHAWXRn:4825:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.aCODHAWXRn:4826:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.aCODHAWXRn:4843:warning: override: reassigning to symbol =
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
    ./.tmp.config.CThNBwBDaB:8291:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.CThNBwBDaB:8294:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.CThNBwBDaB:8295:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.CThNBwBDaB:8297:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.CThNBwBDaB:8298:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.CThNBwBDaB:8302:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.CThNBwBDaB:8303:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.CThNBwBDaB:8358:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.CThNBwBDaB:8362:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.CThNBwBDaB:8370:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.CThNBwBDaB:8391:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.CThNBwBDaB:8417:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.CThNBwBDaB:8421:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.CThNBwBDaB:8529:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.CThNBwBDaB:8540:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.CThNBwBDaB:8550:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.CThNBwBDaB:8557:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.CThNBwBDaB:8560:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.CThNBwBDaB:8561:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.CThNBwBDaB:8563:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.CThNBwBDaB:8564:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.CThNBwBDaB:8565:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.CThNBwBDaB:8567:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.CThNBwBDaB:8576:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.CThNBwBDaB:8582:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.CThNBwBDaB:8602:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.CThNBwBDaB:8606:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.CThNBwBDaB:8607:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.CThNBwBDaB:8624:warning: override: reassigning to symbol =
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
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1169:warning: override: UNWINDER_GUESS changes choice state

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
    ./.tmp.config.VbD7Pa1Q9O:4573:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.VbD7Pa1Q9O:4576:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.VbD7Pa1Q9O:4577:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.VbD7Pa1Q9O:4579:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.VbD7Pa1Q9O:4580:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.VbD7Pa1Q9O:4584:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.VbD7Pa1Q9O:4585:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.VbD7Pa1Q9O:4640:warning: override: reassigning to symbol =
NF_CONNTRACK
    ./.tmp.config.VbD7Pa1Q9O:4644:warning: override: reassigning to symbol =
NF_NAT
    ./.tmp.config.VbD7Pa1Q9O:4652:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.VbD7Pa1Q9O:4673:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.VbD7Pa1Q9O:4699:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.VbD7Pa1Q9O:4703:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.VbD7Pa1Q9O:4811:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.VbD7Pa1Q9O:4822:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.VbD7Pa1Q9O:4832:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.VbD7Pa1Q9O:4839:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.VbD7Pa1Q9O:4842:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.VbD7Pa1Q9O:4843:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.VbD7Pa1Q9O:4845:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.VbD7Pa1Q9O:4846:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.VbD7Pa1Q9O:4847:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.VbD7Pa1Q9O:4849:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.VbD7Pa1Q9O:4858:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.VbD7Pa1Q9O:4864:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.VbD7Pa1Q9O:4884:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.VbD7Pa1Q9O:4888:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.VbD7Pa1Q9O:4889:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.VbD7Pa1Q9O:4906:warning: override: reassigning to symbol =
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
