Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06618DE876
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 11:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbfJUJt1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 05:49:27 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34431 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbfJUJt0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Oct 2019 05:49:26 -0400
Received: by mail-wr1-f68.google.com with SMTP id t16so8007538wrr.1
        for <linux-next@vger.kernel.org>; Mon, 21 Oct 2019 02:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=72foxednlzNSbUDB8TMOHqyvrNAevLS/UHiZke2hQHg=;
        b=dIslgRnjhpUCSe1ACadt4/B7RoT9+lUaqSW9T9hysNCr6/t/ydJ6Eb2o1PLhheiNTS
         FwseJeiK7x5AmjtZH6KNRruFGeTXa9psy4kThn8oDk4oSEvgG6/5yd9P4D97YpryTLdv
         t6JzaPlthzsxM+aKw00iKk7Ty8WfbFcuakY8qINKDQ62EsCskrkKrVvsCbfAh5O0BOBA
         d/sQ8NDJzLAosZvlGTRaS2Dk98HCqaApgaLWcBdJAMwooiqZpxYzQG+B5V1hSItA7YBD
         ckurVHL38AQHTTuToGK1OsvL8B2EzenFhAo+C4YoQxoJS7eIYw3zpP/H9cipvUdfvKpK
         lOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=72foxednlzNSbUDB8TMOHqyvrNAevLS/UHiZke2hQHg=;
        b=ABNUgCJVC0Vf6PpYxq1fvgUGSmBl0BUIjnup7vwtkP0jiNSUnn4zx6+iHK6DnjSVHo
         r7qJIUyAXyts/O3HKyhWwwiiCdxG6+j6gFBIHyu5FrR3Zi67TDXKbQK3QYbF1FVD4VVB
         hIhXfWsVO1m1lKfZs02Tdh8W0DhNhwmtJ5ccvqa3KihVO1uBl7OPzK51O+nZBBjhBQCO
         BWmLVB6VQW8SIAfRKpPyd1FSB6/rTVoQas3bYFcWukHwvjlnyTxRm79n4isNBA7/eZWT
         EsaXKqQMV3M+NsPHALqHSYKaBSn9+9P23rz1uuSIbTNhLmQb3NYsA8PVrIO9nhenEd0Y
         kFUQ==
X-Gm-Message-State: APjAAAUbbmAbS/q91PKNHa0atA0b8/ZbppyhzVifLk1l1cpITbncI8xE
        AOp8O70hfCLPlRMQeTumF1cK3sQqlH8=
X-Google-Smtp-Source: APXvYqw2MlHfJUX3w5qoxkxQVtqVY2UKrziCh5TL5gGYWHz8aYUvPc/qGMwWuS2rwexpdvyScZtJ7w==
X-Received: by 2002:adf:e302:: with SMTP id b2mr17854563wrj.298.1571651354490;
        Mon, 21 Oct 2019 02:49:14 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u1sm12976772wmc.38.2019.10.21.02.49.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 02:49:13 -0700 (PDT)
Message-ID: <5dad7f19.1c69fb81.5591c.079e@mx.google.com>
Date:   Mon, 21 Oct 2019 02:49:13 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20191021
Subject: next/master build: 219 builds: 6 failed, 213 passed, 25 errors,
 548 warnings (next-20191021)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 219 builds: 6 failed, 213 passed, 25 errors, 548 warning=
s (next-20191021)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191021/

Tree: next
Branch: master
Git Describe: next-20191021
Git Commit: a6fcdcd94927a1b24dea6a9951ffa7c64545ecfb
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-8) FAIL
    allmodconfig: (gcc-8) FAIL

