Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3990DCF6CC
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2019 12:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729944AbfJHKNR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Oct 2019 06:13:17 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50722 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728866AbfJHKNR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Oct 2019 06:13:17 -0400
Received: by mail-wm1-f67.google.com with SMTP id 5so2511730wmg.0
        for <linux-next@vger.kernel.org>; Tue, 08 Oct 2019 03:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=i+Xl0s5XhpZYfXfCYXXIA5/uU8kXWWAAoPBOCQ4KGqs=;
        b=p2oSzB62tK/rPUmt+SyWsHNV9qAs7wusBXAbW7brrB5h4evQ3jzvtZ7K3Zzj4wuaCi
         mLZm1QcuqTgUcwn8Uhjy4HPISItdPkRDTj2q6hT42HWeqYu2IIu39e10wCvpzqpO8Evo
         +VlqUhD/bresk8oY0JWWp0dF3MPmOSz9iMo/rgUEx28UhPFvdrxNnSLMeMmsloH4SINP
         aA+sG7Ubvy1pP+s0M0jxFqZEim5L9H+d1MUHoso3jVqDij3nDhibYtO7gKRYMZXEy654
         e1HMx5qXXQu0iP0tzEXHl6rylBjFjEfaKBBp/lc4ACEsYCDZOVPf0e1VRXXjpthn/bg7
         216w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=i+Xl0s5XhpZYfXfCYXXIA5/uU8kXWWAAoPBOCQ4KGqs=;
        b=a5KsagFlYTDPoGq7hJB5j5q5ZxZKIUhMtKbV7SdSvw3+SjCki6lRxKqOZbqakR9QQ7
         2Ak46XLwbR/MCsFydzZdXOl2J5fv0+qNMRc64TvaiE82rrVmKgRrKEShfS2lLPfiCxMd
         3Fjw7QgK2M27YepuUY0xkw/Mqb5gZyGpmcjc0oMNOWxrrTPFL9+nCz7SFGZeEmVBTJgE
         pmZNfzVS/0FI9mN3Vaixf5bsa6WTH1TIfAL2EieMjxwbuMmF8uFPhBWEr/Jk5k6yL9XL
         juRKOAf+byaMV/fcYtZVzAG7LQ789OxFfwXRMNGm2l6h/ekdP1ZWCSJdbjufrPmmv/2b
         r4RQ==
X-Gm-Message-State: APjAAAUAJ8rZNR/2Pkh3P+dKRK/EpOsfp8GQV5uE4cMHgqcsYKf0cVJl
        uHSJ25ye87mpNJeEAQ1aPuQXUxA7spWdmQ==
X-Google-Smtp-Source: APXvYqwRYS2qE53YNFtrvjGIXrXPaOCfiJgOrlXvkzaGxXJVQz6O1UFemhNg6zEc2ZP9mXMvt0LwlQ==
X-Received: by 2002:a1c:3182:: with SMTP id x124mr3369680wmx.168.1570529585229;
        Tue, 08 Oct 2019 03:13:05 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id b7sm17650489wrx.56.2019.10.08.03.13.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 03:13:04 -0700 (PDT)
Message-ID: <5d9c6130.1c69fb81.d744f.0183@mx.google.com>
Date:   Tue, 08 Oct 2019 03:13:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v5.4-rc2-299-gb6f03173ae19
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 214 builds: 0 failed, 214 passed,
 475 warnings (v5.4-rc2-299-gb6f03173ae19)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 214 builds: 0 failed, 214 passed, 475 warnings (v=
5.4-rc2-299-gb6f03173ae19)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc2-299-gb6f03173ae19/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc2-299-gb6f03173ae19
Git Commit: b6f03173ae19a33c2ead73ffc68f6d20de4d199a
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Warnings Detected:

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
    defconfig (gcc-8): 27 warnings

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
    eseries_pxa_defconfig (gcc-8): 2 warnings
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
    magician_defconfig (gcc-8): 2 warnings
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
    s3c2410_defconfig (gcc-8): 1 warning
    s3c6400_defconfig (gcc-8): 2 warnings
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
    zeus_defconfig (gcc-8): 2 warnings

i386:
    i386_defconfig (gcc-8): 27 warnings

mips:
    32r2el_defconfig (gcc-8): 27 warnings
    db1xxx_defconfig (gcc-8): 1 warning

riscv:
    defconfig (gcc-8): 27 warnings
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 27 warnings


