Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9DA4C19CA
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2019 01:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbfI2X5L (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Sep 2019 19:57:11 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37021 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729010AbfI2X5L (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 29 Sep 2019 19:57:11 -0400
Received: by mail-wm1-f65.google.com with SMTP id f22so10763933wmc.2
        for <linux-next@vger.kernel.org>; Sun, 29 Sep 2019 16:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=woBPdaIANOy71J5mH9djwZDbx5sHmK7nsqDfGRH98+M=;
        b=dGM+muJKKyRF//RHZEfxMnSX40/KwxzXmt0MoSyRTNjgDZ3W3S1cFnfnFgPhssyZyM
         WHDZGEHJnRoUfmL1BHWKKvn5P0irlImekxY1abhB4IpxlqVme5GJJjtIcri7lvW840Hv
         AzvcM1aW3qS/BYjJMcyAxKe4Gis9IVrkKELcmf3aB3gJ/1CJ2SUg62O6+EofIY5YYWu/
         CpyNQto7V7htaVRc5z9gn9F+fDKOkUOlpnob7vP+KD7jSyUGgaYFA422cob223cAEbge
         iwQ7gNfNwwJqzHpOORNeg8LP6FuRs54/iiIdv5KgJAu8FgndWbG66uT74P6N6iBx8dNi
         M6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=woBPdaIANOy71J5mH9djwZDbx5sHmK7nsqDfGRH98+M=;
        b=WSqW4pRIqWJRTZqQ+Fe3ErRBkAELLONXDlzm51xRo2AF6zheKlljjAlaE3P/bKjH83
         cfAf0cH4iZGPmvCV/CJbkEU8ht2NBlIl9SNtQ6wZHthlI+wY0uQc1NScc4QocbZPHGCk
         jswFMClhRYcwHstwRiYsuaK2Mhl6F6t5Kz1y5DjAdsJJL3l4N6xoF9GOC/9qAqbeNCCo
         RAyKM02g4Bwh8+KcTMQ2+ugGVp6LJCOTIEV1keQmWNUx5q9rTjqsunId/Njhl+1O9lRN
         CtP2D1K+HX4yPOmmoA5PGaoc+E71rmS14xpIDoNuAynYeiUynSYrHb6vuFjNrPSrlFFd
         4f+g==
X-Gm-Message-State: APjAAAWLVvTYslrIb+HoDOQXShbGbfD6FLbAgsD/ZgJ2fXKuPkvvhjoH
        ZZ//nGJo52iuJi5Aos9mNhcll6wdeE8=
X-Google-Smtp-Source: APXvYqzAJzMK3SoAOLjSR6E0KN3ky6Jhdq805JY12F1V8f5g1guvVw3//BOSUKUuE7M8HvZriO+OyQ==
X-Received: by 2002:a1c:3281:: with SMTP id y123mr14163464wmy.34.1569801417220;
        Sun, 29 Sep 2019 16:56:57 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x16sm7942643wrl.32.2019.09.29.16.56.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 29 Sep 2019 16:56:56 -0700 (PDT)
Message-ID: <5d9144c8.1c69fb81.d371b.1685@mx.google.com>
Date:   Sun, 29 Sep 2019 16:56:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.3-13311-g8d0cc3a7f82f
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 214 builds: 2 failed, 212 passed, 10 errors,
 728 warnings (v5.3-13311-g8d0cc3a7f82f)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 214 builds: 2 failed, 212 passed, 10 errors, 728 =
warnings (v5.3-13311-g8d0cc3a7f82f)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-13311-g8d0cc3a7f82f/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-13311-g8d0cc3a7f82f
Git Commit: 8d0cc3a7f82fcdc3db2980db674581fa85e5408a
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

mips:
    cavium_octeon_defconfig: (gcc-8) FAIL
    msp71xx_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 2 warnings
    axs103_smp_defconfig (gcc-8): 2 warnings
    haps_hs_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    hsdk_defconfig (gcc-8): 2 warnings
    nsim_hs_defconfig (gcc-8): 2 warnings
    nsim_hs_defconfig (gcc-8): 29 warnings
    nsim_hs_smp_defconfig (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (gcc-8): 2 warnings
    defconfig (gcc-8): 3 warnings
    defconfig (gcc-8): 3 warnings
    defconfig (gcc-8): 3 warnings
    defconfig (gcc-8): 30 warnings

arm:
    am200epdkit_defconfig (gcc-8): 2 warnings
    assabet_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (gcc-8): 2 warnings
    axm55xx_defconfig (gcc-8): 2 warnings
    cm_x2xx_defconfig (gcc-8): 2 warnings
    cm_x300_defconfig (gcc-8): 2 warnings
    cns3420vb_defconfig (gcc-8): 2 warnings
    colibri_pxa270_defconfig (gcc-8): 2 warnings
    colibri_pxa300_defconfig (gcc-8): 2 warnings
    collie_defconfig (gcc-8): 1 warning
    davinci_all_defconfig (gcc-8): 3 warnings
    dove_defconfig (gcc-8): 2 warnings
    em_x270_defconfig (gcc-8): 2 warnings
    ep93xx_defconfig (gcc-8): 2 warnings
    eseries_pxa_defconfig (gcc-8): 2 warnings
    exynos_defconfig (gcc-8): 172 warnings
    ezx_defconfig (gcc-8): 2 warnings
    h3600_defconfig (gcc-8): 1 warning
    h5000_defconfig (gcc-8): 2 warnings
    imote2_defconfig (gcc-8): 2 warnings
    imx_v4_v5_defconfig (gcc-8): 2 warnings
    imx_v6_v7_defconfig (gcc-8): 2 warnings
    integrator_defconfig (gcc-8): 2 warnings
    ixp4xx_defconfig (gcc-8): 2 warnings
    keystone_defconfig (gcc-8): 2 warnings
    lpc32xx_defconfig (gcc-8): 2 warnings
    magician_defconfig (gcc-8): 2 warnings
    milbeaut_m10v_defconfig (gcc-8): 2 warnings
    mini2440_defconfig (gcc-8): 2 warnings
    mmp2_defconfig (gcc-8): 2 warnings
    multi_v5_defconfig (gcc-8): 2 warnings
    multi_v7_defconfig (gcc-8): 5 warnings
    multi_v7_defconfig (gcc-8): 5 warnings
    multi_v7_defconfig (gcc-8): 5 warnings
    multi_v7_defconfig (gcc-8): 5 warnings
    multi_v7_defconfig (gcc-8): 30 warnings
    mv78xx0_defconfig (gcc-8): 2 warnings
    mvebu_v5_defconfig (gcc-8): 2 warnings
    mvebu_v7_defconfig (gcc-8): 2 warnings
    mxs_defconfig (gcc-8): 2 warnings
    neponset_defconfig (gcc-8): 1 warning
    nhk8815_defconfig (gcc-8): 2 warnings
    omap1_defconfig (gcc-8): 2 warnings
    omap2plus_defconfig (gcc-8): 3 warnings
    orion5x_defconfig (gcc-8): 2 warnings
    oxnas_v6_defconfig (gcc-8): 2 warnings
    palmz72_defconfig (gcc-8): 2 warnings
    pcm027_defconfig (gcc-8): 2 warnings
    prima2_defconfig (gcc-8): 2 warnings
    pxa168_defconfig (gcc-8): 2 warnings
    pxa3xx_defconfig (gcc-8): 2 warnings
    pxa910_defconfig (gcc-8): 2 warnings
    qcom_defconfig (gcc-8): 2 warnings
    realview_defconfig (gcc-8): 2 warnings
    s3c6400_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (gcc-8): 2 warnings
    sama5_defconfig (gcc-8): 2 warnings
    shannon_defconfig (gcc-8): 1 warning
    spear13xx_defconfig (gcc-8): 2 warnings
    sunxi_defconfig (gcc-8): 2 warnings
    tango4_defconfig (gcc-8): 2 warnings
    tegra_defconfig (gcc-8): 2 warnings
    trizeps4_defconfig (gcc-8): 2 warnings
    u300_defconfig (gcc-8): 2 warnings
    u8500_defconfig (gcc-8): 2 warnings
    versatile_defconfig (gcc-8): 2 warnings
    vexpress_defconfig (gcc-8): 2 warnings
    viper_defconfig (gcc-8): 2 warnings
    xcep_defconfig (gcc-8): 2 warnings
    zeus_defconfig (gcc-8): 2 warnings

i386:
    i386_defconfig (gcc-8): 27 warnings

mips:
    32r2el_defconfig (gcc-8): 3 warnings
    32r2el_defconfig (gcc-8): 30 warnings
    allnoconfig (gcc-8): 1 warning
    ar7_defconfig (gcc-8): 2 warnings
    ath25_defconfig (gcc-8): 2 warnings
    ath79_defconfig (gcc-8): 2 warnings
    bcm47xx_defconfig (gcc-8): 2 warnings
    bcm63xx_defconfig (gcc-8): 1 warning
    bigsur_defconfig (gcc-8): 6 warnings
    bmips_be_defconfig (gcc-8): 1 warning
    bmips_stb_defconfig (gcc-8): 1 warning
    capcella_defconfig (gcc-8): 2 warnings
    cavium_octeon_defconfig (gcc-8): 6 errors, 6 warnings
    ci20_defconfig (gcc-8): 1 warning
    cobalt_defconfig (gcc-8): 2 warnings
    db1xxx_defconfig (gcc-8): 2 warnings
    decstation_64_defconfig (gcc-8): 6 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
    e55_defconfig (gcc-8): 2 warnings
    fuloong2e_defconfig (gcc-8): 6 warnings
    gcw0_defconfig (gcc-8): 1 warning
    gpr_defconfig (gcc-8): 2 warnings
    ip22_defconfig (gcc-8): 2 warnings
    ip27_defconfig (gcc-8): 6 warnings
    ip28_defconfig (gcc-8): 6 warnings
    ip32_defconfig (gcc-8): 7 warnings
    jazz_defconfig (gcc-8): 3 warnings
    jmr3927_defconfig (gcc-8): 1 warning
    lasat_defconfig (gcc-8): 1 warning
    lemote2f_defconfig (gcc-8): 6 warnings
    loongson1b_defconfig (gcc-8): 2 warnings
    loongson1c_defconfig (gcc-8): 2 warnings
    loongson3_defconfig (gcc-8): 6 warnings
    malta_defconfig (gcc-8): 2 warnings
    malta_kvm_defconfig (gcc-8): 2 warnings
    malta_kvm_guest_defconfig (gcc-8): 2 warnings
    malta_qemu_32r6_defconfig (gcc-8): 2 warnings
    maltaaprp_defconfig (gcc-8): 2 warnings
    maltasmvp_defconfig (gcc-8): 2 warnings
    maltasmvp_eva_defconfig (gcc-8): 2 warnings
    maltaup_defconfig (gcc-8): 2 warnings
    maltaup_xpa_defconfig (gcc-8): 2 warnings
    markeins_defconfig (gcc-8): 2 warnings
    mips_paravirt_defconfig (gcc-8): 6 warnings
    mpc30x_defconfig (gcc-8): 2 warnings
    msp71xx_defconfig (gcc-8): 4 errors, 2 warnings
    mtx1_defconfig (gcc-8): 2 warnings
    nlm_xlp_defconfig (gcc-8): 6 warnings
    nlm_xlr_defconfig (gcc-8): 2 warnings
    omega2p_defconfig (gcc-8): 1 warning
    pic32mzda_defconfig (gcc-8): 2 warnings
    pistachio_defconfig (gcc-8): 2 warnings
    pnx8335_stb225_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 2 warnings
    rb532_defconfig (gcc-8): 2 warnings
    rbtx49xx_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 3 warnings
    rt305x_defconfig (gcc-8): 2 warnings
    sb1250_swarm_defconfig (gcc-8): 4 warnings
    tb0219_defconfig (gcc-8): 2 warnings
    tb0226_defconfig (gcc-8): 2 warnings
    tb0287_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vocore2_defconfig (gcc-8): 1 warning
    workpad_defconfig (gcc-8): 2 warnings
    xway_defconfig (gcc-8): 2 warnings

riscv:
    defconfig (gcc-8): 27 warnings
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 27 warnings

Errors summary:

    3    arch/mips/include/asm/octeon/cvmx-ipd.h:331:36: error: 'CVMX_PIP_S=
FT_RST' undeclared (first use in this function); did you mean 'CVMX_CIU_SOF=
T_RST'?
    3    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: error: storage siz=
e of 'pip_sft_rst' isn't known
    1    arch/mips/pmcs-msp71xx/msp_prom.c:65:20: error: 'prom_mem_size' de=
fined but not used [-Werror=3Dunused-variable]
    1    arch/mips/pmcs-msp71xx/msp_prom.c:64:34: error: 'MAX_PROM_MEM' und=
eclared here (not in a function); did you mean 'DEV_PROP_MAX'?
    1    arch/mips/pmcs-msp71xx/msp_prom.c:64:20: error: 'prom_mem_base' de=
fined but not used [-Werror=3Dunused-variable]
    1    arch/mips/pmcs-msp71xx/msp_prom.c:380:16: error: unused variable '=
addr' [-Werror=3Dunused-variable]

Warnings summary:

    192  <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    128  WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    10   WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYM=
BOL_GPL
    5    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_=
period' defined but not used [-Wunused-function]
    5    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' =
invalid for REMOTEPROC
    4    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid=
 for REMOTEPROC
    3    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: warning: unused va=
riable 'pip_sft_rst' [-Wunused-variable]
    3    arch/mips/fw/arc/memory.c:163:16: warning: unused variable 'addr' =
[-Wunused-variable]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mism=
atch in conditional expression
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@9/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.k=
o needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@9/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.k=
o needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-u=
sbat.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-u=
sbat.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-u=
sbat.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-u=
sbat.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-u=
sbat.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-u=
sbat.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-u=
sbat.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-u=
sbat.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-u=
sbat.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-u=
sbat.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-u=
sbat.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-u=
sbat.ko needs unknown symbol usb_stor_clear_halt
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-u=
sbat.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-u=
sbat.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-u=
sbat.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-u=
sbat.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr55.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr55.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr55.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr55.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr55.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr55.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr55.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr55.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr55.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr55.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr55.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr55.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr55.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_CB_transport
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-s=
ddr09.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-r=
ealtek.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-r=
ealtek.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-r=
ealtek.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-r=
ealtek.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-r=
ealtek.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-r=
ealtek.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-r=
ealtek.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-r=
ealtek.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-r=
ealtek.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-o=
netouch.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-o=
netouch.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-o=
netouch.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-o=
netouch.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-o=
netouch.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-o=
netouch.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-o=
netouch.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-o=
netouch.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-o=
netouch.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-k=
arma.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-k=
arma.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-k=
arma.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-k=
arma.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-k=
arma.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-k=
arma.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-k=
arma.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-k=
arma.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-k=
arma.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-k=
arma.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-k=
arma.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-k=
arma.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-j=
umpshot.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-j=
umpshot.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-j=
umpshot.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-j=
umpshot.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-j=
umpshot.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-j=
umpshot.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-j=
umpshot.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-j=
umpshot.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-j=
umpshot.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-j=
umpshot.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-j=
umpshot.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-j=
umpshot.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-j=
umpshot.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-j=
umpshot.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-j=
umpshot.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-i=
sd200.ko needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-i=
sd200.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-i=
sd200.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-i=
sd200.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-i=
sd200.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-i=
sd200.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-i=
sd200.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-i=
sd200.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-i=
sd200.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-i=
sd200.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-i=
sd200.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-i=
sd200.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-i=
sd200.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-f=
reecom.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-f=
reecom.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-f=
reecom.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-f=
reecom.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-f=
reecom.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-f=
reecom.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-f=
reecom.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-f=
reecom.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-f=
reecom.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-f=
reecom.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-f=
reecom.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-f=
reecom.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-e=
neub6250.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-e=
neub6250.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-e=
neub6250.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-e=
neub6250.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-e=
neub6250.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-e=
neub6250.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-e=
neub6250.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-e=
neub6250.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-e=
neub6250.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-e=
neub6250.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-e=
neub6250.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-e=
neub6250.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-e=
neub6250.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-d=
atafab.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-d=
atafab.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-d=
atafab.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-d=
atafab.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-d=
atafab.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-d=
atafab.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-d=
atafab.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-d=
atafab.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-d=
atafab.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-d=
atafab.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-d=
atafab.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-d=
atafab.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-d=
atafab.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-d=
atafab.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-c=
ypress.ko needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-c=
ypress.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-c=
ypress.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-c=
ypress.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-c=
ypress.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-c=
ypress.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-c=
ypress.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-c=
ypress.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-c=
ypress.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-c=
ypress.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-c=
ypress.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-a=
lauda.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-a=
lauda.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-a=
lauda.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-a=
lauda.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-a=
lauda.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-a=
lauda.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-a=
lauda.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-a=
lauda.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-a=
lauda.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-a=
lauda.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-a=
lauda.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-a=
lauda.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-a=
lauda.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-a=
lauda.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-a=
lauda.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@5/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.k=
o needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@5/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.k=
o needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.k=
o needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.k=
o needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs un=
known symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs un=
known symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs unkn=
own symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs unkn=
own symbol usb_stor_adjust_quirks
    1    cc1: all warnings being treated as errors
    1    arch/arm/configs/omap2plus_defconfig:487:warning: symbol value 'm'=
 invalid for REMOTEPROC
    1    arch/arm/configs/davinci_all_defconfig:231:warning: symbol value '=
m' invalid for REMOTEPROC
    1    .config:1169:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.xEN0frb3E0:4834:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xEN0frb3E0:4818:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.xEN0frb3E0:4817:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.xEN0frb3E0:4813:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.xEN0frb3E0:4793:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.xEN0frb3E0:4787:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.xEN0frb3E0:4778:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.xEN0frb3E0:4776:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.xEN0frb3E0:4775:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.xEN0frb3E0:4774:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.xEN0frb3E0:4772:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.xEN0frb3E0:4771:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.xEN0frb3E0:4768:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.xEN0frb3E0:4761:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.xEN0frb3E0:4751:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.xEN0frb3E0:4740:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xEN0frb3E0:4632:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.xEN0frb3E0:4628:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xEN0frb3E0:4603:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.xEN0frb3E0:4582:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.xEN0frb3E0:4524:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.xEN0frb3E0:4523:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.xEN0frb3E0:4519:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.xEN0frb3E0:4518:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.xEN0frb3E0:4516:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.xEN0frb3E0:4515:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.xEN0frb3E0:4512:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.uSrNI8UlUM:1746:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.uSrNI8UlUM:1730:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.uSrNI8UlUM:1729:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.uSrNI8UlUM:1725:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.uSrNI8UlUM:1705:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.uSrNI8UlUM:1699:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.uSrNI8UlUM:1690:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.uSrNI8UlUM:1688:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.uSrNI8UlUM:1687:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.uSrNI8UlUM:1686:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.uSrNI8UlUM:1684:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.uSrNI8UlUM:1683:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.uSrNI8UlUM:1680:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.uSrNI8UlUM:1673:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.uSrNI8UlUM:1663:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.uSrNI8UlUM:1652:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.uSrNI8UlUM:1544:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.uSrNI8UlUM:1540:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.uSrNI8UlUM:1515:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.uSrNI8UlUM:1494:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.uSrNI8UlUM:1436:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.uSrNI8UlUM:1435:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.uSrNI8UlUM:1431:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.uSrNI8UlUM:1430:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.uSrNI8UlUM:1428:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.uSrNI8UlUM:1427:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.uSrNI8UlUM:1424:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.onbnJX6Rzo:3374:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.onbnJX6Rzo:3358:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.onbnJX6Rzo:3357:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.onbnJX6Rzo:3353:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.onbnJX6Rzo:3333:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.onbnJX6Rzo:3327:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.onbnJX6Rzo:3318:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.onbnJX6Rzo:3316:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.onbnJX6Rzo:3315:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.onbnJX6Rzo:3314:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.onbnJX6Rzo:3312:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.onbnJX6Rzo:3311:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.onbnJX6Rzo:3308:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.onbnJX6Rzo:3301:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.onbnJX6Rzo:3291:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.onbnJX6Rzo:3280:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.onbnJX6Rzo:3172:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.onbnJX6Rzo:3168:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.onbnJX6Rzo:3143:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.onbnJX6Rzo:3122:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.onbnJX6Rzo:3064:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.onbnJX6Rzo:3063:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.onbnJX6Rzo:3059:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.onbnJX6Rzo:3058:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.onbnJX6Rzo:3056:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.onbnJX6Rzo:3055:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.onbnJX6Rzo:3052:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.g3FuveBZp6:8482:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.g3FuveBZp6:8466:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.g3FuveBZp6:8465:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.g3FuveBZp6:8461:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.g3FuveBZp6:8441:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.g3FuveBZp6:8435:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.g3FuveBZp6:8426:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.g3FuveBZp6:8424:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.g3FuveBZp6:8423:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.g3FuveBZp6:8422:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.g3FuveBZp6:8420:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.g3FuveBZp6:8419:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.g3FuveBZp6:8416:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.g3FuveBZp6:8409:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.g3FuveBZp6:8399:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.g3FuveBZp6:8388:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.g3FuveBZp6:8280:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.g3FuveBZp6:8276:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.g3FuveBZp6:8251:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.g3FuveBZp6:8230:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.g3FuveBZp6:8172:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.g3FuveBZp6:8171:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.g3FuveBZp6:8167:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.g3FuveBZp6:8166:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.g3FuveBZp6:8164:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.g3FuveBZp6:8163:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.g3FuveBZp6:8160:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.VLBbbpUrFR:7923:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VLBbbpUrFR:7907:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.VLBbbpUrFR:7906:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.VLBbbpUrFR:7902:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.VLBbbpUrFR:7882:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.VLBbbpUrFR:7876:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.VLBbbpUrFR:7867:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.VLBbbpUrFR:7865:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.VLBbbpUrFR:7864:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.VLBbbpUrFR:7863:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.VLBbbpUrFR:7861:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.VLBbbpUrFR:7860:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.VLBbbpUrFR:7857:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.VLBbbpUrFR:7850:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.VLBbbpUrFR:7840:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.VLBbbpUrFR:7829:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VLBbbpUrFR:7721:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.VLBbbpUrFR:7717:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VLBbbpUrFR:7692:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.VLBbbpUrFR:7671:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.VLBbbpUrFR:7613:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.VLBbbpUrFR:7612:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.VLBbbpUrFR:7608:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.VLBbbpUrFR:7607:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.VLBbbpUrFR:7605:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.VLBbbpUrFR:7604:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.VLBbbpUrFR:7601:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.MxRj3MpJE4:3983:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.MxRj3MpJE4:3967:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.MxRj3MpJE4:3966:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.MxRj3MpJE4:3962:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.MxRj3MpJE4:3942:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.MxRj3MpJE4:3936:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.MxRj3MpJE4:3927:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.MxRj3MpJE4:3925:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.MxRj3MpJE4:3924:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.MxRj3MpJE4:3923:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.MxRj3MpJE4:3921:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.MxRj3MpJE4:3920:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.MxRj3MpJE4:3917:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.MxRj3MpJE4:3910:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.MxRj3MpJE4:3900:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.MxRj3MpJE4:3889:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.MxRj3MpJE4:3781:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.MxRj3MpJE4:3777:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.MxRj3MpJE4:3752:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.MxRj3MpJE4:3731:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.MxRj3MpJE4:3673:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.MxRj3MpJE4:3672:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.MxRj3MpJE4:3668:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.MxRj3MpJE4:3667:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.MxRj3MpJE4:3665:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.MxRj3MpJE4:3664:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.MxRj3MpJE4:3661:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.0I5Q9GUKXv:4895:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0I5Q9GUKXv:4879:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.0I5Q9GUKXv:4878:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.0I5Q9GUKXv:4874:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.0I5Q9GUKXv:4854:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.0I5Q9GUKXv:4848:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.0I5Q9GUKXv:4839:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.0I5Q9GUKXv:4837:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.0I5Q9GUKXv:4836:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.0I5Q9GUKXv:4835:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.0I5Q9GUKXv:4833:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.0I5Q9GUKXv:4832:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.0I5Q9GUKXv:4829:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.0I5Q9GUKXv:4822:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.0I5Q9GUKXv:4812:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.0I5Q9GUKXv:4801:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0I5Q9GUKXv:4693:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.0I5Q9GUKXv:4689:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0I5Q9GUKXv:4664:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.0I5Q9GUKXv:4643:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.0I5Q9GUKXv:4585:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.0I5Q9GUKXv:4584:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.0I5Q9GUKXv:4580:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.0I5Q9GUKXv:4579:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.0I5Q9GUKXv:4577:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.0I5Q9GUKXv:4576:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.0I5Q9GUKXv:4573:warning: override: reassigning to sy=
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
    1    WARNING: vmlinux.o(.text.unlikely+0xf7c): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0xf74): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0xf70): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0xf6c): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0xedc): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0xed4): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0xed0): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0xecc): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0xddc): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0xdd4): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0xdd0): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0xdcc): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0xdbc): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0xdb4): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0xdb0): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0xdac): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0xd58): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0xd50): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0xd4c): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0xd48): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0xd1c): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0xd14): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0xd14): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0xd10): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0xd0c): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0xd0c): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:nowar
    1    WARNING: vmlinux.o(.text.unlikely+0xd08): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0xd04): Section mismatch in refe=