mips:
    cavium_octeon_defconfig: (gcc-8) FAIL
    ci20_defconfig: (gcc-8) FAIL
    omega2p_defconfig: (gcc-8) FAIL
    vocore2_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 2 warnings
    axs103_smp_defconfig (gcc-8): 2 warnings
    haps_hs_defconfig (gcc-8): 2 warnings
    haps_hs_smp_defconfig (gcc-8): 2 warnings
    hsdk_defconfig (gcc-8): 2 warnings
    nsim_hs_defconfig (gcc-8): 2 warnings
    nsim_hs_defconfig (gcc-8): 30 warnings
    nsim_hs_smp_defconfig (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (clang-8): 9 errors, 46 warnings
    allmodconfig (gcc-8): 9 errors, 1 warning
    defconfig (gcc-8): 27 warnings

arm:
    allmodconfig (gcc-8): 18 warnings
    am200epdkit_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (gcc-8): 1 warning
    axm55xx_defconfig (gcc-8): 1 warning
    bcm2835_defconfig (gcc-8): 3 warnings
    cm_x2xx_defconfig (gcc-8): 1 warning
    cm_x300_defconfig (gcc-8): 1 warning
    cns3420vb_defconfig (gcc-8): 1 warning
    colibri_pxa270_defconfig (gcc-8): 1 warning
    colibri_pxa300_defconfig (gcc-8): 1 warning
    davinci_all_defconfig (gcc-8): 1 warning
    dove_defconfig (gcc-8): 1 warning
    em_x270_defconfig (gcc-8): 1 warning
    ep93xx_defconfig (gcc-8): 1 warning
    eseries_pxa_defconfig (gcc-8): 2 warnings
    exynos_defconfig (gcc-8): 171 warnings
    ezx_defconfig (gcc-8): 1 warning
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
    multi_v7_defconfig (gcc-8): 30 warnings
    mv78xx0_defconfig (gcc-8): 1 warning
    mvebu_v5_defconfig (gcc-8): 1 warning
    mvebu_v7_defconfig (gcc-8): 1 warning
    mxs_defconfig (gcc-8): 1 warning
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
    i386_defconfig (gcc-8): 28 warnings

mips:
    32r2el_defconfig (gcc-8): 28 warnings
    cavium_octeon_defconfig (gcc-8): 4 errors, 3 warnings
    ci20_defconfig (gcc-8): 1 error
    db1xxx_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    nlm_xlr_defconfig (gcc-8): 1 warning
    omega2p_defconfig (gcc-8): 1 error
    rbtx49xx_defconfig (gcc-8): 1 warning
    vocore2_defconfig (gcc-8): 1 error

riscv:
    defconfig (gcc-8): 27 warnings
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 27 warnings

Errors summary:

    3    include/linux/compiler.h:350:38: error: call to '__compiletime_ass=
ert_1659' declared with attribute error: BUILD_BUG_ON failed: stat_items_si=
ze !=3D ARRAY_SIZE(vmstat_text) * sizeof(unsigned long)
    2    ERROR: "dpdmai_set_rx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdm=
a.ko] undefined!
    2    ERROR: "dpdmai_reset" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] u=
ndefined!
    2    ERROR: "dpdmai_open" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] un=
defined!
    2    ERROR: "dpdmai_get_tx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdm=
a.ko] undefined!
    2    ERROR: "dpdmai_get_rx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdm=
a.ko] undefined!
    2    ERROR: "dpdmai_get_attributes" [drivers/dma/fsl-dpaa2-qdma/dpaa2-q=
dma.ko] undefined!
    2    ERROR: "dpdmai_enable" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] =
undefined!
    2    ERROR: "dpdmai_disable" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko]=
 undefined!
    2    ERROR: "dpdmai_close" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] u=
ndefined!
    1    drivers/staging/octeon/ethernet.c:516:29: error: type of formal pa=
rameter 2 is incomplete
    1    drivers/staging/octeon/ethernet.c:499:30: error: storage size of '=
link_info' isn't known
    1    drivers/staging/octeon/ethernet.c:463:30: error: storage size of '=
link_info' isn't known
    1    drivers/staging/octeon/ethernet.c:177:21: error: dereferencing poi=