Warnings summary:

    64   WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    26   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    6    sound/soc/soc-pcm.c:1149:8: warning: unused variable 'name' [-Wunu=
sed-variable]
    5    drivers/video/fbdev/sa1100fb.c:975:21: warning: 'sa1100fb_min_dma_=
period' defined but not used [-Wunused-function]
    4    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/uas.ko needs =
unknown symbol usb_stor_sense_invalidCDB
    4    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/uas.ko needs =
unknown symbol usb_stor_adjust_quirks
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/=
uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/=
uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_clear_halt
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko =
needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko=
 needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_CB_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko=
 needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.k=
o needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.=
ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko =
needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.=
ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko=
 needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.k=
o needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250=
.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.k=
o needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.k=
o needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko=
 needs unknown symbol fill_inquiry_response
    1    .config:1169:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.nnhjQ9UT5Q:3982:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.nnhjQ9UT5Q:3966:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.nnhjQ9UT5Q:3965:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.nnhjQ9UT5Q:3961:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.nnhjQ9UT5Q:3941:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.nnhjQ9UT5Q:3935:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.nnhjQ9UT5Q:3926:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.nnhjQ9UT5Q:3924:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.nnhjQ9UT5Q:3923:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.nnhjQ9UT5Q:3922:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.nnhjQ9UT5Q:3920:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.nnhjQ9UT5Q:3919:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.nnhjQ9UT5Q:3916:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.nnhjQ9UT5Q:3909:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.nnhjQ9UT5Q:3899:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.nnhjQ9UT5Q:3888:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.nnhjQ9UT5Q:3780:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.nnhjQ9UT5Q:3776:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.nnhjQ9UT5Q:3751:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.nnhjQ9UT5Q:3730:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.nnhjQ9UT5Q:3672:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.nnhjQ9UT5Q:3671:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.nnhjQ9UT5Q:3667:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.nnhjQ9UT5Q:3666:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.nnhjQ9UT5Q:3664:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.nnhjQ9UT5Q:3663:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.nnhjQ9UT5Q:3660:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.jMTAEkh0M7:7931:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.jMTAEkh0M7:7915:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.jMTAEkh0M7:7914:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.jMTAEkh0M7:7910:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.jMTAEkh0M7:7890:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.jMTAEkh0M7:7884:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.jMTAEkh0M7:7875:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.jMTAEkh0M7:7873:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.jMTAEkh0M7:7872:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.jMTAEkh0M7:7871:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.jMTAEkh0M7:7869:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.jMTAEkh0M7:7868:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.jMTAEkh0M7:7865:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.jMTAEkh0M7:7858:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.jMTAEkh0M7:7848:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.jMTAEkh0M7:7837:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.jMTAEkh0M7:7729:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.jMTAEkh0M7:7725:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.jMTAEkh0M7:7700:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.jMTAEkh0M7:7679:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.jMTAEkh0M7:7621:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.jMTAEkh0M7:7620:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.jMTAEkh0M7:7616:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.jMTAEkh0M7:7615:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.jMTAEkh0M7:7613:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.jMTAEkh0M7:7612:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.jMTAEkh0M7:7609:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Vaa78w1aZ0:4894:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Vaa78w1aZ0:4878:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Vaa78w1aZ0:4877:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.Vaa78w1aZ0:4873:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.Vaa78w1aZ0:4853:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.Vaa78w1aZ0:4847:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.Vaa78w1aZ0:4838:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.Vaa78w1aZ0:4836:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Vaa78w1aZ0:4835:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.Vaa78w1aZ0:4834:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.Vaa78w1aZ0:4832:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.Vaa78w1aZ0:4831:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.Vaa78w1aZ0:4828:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Vaa78w1aZ0:4821:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Vaa78w1aZ0:4811:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.Vaa78w1aZ0:4800:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Vaa78w1aZ0:4692:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.Vaa78w1aZ0:4688:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Vaa78w1aZ0:4663:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.Vaa78w1aZ0:4642:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Vaa78w1aZ0:4584:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.Vaa78w1aZ0:4583:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.Vaa78w1aZ0:4579:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.Vaa78w1aZ0:4578:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.Vaa78w1aZ0:4576:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.Vaa78w1aZ0:4575:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.Vaa78w1aZ0:4572:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.SsSiWRBVRF:3373:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.SsSiWRBVRF:3357:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.SsSiWRBVRF:3356:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.SsSiWRBVRF:3352:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.SsSiWRBVRF:3332:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.SsSiWRBVRF:3326:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.SsSiWRBVRF:3317:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.SsSiWRBVRF:3315:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.SsSiWRBVRF:3314:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.SsSiWRBVRF:3313:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.SsSiWRBVRF:3311:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.SsSiWRBVRF:3310:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.SsSiWRBVRF:3307:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.SsSiWRBVRF:3300:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.SsSiWRBVRF:3290:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.SsSiWRBVRF:3279:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.SsSiWRBVRF:3171:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.SsSiWRBVRF:3167:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.SsSiWRBVRF:3142:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.SsSiWRBVRF:3121:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.SsSiWRBVRF:3063:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.SsSiWRBVRF:3062:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.SsSiWRBVRF:3058:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.SsSiWRBVRF:3057:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.SsSiWRBVRF:3055:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.SsSiWRBVRF:3054:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.SsSiWRBVRF:3051:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.NxGGMFnIxm:8489:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.NxGGMFnIxm:8473:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.NxGGMFnIxm:8472:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.NxGGMFnIxm:8468:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.NxGGMFnIxm:8448:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.NxGGMFnIxm:8442:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.NxGGMFnIxm:8433:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.NxGGMFnIxm:8431:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.NxGGMFnIxm:8430:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.NxGGMFnIxm:8429:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.NxGGMFnIxm:8427:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.NxGGMFnIxm:8426:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.NxGGMFnIxm:8423:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.NxGGMFnIxm:8416:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.NxGGMFnIxm:8406:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.NxGGMFnIxm:8395:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.NxGGMFnIxm:8287:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.NxGGMFnIxm:8283:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.NxGGMFnIxm:8258:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.NxGGMFnIxm:8237:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.NxGGMFnIxm:8179:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.NxGGMFnIxm:8178:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.NxGGMFnIxm:8174:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.NxGGMFnIxm:8173:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.NxGGMFnIxm:8171:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.NxGGMFnIxm:8170:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.NxGGMFnIxm:8167:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ATiooz7Z5Y:4833:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ATiooz7Z5Y:4817:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ATiooz7Z5Y:4816:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.ATiooz7Z5Y:4812:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.ATiooz7Z5Y:4792:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.ATiooz7Z5Y:4786:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.ATiooz7Z5Y:4777:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.ATiooz7Z5Y:4775:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ATiooz7Z5Y:4774:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.ATiooz7Z5Y:4773:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.ATiooz7Z5Y:4771:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.ATiooz7Z5Y:4770:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.ATiooz7Z5Y:4767:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ATiooz7Z5Y:4760:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ATiooz7Z5Y:4750:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.ATiooz7Z5Y:4739:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ATiooz7Z5Y:4631:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.ATiooz7Z5Y:4627:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ATiooz7Z5Y:4602:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.ATiooz7Z5Y:4581:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ATiooz7Z5Y:4523:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.ATiooz7Z5Y:4522:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.ATiooz7Z5Y:4518:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.ATiooz7Z5Y:4517:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.ATiooz7Z5Y:4515:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.ATiooz7Z5Y:4514:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.ATiooz7Z5Y:4511:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.50kiP630B4:1746:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.50kiP630B4:1730:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.50kiP630B4:1729:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.50kiP630B4:1725:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.50kiP630B4:1705:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.50kiP630B4:1699:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.50kiP630B4:1690:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.50kiP630B4:1688:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.50kiP630B4:1687:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.50kiP630B4:1686:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.50kiP630B4:1684:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.50kiP630B4:1683:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.50kiP630B4:1680:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.50kiP630B4:1673:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.50kiP630B4:1663:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.50kiP630B4:1652:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.50kiP630B4:1544:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.50kiP630B4:1540:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.50kiP630B4:1515:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.50kiP630B4:1494:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.50kiP630B4:1436:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.50kiP630B4:1435:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.50kiP630B4:1431:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.50kiP630B4:1430:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.50kiP630B4:1428:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.50kiP630B4:1427:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.50kiP630B4:1424:warning: override: reassigning to sy=
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
    1    WARNING: vmlinux.o(.text.unlikely+0x3520): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    1    WARNING: vmlinux.o(.text.unlikely+0x31ac): Section mismatch in ref=
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
    ./.tmp.config.nnhjQ9UT5Q:3660:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.nnhjQ9UT5Q:3663:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.nnhjQ9UT5Q:3664:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.nnhjQ9UT5Q:3666:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.nnhjQ9UT5Q:3667:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.nnhjQ9UT5Q:3671:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.nnhjQ9UT5Q:3672:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.nnhjQ9UT5Q:3730:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.nnhjQ9UT5Q:3751:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.nnhjQ9UT5Q:3776:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.nnhjQ9UT5Q:3780:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.nnhjQ9UT5Q:3888:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.nnhjQ9UT5Q:3899:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.nnhjQ9UT5Q:3909:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.nnhjQ9UT5Q:3916:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.nnhjQ9UT5Q:3919:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.nnhjQ9UT5Q:3920:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.nnhjQ9UT5Q:3922:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.nnhjQ9UT5Q:3923:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.nnhjQ9UT5Q:3924:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.nnhjQ9UT5Q:3926:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.nnhjQ9UT5Q:3935:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.nnhjQ9UT5Q:3941:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.nnhjQ9UT5Q:3961:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.nnhjQ9UT5Q:3965:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.nnhjQ9UT5Q:3966:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.nnhjQ9UT5Q:3982:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
    sound/soc/soc-pcm.c:1149:8: warning: unused variable 'name' [-Wunused-v=
ariable]

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.SsSiWRBVRF:3051:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.SsSiWRBVRF:3054:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.SsSiWRBVRF:3055:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.SsSiWRBVRF:3057:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.SsSiWRBVRF:3058:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.SsSiWRBVRF:3062:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.SsSiWRBVRF:3063:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.SsSiWRBVRF:3121:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.SsSiWRBVRF:3142:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.SsSiWRBVRF:3167:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.SsSiWRBVRF:3171:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.SsSiWRBVRF:3279:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.SsSiWRBVRF:3290:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.SsSiWRBVRF:3300:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.SsSiWRBVRF:3307:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.SsSiWRBVRF:3310:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.SsSiWRBVRF:3311:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.SsSiWRBVRF:3313:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.SsSiWRBVRF:3314:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.SsSiWRBVRF:3315:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.SsSiWRBVRF:3317:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.SsSiWRBVRF:3326:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.SsSiWRBVRF:3332:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.SsSiWRBVRF:3352:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.SsSiWRBVRF:3356:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.SsSiWRBVRF:3357:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.SsSiWRBVRF:3373:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.jMTAEkh0M7:7609:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.jMTAEkh0M7:7612:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.jMTAEkh0M7:7613:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.jMTAEkh0M7:7615:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.jMTAEkh0M7:7616:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.jMTAEkh0M7:7620:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.jMTAEkh0M7:7621:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.jMTAEkh0M7:7679:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.jMTAEkh0M7:7700:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.jMTAEkh0M7:7725:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.jMTAEkh0M7:7729:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.jMTAEkh0M7:7837:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.jMTAEkh0M7:7848:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.jMTAEkh0M7:7858:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.jMTAEkh0M7:7865:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.jMTAEkh0M7:7868:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.jMTAEkh0M7:7869:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.jMTAEkh0M7:7871:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.jMTAEkh0M7:7872:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.jMTAEkh0M7:7873:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.jMTAEkh0M7:7875:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.jMTAEkh0M7:7884:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.jMTAEkh0M7:7890:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.jMTAEkh0M7:7910:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.jMTAEkh0M7:7914:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.jMTAEkh0M7:7915:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.jMTAEkh0M7:7931:warning: override: reassigning to symbol =
USER_NS

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
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1149:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 171 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-alauda.ko need=
s unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-cypress.ko nee=
ds unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-datafab.ko nee=
ds unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-eneub6250.ko n=
eeds unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-freecom.ko nee=
ds unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-isd200.ko need=
s unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-jumpshot.ko ne=
eds unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-karma.ko needs=
 unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-onetouch.ko ne=
