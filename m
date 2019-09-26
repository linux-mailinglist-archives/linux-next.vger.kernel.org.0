Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 128ADBFA62
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2019 22:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbfIZUFh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Sep 2019 16:05:37 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40715 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727828AbfIZUFh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Sep 2019 16:05:37 -0400
Received: by mail-wr1-f68.google.com with SMTP id l3so179233wru.7
        for <linux-next@vger.kernel.org>; Thu, 26 Sep 2019 13:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4Fg5OtNxkPH9aehfNu0N61sRKlb1nhFO6gU2zE6Z7XI=;
        b=J4XLE2jKo7M9rPpGRO+Pp8qydXMDWmQDf3fLxoqgb94qHgoPgHUNxAtkjqi5fGQ4+l
         KI/rZF2te0OFblPkMAiFs24y1fKC4YdCVeeyyWjqdwqEXk5VIr54LadY4mJl69FP4sKI
         G7UfkglEYdjTxhX2UzjfswSiOK8DIJPlF5Kczv5goR4lgD9IXIdA5ztR+BjZVqqP2Ffl
         q+P4HFlYOU3KZxrBll/egGwD/uJ58v0yAWT5UHLC5zU+PIpJ0NqXAqU+GP3NpP/7CL97
         TpN6W1QHjP6QDSNYdv3EytdbV6QFryyt7C7hTZr9AYWyjzSbmbceZZ/3rxBf8h+1HVR/
         iO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4Fg5OtNxkPH9aehfNu0N61sRKlb1nhFO6gU2zE6Z7XI=;
        b=ev3i3P2AOS9lfaHKBb7TCvhIGTsJVoT+5j8UbaCAZrfJk2Rf3djpU3iNU/MfSDnfGO
         1DWCVqeVyImaUxcUjF3QFi7YXztKBtL3aDJom845fPRcmc8f1NdVwOi5p95054vs6U8+
         nz+IdzwmjDlQtWOYcNl35hC2IZdYp+ec7e3EweAUBmUFgVyhH0UvSA2tE+/insZwkjv6
         twSZrMjhhzY/WzUS5zoBbkx1EbIWQ4iu+5EFFUVPB4qAd8rV1rqCjqDSGovrQpSjRsAM
         0zkUaLxFnOv7xgiR2Ohr5NYQZXTgPpD8ugyNDV3vsyS2jhuIWhwR2ixirtqgsrBBkA/p
         oPRg==
X-Gm-Message-State: APjAAAVM7WPLV0Y9esFfHMqa2Zn7s9Sv+VTbq2+mNvgMnGVo0+ZMWDZ4
        FHzBPYljMgeXLQpf+9tTAtQkQrM+QKiFYw==
X-Google-Smtp-Source: APXvYqxgXBX3LWBP0WhmiYM3qCuQt/X7Ya4CYHAkZ712EzoqjUjX2oL5GsQVHBi8mODUbx32dbIlXA==
X-Received: by 2002:adf:e392:: with SMTP id e18mr146135wrm.87.1569528325624;
        Thu, 26 Sep 2019 13:05:25 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id i1sm7607250wmb.19.2019.09.26.13.05.24
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 13:05:24 -0700 (PDT)
Message-ID: <5d8d1a04.1c69fb81.e7eb7.1f77@mx.google.com>
Date:   Thu, 26 Sep 2019 13:05:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-12689-gd20eeb14322b
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 214 builds: 2 failed, 212 passed, 6 errors,
 728 warnings (v5.3-12689-gd20eeb14322b)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 214 builds: 2 failed, 212 passed, 6 errors, 728 w=
arnings (v5.3-12689-gd20eeb14322b)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-12689-gd20eeb14322b/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-12689-gd20eeb14322b
Git Commit: d20eeb14322b02c728ce7fe77d41be77a3a37494
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
    3    arch/mips/fw/arc/memory.c:163:16: warning: unused variable 'addr' =
[-Wunused-variable]
    2    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret=
' [-Wunused-variable]
    2    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs un=
known symbol usb_stor_sense_invalidCDB
    2    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs un=
