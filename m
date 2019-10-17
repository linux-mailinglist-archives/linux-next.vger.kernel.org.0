Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 176EBDA683
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2019 09:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730089AbfJQHdd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Oct 2019 03:33:33 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44814 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbfJQHdc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Oct 2019 03:33:32 -0400
Received: by mail-wr1-f67.google.com with SMTP id z9so1055343wrl.11
        for <linux-next@vger.kernel.org>; Thu, 17 Oct 2019 00:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cP1TemwquRUE1TibynS2nP76Bodl6ntfrddS4YDJ76Q=;
        b=RvQ16KjpoNYJgX0TcoFRltLB6UFOIPb64sgoA0+v+Sftn6upBYRY/EepraZjaIHm9T
         cQqM3CzCYfTXPxm85PM604yRoT5A8st7rO97hvRqmWx3e157uRoU7RQ0SEm0rvTCS8X+
         JHD01Fqq1RNSdWO/1jNKcXFw6OpRL8xruNwl9DTCZ66Ix2OnQvExLqySExfz0Lm65Evl
         G+SUvm5U480j3GwBe6rMys3cRf/q6eBwHEwNaMsReOByFozKiSVYN1viPp0Fl/eR5pWE
         mtihuEvkqDIRTHcefnwgujWqI855wkPwcy4yVJ2En2a90RuJiPsVZWAPEx/aR2y3JL3Q
         bFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cP1TemwquRUE1TibynS2nP76Bodl6ntfrddS4YDJ76Q=;
        b=pzu8mIMNa+7LiuEP9Wm9GPdpQb8UlcG8wyewWzerav/u4Ftfu9anji7M1dglz1SRmi
         JYO8riz+sl1/cz8jMMrBbdcqp9XrwBjJQRqvkMZOoOm3MLD8O3VPmSyO1c1Ax3W87HP0
         2bM6AJu7OkQOyZE8gbqOQhbV26Aw/YcpYNeZ0HPuQGXzroRFHoQzE/vpCHEMCCfj/a7O
         febh02i0l4fl7l1Xm7jcdi1xOLZzTYcJ2ldI9qnjlwsMZo6YB6SvdfA74rn1fGf/tJT7
         A7LGfEC/Z+UebZCixADHFRMF9SqiVc+FJi/3Sd5bLmdaSPCU2/1AW/LiCLZsCuvTVbT8
         jxig==
X-Gm-Message-State: APjAAAVXX7HPHlgwhtiCpbx5pp7p9ikVJw+M486G6YOU8ltglg4fTBu1
        FC1yDCt5S9ZbNFRfi3iICzzdahy0z18=
X-Google-Smtp-Source: APXvYqxjjnfZF9fkpwNR9lXaSMAkSp8nVyLUM5rPTkXvjTkJL6ZtXUDm2QDGkIWHjpcaB7tOcT4hFQ==
X-Received: by 2002:a5d:4b4c:: with SMTP id w12mr1607375wrs.107.1571297597026;
        Thu, 17 Oct 2019 00:33:17 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 63sm1371378wri.25.2019.10.17.00.33.13
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 00:33:15 -0700 (PDT)
Message-ID: <5da8193b.1c69fb81.4741.6070@mx.google.com>
Date:   Thu, 17 Oct 2019 00:33:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20191017
Subject: next/master build: 219 builds: 1 failed, 218 passed, 4 errors,
 543 warnings (next-20191017)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 219 builds: 1 failed, 218 passed, 4 errors, 543 warnings=
 (next-20191017)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191017/

