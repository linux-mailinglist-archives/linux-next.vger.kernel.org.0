Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 505589B938
	for <lists+linux-next@lfdr.de>; Sat, 24 Aug 2019 02:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfHXAAr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Aug 2019 20:00:47 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40450 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbfHXAAq (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Aug 2019 20:00:46 -0400
Received: by mail-wm1-f65.google.com with SMTP id c5so10383242wmb.5
        for <linux-next@vger.kernel.org>; Fri, 23 Aug 2019 17:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=0HRDKmD52a/uj8i2CL4MoZn+GIjmQJUjCIHDC/+zRZs=;
        b=g3L2iBX3DbspYLmA7bTzmaa0z8o8z5Ips3LhR0aOoLgONDEGnIdPxUilYAI7X5g3Yv
         gBYk5oeyj8f41DANsgqZ4TXwjMwu8QzdOW808kZuBS7nRRgJ1QfKSpeswGB4iatQAsQi
         d6wJG0ksytyLXn4CKLKHMvyqp1xaiYZgYfixStLpW5zRqpteCdR/0HMPCO5FV75mZFbk
         NUaA7/AQNF2hOqb09Uxe4Wf2yrzikpL8aKNAmm7cb2TM6d73WjElX5YK+ZtShSItQIUG
         J50kNd2Jixo4sjSCtfSPRocSwl1WHw3PRbjc2XqZymwtvY12dnLQ9t1T2jJ7lRI4jzS2
         mgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=0HRDKmD52a/uj8i2CL4MoZn+GIjmQJUjCIHDC/+zRZs=;
        b=EpRsxe9pS1MnrgUbUxbJXGzZM4vZNFbLyzo55JWhAnFZIfcuwc9EVZcuHSELagtSbe
         042jbmzs2lUE/UBphAScAJMie4m+8OGqo9Qmt+vLtrqmeJjEKsj0oXnf73WRpCDEYdwo
         uNnbqolx8PBBRK/rZp7/+Vlh9mkE+GpWux9kdfqyPO54hb/Drqg7BicgjI5EjPs5F6m0
         of/Dp7JaJchztirSMcKiX/IfNmav1ZLvh8yVGFQi4Pihyzk9uZLiNf3iXkgRiJSdnT5s
         MVLHGXMYMYrdZZivjfyWBUP1q9gUayPcMXv9DDrGAWKnO2kcTJV5kBXHW6sAwuSgDPZZ
         6hQA==
X-Gm-Message-State: APjAAAVDs+WNrVx3RZ9160KeCoBv42aqA2T5HXQzgx+RB3rBSBC98nyj
        fPaXn1kGKLACM7F52IX/PR91jbqh+w9JHw==
X-Google-Smtp-Source: APXvYqz3VluRa7WAQhuVtDtANTvftf0U3dBMFr9IfKuvQ6QVTMBKW0BtLK328v0SQg0V0hj1RywlAw==
X-Received: by 2002:a1c:3944:: with SMTP id g65mr8080270wma.68.1566604840440;
        Fri, 23 Aug 2019 17:00:40 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z7sm4085970wrh.67.2019.08.23.17.00.39
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Aug 2019 17:00:39 -0700 (PDT)
Message-ID: <5d607e27.1c69fb81.eb9af.1e5c@mx.google.com>
Date:   Fri, 23 Aug 2019 17:00:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190823
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
Subject: next/master build: 218 builds: 4 failed, 214 passed, 10 errors,
 786 warnings (next-20190823)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 218 builds: 4 failed, 214 passed, 10 errors, 786 warning=
s (next-20190823)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190823/

Tree: next
Branch: master
Git Describe: next-20190823
Git Commit: 9733a7c62c66722bcfdb1a6fe4d35c497312d59a
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

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 2 warnings
    axs103_smp_defconfig (gcc-8): 2 warnings
    haps_hs_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    hsdk_defconfig (gcc-8): 2 warnings
    nsim_hs_defconfig (gcc-8): 2 warnings
    nsim_hs_defconfig (gcc-8): 14 warnings
    nsim_hs_smp_defconfig (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (clang-8): 4 errors, 60 warnings
    allmodconfig (gcc-8): 2 errors, 34 warnings
    defconfig (clang-8): 4 warnings
    defconfig (gcc-8): 4 warnings
    defconfig (gcc-8): 4 warnings
    defconfig (gcc-8): 4 warnings
    defconfig (gcc-8): 6 warnings

arm:
    allmodconfig (gcc-8): 2 errors, 42 warnings
    am200epdkit_defconfig (gcc-8): 3 warnings
    at91_dt_defconfig (gcc-8): 2 warnings
    axm55xx_defconfig (gcc-8): 2 warnings
    badge4_defconfig (gcc-8): 1 warning
    bcm2835_defconfig (gcc-8): 2 warnings
    cm_x2xx_defconfig (gcc-8): 3 warnings
    cm_x300_defconfig (gcc-8): 3 warnings
    cns3420vb_defconfig (gcc-8): 2 warnings
    colibri_pxa270_defconfig (gcc-8): 2 warnings
    colibri_pxa300_defconfig (gcc-8): 2 warnings
    corgi_defconfig (gcc-8): 1 warning
    davinci_all_defconfig (gcc-8): 4 warnings
    dove_defconfig (gcc-8): 2 warnings
    em_x270_defconfig (gcc-8): 3 warnings
    ep93xx_defconfig (gcc-8): 2 warnings
    eseries_pxa_defconfig (gcc-8): 3 warnings
    exynos_defconfig (gcc-8): 6 warnings
    ezx_defconfig (gcc-8): 4 warnings
    h5000_defconfig (gcc-8): 2 warnings
    imote2_defconfig (gcc-8): 5 warnings
    imx_v4_v5_defconfig (gcc-8): 4 warnings
    imx_v6_v7_defconfig (gcc-8): 6 warnings
    integrator_defconfig (gcc-8): 2 warnings
    ixp4xx_defconfig (gcc-8): 2 warnings
    keystone_defconfig (gcc-8): 4 warnings
    lpc32xx_defconfig (gcc-8): 2 warnings
    magician_defconfig (gcc-8): 3 warnings
    milbeaut_m10v_defconfig (gcc-8): 5 warnings
    mini2440_defconfig (gcc-8): 3 warnings
    mmp2_defconfig (gcc-8): 2 warnings
    multi_v5_defconfig (gcc-8): 4 warnings
    multi_v7_defconfig (gcc-8): 7 warnings
    multi_v7_defconfig (gcc-8): 7 warnings
    multi_v7_defconfig (gcc-8): 7 warnings
    multi_v7_defconfig (gcc-8): 7 warnings
    multi_v7_defconfig (gcc-8): 14 warnings
    mv78xx0_defconfig (gcc-8): 4 warnings
    mvebu_v5_defconfig (gcc-8): 4 warnings
    mvebu_v7_defconfig (gcc-8): 6 warnings
    mxs_defconfig (gcc-8): 4 warnings
    nhk8815_defconfig (gcc-8): 3 warnings
    omap1_defconfig (gcc-8): 4 warnings
    omap2plus_defconfig (gcc-8): 7 warnings
    orion5x_defconfig (gcc-8): 2 warnings
    oxnas_v6_defconfig (gcc-8): 5 warnings
    palmz72_defconfig (gcc-8): 2 warnings
    pcm027_defconfig (gcc-8): 2 warnings
    prima2_defconfig (gcc-8): 2 warnings
    pxa168_defconfig (gcc-8): 2 warnings
    pxa3xx_defconfig (gcc-8): 2 warnings
    pxa910_defconfig (gcc-8): 2 warnings
    pxa_defconfig (gcc-8): 4 warnings
    qcom_defconfig (gcc-8): 6 warnings
    realview_defconfig (gcc-8): 2 warnings
    s3c2410_defconfig (gcc-8): 1 warning
    s3c6400_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (gcc-8): 3 warnings
    sama5_defconfig (gcc-8): 2 warnings
    simpad_defconfig (gcc-8): 1 warning
    socfpga_defconfig (gcc-8): 2 warnings
    spear13xx_defconfig (gcc-8): 4 warnings
    spitz_defconfig (gcc-8): 1 warning
    sunxi_defconfig (gcc-8): 4 warnings
    tango4_defconfig (gcc-8): 2 warnings
    tegra_defconfig (gcc-8): 6 warnings
    trizeps4_defconfig (gcc-8): 2 warnings
    u300_defconfig (gcc-8): 2 warnings
    u8500_defconfig (gcc-8): 2 warnings
    versatile_defconfig (gcc-8): 2 warnings
    vexpress_defconfig (gcc-8): 4 warnings
    viper_defconfig (gcc-8): 3 warnings
    xcep_defconfig (gcc-8): 2 warnings
    zeus_defconfig (gcc-8): 3 warnings

i386:
    i386_defconfig (gcc-8): 6 warnings
    i386_defconfig (gcc-8): 15 warnings

mips:
    32r2el_defconfig (gcc-8): 3 warnings
    32r2el_defconfig (gcc-8): 14 warnings
    allnoconfig (gcc-8): 1 warning
    ar7_defconfig (gcc-8): 4 warnings
    ath25_defconfig (gcc-8): 4 warnings
    ath79_defconfig (gcc-8): 4 warnings
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
    decstation_64_defconfig (gcc-8): 10 warnings
    decstation_defconfig (gcc-8): 6 warnings
    decstation_r4k_defconfig (gcc-8): 6 warnings
    e55_defconfig (gcc-8): 2 warnings
    fuloong2e_defconfig (gcc-8): 11 warnings
    gcw0_defconfig (gcc-8): 1 warning
    gpr_defconfig (gcc-8): 5 warnings
    ip22_defconfig (gcc-8): 4 warnings
    ip27_defconfig (gcc-8): 8 warnings
    ip28_defconfig (gcc-8): 6 warnings
    ip32_defconfig (gcc-8): 9 warnings
    jazz_defconfig (gcc-8): 4 warnings
    jmr3927_defconfig (gcc-8): 1 warning
    lasat_defconfig (gcc-8): 1 warning
    lemote2f_defconfig (gcc-8): 11 warnings
    loongson1b_defconfig (gcc-8): 2 warnings
    loongson1c_defconfig (gcc-8): 2 warnings
    loongson3_defconfig (gcc-8): 11 warnings
    malta_defconfig (gcc-8): 4 warnings
    malta_kvm_defconfig (gcc-8): 7 warnings
    malta_kvm_guest_defconfig (gcc-8): 4 warnings
    malta_qemu_32r6_defconfig (gcc-8): 5 warnings
    maltaaprp_defconfig (gcc-8): 4 warnings
    maltasmvp_defconfig (gcc-8): 4 warnings
    maltasmvp_eva_defconfig (gcc-8): 4 warnings
    maltaup_defconfig (gcc-8): 4 warnings
    maltaup_xpa_defconfig (gcc-8): 4 warnings
    markeins_defconfig (gcc-8): 2 warnings
    mips_paravirt_defconfig (gcc-8): 6 warnings
    mpc30x_defconfig (gcc-8): 2 warnings
    msp71xx_defconfig (gcc-8): 2 warnings
    mtx1_defconfig (gcc-8): 7 warnings
    nlm_xlp_defconfig (gcc-8): 14 warnings
    nlm_xlr_defconfig (gcc-8): 15 warnings
    omega2p_defconfig (gcc-8): 1 warning
    pic32mzda_defconfig (gcc-8): 2 warnings
    pistachio_defconfig (gcc-8): 5 warnings
    pnx8335_stb225_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 2 warnings
    rb532_defconfig (gcc-8): 2 warnings
    rbtx49xx_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 4 warnings
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
    defconfig (gcc-8): 3 warnings
    defconfig (gcc-8): 8 warnings
    rv32_defconfig (gcc-8): 9 warnings

x86_64:
    allmodconfig (gcc-8): 12 warnings
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 6 warnings
    x86_64_defconfig (gcc-8): 6 warnings

Errors summary:

    2    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:8: error: implicit decl=
aration of function 'dma_set_max_seg_size'; did you mean 'drm_rect_adjust_s=
ize'? [-Werror=3Dimplicit-function-declaration]
    2    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:52: error: implicit dec=
laration of function 'DMA_BIT_MASK'; did you mean 'BIT_MASK'? [-Werror=3Dim=
plicit-function-declaration]
    1    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:8: error: this function=
 declaration is not a prototype [-Werror,-Wstrict-prototypes]
    1    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:8: error: implicit decl=
aration of function 'dma_set_max_seg_size' [-Werror,-Wimplicit-function-dec=
laration]
    1    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:52: error: this functio=
n declaration is not a prototype [-Werror,-Wstrict-prototypes]
    1    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:52: error: implicit dec=
laration of function 'DMA_BIT_MASK' [-Werror,-Wimplicit-function-declaratio=
n]
    1    arch/mips/include/asm/octeon/cvmx-ipd.h:331:36: error: 'CVMX_PIP_S=
FT_RST' undeclared (first use in this function); did you mean 'CVMX_CIU_SOF=
T_RST'?
    1    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: error: storage siz=
e of 'pip_sft_rst' isn't known

Warnings summary:

    193  <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    128  WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    100  WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBO=
L_GPL
    86   WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256=
.o
    67   WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    36   ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' d=
eclared inside parameter list will not be visible outside of this definitio=
n or declaration
    24   ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' d=
eclared inside parameter list will not be visible outside of this definitio=
n or declaration
    12   WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYM=
BOL_GPL
    9    1 warning generated.
    8    WARNING: "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress] is a sta=
tic EXPORT_SYMBOL
    6    include/linux/kern_levels.h:5:18: warning: format '%lu' expects ar=
gument of type 'long unsigned int', but argument 8 has type 'unsigned int' =
[-Wformat=3D]
    6    fs/btrfs/tree-checker.c:1216:10: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    6    fs/btrfs/tree-checker.c:1200:50: warning: format '%lu' expects arg=
ument of type 'long unsigned int', but argument 5 has type 'unsigned int' [=
-Wformat=3D]
    6    fs/btrfs/tree-checker.c:1083:10: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    6    fs/btrfs/tree-checker.c:1065:9: warning: cast from pointer to inte=
ger of different size [-Wpointer-to-int-cast]
    6    fs/btrfs/tree-checker.c:1057:10: warning: cast to pointer from int=
eger of different size [-Wint-to-pointer-cast]
    6    fs/btrfs/tree-checker.c:1051:8: warning: cast from pointer to inte=
ger of different size [-Wpointer-to-int-cast]
    6    fs/btrfs/tree-checker.c:1003:47: warning: format '%lu' expects arg=
ument of type 'long unsigned int', but argument 5 has type 'unsigned int' [=
-Wformat=3D]
    6    ./../include/trace/events/iomap.h:80:1: warning: declaration of 's=
truct inode' will not be visible outside of this function [-Wvisibility]
    6    ./../include/trace/events/iomap.h:79:1: warning: declaration of 's=
truct inode' will not be visible outside of this function [-Wvisibility]
    6    ./../include/trace/events/iomap.h:54:1: warning: declaration of 's=
truct inode' will not be visible outside of this function [-Wvisibility]
    6    ./../include/trace/events/iomap.h:53:1: warning: declaration of 's=
truct inode' will not be visible outside of this function [-Wvisibility]
    6    ./../include/trace/events/iomap.h:52:1: warning: declaration of 's=
truct inode' will not be visible outside of this function [-Wvisibility]
    4    WARNING: "ahci_em_messages" [drivers/ata/libahci] is a static EXPO=
RT_SYMBOL_GPL
    3    2 warnings generated.
    2    net/netfilter/nf_tables_offload.c:73:1: warning: the frame size of=
 1176 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    2    drivers/dma/iop-adma.c:118:12: warning: format '%x' expects argume=
nt of type 'unsigned int', but argument 6 has type 'dma_addr_t' {aka 'long =
long unsigned int'} [-Wformat=3D]
    2    cc1: some warnings being treated as errors
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:134: Warning: macro instruction expanded into mul=
tiple instructions
    1    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitia=
lized when used within its own initialization [-Wuninitialized]
    1    net/netfilter/nf_tables_offload.c:73:1: warning: the frame size of=
 1184 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    1    net/netfilter/nf_tables_offload.c:73:1: warning: the frame size of=
 1164 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    1    mm/shmem.c:2734:35: warning: variable 'shmem_falloc_waitq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    1    fs/proc/base.c:1894:35: warning: variable 'wq' is uninitialized wh=
en used within its own initialization [-Wuninitialized]
    1    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when=
 used within its own initialization [-Wuninitialized]
    1    fs/namei.c:3136:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    fs/namei.c:1646:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized =
when used within its own initialization [-Wuninitialized]
    1    fs/cifs/readdir.c:83:34: warning: variable 'wq' is uninitialized w=
hen used within its own initialization [-Wuninitialized]
    1    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized=
 when used within its own initialization [-Wuninitialized]
    1    drivers/usb/gadget/udc/lpc32xx_udc.c:1257:11: warning: cast from p=
ointer to integer of different size [-Wpointer-to-int-cast]
    1    drivers/usb/gadget/udc/lpc32xx_udc.c:1156:11: warning: cast from p=
ointer to integer of different size [-Wpointer-to-int-cast]
    1    drivers/soundwire/intel.c:829:6: warning: unused variable 'nval' [=
-Wunused-variable]
    1    drivers/soundwire/intel.c:829:12: warning: unused variable 'i' [-W=
unused-variable]
    1    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mism=
atch in conditional expression
    1    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    crypto/aegis128-neon-inner.c:62:38: warning: vector initializers a=
re not compatible with NEON intrinsics in big endian mode [-Wnonportable-ve=
ctor-initialization]
    1    crypto/aegis128-neon-inner.c:58:40: warning: vector initializers a=
re not compatible with NEON intrinsics in big endian mode [-Wnonportable-ve=
ctor-initialization]
    1    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: warning: unused va=
riable 'pip_sft_rst' [-Wunused-variable]
    1    30 warnings generated.
    1    /tmp/cc5ALpaI.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/cc5ALpaI.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1175:warning: override: UNWINDER_GUESS changes choice state

Section mismatches summary:

    1    WARNING: vmlinux.o(.text+0xaa86ec): Section mismatch in reference =
from the function weim_probe() to the function .init.text:weim_timing_setup=
()
    1    WARNING: vmlinux.o(.text+0xaa85b4): Section mismatch in reference =
from the function weim_probe() to the function .init.text:imx_weim_gpr_setu=
p()

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
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 14 warni=
ngs, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:1003:47: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1051:8: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1057:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1065:9: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1083:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1200:50: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1216:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    net/netfilter/nf_tables_offload.c:73:1: warning: the frame size of 1176=
 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 FAIL, 4 errors, 60 warnings, 0 sect=
ion mismatches

Errors:
    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:8: error: implicit declarati=
on of function 'dma_set_max_seg_size' [-Werror,-Wimplicit-function-declarat=
ion]
    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:8: error: this function decl=
aration is not a prototype [-Werror,-Wstrict-prototypes]
    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:52: error: implicit declarat=
ion of function 'DMA_BIT_MASK' [-Werror,-Wimplicit-function-declaration]
    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:52: error: this function dec=
laration is not a prototype [-Werror,-Wstrict-prototypes]

Warnings:
    mm/shmem.c:2734:35: warning: variable 'shmem_falloc_waitq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/proc/base.c:1894:35: warning: variable 'wq' is uninitialized when us=
ed within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is uninitialized w=
hen used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/namei.c:1646:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    fs/namei.c:3136:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    2 warnings generated.
    ./../include/trace/events/iomap.h:52:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:52:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:52:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:52:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:52:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:52:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:53:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:53:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:53:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:53:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:53:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:53:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:54:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:54:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:54:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:54:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:54:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:54:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:79:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:79:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:79:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:79:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:79:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:79:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:80:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:80:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:80:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:80:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:80:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    ./../include/trace/events/iomap.h:80:1: warning: declaration of 'struct=
 inode' will not be visible outside of this function [-Wvisibility]
    30 warnings generated.
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    fs/afs/dir_silly.c:205:34: warning: variable 'wq' is uninitialized when=
 used within its own initialization [-Wuninitialized]
    1 warning generated.
    crypto/aegis128-neon-inner.c:58:40: warning: vector initializers are no=
t compatible with NEON intrinsics in big endian mode [-Wnonportable-vector-=
initialization]
    crypto/aegis128-neon-inner.c:62:38: warning: vector initializers are no=
t compatible with NEON intrinsics in big endian mode [-Wnonportable-vector-=
initialization]
    2 warnings generated.
    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
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

Section mismatches:
    WARNING: vmlinux.o(.text+0xaa85b4): Section mismatch in reference from =
the function weim_probe() to the function .init.text:imx_weim_gpr_setup()
    WARNING: vmlinux.o(.text+0xaa86ec): Section mismatch in reference from =
the function weim_probe() to the function .init.text:weim_timing_setup()

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 2 errors, 34 warnings, 0 sectio=
n mismatches

Errors:
    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:8: error: implicit declarati=
on of function 'dma_set_max_seg_size'; did you mean 'drm_rect_adjust_size'?=
 [-Werror=3Dimplicit-function-declaration]
    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:52: error: implicit declarat=
ion of function 'DMA_BIT_MASK'; did you mean 'BIT_MASK'? [-Werror=3Dimplici=
t-function-declaration]

Warnings:
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    drivers/dma/iop-adma.c:118:12: warning: format '%x' expects argument of=
 type 'unsigned int', but argument 6 has type 'dma_addr_t' {aka 'long long =
unsigned int'} [-Wformat=3D]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 42 warnings, 0 section =
mismatches

Errors:
    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:8: error: implicit declarati=
on of function 'dma_set_max_seg_size'; did you mean 'drm_rect_adjust_size'?=
 [-Werror=3Dimplicit-function-declaration]
    drivers/gpu/drm/mediatek/mtk_drm_drv.c:291:52: error: implicit declarat=
ion of function 'DMA_BIT_MASK'; did you mean 'BIT_MASK'? [-Werror=3Dimplici=
t-function-declaration]

Warnings:
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:49:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    ./../include/trace/events/iomap.h:77:18: warning: 'struct inode' declar=
ed inside parameter list will not be visible outside of this definition or =
declaration
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    /tmp/cc5ALpaI.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/cc5ALpaI.s:18191: Warning: using r15 results in unpredictable beha=
viour
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:1003:47: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1051:8: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1057:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1065:9: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1083:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1200:50: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1216:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    cc1: some warnings being treated as errors

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 12 warnings, 0 secti=
on mismatches

Warnings:
    drivers/dma/iop-adma.c:118:12: warning: format '%x' expects argument of=
 type 'unsigned int', but argument 6 has type 'dma_addr_t' {aka 'long long =
unsigned int'} [-Wformat=3D]
    drivers/soundwire/intel.c:829:12: warning: unused variable 'i' [-Wunuse=
d-variable]
    drivers/soundwire/intel.c:829:6: warning: unused variable 'nval' [-Wunu=
sed-variable]
    drivers/usb/gadget/udc/lpc32xx_udc.c:1156:11: warning: cast from pointe=
r to integer of different size [-Wpointer-to-int-cast]
    drivers/usb/gadget/udc/lpc32xx_udc.c:1257:11: warning: cast from pointe=
r to integer of different size [-Wpointer-to-int-cast]
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress] is a static E=
XPORT_SYMBOL
    WARNING: "ahci_em_messages" [drivers/ata/libahci] is a static EXPORT_SY=
MBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress] is a static E=
XPORT_SYMBOL
    WARNING: "ahci_em_messages" [drivers/ata/libahci] is a static EXPORT_SY=
MBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

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

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

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
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
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
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [drivers/ata/libahci] is a static EXPORT_SY=
MBOL_GPL

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
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 10 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress] is a static E=
XPORT_SYMBOL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress] is a static E=
XPORT_SYMBOL

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress] is a static E=
XPORT_SYMBOL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress] is a static E=
XPORT_SYMBOL

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress] is a static E=
XPORT_SYMBOL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "LZ4HC_setExternalDict" [lib/lz4/lz4hc_compress] is a static E=
XPORT_SYMBOL

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section mi=
smatches

