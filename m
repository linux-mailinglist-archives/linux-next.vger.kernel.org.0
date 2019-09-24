Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2449ABD4B5
	for <lists+linux-next@lfdr.de>; Tue, 24 Sep 2019 23:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394454AbfIXV65 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Sep 2019 17:58:57 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37564 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387723AbfIXV65 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Sep 2019 17:58:57 -0400
Received: by mail-wm1-f68.google.com with SMTP id f22so1902464wmc.2
        for <linux-next@vger.kernel.org>; Tue, 24 Sep 2019 14:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XgR3jVDcyVJw9ZpUwUEDAKIn9jVxwRfKp6VlYFrZ1qI=;
        b=HVhT5ziYQ5wWKWXUZGiY5fht3d01yDiiVOeDz6P/zy7NuyDtDZ5p6pgjAUzPbirLQ/
         5MqOHsUe7qu7+sEWqsRBR3ojPEUwSbQcVDj+gnpaqDWYUSbT4pk9Q8hEN/NU+CsMZgvm
         P/maBrw+rY411O2gpffj5pTeJBcNxmFdZ7k0bW14wFdAkRKgLCwgzGW+aNEASYNYrXy2
         kbVruMQI2xjB7atrK0ZFteCfQSxecNPZ7F+Xqs+b0cqoOBRqWOSrhidY011gm2NhwaNh
         +J+9fNMfLGsJaEXuBKbqu8S8ZhPMS/cCoqvNb244KagjwskoXWebWC3xhLYzBWmIhAbo
         xE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XgR3jVDcyVJw9ZpUwUEDAKIn9jVxwRfKp6VlYFrZ1qI=;
        b=AJ0NTXi/Z0dlqTX7bXuSEsvd28aUa2Gsnx55oIR0r+HiadjxF4F5aegeyGvlohFuc3
         hyDvrjiRwzEa3D5ORDtsNmtMshUtNBDIWCkYEHQAzb2GQzD/R4d3yEu99lQ9yJRJUOKA
         2tvbbYk5/yfhulb4eItcbzRv7+pGEbA50mF4FGBPFziH4ho4ILlpVxB8oJbGLnHYSFMC
         MsaNU/fM85ZV/JaovvGR3FGmGYXGkBdyJlfj6a5WHDGc0bia9e13I/raaZxRaTCN4Mk9
         Sv0m87bguOx4hP2z2/L659Qi1dFskK6TUHQBviAO3XB7PMgMIm64zRR6nT8zkA0/suwS
         qEwg==
X-Gm-Message-State: APjAAAXCUAz4xo9fiA7/nF9RBWGpsx6/FU5gpiry8P88PgHWTTMUP5Rk
        ndGKF5+dz4/DjM8q2dddIX77bNmrD9vVDg==
X-Google-Smtp-Source: APXvYqzpz54lPWZthUuXZJQHBQjfPn+hHcERD00nzUkSZ8lilBWSw/zttosTsNxyWN7yPPntNzj0pg==
X-Received: by 2002:a1c:1f08:: with SMTP id f8mr2918273wmf.46.1569362325174;
        Tue, 24 Sep 2019 14:58:45 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l1sm3014903wrb.1.2019.09.24.14.58.44
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 14:58:44 -0700 (PDT)
Message-ID: <5d8a9194.1c69fb81.e7064.e64a@mx.google.com>
Date:   Tue, 24 Sep 2019 14:58:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-12188-gc7e0ace95443
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 214 builds: 2 failed, 212 passed, 6 errors,
 728 warnings (v5.3-12188-gc7e0ace95443)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 214 builds: 2 failed, 212 passed, 6 errors, 728 w=
arnings (v5.3-12188-gc7e0ace95443)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-12188-gc7e0ace95443/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-12188-gc7e0ace95443
Git Commit: c7e0ace95443cafd98356ecc472f639d16fb82d8
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
    cavium_octeon_defconfig (gcc-8): 2 errors, 4 warnings
    ci20_defconfig (gcc-8): 2 warnings
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
    qi_lb60_defconfig (gcc-8): 3 warnings
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

    1    arch/mips/pmcs-msp71xx/msp_prom.c:65:20: error: 'prom_mem_size' de=
fined but not used [-Werror=3Dunused-variable]
    1    arch/mips/pmcs-msp71xx/msp_prom.c:64:34: error: 'MAX_PROM_MEM' und=