rence from the function check_mult_sh() to the variable .init.data:nowar
    1    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x7c8): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x710): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    1    WARNING: vmlinux.o(.text.unlikely+0x3520): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    1    WARNING: vmlinux.o(.text.unlikely+0x31ac): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    1    WARNING: vmlinux.o(.text.unlikely+0x1ebc): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0x1eb8): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0x1eb0): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0x1ea8): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0x1ea4): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0x1ea0): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0x1e9c): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0x1e98): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0x17dc): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0x17d8): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0x17d0): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0x17c8): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0x17c4): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0x17c0): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0x17bc): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0x17b8): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0x1198): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0x1190): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0x118c): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0x1188): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0x10f4): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0x10ec): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:r4kwar
    1    WARNING: vmlinux.o(.text.unlikely+0x10e8): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:bug64hit
    1    WARNING: vmlinux.o(.text.unlikely+0x10e4): Section mismatch in ref=
erence from the function check_mult_sh() to the variable .init.data:r4kwar

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
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 30 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.MxRj3MpJE4:3661:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.MxRj3MpJE4:3664:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.MxRj3MpJE4:3665:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.MxRj3MpJE4:3667:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.MxRj3MpJE4:3668:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.MxRj3MpJE4:3672:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.MxRj3MpJE4:3673:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.MxRj3MpJE4:3731:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.MxRj3MpJE4:3752:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.MxRj3MpJE4:3777:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.MxRj3MpJE4:3781:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.MxRj3MpJE4:3889:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.MxRj3MpJE4:3900:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.MxRj3MpJE4:3910:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.MxRj3MpJE4:3917:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.MxRj3MpJE4:3920:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.MxRj3MpJE4:3921:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.MxRj3MpJE4:3923:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.MxRj3MpJE4:3924:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.MxRj3MpJE4:3925:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.MxRj3MpJE4:3927:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.MxRj3MpJE4:3936:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.MxRj3MpJE4:3942:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.MxRj3MpJE4:3962:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.MxRj3MpJE4:3966:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.MxRj3MpJE4:3967:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.MxRj3MpJE4:3983:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

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
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_perio=
d' defined but not used [-Wunused-function]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0xd0c): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0xd10): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:bug64hit
    WARNING: vmlinux.o(.text.unlikely+0xd14): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0xd1c): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:bug64hit

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
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 6 errors, 6 warnings,=
 0 section mismatches