known symbol usb_stor_adjust_quirks
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mism=
atch in conditional expression
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@7/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.k=
o needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@7/linux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.k=
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
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs unkn=
own symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs unkn=
own symbol usb_stor_adjust_quirks
    1    cc1: all warnings being treated as errors
    1    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: warning: unused va=
riable 'pip_sft_rst' [-Wunused-variable]
    1    arch/arm/configs/omap2plus_defconfig:487:warning: symbol value 'm'=
 invalid for REMOTEPROC
    1    arch/arm/configs/davinci_all_defconfig:231:warning: symbol value '=
m' invalid for REMOTEPROC
    1    .config:1170:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.wzy9lZcbAh:4832:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.wzy9lZcbAh:4816:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.wzy9lZcbAh:4815:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.wzy9lZcbAh:4811:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.wzy9lZcbAh:4791:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.wzy9lZcbAh:4785:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.wzy9lZcbAh:4776:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.wzy9lZcbAh:4774:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.wzy9lZcbAh:4773:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.wzy9lZcbAh:4772:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.wzy9lZcbAh:4770:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.wzy9lZcbAh:4769:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.wzy9lZcbAh:4766:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.wzy9lZcbAh:4759:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.wzy9lZcbAh:4749:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.wzy9lZcbAh:4738:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.wzy9lZcbAh:4632:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.wzy9lZcbAh:4628:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.wzy9lZcbAh:4603:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.wzy9lZcbAh:4582:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.wzy9lZcbAh:4524:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.wzy9lZcbAh:4523:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.wzy9lZcbAh:4519:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.wzy9lZcbAh:4518:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.wzy9lZcbAh:4516:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.wzy9lZcbAh:4515:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.wzy9lZcbAh:4512:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.fU7ZjIrvSd:4893:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.fU7ZjIrvSd:4877:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.fU7ZjIrvSd:4876:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.fU7ZjIrvSd:4872:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.fU7ZjIrvSd:4852:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.fU7ZjIrvSd:4846:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.fU7ZjIrvSd:4837:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.fU7ZjIrvSd:4835:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.fU7ZjIrvSd:4834:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.fU7ZjIrvSd:4833:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.fU7ZjIrvSd:4831:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.fU7ZjIrvSd:4830:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.fU7ZjIrvSd:4827:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.fU7ZjIrvSd:4820:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.fU7ZjIrvSd:4810:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.fU7ZjIrvSd:4799:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.fU7ZjIrvSd:4693:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.fU7ZjIrvSd:4689:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.fU7ZjIrvSd:4664:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.fU7ZjIrvSd:4643:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.fU7ZjIrvSd:4585:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.fU7ZjIrvSd:4584:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.fU7ZjIrvSd:4580:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.fU7ZjIrvSd:4579:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.fU7ZjIrvSd:4577:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.fU7ZjIrvSd:4576:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.fU7ZjIrvSd:4573:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.dJ31MtyPu6:8480:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.dJ31MtyPu6:8464:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.dJ31MtyPu6:8463:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.dJ31MtyPu6:8459:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.dJ31MtyPu6:8439:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.dJ31MtyPu6:8433:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.dJ31MtyPu6:8424:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.dJ31MtyPu6:8422:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.dJ31MtyPu6:8421:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.dJ31MtyPu6:8420:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.dJ31MtyPu6:8418:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.dJ31MtyPu6:8417:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.dJ31MtyPu6:8414:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.dJ31MtyPu6:8407:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.dJ31MtyPu6:8397:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.dJ31MtyPu6:8386:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.dJ31MtyPu6:8280:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.dJ31MtyPu6:8276:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.dJ31MtyPu6:8251:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.dJ31MtyPu6:8230:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.dJ31MtyPu6:8172:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.dJ31MtyPu6:8171:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.dJ31MtyPu6:8167:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.dJ31MtyPu6:8166:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.dJ31MtyPu6:8164:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.dJ31MtyPu6:8163:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.dJ31MtyPu6:8160:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.L2Mrv2fHOq:3372:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.L2Mrv2fHOq:3356:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.L2Mrv2fHOq:3355:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.L2Mrv2fHOq:3351:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.L2Mrv2fHOq:3331:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.L2Mrv2fHOq:3325:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.L2Mrv2fHOq:3316:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.L2Mrv2fHOq:3314:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.L2Mrv2fHOq:3313:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.L2Mrv2fHOq:3312:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.L2Mrv2fHOq:3310:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.L2Mrv2fHOq:3309:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.L2Mrv2fHOq:3306:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.L2Mrv2fHOq:3299:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.L2Mrv2fHOq:3289:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.L2Mrv2fHOq:3278:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.L2Mrv2fHOq:3172:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.L2Mrv2fHOq:3168:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.L2Mrv2fHOq:3143:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.L2Mrv2fHOq:3122:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.L2Mrv2fHOq:3064:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.L2Mrv2fHOq:3063:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.L2Mrv2fHOq:3059:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.L2Mrv2fHOq:3058:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.L2Mrv2fHOq:3056:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.L2Mrv2fHOq:3055:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.L2Mrv2fHOq:3052:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.8xLMwiiGDZ:7918:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.8xLMwiiGDZ:7902:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.8xLMwiiGDZ:7901:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.8xLMwiiGDZ:7897:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.8xLMwiiGDZ:7877:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.8xLMwiiGDZ:7871:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.8xLMwiiGDZ:7862:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.8xLMwiiGDZ:7860:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.8xLMwiiGDZ:7859:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.8xLMwiiGDZ:7858:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.8xLMwiiGDZ:7856:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.8xLMwiiGDZ:7855:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.8xLMwiiGDZ:7852:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.8xLMwiiGDZ:7845:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.8xLMwiiGDZ:7835:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.8xLMwiiGDZ:7824:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.8xLMwiiGDZ:7718:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.8xLMwiiGDZ:7714:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.8xLMwiiGDZ:7689:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.8xLMwiiGDZ:7668:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.8xLMwiiGDZ:7610:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.8xLMwiiGDZ:7609:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.8xLMwiiGDZ:7605:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.8xLMwiiGDZ:7604:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.8xLMwiiGDZ:7602:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.8xLMwiiGDZ:7601:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.8xLMwiiGDZ:7598:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.7rI9rFMWio:3980:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7rI9rFMWio:3964:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.7rI9rFMWio:3963:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.7rI9rFMWio:3959:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.7rI9rFMWio:3939:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.7rI9rFMWio:3933:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.7rI9rFMWio:3924:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.7rI9rFMWio:3922:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.7rI9rFMWio:3921:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.7rI9rFMWio:3920:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.7rI9rFMWio:3918:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.7rI9rFMWio:3917:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.7rI9rFMWio:3914:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.7rI9rFMWio:3907:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.7rI9rFMWio:3897:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.7rI9rFMWio:3886:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7rI9rFMWio:3780:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.7rI9rFMWio:3776:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7rI9rFMWio:3751:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.7rI9rFMWio:3730:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.7rI9rFMWio:3672:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.7rI9rFMWio:3671:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.7rI9rFMWio:3667:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.7rI9rFMWio:3666:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.7rI9rFMWio:3664:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.7rI9rFMWio:3663:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.7rI9rFMWio:3660:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.6kVJnKmXi7:1745:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6kVJnKmXi7:1729:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.6kVJnKmXi7:1728:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.6kVJnKmXi7:1724:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.6kVJnKmXi7:1704:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.6kVJnKmXi7:1698:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.6kVJnKmXi7:1689:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.6kVJnKmXi7:1687:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.6kVJnKmXi7:1686:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.6kVJnKmXi7:1685:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.6kVJnKmXi7:1683:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.6kVJnKmXi7:1682:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.6kVJnKmXi7:1679:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.6kVJnKmXi7:1672:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.6kVJnKmXi7:1662:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.6kVJnKmXi7:1651:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6kVJnKmXi7:1545:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.6kVJnKmXi7:1541:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6kVJnKmXi7:1516:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.6kVJnKmXi7:1495:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.6kVJnKmXi7:1437:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.6kVJnKmXi7:1436:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.6kVJnKmXi7:1432:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.6kVJnKmXi7:1431:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.6kVJnKmXi7:1429:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.6kVJnKmXi7:1428:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.6kVJnKmXi7:1425:warning: override: reassigning to sy=
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
    ./.tmp.config.7rI9rFMWio:3660:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.7rI9rFMWio:3663:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.7rI9rFMWio:3664:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.7rI9rFMWio:3666:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.7rI9rFMWio:3667:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.7rI9rFMWio:3671:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.7rI9rFMWio:3672:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.7rI9rFMWio:3730:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.7rI9rFMWio:3751:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.7rI9rFMWio:3776:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.7rI9rFMWio:3780:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.7rI9rFMWio:3886:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.7rI9rFMWio:3897:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.7rI9rFMWio:3907:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.7rI9rFMWio:3914:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.7rI9rFMWio:3917:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.7rI9rFMWio:3918:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.7rI9rFMWio:3920:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.7rI9rFMWio:3921:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.7rI9rFMWio:3922:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.7rI9rFMWio:3924:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.7rI9rFMWio:3933:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.7rI9rFMWio:3939:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.7rI9rFMWio:3959:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.7rI9rFMWio:3963:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.7rI9rFMWio:3964:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.7rI9rFMWio:3980:warning: override: reassigning to symbol =
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
    ./.tmp.config.L2Mrv2fHOq:3052:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.L2Mrv2fHOq:3055:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.L2Mrv2fHOq:3056:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.L2Mrv2fHOq:3058:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.L2Mrv2fHOq:3059:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.L2Mrv2fHOq:3063:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.L2Mrv2fHOq:3064:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.L2Mrv2fHOq:3122:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.L2Mrv2fHOq:3143:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.L2Mrv2fHOq:3168:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.L2Mrv2fHOq:3172:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.L2Mrv2fHOq:3278:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.L2Mrv2fHOq:3289:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.L2Mrv2fHOq:3299:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.L2Mrv2fHOq:3306:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.L2Mrv2fHOq:3309:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.L2Mrv2fHOq:3310:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.L2Mrv2fHOq:3312:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.L2Mrv2fHOq:3313:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.L2Mrv2fHOq:3314:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.L2Mrv2fHOq:3316:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.L2Mrv2fHOq:3325:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.L2Mrv2fHOq:3331:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.L2Mrv2fHOq:3351:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.L2Mrv2fHOq:3355:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.L2Mrv2fHOq:3356:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.L2Mrv2fHOq:3372:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 30 warnings, 0=
 section mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    ./.tmp.config.8xLMwiiGDZ:7598:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.8xLMwiiGDZ:7601:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.8xLMwiiGDZ:7602:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.8xLMwiiGDZ:7604:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.8xLMwiiGDZ:7605:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.8xLMwiiGDZ:7609:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.8xLMwiiGDZ:7610:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.8xLMwiiGDZ:7668:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.8xLMwiiGDZ:7689:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.8xLMwiiGDZ:7714:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.8xLMwiiGDZ:7718:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.8xLMwiiGDZ:7824:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.8xLMwiiGDZ:7835:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.8xLMwiiGDZ:7845:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.8xLMwiiGDZ:7852:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.8xLMwiiGDZ:7855:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.8xLMwiiGDZ:7856:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.8xLMwiiGDZ:7858:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.8xLMwiiGDZ:7859:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.8xLMwiiGDZ:7860:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.8xLMwiiGDZ:7862:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.8xLMwiiGDZ:7871:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.8xLMwiiGDZ:7877:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.8xLMwiiGDZ:7897:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.8xLMwiiGDZ:7901:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.8xLMwiiGDZ:7902:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.8xLMwiiGDZ:7918:warning: override: reassigning to symbol =
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
    ./.tmp.config.wzy9lZcbAh:4512:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.wzy9lZcbAh:4515:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.wzy9lZcbAh:4516:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.wzy9lZcbAh:4518:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.wzy9lZcbAh:4519:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.wzy9lZcbAh:4523:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.wzy9lZcbAh:4524:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.wzy9lZcbAh:4582:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.wzy9lZcbAh:4603:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.wzy9lZcbAh:4628:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.wzy9lZcbAh:4632:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.wzy9lZcbAh:4738:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.wzy9lZcbAh:4749:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.wzy9lZcbAh:4759:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.wzy9lZcbAh:4766:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.wzy9lZcbAh:4769:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.wzy9lZcbAh:4770:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.wzy9lZcbAh:4772:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.wzy9lZcbAh:4773:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.wzy9lZcbAh:4774:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.wzy9lZcbAh:4776:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.wzy9lZcbAh:4785:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.wzy9lZcbAh:4791:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.wzy9lZcbAh:4811:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.wzy9lZcbAh:4815:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.wzy9lZcbAh:4816:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.wzy9lZcbAh:4832:warning: override: reassigning to symbol =
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
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@7/li=
nux/build/_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko nee=
ds unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@7/li=
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
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs unknown=
 symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0/kernel/drivers/usb/storage/uas.ko needs unknown=
 symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 =
