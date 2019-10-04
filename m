Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3BF7CB2D0
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2019 02:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbfJDAuQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Oct 2019 20:50:16 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43186 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbfJDAuQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Oct 2019 20:50:16 -0400
Received: by mail-wr1-f68.google.com with SMTP id j18so4067119wrq.10
        for <linux-next@vger.kernel.org>; Thu, 03 Oct 2019 17:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=m/BhBQKHlz+JBD463J9E9qopnsIxxMs9M92qkSa9YG8=;
        b=L5v7yGMDBXJdq8CutMC1tqAS5RhxBa/RRE4sRI97bplCvCe+WygXd8imIIQILi/xqe
         uXC9NW+LZTWExN+eEj8RLTlmV8Ax75mtEfwsxNkaOUdNn7Wjnf4GhJrgmp2/pDun2Id2
         cqhNXhBWfgnA9QH0UVUDMS6j+VRiuAx0VS1dKuEqTj9UyJdtsiNlNSE0KJi/Xr4uHl/f
         8BZBFPABD3HILvzGuUpcWM9mfi0Hwc5jgs+WC27Jde2oDDuQIhbK/qqmLqzuP5DvUBM9
         kaInc7PsrEmpj7IedT3VTOsSwAefgqnGHR1J7bYFqxzykkGznXjMRtuy4+BlBAyMyodI
         PLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=m/BhBQKHlz+JBD463J9E9qopnsIxxMs9M92qkSa9YG8=;
        b=A1VnsEgyL8GJgJOdHQ6lVi9BKsks16nm2wEoIvwUc+rmJ/O1NGXHopzJJqmV/1PaXM
         HEyaxi2+txgd7EU8h1UZrnaP9v/k8Q+DQV9tPH2H4XRpDDfBc5AJCvSX6jA7Jw7I3yEr
         BjFupNVvujasVtZrW0LkFMlzy7kffG1D3Kx2OthVm1a08bmjXWhrEIv9jWbLHDNhdbSy
         H3HyjrYZcyIh+8mEi5p3YdnQs5Cc8BpptHV38ozRreA3UP1EYHq1SzaSkC4uApuML5th
         tb89k9HdSglMkXCjQ9/WzcNMf0yKvel4im31vinzzx0/rPNQuGN/kGg++WdPwEh/pIb3
         kbyw==
X-Gm-Message-State: APjAAAXnGyyCU/reyQDugX+JbxR74UCmNxnKbSWEaMR7NGPrrxl6vfN1
        QbSmNSy8IVN/VubOnb1SKTuhUdFigCllpg==
X-Google-Smtp-Source: APXvYqyiumxWUJWw8Vr2+Ype68ohme3ikSZStpb2iSLYhD1y6y7Swmv+g2SwYkYVwA8KZDQkwiMSWw==
X-Received: by 2002:adf:ea41:: with SMTP id j1mr9551132wrn.378.1570150202933;
        Thu, 03 Oct 2019 17:50:02 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y186sm8349649wmb.41.2019.10.03.17.50.01
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 17:50:02 -0700 (PDT)
Message-ID: <5d96973a.1c69fb81.e9e7.794b@mx.google.com>
Date:   Thu, 03 Oct 2019 17:50:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc1-261-g829a15f23627
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes build: 214 builds: 1 failed, 213 passed, 4 errors,
 479 warnings (v5.4-rc1-261-g829a15f23627)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 214 builds: 1 failed, 213 passed, 4 errors, 479 w=
arnings (v5.4-rc1-261-g829a15f23627)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc1-261-g829a15f23627/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc1-261-g829a15f23627
Git Commit: 829a15f23627ab3211304a590b7786e60576960b
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failure Detected:

mips:
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
    allmodconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 1 warning
    defconfig (gcc-8): 28 warnings