Errors:
    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: error: storage size of =
'pip_sft_rst' isn't known
    arch/mips/include/asm/octeon/cvmx-ipd.h:331:36: error: 'CVMX_PIP_SFT_RS=
T' undeclared (first use in this function); did you mean 'CVMX_CIU_SOFT_RST=
'?
    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: error: storage size of =
'pip_sft_rst' isn't known
    arch/mips/include/asm/octeon/cvmx-ipd.h:331:36: error: 'CVMX_PIP_SFT_RS=
T' undeclared (first use in this function); did you mean 'CVMX_CIU_SOFT_RST=
'?
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
    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: warning: unused variabl=
e 'pip_sft_rst' [-Wunused-variable]
    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: warning: unused variabl=
e 'pip_sft_rst' [-Wunused-variable]

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
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_perio=
d' defined but not used [-Wunused-function]

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
    arch/arm/configs/davinci_all_defconfig:231:warning: symbol value 'm' in=
valid for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0xd04): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:nowar
    WARNING: vmlinux.o(.text.unlikely+0xd08): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:bug64hit
    WARNING: vmlinux.o(.text.unlikely+0xd0c): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:nowar
    WARNING: vmlinux.o(.text.unlikely+0xd14): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:bug64hit

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3520): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x31ac): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section mi=
smatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 3 warnings, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 3 warnings, 0 section mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.onbnJX6Rzo:3052:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.onbnJX6Rzo:3055:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.onbnJX6Rzo:3056:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.onbnJX6Rzo:3058:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.onbnJX6Rzo:3059:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.onbnJX6Rzo:3063:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.onbnJX6Rzo:3064:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.onbnJX6Rzo:3122:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.onbnJX6Rzo:3143:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.onbnJX6Rzo:3168:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.onbnJX6Rzo:3172:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.onbnJX6Rzo:3280:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.onbnJX6Rzo:3291:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.onbnJX6Rzo:3301:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.onbnJX6Rzo:3308:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.onbnJX6Rzo:3311:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.onbnJX6Rzo:3312:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.onbnJX6Rzo:3314:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.onbnJX6Rzo:3315:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.onbnJX6Rzo:3316:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.onbnJX6Rzo:3318:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.onbnJX6Rzo:3327:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.onbnJX6Rzo:3333:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.onbnJX6Rzo:3353:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.onbnJX6Rzo:3357:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.onbnJX6Rzo:3358:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.onbnJX6Rzo:3374:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 30 warnings, 0=
 section mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    ./.tmp.config.VLBbbpUrFR:7601:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.VLBbbpUrFR:7604:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.VLBbbpUrFR:7605:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.VLBbbpUrFR:7607:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.VLBbbpUrFR:7608:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.VLBbbpUrFR:7612:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.VLBbbpUrFR:7613:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.VLBbbpUrFR:7671:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.VLBbbpUrFR:7692:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.VLBbbpUrFR:7717:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.VLBbbpUrFR:7721:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.VLBbbpUrFR:7829:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.VLBbbpUrFR:7840:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.VLBbbpUrFR:7850:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.VLBbbpUrFR:7857:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.VLBbbpUrFR:7860:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.VLBbbpUrFR:7861:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.VLBbbpUrFR:7863:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.VLBbbpUrFR:7864:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.VLBbbpUrFR:7865:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.VLBbbpUrFR:7867:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.VLBbbpUrFR:7876:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.VLBbbpUrFR:7882:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.VLBbbpUrFR:7902:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.VLBbbpUrFR:7906:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.VLBbbpUrFR:7907:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.VLBbbpUrFR:7923:warning: override: reassigning to symbol =