warnings, 0 section mismatches

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
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 30 warn=
ings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    ./.tmp.config.dJ31MtyPu6:8160:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.dJ31MtyPu6:8163:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.dJ31MtyPu6:8164:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.dJ31MtyPu6:8166:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.dJ31MtyPu6:8167:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.dJ31MtyPu6:8171:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.dJ31MtyPu6:8172:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.dJ31MtyPu6:8230:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.dJ31MtyPu6:8251:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.dJ31MtyPu6:8276:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.dJ31MtyPu6:8280:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.dJ31MtyPu6:8386:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.dJ31MtyPu6:8397:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.dJ31MtyPu6:8407:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.dJ31MtyPu6:8414:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.dJ31MtyPu6:8417:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.dJ31MtyPu6:8418:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.dJ31MtyPu6:8420:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.dJ31MtyPu6:8421:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.dJ31MtyPu6:8422:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.dJ31MtyPu6:8424:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.dJ31MtyPu6:8433:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.dJ31MtyPu6:8439:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.dJ31MtyPu6:8459:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.dJ31MtyPu6:8463:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.dJ31MtyPu6:8464:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.dJ31MtyPu6:8480:warning: override: reassigning to symbol =
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
    ./.tmp.config.6kVJnKmXi7:1425:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.6kVJnKmXi7:1428:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.6kVJnKmXi7:1429:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.6kVJnKmXi7:1431:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.6kVJnKmXi7:1432:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.6kVJnKmXi7:1436:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.6kVJnKmXi7:1437:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.6kVJnKmXi7:1495:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.6kVJnKmXi7:1516:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.6kVJnKmXi7:1541:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.6kVJnKmXi7:1545:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.6kVJnKmXi7:1651:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.6kVJnKmXi7:1662:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.6kVJnKmXi7:1672:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.6kVJnKmXi7:1679:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.6kVJnKmXi7:1682:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.6kVJnKmXi7:1683:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.6kVJnKmXi7:1685:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.6kVJnKmXi7:1686:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.6kVJnKmXi7:1687:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.6kVJnKmXi7:1689:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.6kVJnKmXi7:1698:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.6kVJnKmXi7:1704:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.6kVJnKmXi7:1724:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.6kVJnKmXi7:1728:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.6kVJnKmXi7:1729:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.6kVJnKmXi7:1745:warning: override: reassigning to symbol =
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
    ./.tmp.config.fU7ZjIrvSd:4573:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.fU7ZjIrvSd:4576:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.fU7ZjIrvSd:4577:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.fU7ZjIrvSd:4579:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.fU7ZjIrvSd:4580:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.fU7ZjIrvSd:4584:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.fU7ZjIrvSd:4585:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.fU7ZjIrvSd:4643:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.fU7ZjIrvSd:4664:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.fU7ZjIrvSd:4689:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.fU7ZjIrvSd:4693:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.fU7ZjIrvSd:4799:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.fU7ZjIrvSd:4810:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.fU7ZjIrvSd:4820:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.fU7ZjIrvSd:4827:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.fU7ZjIrvSd:4830:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.fU7ZjIrvSd:4831:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.fU7ZjIrvSd:4833:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.fU7ZjIrvSd:4834:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.fU7ZjIrvSd:4835:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.fU7ZjIrvSd:4837:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.fU7ZjIrvSd:4846:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.fU7ZjIrvSd:4852:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.fU7ZjIrvSd:4872:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.fU7ZjIrvSd:4876:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.fU7ZjIrvSd:4877:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.fU7ZjIrvSd:4893:warning: override: reassigning to symbol =
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