arm:
    am200epdkit_defconfig (gcc-8): 1 warning
    assabet_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (gcc-8): 1 warning
    axm55xx_defconfig (gcc-8): 1 warning
    cm_x2xx_defconfig (gcc-8): 1 warning
    cm_x300_defconfig (gcc-8): 1 warning
    cns3420vb_defconfig (gcc-8): 1 warning
    colibri_pxa270_defconfig (gcc-8): 1 warning
    colibri_pxa300_defconfig (gcc-8): 1 warning
    collie_defconfig (gcc-8): 1 warning
    davinci_all_defconfig (gcc-8): 1 warning
    dove_defconfig (gcc-8): 1 warning
    em_x270_defconfig (gcc-8): 1 warning
    ep93xx_defconfig (gcc-8): 1 warning
    eseries_pxa_defconfig (gcc-8): 1 warning
    exynos_defconfig (gcc-8): 171 warnings
    ezx_defconfig (gcc-8): 1 warning
    h3600_defconfig (gcc-8): 1 warning
    h5000_defconfig (gcc-8): 1 warning
    imote2_defconfig (gcc-8): 1 warning
    imx_v4_v5_defconfig (gcc-8): 1 warning
    imx_v6_v7_defconfig (gcc-8): 1 warning
    integrator_defconfig (gcc-8): 1 warning
    ixp4xx_defconfig (gcc-8): 1 warning
    keystone_defconfig (gcc-8): 1 warning
    lpc32xx_defconfig (gcc-8): 1 warning
    magician_defconfig (gcc-8): 1 warning
    milbeaut_m10v_defconfig (gcc-8): 1 warning
    mini2440_defconfig (gcc-8): 1 warning
    mmp2_defconfig (gcc-8): 1 warning
    multi_v5_defconfig (gcc-8): 1 warning
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 29 warnings
    mv78xx0_defconfig (gcc-8): 1 warning
    mvebu_v5_defconfig (gcc-8): 1 warning
    mvebu_v7_defconfig (gcc-8): 1 warning
    mxs_defconfig (gcc-8): 1 warning
    neponset_defconfig (gcc-8): 1 warning
    nhk8815_defconfig (gcc-8): 1 warning
    omap1_defconfig (gcc-8): 1 warning
    omap2plus_defconfig (gcc-8): 1 warning
    orion5x_defconfig (gcc-8): 1 warning
    oxnas_v6_defconfig (gcc-8): 1 warning
    palmz72_defconfig (gcc-8): 1 warning
    pcm027_defconfig (gcc-8): 1 warning
    prima2_defconfig (gcc-8): 1 warning
    pxa168_defconfig (gcc-8): 1 warning
    pxa3xx_defconfig (gcc-8): 1 warning
    pxa910_defconfig (gcc-8): 1 warning
    qcom_defconfig (gcc-8): 1 warning
    realview_defconfig (gcc-8): 1 warning
    s3c6400_defconfig (gcc-8): 1 warning
    s5pv210_defconfig (gcc-8): 1 warning
    sama5_defconfig (gcc-8): 1 warning
    shannon_defconfig (gcc-8): 1 warning
    spear13xx_defconfig (gcc-8): 1 warning
    sunxi_defconfig (gcc-8): 1 warning
    tango4_defconfig (gcc-8): 1 warning
    tegra_defconfig (gcc-8): 1 warning
    trizeps4_defconfig (gcc-8): 1 warning
    u300_defconfig (gcc-8): 1 warning
    u8500_defconfig (gcc-8): 1 warning
    versatile_defconfig (gcc-8): 1 warning
    vexpress_defconfig (gcc-8): 1 warning
    viper_defconfig (gcc-8): 1 warning
    xcep_defconfig (gcc-8): 1 warning
    zeus_defconfig (gcc-8): 1 warning

i386:
    i386_defconfig (gcc-8): 27 warnings

mips:
    32r2el_defconfig (gcc-8): 27 warnings
    db1xxx_defconfig (gcc-8): 1 warning
    ip32_defconfig (gcc-8): 1 warning
    jazz_defconfig (gcc-8): 1 warning
    msp71xx_defconfig (gcc-8): 4 errors, 1 warning
    rm200_defconfig (gcc-8): 1 warning

riscv:
    defconfig (gcc-8): 27 warnings
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 27 warnings

Errors summary:

    2    arch/mips/pmcs-msp71xx/msp_prom.c:65:20: error: 'prom_mem_size' de=
fined but not used [-Werror=3Dunused-variable]
    2    arch/mips/pmcs-msp71xx/msp_prom.c:64:34: error: 'MAX_PROM_MEM' und=
eclared here (not in a function); did you mean 'DEV_PROP_MAX'?
    2    arch/mips/pmcs-msp71xx/msp_prom.c:64:20: error: 'prom_mem_base' de=
fined but not used [-Werror=3Dunused-variable]
    2    arch/mips/pmcs-msp71xx/msp_prom.c:380:16: error: unused variable '=
addr' [-Werror=3Dunused-variable]

Warnings summary:

    128  WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    52   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    10   drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_=
period' defined but not used [-Wunused-function]
    9    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYM=
BOL_GPL
    6    arch/mips/fw/arc/memory.c:163:16: warning: unused variable 'addr' =
[-Wunused-variable]
    4    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    4    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    3    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@7/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_sense_invalidCDB
    3    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@7/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_adjust_quirks
    2    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mism=