USER_NS
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL
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
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 172 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda=
.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda=
.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda=
.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda=
.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda=
.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda=
.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda=
.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda=
.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda=
.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda=
.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda=
.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda=
.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda=
.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda=
.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda=
.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypres=
s.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypres=
s.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypres=
s.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypres=
s.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypres=
s.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypres=
s.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypres=
s.ko needs unknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypres=
s.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypres=
s.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypres=
s.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypres=
s.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafa=
b.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafa=
b.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafa=
b.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafa=
b.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafa=
b.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafa=
b.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafa=
b.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafa=
b.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafa=
b.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafa=
b.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafa=
b.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafa=
b.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafa=
b.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafa=
b.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6=
250.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6=
250.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6=
250.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6=
250.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6=
250.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6=
250.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6=
250.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6=
250.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6=
250.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6=
250.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6=
250.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6=
250.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6=
250.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freeco=
m.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freeco=
m.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freeco=
m.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freeco=
m.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freeco=
m.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freeco=
m.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freeco=
m.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freeco=
m.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freeco=
m.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freeco=
m.ko needs unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freeco=
m.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freeco=
m.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200=
.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200=
.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200=
.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200=
.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200=
.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200=
.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200=
.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200=
.ko needs unknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200=
.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200=
.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200=
.ko needs unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200=
.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200=
.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpsh=
ot.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpsh=
ot.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpsh=
ot.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpsh=
ot.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpsh=
ot.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpsh=
ot.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpsh=
ot.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpsh=
ot.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpsh=
ot.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpsh=
ot.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpsh=
ot.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpsh=
ot.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpsh=
ot.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpsh=
ot.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpsh=
ot.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.=
ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.=
ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.=
ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.=
ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.=
ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.=
ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.=
ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.=
ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.=
ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.=
ko needs unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.=
ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.=
ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetou=
ch.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetou=
ch.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetou=
ch.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetou=
ch.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetou=
ch.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetou=
ch.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetou=
ch.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetou=
ch.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetou=
ch.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realte=
k.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realte=
k.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realte=
k.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realte=
k.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realte=
k.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realte=
k.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realte=
k.ko needs unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realte=
k.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realte=
k.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_CB_transport
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09=
.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55=
.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55=
.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55=
.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55=
.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55=
.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55=
.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55=
.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55=
.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55=
.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55=
.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55=
.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55=
.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55=
.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.=
ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.=
ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.=
ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.=
ko needs unknown symbol usb_stor_clear_halt
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.=
ko needs unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.=
ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.=
ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.=
ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.=
ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.=
ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.=
ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.=
ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.=
ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.=
ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.=
ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.=
ko needs unknown symbol usb_stor_set_xfer_buf

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0xdcc): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0xdd0): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:bug64hit
    WARNING: vmlinux.o(.text.unlikely+0xdd4): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0xddc): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:bug64hit

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
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_perio=
d' defined but not used [-Wunused-function]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

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
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 27 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.xEN0frb3E0:4512:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.xEN0frb3E0:4515:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.xEN0frb3E0:4516:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.xEN0frb3E0:4518:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.xEN0frb3E0:4519:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.xEN0frb3E0:4523:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.xEN0frb3E0:4524:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.xEN0frb3E0:4582:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.xEN0frb3E0:4603:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.xEN0frb3E0:4628:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.xEN0frb3E0:4632:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.xEN0frb3E0:4740:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.xEN0frb3E0:4751:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.xEN0frb3E0:4761:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.xEN0frb3E0:4768:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.xEN0frb3E0:4771:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.xEN0frb3E0:4772:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.xEN0frb3E0:4774:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.xEN0frb3E0:4775:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.xEN0frb3E0:4776:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.xEN0frb3E0:4778:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.xEN0frb3E0:4787:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.xEN0frb3E0:4793:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.xEN0frb3E0:4813:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.xEN0frb3E0:4817:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.xEN0frb3E0:4818:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.xEN0frb3E0:4834:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x17b8): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0x17bc): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0x17c0): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0x17c4): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0x17c8): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:bug64hit
    WARNING: vmlinux.o(.text.unlikely+0x17d0): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:bug64hit
    WARNING: vmlinux.o(.text.unlikely+0x17d8): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:bug64hit
    WARNING: vmlinux.o(.text.unlikely+0x17dc): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:bug64hit

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

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x1e98): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0x1e9c): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0x1ea0): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0x1ea4): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0x1ea8): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:bug64hit
    WARNING: vmlinux.o(.text.unlikely+0x1eb0): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:bug64hit
    WARNING: vmlinux.o(.text.unlikely+0x1eb8): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:bug64hit
    WARNING: vmlinux.o(.text.unlikely+0x1ebc): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:bug64hit

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/mips/fw/arc/memory.c:163:16: warning: unused variable 'addr' [-Wun=
used-variable]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x10e4): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0x10e8): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:bug64hit
    WARNING: vmlinux.o(.text.unlikely+0x10ec): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0x10f4): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:bug64hit

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/mips/fw/arc/memory.c:163:16: warning: unused variable 'addr' [-Wun=
used-variable]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x7c8): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0xf6c): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0xf70): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:bug64hit
    WARNING: vmlinux.o(.text.unlikely+0xf74): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0xf7c): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:bug64hit

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
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0xecc): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0xed0): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:bug64hit
    WARNING: vmlinux.o(.text.unlikely+0xed4): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0xedc): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:bug64hit

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
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, =
0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
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

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0xd48): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0xd4c): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:bug64hit
    WARNING: vmlinux.o(.text.unlikely+0xd50): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0xd58): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:bug64hit

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
msp71xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 4 errors, 2 warnings, 0 sec=
tion mismatches