nter to incomplete type 'struct cvmx_wqe'

Warnings summary:

    64   WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    26   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    15   1 warning generated.
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    6    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunu=
sed-variable]
    6    include/linux/kern_levels.h:5:18: warning: format '%lu' expects ar=
gument of type 'long unsigned int', but argument 8 has type 'unsigned int' =
[-Wformat=3D]
    5    2 warnings generated.
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    2    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/stora=
ge/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    2    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/stora=
ge/uas.ko needs unknown symbol usb_stor_adjust_quirks
    2    WARNING: modpost: missing MODULE_LICENSE() in drivers/dma/fsl-dpaa=
2-qdma/dpdmai.o
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:134: Warning: macro instruction expanded into mul=
tiple instructions
    1    warning: same module names found:
    1    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable 'rtd' [-=
Wunused-variable]
    1    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitia=
lized when used within its own initialization [-Wuninitialized]
    1    mm/shmem.c:2737:35: warning: variable 'shmem_falloc_waitq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    kernel/debug/debug_core.c:470:18: warning: array subscript [0, 0] =
is outside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]
    1    kernel/debug/debug_core.c:469:33: warning: array subscript [0, 0] =
is outside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]
    1    kernel/debug/debug_core.c:452:17: warning: array subscript [0, 0] =
is outside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]
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
    1    drivers/scsi/lpfc/lpfc_sli.c:11855:34: warning: variable 'done_q' =
is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/lpfc/lpfc_scsi.c:4722:34: warning: variable 'waitq' i=
s uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1    drivers/net/usb/lan78xx.c:2662:34: warning: variable 'unlink_wakeu=
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
    1    drivers/gpu/drm/amd/amdgpu/../powerplay/renoir_ppt.c:182:26: warni=
ng: suggest braces around initialization of subobject [-Wmissing-braces]
    1    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:148:25: warning: variable 'cfg=