eclared here (not in a function); did you mean 'DEV_PROP_MAX'?
    1    arch/mips/pmcs-msp71xx/msp_prom.c:64:20: error: 'prom_mem_base' de=
fined but not used [-Werror=3Dunused-variable]
    1    arch/mips/pmcs-msp71xx/msp_prom.c:380:16: error: unused variable '=
addr' [-Werror=3Dunused-variable]
    1    arch/mips/include/asm/octeon/cvmx-ipd.h:331:36: error: 'CVMX_PIP_S=
FT_RST' undeclared (first use in this function); did you mean 'CVMX_CIU_SOF=
T_RST'?
    1    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: error: storage siz=
e of 'pip_sft_rst' isn't known

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
    3    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@8/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.k=
o needs unknown symbol usb_stor_sense_invalidCDB
    3    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@8/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.k=
o needs unknown symbol usb_stor_adjust_quirks
    3    arch/mips/fw/arc/memory.c:163:16: warning: unused variable 'addr' =
[-Wunused-variable]
    2    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret=
' [-Wunused-variable]
    2    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs unkn=
own symbol usb_stor_sense_invalidCDB
    2    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs unkn=
own symbol usb_stor_adjust_quirks
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mism=
atch in conditional expression
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko need=
s unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko need=
s unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko need=
s unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko need=
s unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko need=
s unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko need=
s unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko need=
s unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko need=
s unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko need=
s unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko need=
s unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko need=
s unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko need=
s unknown symbol usb_stor_clear_halt
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko need=
s unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko need=
s unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko need=
s unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko need=
s unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko nee=
ds unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko nee=
ds unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko nee=
ds unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko nee=
ds unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko nee=
ds unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko nee=
ds unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko nee=
ds unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko nee=
ds unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko nee=
ds unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko nee=
ds unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko nee=
ds unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko nee=
ds unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko nee=
ds unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_CB_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko nee=
ds unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko ne=
eds unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko ne=
eds unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko ne=
eds unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko ne=
eds unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko ne=
eds unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko ne=
eds unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko ne=
eds unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko ne=
eds unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko ne=
eds unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko n=
eeds unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko n=
eeds unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko n=
eeds unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko n=
eeds unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko n=
eeds unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko n=
eeds unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko n=
eeds unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko n=
eeds unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko n=
eeds unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko need=
s unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko need=
s unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko need=
s unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko need=
s unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko need=
s unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko need=
s unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko need=
s unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko need=
s unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko need=
s unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko need=
s unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko need=
s unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko need=
s unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko n=
eeds unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko n=
eeds unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko n=
eeds unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko n=
eeds unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko n=
eeds unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko n=
eeds unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko n=
eeds unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko n=
eeds unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko n=
eeds unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko n=
eeds unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko n=
eeds unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko n=
eeds unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko n=
eeds unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko n=
eeds unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko n=
eeds unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko nee=
ds unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko nee=
ds unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko nee=
ds unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko nee=
ds unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko nee=
ds unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko nee=
ds unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko nee=
ds unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko nee=
ds unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko nee=
ds unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko nee=
ds unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko nee=
ds unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko nee=
ds unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko nee=
ds unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko ne=
eds unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko ne=
eds unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko ne=
eds unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko ne=
eds unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko ne=
eds unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko ne=
eds unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko ne=
eds unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko ne=
eds unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko ne=
eds unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko ne=
eds unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko ne=
eds unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko ne=
eds unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko =
needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko =
needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko =
needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko =
needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko =
needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko =
needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko =
needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko =
needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko =
needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko =
needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko =
needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko =
needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko =
needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko ne=
eds unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko ne=
eds unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko ne=
eds unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko ne=
eds unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko ne=
eds unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko ne=
eds unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko ne=
eds unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko ne=
eds unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko ne=
eds unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko ne=
eds unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko ne=
eds unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko ne=
eds unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko ne=
eds unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko ne=
eds unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko ne=
eds unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko ne=
eds unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko ne=
eds unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko ne=
eds unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko ne=
eds unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko ne=
eds unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko ne=
eds unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko ne=
eds unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko ne=
eds unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko ne=
eds unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko ne=
eds unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko nee=
ds unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko nee=
ds unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko nee=
ds unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko nee=
ds unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko nee=
ds unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko nee=
ds unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko nee=
ds unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko nee=
ds unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko nee=
ds unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko nee=
ds unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko nee=
ds unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko nee=
ds unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko nee=
ds unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko nee=
ds unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko nee=
ds unknown symbol fill_inquiry_response
    1    cc1: all warnings being treated as errors
    1    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: warning: unused va=