Errors:
    arch/mips/pmcs-msp71xx/msp_prom.c:64:34: error: 'MAX_PROM_MEM' undeclar=
ed here (not in a function); did you mean 'DEV_PROP_MAX'?
    arch/mips/pmcs-msp71xx/msp_prom.c:380:16: error: unused variable 'addr'=
 [-Werror=3Dunused-variable]
    arch/mips/pmcs-msp71xx/msp_prom.c:65:20: error: 'prom_mem_size' defined=
 but not used [-Werror=3Dunused-variable]
    arch/mips/pmcs-msp71xx/msp_prom.c:64:20: error: 'prom_mem_base' defined=
 but not used [-Werror=3Dunused-variable]

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    cc1: all warnings being treated as errors

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 sec=
tion mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs unknown=
 symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs unknown=
 symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 5 warnings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@5/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko nee=
ds unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@5/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko nee=
ds unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@9/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko nee=
ds unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@9/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko nee=
ds unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 =
warnings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs unknown s=
ymbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs unknown s=
ymbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 30 warn=
ings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    ./.tmp.config.g3FuveBZp6:8160:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.g3FuveBZp6:8163:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.g3FuveBZp6:8164:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.g3FuveBZp6:8166:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.g3FuveBZp6:8167:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.g3FuveBZp6:8171:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.g3FuveBZp6:8172:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.g3FuveBZp6:8230:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.g3FuveBZp6:8251:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.g3FuveBZp6:8276:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.g3FuveBZp6:8280:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.g3FuveBZp6:8388:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.g3FuveBZp6:8399:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.g3FuveBZp6:8409:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.g3FuveBZp6:8416:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.g3FuveBZp6:8419:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.g3FuveBZp6:8420:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.g3FuveBZp6:8422:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.g3FuveBZp6:8423:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.g3FuveBZp6:8424:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.g3FuveBZp6:8426:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.g3FuveBZp6:8435:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.g3FuveBZp6:8441:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.g3FuveBZp6:8461:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.g3FuveBZp6:8465:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.g3FuveBZp6:8466:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.g3FuveBZp6:8482:warning: override: reassigning to symbol =
USER_NS
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko nee=
ds unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko nee=
ds unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_perio=
d' defined but not used [-Wunused-function]

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
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x1188): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0x118c): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:bug64hit
    WARNING: vmlinux.o(.text.unlikely+0x1190): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0x1198): Section mismatch in referenc=