' is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:148:20: warning: variable 'cmd=
' is uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/android/binderfs.c:657:41: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@9/linux/build/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@9/linux/build/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@4/linux/build/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@4/linux/build/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_clear_halt
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_CB_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol fill_inquiry_response
    1    /tmp/ccb67aGj.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccb67aGj.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1165:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.vw3mCjUfBG:1745:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vw3mCjUfBG:1728:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.vw3mCjUfBG:1727:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.vw3mCjUfBG:1723:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.vw3mCjUfBG:1703:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.vw3mCjUfBG:1697:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.vw3mCjUfBG:1688:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.vw3mCjUfBG:1686:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.vw3mCjUfBG:1685:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.vw3mCjUfBG:1684:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.vw3mCjUfBG:1682:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.vw3mCjUfBG:1681:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.vw3mCjUfBG:1678:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.vw3mCjUfBG:1671:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.vw3mCjUfBG:1661:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.vw3mCjUfBG:1650:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vw3mCjUfBG:1542:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.vw3mCjUfBG:1538:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vw3mCjUfBG:1513:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.vw3mCjUfBG:1492:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.vw3mCjUfBG:1434:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.vw3mCjUfBG:1433:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.vw3mCjUfBG:1429:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.vw3mCjUfBG:1428:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.vw3mCjUfBG:1426:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.vw3mCjUfBG:1425:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.vw3mCjUfBG:1422:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.vGhEl8Wvl4:4889:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vGhEl8Wvl4:4872:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.vGhEl8Wvl4:4871:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.vGhEl8Wvl4:4867:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.vGhEl8Wvl4:4847:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.vGhEl8Wvl4:4841:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.vGhEl8Wvl4:4832:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.vGhEl8Wvl4:4830:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.vGhEl8Wvl4:4829:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.vGhEl8Wvl4:4828:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.vGhEl8Wvl4:4826:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.vGhEl8Wvl4:4825:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.vGhEl8Wvl4:4822:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.vGhEl8Wvl4:4815:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.vGhEl8Wvl4:4805:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.vGhEl8Wvl4:4794:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vGhEl8Wvl4:4686:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.vGhEl8Wvl4:4682:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vGhEl8Wvl4:4657:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.vGhEl8Wvl4:4636:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.vGhEl8Wvl4:4578:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.vGhEl8Wvl4:4577:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.vGhEl8Wvl4:4573:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.vGhEl8Wvl4:4572:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.vGhEl8Wvl4:4570:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.vGhEl8Wvl4:4569:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.vGhEl8Wvl4:4566:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.nmz1DceE9X:7953:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.nmz1DceE9X:7936:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.nmz1DceE9X:7935:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.nmz1DceE9X:7931:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.nmz1DceE9X:7911:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.nmz1DceE9X:7905:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.nmz1DceE9X:7896:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.nmz1DceE9X:7894:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.nmz1DceE9X:7893:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.nmz1DceE9X:7892:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.nmz1DceE9X:7890:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.nmz1DceE9X:7889:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.nmz1DceE9X:7886:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.nmz1DceE9X:7879:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.nmz1DceE9X:7869:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.nmz1DceE9X:7858:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.nmz1DceE9X:7750:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.nmz1DceE9X:7746:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.nmz1DceE9X:7721:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.nmz1DceE9X:7700:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.nmz1DceE9X:7642:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.nmz1DceE9X:7641:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.nmz1DceE9X:7637:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.nmz1DceE9X:7636:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.nmz1DceE9X:7634:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.nmz1DceE9X:7633:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.nmz1DceE9X:7630:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.iSnOR7bhNw:3365:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.iSnOR7bhNw:3348:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.iSnOR7bhNw:3347:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.iSnOR7bhNw:3343:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.iSnOR7bhNw:3323:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.iSnOR7bhNw:3317:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.iSnOR7bhNw:3308:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.iSnOR7bhNw:3306:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.iSnOR7bhNw:3305:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.iSnOR7bhNw:3304:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.iSnOR7bhNw:3302:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.iSnOR7bhNw:3301:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.iSnOR7bhNw:3298:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.iSnOR7bhNw:3291:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.iSnOR7bhNw:3281:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.iSnOR7bhNw:3270:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.iSnOR7bhNw:3162:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.iSnOR7bhNw:3158:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.iSnOR7bhNw:3133:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.iSnOR7bhNw:3112:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.iSnOR7bhNw:3054:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.iSnOR7bhNw:3053:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.iSnOR7bhNw:3049:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.iSnOR7bhNw:3048:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.iSnOR7bhNw:3046:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.iSnOR7bhNw:3045:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.iSnOR7bhNw:3042:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.QC0gDOAXVp:3979:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.QC0gDOAXVp:3962:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.QC0gDOAXVp:3961:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.QC0gDOAXVp:3957:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.QC0gDOAXVp:3937:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.QC0gDOAXVp:3931:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.QC0gDOAXVp:3922:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.QC0gDOAXVp:3920:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.QC0gDOAXVp:3919:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.QC0gDOAXVp:3918:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.QC0gDOAXVp:3916:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.QC0gDOAXVp:3915:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.QC0gDOAXVp:3912:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.QC0gDOAXVp:3905:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.QC0gDOAXVp:3895:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.QC0gDOAXVp:3884:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.QC0gDOAXVp:3776:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.QC0gDOAXVp:3772:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.QC0gDOAXVp:3747:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.QC0gDOAXVp:3726:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.QC0gDOAXVp:3668:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.QC0gDOAXVp:3667:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.QC0gDOAXVp:3663:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.QC0gDOAXVp:3662:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.QC0gDOAXVp:3660:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.QC0gDOAXVp:3659:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.QC0gDOAXVp:3656:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Q89c87CZ76:4826:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Q89c87CZ76:4809:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Q89c87CZ76:4808:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.Q89c87CZ76:4804:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.Q89c87CZ76:4784:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.Q89c87CZ76:4778:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.Q89c87CZ76:4769:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.Q89c87CZ76:4767:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Q89c87CZ76:4766:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.Q89c87CZ76:4765:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.Q89c87CZ76:4763:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.Q89c87CZ76:4762:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.Q89c87CZ76:4759:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Q89c87CZ76:4752:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Q89c87CZ76:4742:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.Q89c87CZ76:4731:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Q89c87CZ76:4623:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.Q89c87CZ76:4619:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Q89c87CZ76:4594:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.Q89c87CZ76:4573:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Q89c87CZ76:4515:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.Q89c87CZ76:4514:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.Q89c87CZ76:4510:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.Q89c87CZ76:4509:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.Q89c87CZ76:4507:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.Q89c87CZ76:4506:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.Q89c87CZ76:4503:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Lg4nl5GY7B:8529:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Lg4nl5GY7B:8512:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Lg4nl5GY7B:8511:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.Lg4nl5GY7B:8507:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.Lg4nl5GY7B:8487:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.Lg4nl5GY7B:8481:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.Lg4nl5GY7B:8472:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.Lg4nl5GY7B:8470:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Lg4nl5GY7B:8469:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.Lg4nl5GY7B:8468:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.Lg4nl5GY7B:8466:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.Lg4nl5GY7B:8465:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.Lg4nl5GY7B:8462:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.Lg4nl5GY7B:8455:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.Lg4nl5GY7B:8445:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.Lg4nl5GY7B:8434:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Lg4nl5GY7B:8326:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.Lg4nl5GY7B:8322:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.Lg4nl5GY7B:8297:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.Lg4nl5GY7B:8276:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.Lg4nl5GY7B:8218:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.Lg4nl5GY7B:8217:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.Lg4nl5GY7B:8213:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.Lg4nl5GY7B:8212:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.Lg4nl5GY7B:8210:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.Lg4nl5GY7B:8209:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.Lg4nl5GY7B:8206:warning: override: reassigning to sy=
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
    1    WARNING: vmlinux.o(.text.unlikely+0x3630): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    1    WARNING: vmlinux.o(.text.unlikely+0x3320): Section mismatch in ref=
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
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 28 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.QC0gDOAXVp:3656:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.QC0gDOAXVp:3659:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.QC0gDOAXVp:3660:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.QC0gDOAXVp:3662:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.QC0gDOAXVp:3663:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.QC0gDOAXVp:3667:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.QC0gDOAXVp:3668:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.QC0gDOAXVp:3726:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.QC0gDOAXVp:3747:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.QC0gDOAXVp:3772:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.QC0gDOAXVp:3776:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.QC0gDOAXVp:3884:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.QC0gDOAXVp:3895:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.QC0gDOAXVp:3905:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.QC0gDOAXVp:3912:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.QC0gDOAXVp:3915:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.QC0gDOAXVp:3916:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.QC0gDOAXVp:3918:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.QC0gDOAXVp:3919:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.QC0gDOAXVp:3920:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.QC0gDOAXVp:3922:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.QC0gDOAXVp:3931:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.QC0gDOAXVp:3937:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.QC0gDOAXVp:3957:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.QC0gDOAXVp:3961:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.QC0gDOAXVp:3962:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.QC0gDOAXVp:3979:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 FAIL, 9 errors, 46 warnings, 0 sect=
ion mismatches