atch in conditional expression
    2    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@8/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_sense_invalidCDB
    2    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@8/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_adjust_quirks
    2    cc1: all warnings being treated as errors
    2    .config:1169:warning: override: UNWINDER_GUESS changes choice state
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@9/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@9/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@3/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@3/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/u=
as.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-usbat.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-usbat.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-usbat.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-usbat.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-usbat.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-usbat.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-usbat.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-usbat.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-usbat.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-usbat.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-usbat.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-usbat.ko needs unknown symbol usb_stor_clear_halt
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-usbat.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-usbat.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-usbat.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-usbat.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr55.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr55.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr55.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr55.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr55.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr55.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr55.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr55.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr55.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr55.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr55.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr55.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr55.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_CB_transport
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-sddr09.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-realtek.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-realtek.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-realtek.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-realtek.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-realtek.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-realtek.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-realtek.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-realtek.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-realtek.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-onetouch.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-onetouch.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-onetouch.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-onetouch.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-onetouch.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-onetouch.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-onetouch.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-onetouch.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-onetouch.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-karma.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-karma.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-karma.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-karma.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-karma.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-karma.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-karma.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-karma.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-karma.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-karma.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-karma.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-karma.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-jumpshot.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-jumpshot.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-jumpshot.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-jumpshot.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-jumpshot.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-jumpshot.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-jumpshot.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-jumpshot.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-jumpshot.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-jumpshot.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-jumpshot.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-jumpshot.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-jumpshot.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-jumpshot.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-jumpshot.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-isd200.ko needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-isd200.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-isd200.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-isd200.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-isd200.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-isd200.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-isd200.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-isd200.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-isd200.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-isd200.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-isd200.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-isd200.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-isd200.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-freecom.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-freecom.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-freecom.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-freecom.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-freecom.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-freecom.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-freecom.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-freecom.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-freecom.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-freecom.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-freecom.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-freecom.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-eneub6250.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-eneub6250.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-eneub6250.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-eneub6250.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-eneub6250.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-eneub6250.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-eneub6250.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-eneub6250.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-eneub6250.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-eneub6250.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-eneub6250.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-datafab.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-datafab.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-datafab.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-datafab.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-datafab.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-datafab.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-datafab.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-datafab.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-datafab.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-datafab.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-datafab.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-datafab.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-datafab.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-datafab.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-cypress.ko needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-cypress.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-cypress.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-cypress.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-cypress.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-cypress.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-cypress.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-cypress.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-cypress.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-cypress.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-cypress.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-alauda.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-alauda.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-alauda.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-alauda.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-alauda.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-alauda.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-alauda.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-alauda.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-alauda.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-alauda.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-alauda.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-alauda.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-alauda.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-alauda.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
ums-alauda.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/=
uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas=
.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
/linux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas=
.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko need=
s unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko need=
s unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_clear_halt
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_CB_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol fill_inquiry_response
    1    ./.tmp.config.xxQrZnDRdZ:7934:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xxQrZnDRdZ:7918:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.xxQrZnDRdZ:7917:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.xxQrZnDRdZ:7913:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.xxQrZnDRdZ:7893:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.xxQrZnDRdZ:7887:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.xxQrZnDRdZ:7878:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.xxQrZnDRdZ:7876:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.xxQrZnDRdZ:7875:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.xxQrZnDRdZ:7874:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.xxQrZnDRdZ:7872:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.xxQrZnDRdZ:7871:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.xxQrZnDRdZ:7868:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.xxQrZnDRdZ:7861:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.xxQrZnDRdZ:7851:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.xxQrZnDRdZ:7840:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xxQrZnDRdZ:7732:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.xxQrZnDRdZ:7728:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xxQrZnDRdZ:7703:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.xxQrZnDRdZ:7682:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.xxQrZnDRdZ:7624:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.xxQrZnDRdZ:7623:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.xxQrZnDRdZ:7619:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.xxQrZnDRdZ:7618:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.xxQrZnDRdZ:7616:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.xxQrZnDRdZ:7615:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.xxQrZnDRdZ:7612:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.xVSchWzHLI:4834:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xVSchWzHLI:4818:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.xVSchWzHLI:4817:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.xVSchWzHLI:4813:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.xVSchWzHLI:4793:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.xVSchWzHLI:4787:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.xVSchWzHLI:4778:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.xVSchWzHLI:4776:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.xVSchWzHLI:4775:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.xVSchWzHLI:4774:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.xVSchWzHLI:4772:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.xVSchWzHLI:4771:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.xVSchWzHLI:4768:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.xVSchWzHLI:4761:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.xVSchWzHLI:4751:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.xVSchWzHLI:4740:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xVSchWzHLI:4632:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.xVSchWzHLI:4628:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xVSchWzHLI:4603:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.xVSchWzHLI:4582:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.xVSchWzHLI:4524:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.xVSchWzHLI:4523:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.xVSchWzHLI:4519:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.xVSchWzHLI:4518:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.xVSchWzHLI:4516:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.xVSchWzHLI:4515:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.xVSchWzHLI:4512:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.sBFA5X4eaa:3983:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.sBFA5X4eaa:3967:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.sBFA5X4eaa:3966:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.sBFA5X4eaa:3962:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.sBFA5X4eaa:3942:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.sBFA5X4eaa:3936:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.sBFA5X4eaa:3927:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.sBFA5X4eaa:3925:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.sBFA5X4eaa:3924:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.sBFA5X4eaa:3923:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.sBFA5X4eaa:3921:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.sBFA5X4eaa:3920:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.sBFA5X4eaa:3917:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.sBFA5X4eaa:3910:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.sBFA5X4eaa:3900:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.sBFA5X4eaa:3889:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.sBFA5X4eaa:3781:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.sBFA5X4eaa:3777:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.sBFA5X4eaa:3752:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.sBFA5X4eaa:3731:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.sBFA5X4eaa:3673:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.sBFA5X4eaa:3672:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.sBFA5X4eaa:3668:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.sBFA5X4eaa:3667:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.sBFA5X4eaa:3665:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.sBFA5X4eaa:3664:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.sBFA5X4eaa:3661:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.qK4gb2PQPs:3374:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.qK4gb2PQPs:3358:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.qK4gb2PQPs:3357:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.qK4gb2PQPs:3353:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.qK4gb2PQPs:3333:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.qK4gb2PQPs:3327:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.qK4gb2PQPs:3318:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.qK4gb2PQPs:3316:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.qK4gb2PQPs:3315:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.qK4gb2PQPs:3314:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.qK4gb2PQPs:3312:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.qK4gb2PQPs:3311:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.qK4gb2PQPs:3308:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.qK4gb2PQPs:3301:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.qK4gb2PQPs:3291:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.qK4gb2PQPs:3280:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.qK4gb2PQPs:3172:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.qK4gb2PQPs:3168:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.qK4gb2PQPs:3143:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.qK4gb2PQPs:3122:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.qK4gb2PQPs:3064:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.qK4gb2PQPs:3063:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.qK4gb2PQPs:3059:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.qK4gb2PQPs:3058:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.qK4gb2PQPs:3056:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.qK4gb2PQPs:3055:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.qK4gb2PQPs:3052:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.kXRvCkfImH:4895:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.kXRvCkfImH:4879:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.kXRvCkfImH:4878:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.kXRvCkfImH:4874:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.kXRvCkfImH:4854:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.kXRvCkfImH:4848:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.kXRvCkfImH:4839:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.kXRvCkfImH:4837:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.kXRvCkfImH:4836:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.kXRvCkfImH:4835:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.kXRvCkfImH:4833:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.kXRvCkfImH:4832:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.kXRvCkfImH:4829:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.kXRvCkfImH:4822:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.kXRvCkfImH:4812:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.kXRvCkfImH:4801:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.kXRvCkfImH:4693:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.kXRvCkfImH:4689:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.kXRvCkfImH:4664:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.kXRvCkfImH:4643:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.kXRvCkfImH:4585:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.kXRvCkfImH:4584:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.kXRvCkfImH:4580:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.kXRvCkfImH:4579:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.kXRvCkfImH:4577:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.kXRvCkfImH:4576:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.kXRvCkfImH:4573:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.i7mayx7yBB:3374:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.i7mayx7yBB:3358:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.i7mayx7yBB:3357:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.i7mayx7yBB:3353:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.i7mayx7yBB:3333:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.i7mayx7yBB:3327:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.i7mayx7yBB:3318:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.i7mayx7yBB:3316:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.i7mayx7yBB:3315:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.i7mayx7yBB:3314:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.i7mayx7yBB:3312:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.i7mayx7yBB:3311:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.i7mayx7yBB:3308:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.i7mayx7yBB:3301:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.i7mayx7yBB:3291:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.i7mayx7yBB:3280:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.i7mayx7yBB:3172:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.i7mayx7yBB:3168:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.i7mayx7yBB:3143:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.i7mayx7yBB:3122:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.i7mayx7yBB:3064:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.i7mayx7yBB:3063:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.i7mayx7yBB:3059:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.i7mayx7yBB:3058:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.i7mayx7yBB:3056:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.i7mayx7yBB:3055:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.i7mayx7yBB:3052:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.fzqnmUr0a4:8490:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.fzqnmUr0a4:8474:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.fzqnmUr0a4:8473:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.fzqnmUr0a4:8469:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.fzqnmUr0a4:8449:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.fzqnmUr0a4:8443:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.fzqnmUr0a4:8434:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.fzqnmUr0a4:8432:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.fzqnmUr0a4:8431:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.fzqnmUr0a4:8430:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.fzqnmUr0a4:8428:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.fzqnmUr0a4:8427:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.fzqnmUr0a4:8424:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.fzqnmUr0a4:8417:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.fzqnmUr0a4:8407:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.fzqnmUr0a4:8396:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.fzqnmUr0a4:8288:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.fzqnmUr0a4:8284:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.fzqnmUr0a4:8259:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.fzqnmUr0a4:8238:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.fzqnmUr0a4:8180:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.fzqnmUr0a4:8179:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.fzqnmUr0a4:8175:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.fzqnmUr0a4:8174:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.fzqnmUr0a4:8172:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.fzqnmUr0a4:8171:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.fzqnmUr0a4:8168:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.eGx7ZB5ayc:4834:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.eGx7ZB5ayc:4818:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.eGx7ZB5ayc:4817:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.eGx7ZB5ayc:4813:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.eGx7ZB5ayc:4793:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.eGx7ZB5ayc:4787:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.eGx7ZB5ayc:4778:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.eGx7ZB5ayc:4776:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.eGx7ZB5ayc:4775:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.eGx7ZB5ayc:4774:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.eGx7ZB5ayc:4772:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.eGx7ZB5ayc:4771:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.eGx7ZB5ayc:4768:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.eGx7ZB5ayc:4761:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.eGx7ZB5ayc:4751:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.eGx7ZB5ayc:4740:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.eGx7ZB5ayc:4632:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.eGx7ZB5ayc:4628:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.eGx7ZB5ayc:4603:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.eGx7ZB5ayc:4582:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.eGx7ZB5ayc:4524:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.eGx7ZB5ayc:4523:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.eGx7ZB5ayc:4519:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.eGx7ZB5ayc:4518:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.eGx7ZB5ayc:4516:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.eGx7ZB5ayc:4515:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.eGx7ZB5ayc:4512:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.cBIKShIWik:3983:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.cBIKShIWik:3967:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.cBIKShIWik:3966:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.cBIKShIWik:3962:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.cBIKShIWik:3942:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.cBIKShIWik:3936:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.cBIKShIWik:3927:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.cBIKShIWik:3925:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.cBIKShIWik:3924:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.cBIKShIWik:3923:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.cBIKShIWik:3921:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.cBIKShIWik:3920:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.cBIKShIWik:3917:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.cBIKShIWik:3910:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.cBIKShIWik:3900:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.cBIKShIWik:3889:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.cBIKShIWik:3781:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.cBIKShIWik:3777:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.cBIKShIWik:3752:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.cBIKShIWik:3731:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.cBIKShIWik:3673:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.cBIKShIWik:3672:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.cBIKShIWik:3668:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.cBIKShIWik:3667:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.cBIKShIWik:3665:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.cBIKShIWik:3664:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.cBIKShIWik:3661:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Yv46Alsq4f:8490:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Yv46Alsq4f:8474:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Yv46Alsq4f:8473:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.Yv46Alsq4f:8469:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.Yv46Alsq4f:8449:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.Yv46Alsq4f:8443:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.Yv46Alsq4f:8434:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.Yv46Alsq4f:8432:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Yv46Alsq4f:8431:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.Yv46Alsq4f:8430:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.Yv46Alsq4f:8428:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.Yv46Alsq4f:8427:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.Yv46Alsq4f:8424:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Yv46Alsq4f:8417:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Yv46Alsq4f:8407:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.Yv46Alsq4f:8396:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Yv46Alsq4f:8288:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.Yv46Alsq4f:8284:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Yv46Alsq4f:8259:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.Yv46Alsq4f:8238:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Yv46Alsq4f:8180:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.Yv46Alsq4f:8179:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.Yv46Alsq4f:8175:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.Yv46Alsq4f:8174:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.Yv46Alsq4f:8172:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.Yv46Alsq4f:8171:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.Yv46Alsq4f:8168:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.VYpdPDx3ak:7934:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VYpdPDx3ak:7918:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.VYpdPDx3ak:7917:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.VYpdPDx3ak:7913:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.VYpdPDx3ak:7893:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.VYpdPDx3ak:7887:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.VYpdPDx3ak:7878:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.VYpdPDx3ak:7876:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.VYpdPDx3ak:7875:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.VYpdPDx3ak:7874:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.VYpdPDx3ak:7872:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.VYpdPDx3ak:7871:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.VYpdPDx3ak:7868:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.VYpdPDx3ak:7861:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.VYpdPDx3ak:7851:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.VYpdPDx3ak:7840:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VYpdPDx3ak:7732:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.VYpdPDx3ak:7728:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.VYpdPDx3ak:7703:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.VYpdPDx3ak:7682:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.VYpdPDx3ak:7624:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.VYpdPDx3ak:7623:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.VYpdPDx3ak:7619:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.VYpdPDx3ak:7618:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.VYpdPDx3ak:7616:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.VYpdPDx3ak:7615:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.VYpdPDx3ak:7612:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.KDKNyY5pkf:1746:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.KDKNyY5pkf:1730:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.KDKNyY5pkf:1729:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.KDKNyY5pkf:1725:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.KDKNyY5pkf:1705:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.KDKNyY5pkf:1699:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.KDKNyY5pkf:1690:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.KDKNyY5pkf:1688:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.KDKNyY5pkf:1687:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.KDKNyY5pkf:1686:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.KDKNyY5pkf:1684:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.KDKNyY5pkf:1683:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.KDKNyY5pkf:1680:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.KDKNyY5pkf:1673:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.KDKNyY5pkf:1663:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.KDKNyY5pkf:1652:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.KDKNyY5pkf:1544:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.KDKNyY5pkf:1540:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.KDKNyY5pkf:1515:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.KDKNyY5pkf:1494:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.KDKNyY5pkf:1436:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.KDKNyY5pkf:1435:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.KDKNyY5pkf:1431:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.KDKNyY5pkf:1430:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.KDKNyY5pkf:1428:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.KDKNyY5pkf:1427:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.KDKNyY5pkf:1424:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.IirWV2JWd0:4895:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.IirWV2JWd0:4879:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.IirWV2JWd0:4878:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.IirWV2JWd0:4874:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.IirWV2JWd0:4854:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.IirWV2JWd0:4848:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.IirWV2JWd0:4839:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.IirWV2JWd0:4837:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.IirWV2JWd0:4836:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.IirWV2JWd0:4835:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.IirWV2JWd0:4833:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.IirWV2JWd0:4832:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.IirWV2JWd0:4829:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.IirWV2JWd0:4822:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.IirWV2JWd0:4812:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.IirWV2JWd0:4801:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.IirWV2JWd0:4693:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.IirWV2JWd0:4689:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.IirWV2JWd0:4664:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.IirWV2JWd0:4643:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.IirWV2JWd0:4585:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.IirWV2JWd0:4584:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.IirWV2JWd0:4580:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.IirWV2JWd0:4579:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.IirWV2JWd0:4577:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.IirWV2JWd0:4576:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.IirWV2JWd0:4573:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.1ZYv3ZVWZK:1746:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.1ZYv3ZVWZK:1730:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.1ZYv3ZVWZK:1729:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.1ZYv3ZVWZK:1725:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.1ZYv3ZVWZK:1705:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.1ZYv3ZVWZK:1699:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.1ZYv3ZVWZK:1690:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.1ZYv3ZVWZK:1688:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.1ZYv3ZVWZK:1687:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.1ZYv3ZVWZK:1686:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.1ZYv3ZVWZK:1684:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.1ZYv3ZVWZK:1683:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.1ZYv3ZVWZK:1680:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.1ZYv3ZVWZK:1673:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.1ZYv3ZVWZK:1663:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.1ZYv3ZVWZK:1652:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.1ZYv3ZVWZK:1544:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.1ZYv3ZVWZK:1540:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.1ZYv3ZVWZK:1515:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.1ZYv3ZVWZK:1494:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.1ZYv3ZVWZK:1436:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.1ZYv3ZVWZK:1435:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.1ZYv3ZVWZK:1431:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.1ZYv3ZVWZK:1430:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.1ZYv3ZVWZK:1428:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.1ZYv3ZVWZK:1427:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.1ZYv3ZVWZK:1424:warning: override: reassigning to sy=