e from the function check_mult_sh() to the variable .init.data:bug64hit

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 29 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.uSrNI8UlUM:1424:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.uSrNI8UlUM:1427:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.uSrNI8UlUM:1428:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.uSrNI8UlUM:1430:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.uSrNI8UlUM:1431:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.uSrNI8UlUM:1435:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.uSrNI8UlUM:1436:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.uSrNI8UlUM:1494:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.uSrNI8UlUM:1515:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.uSrNI8UlUM:1540:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.uSrNI8UlUM:1544:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.uSrNI8UlUM:1652:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.uSrNI8UlUM:1663:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.uSrNI8UlUM:1673:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.uSrNI8UlUM:1680:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.uSrNI8UlUM:1683:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.uSrNI8UlUM:1684:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.uSrNI8UlUM:1686:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.uSrNI8UlUM:1687:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.uSrNI8UlUM:1688:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.uSrNI8UlUM:1690:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.uSrNI8UlUM:1699:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.uSrNI8UlUM:1705:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.uSrNI8UlUM:1725:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.uSrNI8UlUM:1729:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.uSrNI8UlUM:1730:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.uSrNI8UlUM:1746:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    arch/arm/configs/omap2plus_defconfig:487:warning: symbol value 'm' inva=
lid for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/mips/fw/arc/memory.c:163:16: warning: unused variable 'addr' [-Wun=
used-variable]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, =
0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0xdac): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0xdb0): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:bug64hit
    WARNING: vmlinux.o(.text.unlikely+0xdb4): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:r4kwar
    WARNING: vmlinux.o(.text.unlikely+0xdbc): Section mismatch in reference=
 from the function check_mult_sh() to the variable .init.data:bug64hit

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_perio=
d' defined but not used [-Wunused-function]

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
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
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
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 27 war=
nings, 0 section mismatches

Warnings:
    ./.tmp.config.0I5Q9GUKXv:4573:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.0I5Q9GUKXv:4576:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.0I5Q9GUKXv:4577:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.0I5Q9GUKXv:4579:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.0I5Q9GUKXv:4580:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.0I5Q9GUKXv:4584:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.0I5Q9GUKXv:4585:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.0I5Q9GUKXv:4643:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.0I5Q9GUKXv:4664:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.0I5Q9GUKXv:4689:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.0I5Q9GUKXv:4693:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.0I5Q9GUKXv:4801:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.0I5Q9GUKXv:4812:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.0I5Q9GUKXv:4822:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.0I5Q9GUKXv:4829:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.0I5Q9GUKXv:4832:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.0I5Q9GUKXv:4833:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.0I5Q9GUKXv:4835:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.0I5Q9GUKXv:4836:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.0I5Q9GUKXv:4837:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.0I5Q9GUKXv:4839:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.0I5Q9GUKXv:4848:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.0I5Q9GUKXv:4854:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.0I5Q9GUKXv:4874:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.0I5Q9GUKXv:4878:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.0I5Q9GUKXv:4879:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.0I5Q9GUKXv:4895:warning: override: reassigning to symbol =
USER_NS

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
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