eds unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-realtek.ko nee=
ds unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_CB_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr09.ko need=
s unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-sddr55.ko need=
s unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_clear_halt
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko needs=
 unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/ums-usbat.ko needs=
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
    ./.tmp.config.ATiooz7Z5Y:4511:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.ATiooz7Z5Y:4514:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.ATiooz7Z5Y:4515:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.ATiooz7Z5Y:4517:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.ATiooz7Z5Y:4518:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.ATiooz7Z5Y:4522:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.ATiooz7Z5Y:4523:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.ATiooz7Z5Y:4581:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.ATiooz7Z5Y:4602:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.ATiooz7Z5Y:4627:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.ATiooz7Z5Y:4631:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.ATiooz7Z5Y:4739:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.ATiooz7Z5Y:4750:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.ATiooz7Z5Y:4760:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.ATiooz7Z5Y:4767:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.ATiooz7Z5Y:4770:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.ATiooz7Z5Y:4771:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.ATiooz7Z5Y:4773:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.ATiooz7Z5Y:4774:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.ATiooz7Z5Y:4775:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.ATiooz7Z5Y:4777:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.ATiooz7Z5Y:4786:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.ATiooz7Z5Y:4792:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.ATiooz7Z5Y:4812:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.ATiooz7Z5Y:4816:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.ATiooz7Z5Y:4817:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.ATiooz7Z5Y:4833:warning: override: reassigning to symbol =
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
ip32_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1149:8: warning: unused variable 'name' [-Wunused-v=
ariable]

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
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/uas.ko needs unkno=
wn symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/uas.ko needs unkno=
wn symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 3 warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/uas.ko needs unkno=
wn symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/uas.ko needs unkno=
wn symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/uas.ko needs unkno=
wn symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/uas.ko needs unkno=
wn symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 =
warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@10/l=
inux/build/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/uas.k=
o needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@10/l=
inux/build/_modules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/uas.k=
o needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 29 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.NxGGMFnIxm:8167:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.NxGGMFnIxm:8170:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.NxGGMFnIxm:8171:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.NxGGMFnIxm:8173:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.NxGGMFnIxm:8174:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.NxGGMFnIxm:8178:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.NxGGMFnIxm:8179:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.NxGGMFnIxm:8237:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.NxGGMFnIxm:8258:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.NxGGMFnIxm:8283:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.NxGGMFnIxm:8287:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.NxGGMFnIxm:8395:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.NxGGMFnIxm:8406:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.NxGGMFnIxm:8416:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.NxGGMFnIxm:8423:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.NxGGMFnIxm:8426:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.NxGGMFnIxm:8427:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.NxGGMFnIxm:8429:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.NxGGMFnIxm:8430:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.NxGGMFnIxm:8431:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.NxGGMFnIxm:8433:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.NxGGMFnIxm:8442:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.NxGGMFnIxm:8448:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.NxGGMFnIxm:8468:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.NxGGMFnIxm:8472:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.NxGGMFnIxm:8473:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.NxGGMFnIxm:8489:warning: override: reassigning to symbol =
USER_NS
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/uas.ko needs unkno=
wn symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/uas.ko needs unkno=
wn symbol usb_stor_adjust_quirks

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
    ./.tmp.config.50kiP630B4:1424:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.50kiP630B4:1427:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.50kiP630B4:1428:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.50kiP630B4:1430:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.50kiP630B4:1431:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.50kiP630B4:1435:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.50kiP630B4:1436:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.50kiP630B4:1494:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.50kiP630B4:1515:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.50kiP630B4:1540:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.50kiP630B4:1544:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.50kiP630B4:1652:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.50kiP630B4:1663:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.50kiP630B4:1673:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.50kiP630B4:1680:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.50kiP630B4:1683:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.50kiP630B4:1684:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.50kiP630B4:1686:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.50kiP630B4:1687:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.50kiP630B4:1688:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.50kiP630B4:1690:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.50kiP630B4:1699:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.50kiP630B4:1705:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.50kiP630B4:1725:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.50kiP630B4:1729:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.50kiP630B4:1730:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.50kiP630B4:1746:warning: override: reassigning to symbol =
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
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    sound/soc/soc-pcm.c:1149:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1149:8: warning: unused variable 'name' [-Wunused-v=
ariable]

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
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1169:warning: override: UNWINDER_GUESS changes choice state

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
tinyconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
tinyconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

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
    ./.tmp.config.Vaa78w1aZ0:4572:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Vaa78w1aZ0:4575:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.Vaa78w1aZ0:4576:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.Vaa78w1aZ0:4578:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.Vaa78w1aZ0:4579:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.Vaa78w1aZ0:4583:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.Vaa78w1aZ0:4584:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.Vaa78w1aZ0:4642:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Vaa78w1aZ0:4663:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.Vaa78w1aZ0:4688:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Vaa78w1aZ0:4692:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.Vaa78w1aZ0:4800:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Vaa78w1aZ0:4811:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.Vaa78w1aZ0:4821:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Vaa78w1aZ0:4828:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Vaa78w1aZ0:4831:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.Vaa78w1aZ0:4832:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.Vaa78w1aZ0:4834:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.Vaa78w1aZ0:4835:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.Vaa78w1aZ0:4836:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Vaa78w1aZ0:4838:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.Vaa78w1aZ0:4847:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.Vaa78w1aZ0:4853:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.Vaa78w1aZ0:4873:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.Vaa78w1aZ0:4877:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.Vaa78w1aZ0:4878:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Vaa78w1aZ0:4894:warning: override: reassigning to symbol =
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
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1149:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