mbol BPF_SYSCALL

Section mismatches summary:

    10   WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    6    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    6    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    2    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    2    WARNING: vmlinux.o(.text.unlikely+0x7c8): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    2    WARNING: vmlinux.o(.text.unlikely+0x710): Section mismatch in refe=
rence from the function free_memmap() to the function .meminit.text:membloc=
k_free()
    2    WARNING: vmlinux.o(.text.unlikely+0x3520): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    2    WARNING: vmlinux.o(.text.unlikely+0x31ac): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
32r2el_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 27 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.sBFA5X4eaa:3661:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.sBFA5X4eaa:3664:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.sBFA5X4eaa:3665:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.sBFA5X4eaa:3667:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.sBFA5X4eaa:3668:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.sBFA5X4eaa:3672:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.sBFA5X4eaa:3673:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.sBFA5X4eaa:3731:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.sBFA5X4eaa:3752:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.sBFA5X4eaa:3777:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.sBFA5X4eaa:3781:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.sBFA5X4eaa:3889:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.sBFA5X4eaa:3900:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.sBFA5X4eaa:3910:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.sBFA5X4eaa:3917:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.sBFA5X4eaa:3920:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.sBFA5X4eaa:3921:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.sBFA5X4eaa:3923:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.sBFA5X4eaa:3924:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.sBFA5X4eaa:3925:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.sBFA5X4eaa:3927:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.sBFA5X4eaa:3936:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.sBFA5X4eaa:3942:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.sBFA5X4eaa:3962:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.sBFA5X4eaa:3966:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.sBFA5X4eaa:3967:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.sBFA5X4eaa:3983:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
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
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
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
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
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
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

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
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, =
0 section mismatches