riable 'pip_sft_rst' [-Wunused-variable]
    1    arch/arm/configs/omap2plus_defconfig:487:warning: symbol value 'm'=
 invalid for REMOTEPROC
    1    arch/arm/configs/davinci_all_defconfig:231:warning: symbol value '=
m' invalid for REMOTEPROC
    1    .config:1170:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.zMbU5ZENI7:8479:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.zMbU5ZENI7:8463:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.zMbU5ZENI7:8462:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.zMbU5ZENI7:8458:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.zMbU5ZENI7:8438:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.zMbU5ZENI7:8432:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.zMbU5ZENI7:8423:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.zMbU5ZENI7:8421:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.zMbU5ZENI7:8420:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.zMbU5ZENI7:8419:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.zMbU5ZENI7:8417:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.zMbU5ZENI7:8416:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.zMbU5ZENI7:8413:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.zMbU5ZENI7:8406:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.zMbU5ZENI7:8396:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.zMbU5ZENI7:8385:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.zMbU5ZENI7:8279:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.zMbU5ZENI7:8275:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.zMbU5ZENI7:8250:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.zMbU5ZENI7:8229:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.zMbU5ZENI7:8171:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.zMbU5ZENI7:8170:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.zMbU5ZENI7:8166:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.zMbU5ZENI7:8165:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.zMbU5ZENI7:8163:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.zMbU5ZENI7:8162:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.zMbU5ZENI7:8159:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.wlwdE5qzsF:3979:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.wlwdE5qzsF:3963:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.wlwdE5qzsF:3962:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.wlwdE5qzsF:3958:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.wlwdE5qzsF:3938:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.wlwdE5qzsF:3932:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.wlwdE5qzsF:3923:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.wlwdE5qzsF:3921:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.wlwdE5qzsF:3920:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.wlwdE5qzsF:3919:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.wlwdE5qzsF:3917:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.wlwdE5qzsF:3916:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.wlwdE5qzsF:3913:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.wlwdE5qzsF:3906:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.wlwdE5qzsF:3896:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.wlwdE5qzsF:3885:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.wlwdE5qzsF:3779:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.wlwdE5qzsF:3775:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.wlwdE5qzsF:3750:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.wlwdE5qzsF:3729:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.wlwdE5qzsF:3671:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.wlwdE5qzsF:3670:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.wlwdE5qzsF:3666:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.wlwdE5qzsF:3665:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.wlwdE5qzsF:3663:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.wlwdE5qzsF:3662:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.wlwdE5qzsF:3659:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.pzud0hPFDD:4832:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.pzud0hPFDD:4816:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.pzud0hPFDD:4815:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.pzud0hPFDD:4811:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.pzud0hPFDD:4791:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.pzud0hPFDD:4785:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.pzud0hPFDD:4776:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.pzud0hPFDD:4774:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.pzud0hPFDD:4773:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.pzud0hPFDD:4772:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.pzud0hPFDD:4770:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.pzud0hPFDD:4769:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.pzud0hPFDD:4766:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.pzud0hPFDD:4759:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.pzud0hPFDD:4749:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.pzud0hPFDD:4738:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.pzud0hPFDD:4632:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.pzud0hPFDD:4628:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.pzud0hPFDD:4603:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.pzud0hPFDD:4582:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.pzud0hPFDD:4524:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.pzud0hPFDD:4523:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.pzud0hPFDD:4519:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.pzud0hPFDD:4518:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.pzud0hPFDD:4516:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.pzud0hPFDD:4515:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.pzud0hPFDD:4512:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.jqU8tv7A3Q:1745:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.jqU8tv7A3Q:1729:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.jqU8tv7A3Q:1728:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.jqU8tv7A3Q:1724:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.jqU8tv7A3Q:1704:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.jqU8tv7A3Q:1698:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.jqU8tv7A3Q:1689:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.jqU8tv7A3Q:1687:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.jqU8tv7A3Q:1686:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.jqU8tv7A3Q:1685:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.jqU8tv7A3Q:1683:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.jqU8tv7A3Q:1682:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.jqU8tv7A3Q:1679:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.jqU8tv7A3Q:1672:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.jqU8tv7A3Q:1662:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.jqU8tv7A3Q:1651:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.jqU8tv7A3Q:1545:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.jqU8tv7A3Q:1541:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.jqU8tv7A3Q:1516:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.jqU8tv7A3Q:1495:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.jqU8tv7A3Q:1437:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.jqU8tv7A3Q:1436:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.jqU8tv7A3Q:1432:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.jqU8tv7A3Q:1431:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.jqU8tv7A3Q:1429:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.jqU8tv7A3Q:1428:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.jqU8tv7A3Q:1425:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.PCKS8nWUBc:3366:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.PCKS8nWUBc:3350:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.PCKS8nWUBc:3349:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.PCKS8nWUBc:3345:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.PCKS8nWUBc:3325:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.PCKS8nWUBc:3319:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.PCKS8nWUBc:3310:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.PCKS8nWUBc:3308:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.PCKS8nWUBc:3307:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.PCKS8nWUBc:3306:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.PCKS8nWUBc:3304:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.PCKS8nWUBc:3303:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.PCKS8nWUBc:3300:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.PCKS8nWUBc:3293:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.PCKS8nWUBc:3283:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.PCKS8nWUBc:3272:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.PCKS8nWUBc:3166:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.PCKS8nWUBc:3162:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.PCKS8nWUBc:3137:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.PCKS8nWUBc:3116:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.PCKS8nWUBc:3058:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.PCKS8nWUBc:3057:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.PCKS8nWUBc:3053:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.PCKS8nWUBc:3052:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.PCKS8nWUBc:3050:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.PCKS8nWUBc:3049:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.PCKS8nWUBc:3046:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.OjrwiNooA7:7916:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.OjrwiNooA7:7900:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.OjrwiNooA7:7899:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.OjrwiNooA7:7895:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.OjrwiNooA7:7875:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.OjrwiNooA7:7869:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.OjrwiNooA7:7860:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.OjrwiNooA7:7858:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.OjrwiNooA7:7857:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.OjrwiNooA7:7856:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.OjrwiNooA7:7854:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.OjrwiNooA7:7853:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.OjrwiNooA7:7850:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.OjrwiNooA7:7843:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.OjrwiNooA7:7833:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.OjrwiNooA7:7822:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.OjrwiNooA7:7716:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.OjrwiNooA7:7712:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.OjrwiNooA7:7687:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.OjrwiNooA7:7666:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.OjrwiNooA7:7608:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.OjrwiNooA7:7607:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.OjrwiNooA7:7603:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.OjrwiNooA7:7602:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.OjrwiNooA7:7600:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.OjrwiNooA7:7599:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.OjrwiNooA7:7596:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.0xlPgtbpCk:4893:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0xlPgtbpCk:4877:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.0xlPgtbpCk:4876:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.0xlPgtbpCk:4872:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.0xlPgtbpCk:4852:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.0xlPgtbpCk:4846:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.0xlPgtbpCk:4837:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.0xlPgtbpCk:4835:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.0xlPgtbpCk:4834:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.0xlPgtbpCk:4833:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.0xlPgtbpCk:4831:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.0xlPgtbpCk:4830:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.0xlPgtbpCk:4827:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.0xlPgtbpCk:4820:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.0xlPgtbpCk:4810:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.0xlPgtbpCk:4799:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0xlPgtbpCk:4693:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.0xlPgtbpCk:4689:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.0xlPgtbpCk:4664:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.0xlPgtbpCk:4643:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.0xlPgtbpCk:4585:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.0xlPgtbpCk:4584:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.0xlPgtbpCk:4580:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.0xlPgtbpCk:4579:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.0xlPgtbpCk:4577:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.0xlPgtbpCk:4576:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.0xlPgtbpCk:4573:warning: override: reassigning to sy=