Errors:
    ERROR: "dpdmai_reset" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] undefi=
ned!
    ERROR: "dpdmai_set_rx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko]=
 undefined!
    ERROR: "dpdmai_get_tx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko]=
 undefined!
    ERROR: "dpdmai_get_rx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko]=
 undefined!
    ERROR: "dpdmai_get_attributes" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.k=
o] undefined!
    ERROR: "dpdmai_open" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] undefin=
ed!
    ERROR: "dpdmai_disable" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] unde=
fined!
    ERROR: "dpdmai_close" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] undefi=
ned!
    ERROR: "dpdmai_enable" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] undef=
ined!

Warnings:
    mm/shmem.c:2737:35: warning: variable 'shmem_falloc_waitq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
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
    drivers/android/binderfs.c:657:41: warning: suggest braces around initi=
alization of subobject [-Wmissing-braces]
    1 warning generated.
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
    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:148:20: warning: variable 'cmd' is =
uninitialized when used within its own initialization [-Wuninitialized]
    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:148:25: warning: variable 'cfg' is =
uninitialized when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when used =
within its own initialization [-Wuninitialized]
    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when used=
 within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/gpu/drm/amd/amdgpu/../powerplay/renoir_ppt.c:182:26: warning: s=
uggest braces around initialization of subobject [-Wmissing-braces]
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
    drivers/misc/mic/vop/vop_vringh.c:155:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    drivers/misc/mic/vop/vop_vringh.c:399:34: warning: variable 'wake' is u=