Tree: next
Branch: master
Git Describe: next-20191017
Git Commit: 3ef845da3c3b180ddd386e228ac3228d84a522d3
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failure Detected:

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
    nsim_hs_defconfig (gcc-8): 30 warnings
    nsim_hs_smp_defconfig (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (clang-8): 42 warnings
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
    db1xxx_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    nlm_xlr_defconfig (gcc-8): 1 warning
    rbtx49xx_defconfig (gcc-8): 1 warning

riscv:
    defconfig (gcc-8): 27 warnings
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 27 warnings

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
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    4    2 warnings generated.
    2    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    2    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
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
    1    drivers/scsi/lpfc/lpfc_scsi.c:4724:34: warning: variable 'waitq' i=
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
    1    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    drivers/android/binderfs.c:657:41: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@5/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@5/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_clear_halt
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-usbat.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr55.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_CB_transport
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-sddr09.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-realtek.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_host_template_in=
it
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-onetouch.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-karma.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_host_template_in=
it
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-jumpshot.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_transparent_scsi_c=
ommand
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-isd200.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-freecom.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_host_template_i=
nit
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_b=
uf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-eneub6250.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-datafab.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_transparent_scsi_=
command
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-cypress.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers=
/usb/storage/ums-alauda.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/driver=
s/usb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/driver=
s/usb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/storage=
/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/storage=
/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    /tmp/cc5HljV1.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/cc5HljV1.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    .config:1165:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.v8rjQU88W5:3978:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.v8rjQU88W5:3961:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.v8rjQU88W5:3960:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.v8rjQU88W5:3956:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.v8rjQU88W5:3936:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.v8rjQU88W5:3930:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.v8rjQU88W5:3921:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.v8rjQU88W5:3919:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.v8rjQU88W5:3918:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.v8rjQU88W5:3917:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.v8rjQU88W5:3915:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.v8rjQU88W5:3914:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.v8rjQU88W5:3911:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.v8rjQU88W5:3904:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.v8rjQU88W5:3894:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.v8rjQU88W5:3883:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.v8rjQU88W5:3775:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.v8rjQU88W5:3771:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.v8rjQU88W5:3746:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.v8rjQU88W5:3725:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.v8rjQU88W5:3667:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.v8rjQU88W5:3666:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.v8rjQU88W5:3662:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.v8rjQU88W5:3661:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.v8rjQU88W5:3659:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.v8rjQU88W5:3658:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.v8rjQU88W5:3655:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.toJ6TZGr4j:3364:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.toJ6TZGr4j:3347:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.toJ6TZGr4j:3346:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.toJ6TZGr4j:3342:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.toJ6TZGr4j:3322:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.toJ6TZGr4j:3316:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.toJ6TZGr4j:3307:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.toJ6TZGr4j:3305:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.toJ6TZGr4j:3304:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.toJ6TZGr4j:3303:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.toJ6TZGr4j:3301:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.toJ6TZGr4j:3300:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.toJ6TZGr4j:3297:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.toJ6TZGr4j:3290:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.toJ6TZGr4j:3280:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.toJ6TZGr4j:3269:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.toJ6TZGr4j:3161:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.toJ6TZGr4j:3157:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.toJ6TZGr4j:3132:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.toJ6TZGr4j:3111:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.toJ6TZGr4j:3053:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.toJ6TZGr4j:3052:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.toJ6TZGr4j:3048:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.toJ6TZGr4j:3047:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.toJ6TZGr4j:3045:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.toJ6TZGr4j:3044:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.toJ6TZGr4j:3041:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.j58FbvncJ4:8529:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.j58FbvncJ4:8512:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.j58FbvncJ4:8511:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.j58FbvncJ4:8507:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.j58FbvncJ4:8487:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.j58FbvncJ4:8481:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.j58FbvncJ4:8472:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.j58FbvncJ4:8470:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.j58FbvncJ4:8469:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.j58FbvncJ4:8468:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.j58FbvncJ4:8466:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.j58FbvncJ4:8465:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.j58FbvncJ4:8462:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.j58FbvncJ4:8455:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.j58FbvncJ4:8445:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.j58FbvncJ4:8434:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.j58FbvncJ4:8326:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.j58FbvncJ4:8322:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.j58FbvncJ4:8297:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.j58FbvncJ4:8276:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.j58FbvncJ4:8218:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.j58FbvncJ4:8217:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.j58FbvncJ4:8213:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.j58FbvncJ4:8212:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.j58FbvncJ4:8210:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.j58FbvncJ4:8209:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.j58FbvncJ4:8206:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.dC8Br4FkIZ:7953:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.dC8Br4FkIZ:7936:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.dC8Br4FkIZ:7935:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.dC8Br4FkIZ:7931:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.dC8Br4FkIZ:7911:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.dC8Br4FkIZ:7905:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.dC8Br4FkIZ:7896:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.dC8Br4FkIZ:7894:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.dC8Br4FkIZ:7893:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.dC8Br4FkIZ:7892:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.dC8Br4FkIZ:7890:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.dC8Br4FkIZ:7889:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.dC8Br4FkIZ:7886:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.dC8Br4FkIZ:7879:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.dC8Br4FkIZ:7869:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.dC8Br4FkIZ:7858:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.dC8Br4FkIZ:7750:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.dC8Br4FkIZ:7746:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.dC8Br4FkIZ:7721:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.dC8Br4FkIZ:7700:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.dC8Br4FkIZ:7642:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.dC8Br4FkIZ:7641:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.dC8Br4FkIZ:7637:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.dC8Br4FkIZ:7636:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.dC8Br4FkIZ:7634:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.dC8Br4FkIZ:7633:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.dC8Br4FkIZ:7630:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.LoaMrzRIu0:4890:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.LoaMrzRIu0:4873:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.LoaMrzRIu0:4872:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.LoaMrzRIu0:4868:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.LoaMrzRIu0:4848:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.LoaMrzRIu0:4842:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.LoaMrzRIu0:4833:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.LoaMrzRIu0:4831:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.LoaMrzRIu0:4830:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.LoaMrzRIu0:4829:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.LoaMrzRIu0:4827:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.LoaMrzRIu0:4826:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.LoaMrzRIu0:4823:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.LoaMrzRIu0:4816:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.LoaMrzRIu0:4806:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.LoaMrzRIu0:4795:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.LoaMrzRIu0:4687:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.LoaMrzRIu0:4683:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.LoaMrzRIu0:4658:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.LoaMrzRIu0:4637:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.LoaMrzRIu0:4579:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.LoaMrzRIu0:4578:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.LoaMrzRIu0:4574:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.LoaMrzRIu0:4573:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.LoaMrzRIu0:4571:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.LoaMrzRIu0:4570:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.LoaMrzRIu0:4567:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.EY2Rvtxmhn:4827:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.EY2Rvtxmhn:4810:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.EY2Rvtxmhn:4809:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.EY2Rvtxmhn:4805:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.EY2Rvtxmhn:4785:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.EY2Rvtxmhn:4779:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.EY2Rvtxmhn:4770:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.EY2Rvtxmhn:4768:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.EY2Rvtxmhn:4767:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.EY2Rvtxmhn:4766:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.EY2Rvtxmhn:4764:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.EY2Rvtxmhn:4763:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.EY2Rvtxmhn:4760:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.EY2Rvtxmhn:4753:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.EY2Rvtxmhn:4743:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.EY2Rvtxmhn:4732:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.EY2Rvtxmhn:4624:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.EY2Rvtxmhn:4620:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.EY2Rvtxmhn:4595:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.EY2Rvtxmhn:4574:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.EY2Rvtxmhn:4516:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.EY2Rvtxmhn:4515:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.EY2Rvtxmhn:4511:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.EY2Rvtxmhn:4510:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.EY2Rvtxmhn:4508:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.EY2Rvtxmhn:4507:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.EY2Rvtxmhn:4504:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.3TG78uYdtM:1744:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.3TG78uYdtM:1727:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.3TG78uYdtM:1726:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.3TG78uYdtM:1722:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.3TG78uYdtM:1702:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.3TG78uYdtM:1696:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.3TG78uYdtM:1687:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.3TG78uYdtM:1685:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.3TG78uYdtM:1684:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.3TG78uYdtM:1683:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.3TG78uYdtM:1681:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.3TG78uYdtM:1680:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.3TG78uYdtM:1677:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.3TG78uYdtM:1670:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.3TG78uYdtM:1660:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.3TG78uYdtM:1649:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.3TG78uYdtM:1541:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.3TG78uYdtM:1537:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.3TG78uYdtM:1512:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.3TG78uYdtM:1491:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.3TG78uYdtM:1433:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.3TG78uYdtM:1432:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.3TG78uYdtM:1428:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.3TG78uYdtM:1427:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.3TG78uYdtM:1425:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.3TG78uYdtM:1424:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.3TG78uYdtM:1421:warning: override: reassigning to sy=
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
    ./.tmp.config.v8rjQU88W5:3655:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.v8rjQU88W5:3658:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.v8rjQU88W5:3659:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.v8rjQU88W5:3661:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.v8rjQU88W5:3662:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.v8rjQU88W5:3666:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.v8rjQU88W5:3667:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.v8rjQU88W5:3725:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.v8rjQU88W5:3746:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.v8rjQU88W5:3771:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.v8rjQU88W5:3775:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.v8rjQU88W5:3883:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.v8rjQU88W5:3894:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.v8rjQU88W5:3904:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.v8rjQU88W5:3911:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.v8rjQU88W5:3914:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.v8rjQU88W5:3915:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.v8rjQU88W5:3917:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.v8rjQU88W5:3918:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.v8rjQU88W5:3919:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.v8rjQU88W5:3921:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.v8rjQU88W5:3930:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.v8rjQU88W5:3936:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.v8rjQU88W5:3956:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.v8rjQU88W5:3960:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.v8rjQU88W5:3961:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.v8rjQU88W5:3978:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 18 warnings, 0 section =
mismatches

Warnings:
    /tmp/cc5HljV1.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/cc5HljV1.s:18191: Warning: using r15 results in unpredictable beha=
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
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 42 warnings, 0 sect=
ion mismatches

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
    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when used =
within its own initialization [-Wuninitialized]
    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when used=
 within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/gpu/host1x/syncpt.c:208:34: warning: variable 'wq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/gpu/drm/amd/amdgpu/../powerplay/renoir_ppt.c:182:26: warning: s=
uggest braces around initialization of subobject [-Wmissing-braces]
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
    drivers/scsi/lpfc/lpfc_scsi.c:4724:34: warning: variable 'waitq' is uni=
nitialized when used within its own initialization [-Wuninitialized]
    1 warning generated.

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
    ./.tmp.config.toJ6TZGr4j:3041:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.toJ6TZGr4j:3044:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.toJ6TZGr4j:3045:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.toJ6TZGr4j:3047:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.toJ6TZGr4j:3048:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.toJ6TZGr4j:3052:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.toJ6TZGr4j:3053:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.toJ6TZGr4j:3111:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.toJ6TZGr4j:3132:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.toJ6TZGr4j:3157:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.toJ6TZGr4j:3161:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.toJ6TZGr4j:3269:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.toJ6TZGr4j:3280:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.toJ6TZGr4j:3290:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.toJ6TZGr4j:3297:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.toJ6TZGr4j:3300:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.toJ6TZGr4j:3301:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.toJ6TZGr4j:3303:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.toJ6TZGr4j:3304:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.toJ6TZGr4j:3305:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.toJ6TZGr4j:3307:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.toJ6TZGr4j:3316:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.toJ6TZGr4j:3322:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.toJ6TZGr4j:3342:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.toJ6TZGr4j:3346:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.toJ6TZGr4j:3347:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.toJ6TZGr4j:3364:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.dC8Br4FkIZ:7630:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.dC8Br4FkIZ:7633:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.dC8Br4FkIZ:7634:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.dC8Br4FkIZ:7636:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.dC8Br4FkIZ:7637:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.dC8Br4FkIZ:7641:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.dC8Br4FkIZ:7642:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.dC8Br4FkIZ:7700:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.dC8Br4FkIZ:7721:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.dC8Br4FkIZ:7746:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.dC8Br4FkIZ:7750:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.dC8Br4FkIZ:7858:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.dC8Br4FkIZ:7869:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.dC8Br4FkIZ:7879:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.dC8Br4FkIZ:7886:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.dC8Br4FkIZ:7889:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.dC8Br4FkIZ:7890:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.dC8Br4FkIZ:7892:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.dC8Br4FkIZ:7893:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.dC8Br4FkIZ:7894:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.dC8Br4FkIZ:7896:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.dC8Br4FkIZ:7905:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.dC8Br4FkIZ:7911:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.dC8Br4FkIZ:7931:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.dC8Br4FkIZ:7935:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.dC8Br4FkIZ:7936:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.dC8Br4FkIZ:7953:warning: override: reassigning to symbol =
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
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-alauda.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_transparent_scsi_comma=
nd
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-cypress.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-datafab.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-eneub6250.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-freecom.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-isd200.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-jumpshot.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-karma.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-onetouch.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-realtek.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_CB_transport
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr09.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-sddr55.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_clear_halt
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/ums-usbat.ko needs unknown symbol usb_stor_set_xfer_buf

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
    ./.tmp.config.EY2Rvtxmhn:4504:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.EY2Rvtxmhn:4507:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.EY2Rvtxmhn:4508:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.EY2Rvtxmhn:4510:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.EY2Rvtxmhn:4511:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.EY2Rvtxmhn:4515:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.EY2Rvtxmhn:4516:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.EY2Rvtxmhn:4574:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.EY2Rvtxmhn:4595:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.EY2Rvtxmhn:4620:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.EY2Rvtxmhn:4624:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.EY2Rvtxmhn:4732:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.EY2Rvtxmhn:4743:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.EY2Rvtxmhn:4753:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.EY2Rvtxmhn:4760:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.EY2Rvtxmhn:4763:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.EY2Rvtxmhn:4764:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.EY2Rvtxmhn:4766:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.EY2Rvtxmhn:4767:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.EY2Rvtxmhn:4768:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.EY2Rvtxmhn:4770:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.EY2Rvtxmhn:4779:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.EY2Rvtxmhn:4785:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.EY2Rvtxmhn:4805:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.EY2Rvtxmhn:4809:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.EY2Rvtxmhn:4810:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.EY2Rvtxmhn:4827:warning: override: reassigning to symbol =
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
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@10/l=
inux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb=
/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@10/l=
inux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb=
/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 3 warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@5/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@5/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 =
warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/storage/uas.=
ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/storage/uas.=
ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 30 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.j58FbvncJ4:8206:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.j58FbvncJ4:8209:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.j58FbvncJ4:8210:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.j58FbvncJ4:8212:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.j58FbvncJ4:8213:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.j58FbvncJ4:8217:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.j58FbvncJ4:8218:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.j58FbvncJ4:8276:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.j58FbvncJ4:8297:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.j58FbvncJ4:8322:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.j58FbvncJ4:8326:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.j58FbvncJ4:8434:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.j58FbvncJ4:8445:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.j58FbvncJ4:8455:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.j58FbvncJ4:8462:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.j58FbvncJ4:8465:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.j58FbvncJ4:8466:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.j58FbvncJ4:8468:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.j58FbvncJ4:8469:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.j58FbvncJ4:8470:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.j58FbvncJ4:8472:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.j58FbvncJ4:8481:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.j58FbvncJ4:8487:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.j58FbvncJ4:8507:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.j58FbvncJ4:8511:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.j58FbvncJ4:8512:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.j58FbvncJ4:8529:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191017/kernel/drivers/usb/=
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
    ./.tmp.config.3TG78uYdtM:1421:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.3TG78uYdtM:1424:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.3TG78uYdtM:1425:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.3TG78uYdtM:1427:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.3TG78uYdtM:1428:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.3TG78uYdtM:1432:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.3TG78uYdtM:1433:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.3TG78uYdtM:1491:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.3TG78uYdtM:1512:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.3TG78uYdtM:1537:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.3TG78uYdtM:1541:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.3TG78uYdtM:1649:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.3TG78uYdtM:1660:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.3TG78uYdtM:1670:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.3TG78uYdtM:1677:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.3TG78uYdtM:1680:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.3TG78uYdtM:1681:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.3TG78uYdtM:1683:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.3TG78uYdtM:1684:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.3TG78uYdtM:1685:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.3TG78uYdtM:1687:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.3TG78uYdtM:1696:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.3TG78uYdtM:1702:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.3TG78uYdtM:1722:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.3TG78uYdtM:1726:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.3TG78uYdtM:1727:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.3TG78uYdtM:1744:warning: override: reassigning to symbol =
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
    ./.tmp.config.LoaMrzRIu0:4567:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.LoaMrzRIu0:4570:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.LoaMrzRIu0:4571:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.LoaMrzRIu0:4573:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.LoaMrzRIu0:4574:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.LoaMrzRIu0:4578:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.LoaMrzRIu0:4579:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.LoaMrzRIu0:4637:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.LoaMrzRIu0:4658:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.LoaMrzRIu0:4683:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.LoaMrzRIu0:4687:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.LoaMrzRIu0:4795:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.LoaMrzRIu0:4806:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.LoaMrzRIu0:4816:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.LoaMrzRIu0:4823:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.LoaMrzRIu0:4826:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.LoaMrzRIu0:4827:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.LoaMrzRIu0:4829:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.LoaMrzRIu0:4830:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.LoaMrzRIu0:4831:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.LoaMrzRIu0:4833:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.LoaMrzRIu0:4842:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.LoaMrzRIu0:4848:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.LoaMrzRIu0:4868:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.LoaMrzRIu0:4872:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.LoaMrzRIu0:4873:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.LoaMrzRIu0:4890:warning: override: reassigning to symbol =
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