mbol BPF_SYSCALL

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
    ./.tmp.config.wlwdE5qzsF:3659:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.wlwdE5qzsF:3662:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.wlwdE5qzsF:3663:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.wlwdE5qzsF:3665:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.wlwdE5qzsF:3666:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.wlwdE5qzsF:3670:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.wlwdE5qzsF:3671:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.wlwdE5qzsF:3729:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.wlwdE5qzsF:3750:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.wlwdE5qzsF:3775:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.wlwdE5qzsF:3779:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.wlwdE5qzsF:3885:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.wlwdE5qzsF:3896:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.wlwdE5qzsF:3906:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.wlwdE5qzsF:3913:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.wlwdE5qzsF:3916:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.wlwdE5qzsF:3917:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.wlwdE5qzsF:3919:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.wlwdE5qzsF:3920:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.wlwdE5qzsF:3921:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.wlwdE5qzsF:3923:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.wlwdE5qzsF:3932:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.wlwdE5qzsF:3938:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.wlwdE5qzsF:3958:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.wlwdE5qzsF:3962:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.wlwdE5qzsF:3963:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.wlwdE5qzsF:3979:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret' [-W=
unused-variable]

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

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
    ./.tmp.config.PCKS8nWUBc:3046:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.PCKS8nWUBc:3049:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.PCKS8nWUBc:3050:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.PCKS8nWUBc:3052:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.PCKS8nWUBc:3053:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.PCKS8nWUBc:3057:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.PCKS8nWUBc:3058:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.PCKS8nWUBc:3116:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.PCKS8nWUBc:3137:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.PCKS8nWUBc:3162:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.PCKS8nWUBc:3166:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.PCKS8nWUBc:3272:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.PCKS8nWUBc:3283:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.PCKS8nWUBc:3293:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.PCKS8nWUBc:3300:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.PCKS8nWUBc:3303:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.PCKS8nWUBc:3304:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.PCKS8nWUBc:3306:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.PCKS8nWUBc:3307:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.PCKS8nWUBc:3308:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.PCKS8nWUBc:3310:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.PCKS8nWUBc:3319:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.PCKS8nWUBc:3325:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.PCKS8nWUBc:3345:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.PCKS8nWUBc:3349:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.PCKS8nWUBc:3350:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.PCKS8nWUBc:3366:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 30 warnings, 0=
 section mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    ./.tmp.config.OjrwiNooA7:7596:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.OjrwiNooA7:7599:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.OjrwiNooA7:7600:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.OjrwiNooA7:7602:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.OjrwiNooA7:7603:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.OjrwiNooA7:7607:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.OjrwiNooA7:7608:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.OjrwiNooA7:7666:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.OjrwiNooA7:7687:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.OjrwiNooA7:7712:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.OjrwiNooA7:7716:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.OjrwiNooA7:7822:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.OjrwiNooA7:7833:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.OjrwiNooA7:7843:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.OjrwiNooA7:7850:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.OjrwiNooA7:7853:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.OjrwiNooA7:7854:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.OjrwiNooA7:7856:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.OjrwiNooA7:7857:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.OjrwiNooA7:7858:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.OjrwiNooA7:7860:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.OjrwiNooA7:7869:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.OjrwiNooA7:7875:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.OjrwiNooA7:7895:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.OjrwiNooA7:7899:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.OjrwiNooA7:7900:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.OjrwiNooA7:7916:warning: override: reassigning to symbol =
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
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko needs un=
known symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko needs un=
known symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko needs un=
known symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko needs un=
known symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko needs un=
known symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko needs un=
known symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko needs un=
known symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko needs un=
known symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko needs un=
known symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko needs un=
known symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko needs un=
known symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko needs un=
known symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko needs un=
known symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko needs un=
known symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-alauda.ko needs un=
known symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko needs u=
nknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko needs u=
nknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko needs u=
nknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko needs u=
nknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko needs u=
nknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko needs u=
nknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko needs u=
nknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko needs u=
nknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko needs u=
nknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko needs u=
nknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-cypress.ko needs u=
nknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko needs u=
nknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko needs u=
nknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko needs u=
nknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko needs u=
nknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko needs u=
nknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko needs u=
nknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko needs u=
nknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko needs u=
nknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko needs u=
nknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko needs u=
nknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko needs u=
nknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko needs u=
nknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko needs u=
nknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-datafab.ko needs u=
nknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko needs=
 unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko needs=
 unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko needs=
 unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko needs=
 unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko needs=
 unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko needs=
 unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko needs=
 unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko needs=
 unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko needs=
 unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko needs=
 unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko needs=
 unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko needs=
 unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-eneub6250.ko needs=
 unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko needs u=
nknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko needs u=
nknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko needs u=
nknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko needs u=
nknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko needs u=
nknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko needs u=
nknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko needs u=
nknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko needs u=
nknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko needs u=
nknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko needs u=
nknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko needs u=
nknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-freecom.ko needs u=
nknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko needs un=
known symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko needs un=
known symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko needs un=
known symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko needs un=
known symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko needs un=
known symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko needs un=
known symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko needs un=
known symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko needs un=
known symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko needs un=
known symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko needs un=
known symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko needs un=
known symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko needs un=
known symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-isd200.ko needs un=
known symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko needs =
unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko needs =
unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko needs =
unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko needs =
unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko needs =
unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko needs =
unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko needs =
unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko needs =
unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko needs =
unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko needs =
unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko needs =
unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko needs =
unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko needs =
unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko needs =
unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-jumpshot.ko needs =
unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko needs unk=
nown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko needs unk=
nown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko needs unk=
nown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko needs unk=
nown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko needs unk=
nown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko needs unk=
nown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko needs unk=
nown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko needs unk=
nown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko needs unk=
nown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko needs unk=
nown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko needs unk=
nown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-karma.ko needs unk=
nown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko needs =
unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko needs =
unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko needs =
unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko needs =
unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko needs =
unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko needs =
unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko needs =
unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko needs =
unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-onetouch.ko needs =
unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko needs u=
nknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko needs u=
nknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko needs u=
nknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko needs u=
nknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko needs u=
nknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko needs u=
nknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko needs u=
nknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko needs u=
nknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-realtek.ko needs u=
nknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_CB_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr09.ko needs un=
known symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko needs un=
known symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko needs un=
known symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko needs un=
known symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko needs un=
known symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko needs un=
known symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko needs un=
known symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko needs un=
known symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko needs un=
known symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko needs un=
known symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko needs un=
known symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko needs un=
known symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko needs un=
known symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-sddr55.ko needs un=
known symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko needs unk=
nown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko needs unk=
nown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko needs unk=
nown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko needs unk=
nown symbol usb_stor_clear_halt
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko needs unk=
nown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko needs unk=
nown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko needs unk=
nown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko needs unk=
nown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko needs unk=
nown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko needs unk=
nown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko needs unk=
nown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko needs unk=
nown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko needs unk=
nown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko needs unk=
nown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko needs unk=
nown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/ums-usbat.ko needs unk=
nown symbol usb_stor_set_xfer_buf

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
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 27 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.pzud0hPFDD:4512:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.pzud0hPFDD:4515:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.pzud0hPFDD:4516:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.pzud0hPFDD:4518:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.pzud0hPFDD:4519:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.pzud0hPFDD:4523:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.pzud0hPFDD:4524:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.pzud0hPFDD:4582:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.pzud0hPFDD:4603:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.pzud0hPFDD:4628:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.pzud0hPFDD:4632:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.pzud0hPFDD:4738:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.pzud0hPFDD:4749:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.pzud0hPFDD:4759:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.pzud0hPFDD:4766:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.pzud0hPFDD:4769:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.pzud0hPFDD:4770:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.pzud0hPFDD:4772:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.pzud0hPFDD:4773:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.pzud0hPFDD:4774:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.pzud0hPFDD:4776:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.pzud0hPFDD:4785:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.pzud0hPFDD:4791:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.pzud0hPFDD:4811:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.pzud0hPFDD:4815:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.pzud0hPFDD:4816:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.pzud0hPFDD:4832:warning: override: reassigning to symbol =
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
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@8/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko nee=
ds unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@8/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko nee=
ds unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 5 warnings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@8/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko nee=
ds unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@8/li=
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
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@8/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko nee=
ds unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@8/li=
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
    ./.tmp.config.zMbU5ZENI7:8159:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.zMbU5ZENI7:8162:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.zMbU5ZENI7:8163:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.zMbU5ZENI7:8165:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.zMbU5ZENI7:8166:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.zMbU5ZENI7:8170:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.zMbU5ZENI7:8171:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.zMbU5ZENI7:8229:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.zMbU5ZENI7:8250:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.zMbU5ZENI7:8275:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.zMbU5ZENI7:8279:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.zMbU5ZENI7:8385:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.zMbU5ZENI7:8396:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.zMbU5ZENI7:8406:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.zMbU5ZENI7:8413:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.zMbU5ZENI7:8416:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.zMbU5ZENI7:8417:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.zMbU5ZENI7:8419:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.zMbU5ZENI7:8420:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.zMbU5ZENI7:8421:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.zMbU5ZENI7:8423:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.zMbU5ZENI7:8432:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.zMbU5ZENI7:8438:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.zMbU5ZENI7:8458:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.zMbU5ZENI7:8462:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.zMbU5ZENI7:8463:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.zMbU5ZENI7:8479:warning: override: reassigning to symbol =