ninitialized when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/net/usb/lan78xx.c:2662:34: warning: variable 'unlink_wakeup' is=
 uninitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/scsi/bfa/bfad_im.c:301:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    drivers/scsi/bfa/bfad_im.c:378:34: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/scsi/lpfc/lpfc_sli.c:11855:34: warning: variable 'done_q' is un=
initialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/scsi/lpfc/lpfc_scsi.c:4722:34: warning: variable 'waitq' is uni=
nitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    WARNING: modpost: missing MODULE_LICENSE() in drivers/dma/fsl-dpaa2-qdm=
a/dpdmai.o

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 18 warnings, 0 section =
mismatches

Warnings:
    /tmp/ccb67aGj.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccb67aGj.s:18191: Warning: using r15 results in unpredictable beha=
viour
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
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
    warning: same module names found:

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 9 errors, 1 warning, 0 section =
mismatches

Errors:
    ERROR: "dpdmai_enable" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] undef=
ined!
    ERROR: "dpdmai_set_rx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko]=
 undefined!
    ERROR: "dpdmai_get_tx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko]=
 undefined!
    ERROR: "dpdmai_get_rx_queue" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko]=
 undefined!
    ERROR: "dpdmai_get_attributes" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.k=
o] undefined!
    ERROR: "dpdmai_open" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] undefin=
ed!
    ERROR: "dpdmai_close" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] undefi=
ned!
    ERROR: "dpdmai_disable" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] unde=
fined!
    ERROR: "dpdmai_reset" [drivers/dma/fsl-dpaa2-qdma/dpaa2-qdma.ko] undefi=
ned!

Warnings:
    WARNING: modpost: missing MODULE_LICENSE() in drivers/dma/fsl-dpaa2-qdm=
a/dpdmai.o

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
allnoconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---------------------------------------------------------------------------=
-----
allnoconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/debug/debug_core.c:452:17: warning: array subscript [0, 0] is ou=
tside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]
    kernel/debug/debug_core.c:469:33: warning: array subscript [0, 0] is ou=
tside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]
    kernel/debug/debug_core.c:470:18: warning: array subscript [0, 0] is ou=
tside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]

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
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 FAIL, 4 errors, 3 warnings,=
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
    drivers/staging/octeon/octeon-ethernet.h:94:12: warning: 'union cvmx_he=
lper_link_info' declared inside parameter list will not be visible outside =
of this definition or declaration
    drivers/staging/octeon/ethernet.c:463:30: warning: unused variable 'lin=
k_info' [-Wunused-variable]
    drivers/staging/octeon/ethernet.c:499:30: warning: unused variable 'lin=