Warnings:
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section =
mismatches

Warnings:
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section mi=
smatches

Warnings:
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 4 warnings, 0 section mismatches

Warnings:
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 4 warnings, 0 section mismatches

Warnings:
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 =
section mismatches

Warnings:
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 =
section mismatches

Warnings:
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
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
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 11 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 15 warning=
s, 0 section mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:1003:47: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1051:8: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1057:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1065:9: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1083:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1200:50: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1216:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    net/netfilter/nf_tables_offload.c:73:1: warning: the frame size of 1184=
 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

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
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

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
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 11 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 11 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
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
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    {standard input}:134: Warning: macro instruction expanded into multiple=
 instructions
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, =
0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
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
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 7 warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 =
warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 14 warn=
ings, 0 section mismatches

Warnings:
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:1003:47: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1051:8: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1057:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1065:9: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1083:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1200:50: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1216:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    net/netfilter/nf_tables_offload.c:73:1: warning: the frame size of 1176=
 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 14 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 15 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/btrfs/tree-checker.c:1003:47: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1051:8: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1057:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1065:9: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1083:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1200:50: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1216:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 14 warni=
ngs, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    net/netfilter/nf_tables_offload.c:73:1: warning: the frame size of 1164=
 bytes is larger than 1024 bytes [-Wframe-larger-than=3D]
    fs/btrfs/tree-checker.c:1003:47: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1051:8: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1057:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1065:9: warning: cast from pointer to integer o=
f different size [-Wpointer-to-int-cast]
    fs/btrfs/tree-checker.c:1083:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    fs/btrfs/tree-checker.c:1200:50: warning: format '%lu' expects argument=
 of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wfor=
mat=3D]
    fs/btrfs/tree-checker.c:1216:10: warning: cast to pointer from integer =
of different size [-Wint-to-pointer-cast]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section =
mismatches

Warnings:
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "ahci_em_messages" [drivers/ata/libahci] is a static EXPORT_SY=
MBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

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
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 9 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
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
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
    .config:1175:warning: override: UNWINDER_GUESS changes choice state

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
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
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
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 6 warn=
ings, 0 section mismatches

Warnings:
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ahci_em_messages" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "ftrace_set_clr_event" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: modpost: missing MODULE_LICENSE() in lib/crypto/libsha256.o
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