Warnings:
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
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mismatch =
in conditional expression

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3520): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 1 warning, 0 section mismatches

Warnings:
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.i7mayx7yBB:3052:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.i7mayx7yBB:3055:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.i7mayx7yBB:3056:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.i7mayx7yBB:3058:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.i7mayx7yBB:3059:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.i7mayx7yBB:3063:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.i7mayx7yBB:3064:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.i7mayx7yBB:3122:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.i7mayx7yBB:3143:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.i7mayx7yBB:3168:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.i7mayx7yBB:3172:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.i7mayx7yBB:3280:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.i7mayx7yBB:3291:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.i7mayx7yBB:3301:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.i7mayx7yBB:3308:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.i7mayx7yBB:3311:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.i7mayx7yBB:3312:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.i7mayx7yBB:3314:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.i7mayx7yBB:3315:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.i7mayx7yBB:3316:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.i7mayx7yBB:3318:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.i7mayx7yBB:3327:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.i7mayx7yBB:3333:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.i7mayx7yBB:3353:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.i7mayx7yBB:3357:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.i7mayx7yBB:3358:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.i7mayx7yBB:3374:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 28 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.xxQrZnDRdZ:7612:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.xxQrZnDRdZ:7615:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.xxQrZnDRdZ:7616:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.xxQrZnDRdZ:7618:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.xxQrZnDRdZ:7619:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.xxQrZnDRdZ:7623:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.xxQrZnDRdZ:7624:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.xxQrZnDRdZ:7682:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.xxQrZnDRdZ:7703:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.xxQrZnDRdZ:7728:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.xxQrZnDRdZ:7732:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.xxQrZnDRdZ:7840:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.xxQrZnDRdZ:7851:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.xxQrZnDRdZ:7861:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.xxQrZnDRdZ:7868:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.xxQrZnDRdZ:7871:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.xxQrZnDRdZ:7872:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.xxQrZnDRdZ:7874:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.xxQrZnDRdZ:7875:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.xxQrZnDRdZ:7876:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.xxQrZnDRdZ:7878:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.xxQrZnDRdZ:7887:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.xxQrZnDRdZ:7893:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.xxQrZnDRdZ:7913:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.xxQrZnDRdZ:7917:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.xxQrZnDRdZ:7918:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.xxQrZnDRdZ:7934:warning: override: reassigning to symbol =
USER_NS
    WARNING: "HYPERVISOR_platform_op" [vmlinux] is a static EXPORT_SYMBOL_G=