k_info' [-Wunused-variable]

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
ci20_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    include/linux/compiler.h:350:38: error: call to '__compiletime_assert_1=
659' declared with attribute error: BUILD_BUG_ON failed: stat_items_size !=
=3D ARRAY_SIZE(vmstat_text) * sizeof(unsigned long)

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
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 s=
ection mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
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
    WARNING: vmlinux.o(.text.unlikely+0x3630): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3320): Section mismatch in referenc=
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
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.iSnOR7bhNw:3042:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.iSnOR7bhNw:3045:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.iSnOR7bhNw:3046:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.iSnOR7bhNw:3048:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.iSnOR7bhNw:3049:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.iSnOR7bhNw:3053:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.iSnOR7bhNw:3054:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.iSnOR7bhNw:3112:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.iSnOR7bhNw:3133:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.iSnOR7bhNw:3158:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.iSnOR7bhNw:3162:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.iSnOR7bhNw:3270:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.iSnOR7bhNw:3281:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.iSnOR7bhNw:3291:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.iSnOR7bhNw:3298:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.iSnOR7bhNw:3301:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.iSnOR7bhNw:3302:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.iSnOR7bhNw:3304:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.iSnOR7bhNw:3305:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.iSnOR7bhNw:3306:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.iSnOR7bhNw:3308:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.iSnOR7bhNw:3317:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.iSnOR7bhNw:3323:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.iSnOR7bhNw:3343:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.iSnOR7bhNw:3347:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.iSnOR7bhNw:3348:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.iSnOR7bhNw:3365:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.nmz1DceE9X:7630:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.nmz1DceE9X:7633:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.nmz1DceE9X:7634:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.nmz1DceE9X:7636:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.nmz1DceE9X:7637:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.nmz1DceE9X:7641:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.nmz1DceE9X:7642:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.nmz1DceE9X:7700:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.nmz1DceE9X:7721:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.nmz1DceE9X:7746:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.nmz1DceE9X:7750:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.nmz1DceE9X:7858:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.nmz1DceE9X:7869:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.nmz1DceE9X:7879:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.nmz1DceE9X:7886:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.nmz1DceE9X:7889:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.nmz1DceE9X:7890:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.nmz1DceE9X:7892:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.nmz1DceE9X:7893:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.nmz1DceE9X:7894:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.nmz1DceE9X:7896:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.nmz1DceE9X:7905:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.nmz1DceE9X:7911:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.nmz1DceE9X:7931:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.nmz1DceE9X:7935:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.nmz1DceE9X:7936:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.nmz1DceE9X:7953:warning: override: reassigning to symbol =
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
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 171 warnings, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_CB_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_clear_halt
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_set_xfer_buf

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
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 28 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.Q89c87CZ76:4503:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Q89c87CZ76:4506:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.Q89c87CZ76:4507:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.Q89c87CZ76:4509:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.Q89c87CZ76:4510:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.Q89c87CZ76:4514:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.Q89c87CZ76:4515:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.Q89c87CZ76:4573:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Q89c87CZ76:4594:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.Q89c87CZ76:4619:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Q89c87CZ76:4623:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.Q89c87CZ76:4731:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Q89c87CZ76:4742:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.Q89c87CZ76:4752:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Q89c87CZ76:4759:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Q89c87CZ76:4762:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.Q89c87CZ76:4763:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.Q89c87CZ76:4765:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.Q89c87CZ76:4766:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.Q89c87CZ76:4767:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Q89c87CZ76:4769:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.Q89c87CZ76:4778:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.Q89c87CZ76:4784:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.Q89c87CZ76:4804:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.Q89c87CZ76:4808:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.Q89c87CZ76:4809:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Q89c87CZ76:4826:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]

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
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
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
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ua=
s.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ua=
s.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 3 warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@4/li=
nux/build/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@4/li=
nux/build/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@9/li=
nux/build/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@9/li=
nux/build/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 =
warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ua=
s.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/storage/ua=
s.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 30 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.Lg4nl5GY7B:8206:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Lg4nl5GY7B:8209:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.Lg4nl5GY7B:8210:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.Lg4nl5GY7B:8212:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.Lg4nl5GY7B:8213:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.Lg4nl5GY7B:8217:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.Lg4nl5GY7B:8218:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.Lg4nl5GY7B:8276:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Lg4nl5GY7B:8297:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.Lg4nl5GY7B:8322:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Lg4nl5GY7B:8326:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.Lg4nl5GY7B:8434:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.Lg4nl5GY7B:8445:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.Lg4nl5GY7B:8455:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Lg4nl5GY7B:8462:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.Lg4nl5GY7B:8465:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.Lg4nl5GY7B:8466:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.Lg4nl5GY7B:8468:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.Lg4nl5GY7B:8469:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.Lg4nl5GY7B:8470:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.Lg4nl5GY7B:8472:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.Lg4nl5GY7B:8481:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.Lg4nl5GY7B:8487:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.Lg4nl5GY7B:8507:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.Lg4nl5GY7B:8511:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.Lg4nl5GY7B:8512:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.Lg4nl5GY7B:8529:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.4.0-rc4-next-20191021/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_adjust_quirks

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
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 30 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.vw3mCjUfBG:1422:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.vw3mCjUfBG:1425:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.vw3mCjUfBG:1426:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.vw3mCjUfBG:1428:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.vw3mCjUfBG:1429:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.vw3mCjUfBG:1433:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.vw3mCjUfBG:1434:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.vw3mCjUfBG:1492:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.vw3mCjUfBG:1513:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.vw3mCjUfBG:1538:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.vw3mCjUfBG:1542:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.vw3mCjUfBG:1650:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.vw3mCjUfBG:1661:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.vw3mCjUfBG:1671:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.vw3mCjUfBG:1678:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.vw3mCjUfBG:1681:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.vw3mCjUfBG:1682:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.vw3mCjUfBG:1684:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.vw3mCjUfBG:1685:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.vw3mCjUfBG:1686:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.vw3mCjUfBG:1688:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.vw3mCjUfBG:1697:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.vw3mCjUfBG:1703:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.vw3mCjUfBG:1723:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.vw3mCjUfBG:1727:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.vw3mCjUfBG:1728:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.vw3mCjUfBG:1745:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]

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
omega2p_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/compiler.h:350:38: error: call to '__compiletime_assert_1=
659' declared with attribute error: BUILD_BUG_ON failed: stat_items_size !=
=3D ARRAY_SIZE(vmstat_text) * sizeof(unsigned long)

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
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
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
    .config:1165:warning: override: UNWINDER_GUESS changes choice state

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
vocore2_defconfig (mips, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    include/linux/compiler.h:350:38: error: call to '__compiletime_assert_1=
659' declared with attribute error: BUILD_BUG_ON failed: stat_items_size !=
=3D ARRAY_SIZE(vmstat_text) * sizeof(unsigned long)

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
    ./.tmp.config.vGhEl8Wvl4:4566:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.vGhEl8Wvl4:4569:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.vGhEl8Wvl4:4570:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.vGhEl8Wvl4:4572:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.vGhEl8Wvl4:4573:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.vGhEl8Wvl4:4577:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.vGhEl8Wvl4:4578:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.vGhEl8Wvl4:4636:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.vGhEl8Wvl4:4657:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.vGhEl8Wvl4:4682:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.vGhEl8Wvl4:4686:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.vGhEl8Wvl4:4794:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.vGhEl8Wvl4:4805:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.vGhEl8Wvl4:4815:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.vGhEl8Wvl4:4822:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.vGhEl8Wvl4:4825:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.vGhEl8Wvl4:4826:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.vGhEl8Wvl4:4828:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.vGhEl8Wvl4:4829:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.vGhEl8Wvl4:4830:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.vGhEl8Wvl4:4832:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.vGhEl8Wvl4:4841:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.vGhEl8Wvl4:4847:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.vGhEl8Wvl4:4867:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.vGhEl8Wvl4:4871:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.vGhEl8Wvl4:4872:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.vGhEl8Wvl4:4889:warning: override: reassigning to symbol =
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
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
