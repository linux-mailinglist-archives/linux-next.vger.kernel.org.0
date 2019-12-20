Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAA8D127766
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2019 09:44:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbfLTIoc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Dec 2019 03:44:32 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34933 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727177AbfLTIob (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Dec 2019 03:44:31 -0500
Received: by mail-wr1-f65.google.com with SMTP id g17so8591057wro.2
        for <linux-next@vger.kernel.org>; Fri, 20 Dec 2019 00:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=QIrcmNIlFXt8QIvRIx7e7+7FI6uDYrYLzcGJBXFQgOY=;
        b=xpwj6AeGowI9MD6+O+ZAoXTMd+pltRXkQ9COC69i5xX6x0dZeyXncwe7F7wOEVcoli
         /5XzY6036LIIvcLlpsRLIZRTqOBUKxsr9DKkhxYA/fpmGLYxqXLbuMG5DR2C2l47fs8s
         y/bVvIqPve0qNWKqtdtmuomJVe5XibmQGRJsROqM3IibGhTSbqbC0gC9Ai6Tc5WiLera
         qad+imYcSN/3RWiqe0dO58X8YErH7uXG5PXxw8rEIDyVwL4Zd1Ti5cSRYGGsqxv4zXl2
         /LwpfRsoMT60jK4v+RCP7NCX/GpIf7Ra39my7+O22cg/ardeaEdvwyJPb/ai95lJL9WD
         RiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=QIrcmNIlFXt8QIvRIx7e7+7FI6uDYrYLzcGJBXFQgOY=;
        b=NE9/5bFFsHTCuaQrJte0Lzsr6J/1Eua5Uml43/Sw3zHwA3E3F05LfuRHdNjCuhDj5f
         WW3wlozakERgFSU1rBqQ6AWiiFOsY4p3Fq+poyifGVUPRwnmtZEsmgtIHhMHUQpnUx9K
         3+CZs9jX2ZSwlFmbAzyAmjIvRNaT/RcAQ+RbXeBpvP9BHZYHCjpSgyNle7JuQ5f2/nrJ
         oAgL97h6xaTD0VD4nBB1YG+c/e0ShpYH7YD1kCAODzSqPcsSZWAqJS5ag2J7W8BVY+NC
         MdkrWnL6kTJRyv3jtoEfrzozTLQCo2oqMDKL2g9Y7ttxcZPRRB62Jzzb4v4UC2NwKLf1
         i6uA==
X-Gm-Message-State: APjAAAV9MhvqE+TWpqv9qAWKMQEL37F/DUlpFD+h2XrY0AYBBEWI1JCm
        5xLpYH+vpJTJy0jwbSE8WK3e1e87JdWeQQ==
X-Google-Smtp-Source: APXvYqyyLnjQ4VdZzxlZ7s1aUTsz6rmTqREpKs1mbZZF4u0QlEBGF7Y645acDXuoS+4JLkqQ/v1ldg==
X-Received: by 2002:adf:eb0a:: with SMTP id s10mr14625437wrn.320.1576831462932;
        Fri, 20 Dec 2019 00:44:22 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 18sm1296295wmf.1.2019.12.20.00.44.21
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 00:44:22 -0800 (PST)
Message-ID: <5dfc89e6.1c69fb81.360c6.5d28@mx.google.com>
Date:   Fri, 20 Dec 2019 00:44:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20191220
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master build: 214 builds: 3 failed, 211 passed, 7 errors,
 185 warnings (next-20191220)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 214 builds: 3 failed, 211 passed, 7 errors, 185 warnings=
 (next-20191220)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191220/

Tree: next
Branch: master
Git Describe: next-20191220
Git Commit: 7ddd09fc4b745fb1d8942f95389583e08412e0cd
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (gcc-8) FAIL

arm:
    allmodconfig: (gcc-8) FAIL

mips:
    db1xxx_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 2 warnings
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
    allmodconfig (gcc-8): 3 errors, 2 warnings
    allnoconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning

arm:
    allmodconfig (gcc-8): 3 errors, 20 warnings
    allnoconfig (gcc-8): 1 warning
    am200epdkit_defconfig (gcc-8): 1 warning
    assabet_defconfig (gcc-8): 1 warning
    axm55xx_defconfig (gcc-8): 1 warning
    badge4_defconfig (gcc-8): 1 warning
    cerfcube_defconfig (gcc-8): 1 warning
    clps711x_defconfig (gcc-8): 1 warning
    cm_x2xx_defconfig (gcc-8): 1 warning
    cm_x300_defconfig (gcc-8): 1 warning
    cns3420vb_defconfig (gcc-8): 1 warning
    colibri_pxa270_defconfig (gcc-8): 1 warning
    colibri_pxa300_defconfig (gcc-8): 1 warning
    collie_defconfig (gcc-8): 1 warning
    corgi_defconfig (gcc-8): 1 warning
    davinci_all_defconfig (gcc-8): 1 warning
    dove_defconfig (gcc-8): 1 warning
    ebsa110_defconfig (gcc-8): 1 warning
    em_x270_defconfig (gcc-8): 1 warning
    ep93xx_defconfig (gcc-8): 1 warning
    eseries_pxa_defconfig (gcc-8): 1 warning
    footbridge_defconfig (gcc-8): 1 warning
    gemini_defconfig (gcc-8): 1 warning
    h3600_defconfig (gcc-8): 1 warning
    h5000_defconfig (gcc-8): 1 warning
    hackkit_defconfig (gcc-8): 1 warning
    hisi_defconfig (gcc-8): 1 warning
    integrator_defconfig (gcc-8): 1 warning
    iop32x_defconfig (gcc-8): 1 warning
    ixp4xx_defconfig (gcc-8): 1 warning
    jornada720_defconfig (gcc-8): 1 warning
    lart_defconfig (gcc-8): 1 warning
    lpd270_defconfig (gcc-8): 1 warning
    lubbock_defconfig (gcc-8): 1 warning
    magician_defconfig (gcc-8): 1 warning
    mainstone_defconfig (gcc-8): 1 warning
    mini2440_defconfig (gcc-8): 1 warning
    mmp2_defconfig (gcc-8): 1 warning
    multi_v4t_defconfig (gcc-8): 1 warning
    multi_v5_defconfig (gcc-8): 1 warning
    mvebu_v5_defconfig (gcc-8): 1 warning
    neponset_defconfig (gcc-8): 1 warning
    netwinder_defconfig (gcc-8): 1 warning
    nhk8815_defconfig (gcc-8): 1 warning
    orion5x_defconfig (gcc-8): 1 warning
    palmz72_defconfig (gcc-8): 1 warning
    pcm027_defconfig (gcc-8): 1 warning
    pleb_defconfig (gcc-8): 1 warning
    prima2_defconfig (gcc-8): 1 warning
    pxa168_defconfig (gcc-8): 1 warning
    pxa255-idp_defconfig (gcc-8): 1 warning
    pxa3xx_defconfig (gcc-8): 1 warning
    pxa910_defconfig (gcc-8): 1 warning
    realview_defconfig (gcc-8): 1 warning
    rpc_defconfig (gcc-8): 1 warning
    s3c2410_defconfig (gcc-8): 1 warning
    s3c6400_defconfig (gcc-8): 1 warning
    s5pv210_defconfig (gcc-8): 1 warning
    sama5_defconfig (gcc-8): 1 warning
    shannon_defconfig (gcc-8): 1 warning
    simpad_defconfig (gcc-8): 1 warning
    spear13xx_defconfig (gcc-8): 1 warning
    spear3xx_defconfig (gcc-8): 1 warning
    spear6xx_defconfig (gcc-8): 1 warning
    spitz_defconfig (gcc-8): 1 warning
    sunxi_defconfig (gcc-8): 1 warning
    tango4_defconfig (gcc-8): 1 warning
    tct_hammer_defconfig (gcc-8): 1 warning
    trizeps4_defconfig (gcc-8): 1 warning
    u300_defconfig (gcc-8): 1 warning
    u8500_defconfig (gcc-8): 1 warning
    versatile_defconfig (gcc-8): 1 warning
    vf610m4_defconfig (gcc-8): 1 warning
    viper_defconfig (gcc-8): 1 warning
    vt8500_v6_v7_defconfig (gcc-8): 1 warning
    xcep_defconfig (gcc-8): 1 warning
    zeus_defconfig (gcc-8): 1 warning
    zx_defconfig (gcc-8): 1 warning

i386:
    allnoconfig (gcc-8): 1 warning

mips:
    32r2el_defconfig (gcc-8): 2 warnings
    allnoconfig (gcc-8): 1 warning
    ar7_defconfig (gcc-8): 1 warning
    ath79_defconfig (gcc-8): 1 warning
    bcm63xx_defconfig (gcc-8): 1 warning
    bigsur_defconfig (gcc-8): 1 warning
    bmips_be_defconfig (gcc-8): 1 warning
    bmips_stb_defconfig (gcc-8): 1 warning
    capcella_defconfig (gcc-8): 1 warning
    cavium_octeon_defconfig (gcc-8): 1 warning
    cobalt_defconfig (gcc-8): 1 warning
    db1xxx_defconfig (gcc-8): 1 error, 1 warning
    decstation_64_defconfig (gcc-8): 1 warning
    decstation_defconfig (gcc-8): 1 warning
    decstation_r4k_defconfig (gcc-8): 1 warning
    e55_defconfig (gcc-8): 1 warning
    gcw0_defconfig (gcc-8): 1 warning
    ip22_defconfig (gcc-8): 1 warning
    ip27_defconfig (gcc-8): 1 warning
    ip28_defconfig (gcc-8): 1 warning
    jazz_defconfig (gcc-8): 1 warning
    jmr3927_defconfig (gcc-8): 1 warning
    lasat_defconfig (gcc-8): 1 warning
    loongson3_defconfig (gcc-8): 1 warning
    malta_defconfig (gcc-8): 1 warning
    malta_kvm_guest_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 2 warnings
    maltaaprp_defconfig (gcc-8): 1 warning
    maltasmvp_defconfig (gcc-8): 1 warning
    maltasmvp_eva_defconfig (gcc-8): 1 warning
    maltaup_defconfig (gcc-8): 1 warning
    maltaup_xpa_defconfig (gcc-8): 1 warning
    markeins_defconfig (gcc-8): 1 warning
    mips_paravirt_defconfig (gcc-8): 1 warning
    mpc30x_defconfig (gcc-8): 1 warning
    msp71xx_defconfig (gcc-8): 1 warning
    pnx8335_stb225_defconfig (gcc-8): 1 warning
    qi_lb60_defconfig (gcc-8): 1 warning
    rb532_defconfig (gcc-8): 1 warning
    rbtx49xx_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 1 warning
    sb1250_swarm_defconfig (gcc-8): 1 warning
    tb0219_defconfig (gcc-8): 1 warning
    tb0226_defconfig (gcc-8): 1 warning
    tb0287_defconfig (gcc-8): 1 warning
    workpad_defconfig (gcc-8): 1 warning

riscv:
    allnoconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    rv32_defconfig (gcc-8): 7 warnings

x86_64:
    allnoconfig (gcc-8): 3 warnings
    tinyconfig (gcc-8): 1 warning

Errors summary:

    2    drivers/scsi/ufs/ufs-mediatek.c:93:23: error: storage size of =E2=
=80=98res=E2=80=99 isn=E2=80=99t known
    2    drivers/scsi/ufs/ufs-mediatek.c:21:2: error: implicit declaration =
of function =E2=80=98arm_smccc_smc=E2=80=99 [-Werror=3Dimplicit-function-de=
claration]
    2    drivers/scsi/ufs/ufs-mediatek.c:21:16: error: =E2=80=98MTK_SIP_UFS=
_CONTROL=E2=80=99 undeclared (first use in this function); did you mean =E2=
=80=98TX_HIBERN8_CONTROL=E2=80=99?
    1    file.c:(.text+0x352c): undefined reference to `__udivdi3'

Warnings summary:

    134  kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=
=99 may be used uninitialized in this function [-Wmaybe-uninitialized]
    20   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    2    drivers/scsi/ufs/ufs-mediatek.c:93:23: warning: unused variable =
=E2=80=98res=E2=80=99 [-Wunused-variable]
    2    cc1: some warnings being treated as errors
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:141: Warning: macro instruction expanded into mul=
tiple instructions
    1    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable =E2=80=
=98rtd=E2=80=99 [-Wunused-variable]
    1    net/netfilter/nf_flow_table_offload.c:91:21: warning: unsigned con=
version from =E2=80=98int=E2=80=99 to =E2=80=98__be16=E2=80=99 {aka =E2=80=
=98short unsigned int=E2=80=99} changes value from =E2=80=98327680=E2=80=99=
 to =E2=80=980=E2=80=99 [-Woverflow]
    1    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%ld=E2=
=80=99 expects argument of type =E2=80=98long int=E2=80=99, but argument 5 =
has type =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wf=
ormat=3D]
    1    drivers/net/phy/mdio-octeon.c:48:3: warning: cast from pointer to =
integer of different size [-Wpointer-to-int-cast]
    1    arch/x86/kernel/unwind_orc.c:210:12: warning: =E2=80=98orc_sort_cm=
p=E2=80=99 defined but not used [-Wunused-function]
    1    arch/x86/kernel/unwind_orc.c:190:13: warning: =E2=80=98orc_sort_sw=
ap=E2=80=99 defined but not used [-Wunused-function]
    1    /tmp/ccCmEjPt.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccCmEjPt.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1173:warning: override: UNWINDER_GUESS changes choice state

Section mismatches summary:

    5    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    3    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    3    WARNING: vmlinux.o(.text.unlikely+0x8d8): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x97c): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x860): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x7a4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x3a98): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    1    WARNING: vmlinux.o(.text.unlikely+0x3740): Section mismatch in ref=
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
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnin=
gs, 0 section mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 3 errors, 2 warnings, 0 section=
 mismatches

Errors:
    drivers/scsi/ufs/ufs-mediatek.c:93:23: error: storage size of =E2=80=98=
res=E2=80=99 isn=E2=80=99t known
    drivers/scsi/ufs/ufs-mediatek.c:21:2: error: implicit declaration of fu=
nction =E2=80=98arm_smccc_smc=E2=80=99 [-Werror=3Dimplicit-function-declara=
tion]
    drivers/scsi/ufs/ufs-mediatek.c:21:16: error: =E2=80=98MTK_SIP_UFS_CONT=
ROL=E2=80=99 undeclared (first use in this function); did you mean =E2=80=
=98TX_HIBERN8_CONTROL=E2=80=99?

Warnings:
    drivers/scsi/ufs/ufs-mediatek.c:93:23: warning: unused variable =E2=80=
=98res=E2=80=99 [-Wunused-variable]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 3 errors, 20 warnings, 0 section =
mismatches

Errors:
    drivers/scsi/ufs/ufs-mediatek.c:93:23: error: storage size of =E2=80=98=
res=E2=80=99 isn=E2=80=99t known
    drivers/scsi/ufs/ufs-mediatek.c:21:2: error: implicit declaration of fu=
nction =E2=80=98arm_smccc_smc=E2=80=99 [-Werror=3Dimplicit-function-declara=
tion]
    drivers/scsi/ufs/ufs-mediatek.c:21:16: error: =E2=80=98MTK_SIP_UFS_CONT=
ROL=E2=80=99 undeclared (first use in this function); did you mean =E2=80=
=98TX_HIBERN8_CONTROL=E2=80=99?

Warnings:
    /tmp/ccCmEjPt.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccCmEjPt.s:18191: Warning: using r15 results in unpredictable beha=
viour
    net/netfilter/nf_flow_table_offload.c:91:21: warning: unsigned conversi=
on from =E2=80=98int=E2=80=99 to =E2=80=98__be16=E2=80=99 {aka =E2=80=98sho=
rt unsigned int=E2=80=99} changes value from =E2=80=98327680=E2=80=99 to =
=E2=80=980=E2=80=99 [-Woverflow]
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
    include/linux/kern_levels.h:5:18: warning: format =E2=80=98%ld=E2=80=99=
 expects argument of type =E2=80=98long int=E2=80=99, but argument 5 has ty=
pe =E2=80=98size_t=E2=80=99 {aka =E2=80=98unsigned int=E2=80=99} [-Wformat=
=3D]
    drivers/scsi/ufs/ufs-mediatek.c:93:23: warning: unused variable =E2=80=
=98res=E2=80=99 [-Wunused-variable]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
allnoconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
allnoconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    arch/x86/kernel/unwind_orc.c:210:12: warning: =E2=80=98orc_sort_cmp=E2=
=80=99 defined but not used [-Wunused-function]
    arch/x86/kernel/unwind_orc.c:190:13: warning: =E2=80=98orc_sort_swap=E2=
=80=99 defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section mi=
smatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
allnoconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

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
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

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
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8d8): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 1 warning, 0 sectio=
n mismatches

Errors:
    file.c:(.text+0x352c): undefined reference to `__udivdi3'

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3a98): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3740): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x7a4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8d8): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in reference=
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
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

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
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x860): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

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
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning=
, 0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    {standard input}:141: Warning: macro instruction expanded into multiple=
 instructions

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 0 warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 =
warnings, 0 section mismatches

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warni=
ngs, 0 section mismatches

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nommu_virt_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

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
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

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
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8d8): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable =E2=80=98rtd=
=E2=80=99 [-Wunused-variable]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x97c): Section mismatch in reference=
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
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x95c): Section mismatch in reference=
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
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in reference=
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
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
tinyconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mism=
atches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
    .config:1173:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

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
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 =
section mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mi=
smatches

Warnings:
    kernel/time/timer.c:969:20: warning: =E2=80=98timer.expires=E2=80=99 ma=
y be used uninitialized in this function [-Wmaybe-uninitialized]

---
For more info write to <info@kernelci.org>