PL

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x710): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 171 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_CB_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_clear_halt
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_set_xfer_buf

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

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
    ./.tmp.config.xVSchWzHLI:4512:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.xVSchWzHLI:4515:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.xVSchWzHLI:4516:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.xVSchWzHLI:4518:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.xVSchWzHLI:4519:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.xVSchWzHLI:4523:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.xVSchWzHLI:4524:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.xVSchWzHLI:4582:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.xVSchWzHLI:4603:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.xVSchWzHLI:4628:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.xVSchWzHLI:4632:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.xVSchWzHLI:4740:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.xVSchWzHLI:4751:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.xVSchWzHLI:4761:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.xVSchWzHLI:4768:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.xVSchWzHLI:4771:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.xVSchWzHLI:4772:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.xVSchWzHLI:4774:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.xVSchWzHLI:4775:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.xVSchWzHLI:4776:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.xVSchWzHLI:4778:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.xVSchWzHLI:4787:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.xVSchWzHLI:4793:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.xVSchWzHLI:4813:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.xVSchWzHLI:4817:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.xVSchWzHLI:4818:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.xVSchWzHLI:4834:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
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
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    arch/mips/fw/arc/memory.c:163:16: warning: unused variable 'addr' [-Wun=
used-variable]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    arch/mips/fw/arc/memory.c:163:16: warning: unused variable 'addr' [-Wun=
used-variable]

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
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
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
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warning=
s, 0 section mismatches

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
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
msp71xx_defconfig (mips, gcc-8) =E2=80=94 FAIL, 4 errors, 1 warning, 0 sect=
ion mismatches

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
    cc1: all warnings being treated as errors

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
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@7/li=
nux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@7/li=
nux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 3 warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@8/li=
nux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@8/li=
nux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build/linu=
x/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko n=
eeds unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build/linu=
x/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko n=
eeds unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 =
warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@9/li=
nux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@9/li=
nux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 29 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.fzqnmUr0a4:8168:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.fzqnmUr0a4:8171:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.fzqnmUr0a4:8172:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.fzqnmUr0a4:8174:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.fzqnmUr0a4:8175:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.fzqnmUr0a4:8179:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.fzqnmUr0a4:8180:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.fzqnmUr0a4:8238:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.fzqnmUr0a4:8259:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.fzqnmUr0a4:8284:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.fzqnmUr0a4:8288:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.fzqnmUr0a4:8396:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.fzqnmUr0a4:8407:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.fzqnmUr0a4:8417:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.fzqnmUr0a4:8424:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.fzqnmUr0a4:8427:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.fzqnmUr0a4:8428:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.fzqnmUr0a4:8430:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.fzqnmUr0a4:8431:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.fzqnmUr0a4:8432:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.fzqnmUr0a4:8434:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.fzqnmUr0a4:8443:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.fzqnmUr0a4:8449:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.fzqnmUr0a4:8469:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.fzqnmUr0a4:8473:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.fzqnmUr0a4:8474:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.fzqnmUr0a4:8490:warning: override: reassigning to symbol =
USER_NS
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@7/li=
nux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@7/li=
nux/build/_modules_/lib/modules/5.4.0-rc1/kernel/drivers/usb/storage/uas.ko=
 needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
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
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
    ./.tmp.config.KDKNyY5pkf:1424:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.KDKNyY5pkf:1427:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.KDKNyY5pkf:1428:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.KDKNyY5pkf:1430:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.KDKNyY5pkf:1431:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.KDKNyY5pkf:1435:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.KDKNyY5pkf:1436:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.KDKNyY5pkf:1494:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.KDKNyY5pkf:1515:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.KDKNyY5pkf:1540:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.KDKNyY5pkf:1544:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.KDKNyY5pkf:1652:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.KDKNyY5pkf:1663:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.KDKNyY5pkf:1673:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.KDKNyY5pkf:1680:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.KDKNyY5pkf:1683:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.KDKNyY5pkf:1684:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.KDKNyY5pkf:1686:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.KDKNyY5pkf:1687:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.KDKNyY5pkf:1688:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.KDKNyY5pkf:1690:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.KDKNyY5pkf:1699:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.KDKNyY5pkf:1705:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.KDKNyY5pkf:1725:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.KDKNyY5pkf:1729:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.KDKNyY5pkf:1730:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.KDKNyY5pkf:1746:warning: override: reassigning to symbol =
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
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
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
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

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
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
    arch/mips/fw/arc/memory.c:163:16: warning: unused variable 'addr' [-Wun=
used-variable]

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
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

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
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

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
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
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
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
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
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
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
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0=
 section mismatches

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 27 war=
nings, 0 section mismatches

Warnings:
    ./.tmp.config.kXRvCkfImH:4573:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.kXRvCkfImH:4576:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.kXRvCkfImH:4577:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.kXRvCkfImH:4579:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.kXRvCkfImH:4580:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.kXRvCkfImH:4584:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.kXRvCkfImH:4585:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.kXRvCkfImH:4643:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.kXRvCkfImH:4664:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.kXRvCkfImH:4689:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.kXRvCkfImH:4693:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.kXRvCkfImH:4801:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.kXRvCkfImH:4812:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.kXRvCkfImH:4822:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.kXRvCkfImH:4829:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.kXRvCkfImH:4832:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.kXRvCkfImH:4833:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.kXRvCkfImH:4835:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.kXRvCkfImH:4836:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.kXRvCkfImH:4837:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.kXRvCkfImH:4839:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.kXRvCkfImH:4848:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.kXRvCkfImH:4854:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.kXRvCkfImH:4874:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.kXRvCkfImH:4878:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.kXRvCkfImH:4879:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.kXRvCkfImH:4895:warning: override: reassigning to symbol =
USER_NS

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
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