USER_NS
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs unknown s=
ymbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs unknown s=
ymbol usb_stor_adjust_quirks

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
    ./.tmp.config.jqU8tv7A3Q:1425:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.jqU8tv7A3Q:1428:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.jqU8tv7A3Q:1429:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.jqU8tv7A3Q:1431:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.jqU8tv7A3Q:1432:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.jqU8tv7A3Q:1436:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.jqU8tv7A3Q:1437:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.jqU8tv7A3Q:1495:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.jqU8tv7A3Q:1516:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.jqU8tv7A3Q:1541:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.jqU8tv7A3Q:1545:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.jqU8tv7A3Q:1651:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.jqU8tv7A3Q:1662:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.jqU8tv7A3Q:1672:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.jqU8tv7A3Q:1679:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.jqU8tv7A3Q:1682:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.jqU8tv7A3Q:1683:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.jqU8tv7A3Q:1685:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.jqU8tv7A3Q:1686:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.jqU8tv7A3Q:1687:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.jqU8tv7A3Q:1689:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.jqU8tv7A3Q:1698:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.jqU8tv7A3Q:1704:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.jqU8tv7A3Q:1724:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.jqU8tv7A3Q:1728:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.jqU8tv7A3Q:1729:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.jqU8tv7A3Q:1745:warning: override: reassigning to symbol =
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
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret' [-W=
unused-variable]
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

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_perio=
d' defined but not used [-Wunused-function]

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
    .config:1170:warning: override: UNWINDER_GUESS changes choice state

---------------------------------------------------------------------------=
-----
tinyconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mis=
matches

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

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
    ./.tmp.config.0xlPgtbpCk:4573:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.0xlPgtbpCk:4576:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.0xlPgtbpCk:4577:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.0xlPgtbpCk:4579:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.0xlPgtbpCk:4580:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.0xlPgtbpCk:4584:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.0xlPgtbpCk:4585:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.0xlPgtbpCk:4643:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.0xlPgtbpCk:4664:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.0xlPgtbpCk:4689:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.0xlPgtbpCk:4693:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.0xlPgtbpCk:4799:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.0xlPgtbpCk:4810:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.0xlPgtbpCk:4820:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.0xlPgtbpCk:4827:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.0xlPgtbpCk:4830:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.0xlPgtbpCk:4831:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.0xlPgtbpCk:4833:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.0xlPgtbpCk:4834:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.0xlPgtbpCk:4835:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.0xlPgtbpCk:4837:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.0xlPgtbpCk:4846:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.0xlPgtbpCk:4852:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.0xlPgtbpCk:4872:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.0xlPgtbpCk:4876:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.0xlPgtbpCk:4877:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.0xlPgtbpCk:4893:warning: override: reassigning to symbol =
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
