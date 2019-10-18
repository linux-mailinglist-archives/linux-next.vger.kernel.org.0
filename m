Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C691ADC52E
	for <lists+linux-next@lfdr.de>; Fri, 18 Oct 2019 14:41:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442784AbfJRMlX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Oct 2019 08:41:23 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33511 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728515AbfJRMlW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Oct 2019 08:41:22 -0400
Received: by mail-wr1-f68.google.com with SMTP id b9so6126837wrs.0
        for <linux-next@vger.kernel.org>; Fri, 18 Oct 2019 05:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=HobQygsIvdidY4fI6gop+OvEicqAUjakvZUt8iwfJtU=;
        b=D80e+NJQIJjxg+MKpjJ3ZCIZNzADtx32LcoGJSe6EB4yZyByDr9LI1eF1anwH8UlJE
         V0nOwoW5pIavYd9ckzm3pAUxr882qRrAIU0fWkmPTTjeohYCxIWom+yYvYus7oPM1Ccq
         vycyM0VfENwrYABCkSbkh5BbUfmYPta8y0wTXrhTGyLzIkEhMHCn/Pn4J5ZEKo/AZ9qF
         AHONDXG9qbwyC1KQqOm6zCyr4P+DLPA7cape6kbMKI8hxPQqt3m2MJt1ZTEeuMIxnYDT
         6VyjkY89lStX7+J24yCeYCfUoneQ3wqeZHPff1v8CWvZe2avJO1K506jUduFoFs3Id4f
         EGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=HobQygsIvdidY4fI6gop+OvEicqAUjakvZUt8iwfJtU=;
        b=MZKOQHwCM4akmgVAmRgGPaJB5IFM1ZNoUF6M4Xut+INtvCyZHWZI3qqMJ2xIypp+Ay
         kdeZM8RojLl0l2R6sg8NeDhn+qEf7pHiByDyQuJ0BxmBUKM/X2EtUCKpzDr+7Xwh6t7w
         LgKMd7himXUVrdksFRmuTgbArxpkAZMRi5n8HYlVjPB3cs+6aVRykAXVYCarkWmpm4An
         DdNxQfBIJJ+eUbpnKN5yd0KK806aDSSMe19tljO/lFtLUVba4hHetDP1SOKnj7qpVjWS
         utdX8LJJ4tVAhO3y1OnjoJ80KNN8GhowHnoruZiY6scpbx87/REKnvwa0MaGlutK6N/m
         lPlQ==
X-Gm-Message-State: APjAAAWTLXbpjd2gSKRYzp1lkiY6KlXGQl1P5UsFLPN6m2vnTN4gk2eB
        nVblgj8fW1YwhbAVDLfgE7xrObRdohg=
X-Google-Smtp-Source: APXvYqxc06XG9ZxI8WJuSYJH+wr+Xb9hGSmsboV1sR757IQSE58mXcdBhSzVbH+ONwr84DkT2ybn2Q==
X-Received: by 2002:a5d:4ace:: with SMTP id y14mr1899808wrs.131.1571402465381;
        Fri, 18 Oct 2019 05:41:05 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id h18sm5041232wrr.78.2019.10.18.05.41.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 18 Oct 2019 05:41:04 -0700 (PDT)
Message-ID: <5da9b2e0.1c69fb81.6750f.a932@mx.google.com>
Date:   Fri, 18 Oct 2019 05:41:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20191018
Subject: next/master build: 219 builds: 3 failed, 216 passed, 22 errors,
 902 warnings (next-20191018)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 219 builds: 3 failed, 216 passed, 22 errors, 902 warning=
s (next-20191018)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191018/

Tree: next
Branch: master
Git Describe: next-20191018
Git Commit: c4b9850b3676869ac0def5885d781d17f64b3a86
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-8) FAIL
    allmodconfig: (gcc-8) FAIL

mips:
    cavium_octeon_defconfig: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 4 warnings
    axs103_smp_defconfig (gcc-8): 4 warnings
    haps_hs_defconfig (gcc-8): 4 warnings
    haps_hs_smp_defconfig (gcc-8): 4 warnings
    hsdk_defconfig (gcc-8): 4 warnings
    nsim_hs_defconfig (gcc-8): 4 warnings
    nsim_hs_defconfig (gcc-8): 32 warnings
    nsim_hs_smp_defconfig (gcc-8): 4 warnings
    nsimosci_hs_defconfig (gcc-8): 4 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 4 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 3 warnings
    vdk_hs38_smp_defconfig (gcc-8): 3 warnings

arm64:
    allmodconfig (gcc-8): 9 errors, 1 warning
    allmodconfig (clang-8): 9 errors, 46 warnings
    defconfig (gcc-8): 27 warnings

arm:
    allmodconfig (gcc-8): 20 warnings
    am200epdkit_defconfig (gcc-8): 4 warnings
    aspeed_g4_defconfig (gcc-8): 2 warnings
    aspeed_g5_defconfig (gcc-8): 2 warnings
    assabet_defconfig (gcc-8): 2 warnings
    at91_dt_defconfig (gcc-8): 3 warnings
    axm55xx_defconfig (gcc-8): 3 warnings
    badge4_defconfig (gcc-8): 3 warnings
    bcm2835_defconfig (gcc-8): 6 warnings
    cerfcube_defconfig (gcc-8): 2 warnings
    clps711x_defconfig (gcc-8): 2 warnings
    cm_x2xx_defconfig (gcc-8): 3 warnings
    cm_x300_defconfig (gcc-8): 3 warnings
    cns3420vb_defconfig (gcc-8): 1 warning
    colibri_pxa270_defconfig (gcc-8): 3 warnings
    colibri_pxa300_defconfig (gcc-8): 3 warnings
    collie_defconfig (gcc-8): 2 warnings
    corgi_defconfig (gcc-8): 3 warnings
    davinci_all_defconfig (gcc-8): 4 warnings
    dove_defconfig (gcc-8): 3 warnings
    ebsa110_defconfig (gcc-8): 2 warnings
    efm32_defconfig (gcc-8): 2 warnings
    em_x270_defconfig (gcc-8): 3 warnings
    ep93xx_defconfig (gcc-8): 3 warnings
    eseries_pxa_defconfig (gcc-8): 4 warnings
    exynos_defconfig (gcc-8): 173 warnings
    ezx_defconfig (gcc-8): 3 warnings
    footbridge_defconfig (gcc-8): 2 warnings
    gemini_defconfig (gcc-8): 2 warnings
    h3600_defconfig (gcc-8): 2 warnings
    h5000_defconfig (gcc-8): 3 warnings
    hackkit_defconfig (gcc-8): 2 warnings
    hisi_defconfig (gcc-8): 2 warnings
    imote2_defconfig (gcc-8): 3 warnings
    imx_v4_v5_defconfig (gcc-8): 3 warnings
    imx_v6_v7_defconfig (gcc-8): 4 warnings
    integrator_defconfig (gcc-8): 3 warnings
    iop32x_defconfig (gcc-8): 2 warnings
    ixp4xx_defconfig (gcc-8): 3 warnings
    jornada720_defconfig (gcc-8): 2 warnings
    keystone_defconfig (gcc-8): 3 warnings
    lart_defconfig (gcc-8): 2 warnings
    lpc18xx_defconfig (gcc-8): 2 warnings
    lpc32xx_defconfig (gcc-8): 3 warnings
    lpd270_defconfig (gcc-8): 2 warnings
    lubbock_defconfig (gcc-8): 2 warnings
    magician_defconfig (gcc-8): 4 warnings
    mainstone_defconfig (gcc-8): 2 warnings
    milbeaut_m10v_defconfig (gcc-8): 1 warning
    mini2440_defconfig (gcc-8): 3 warnings
    mmp2_defconfig (gcc-8): 3 warnings
    moxart_defconfig (gcc-8): 2 warnings
    mps2_defconfig (gcc-8): 2 warnings
    multi_v5_defconfig (gcc-8): 3 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 6 warnings
    multi_v7_defconfig (gcc-8): 33 warnings
    mv78xx0_defconfig (gcc-8): 3 warnings
    mvebu_v5_defconfig (gcc-8): 3 warnings
    mvebu_v7_defconfig (gcc-8): 3 warnings
    mxs_defconfig (gcc-8): 3 warnings
    neponset_defconfig (gcc-8): 2 warnings
    netwinder_defconfig (gcc-8): 2 warnings
    nhk8815_defconfig (gcc-8): 4 warnings
    omap1_defconfig (gcc-8): 3 warnings
    omap2plus_defconfig (gcc-8): 3 warnings
    orion5x_defconfig (gcc-8): 3 warnings
    oxnas_v6_defconfig (gcc-8): 3 warnings
    palmz72_defconfig (gcc-8): 3 warnings
    pcm027_defconfig (gcc-8): 3 warnings
    pleb_defconfig (gcc-8): 2 warnings
    prima2_defconfig (gcc-8): 1 warning
    pxa168_defconfig (gcc-8): 3 warnings
    pxa255-idp_defconfig (gcc-8): 2 warnings
    pxa3xx_defconfig (gcc-8): 3 warnings
    pxa910_defconfig (gcc-8): 3 warnings
    pxa_defconfig (gcc-8): 2 warnings
    qcom_defconfig (gcc-8): 3 warnings
    realview_defconfig (gcc-8): 3 warnings
    rpc_defconfig (gcc-8): 2 warnings
    s3c2410_defconfig (gcc-8): 4 warnings
    s3c6400_defconfig (gcc-8): 2 warnings
    s5pv210_defconfig (gcc-8): 4 warnings
    sama5_defconfig (gcc-8): 3 warnings
    shannon_defconfig (gcc-8): 2 warnings
    shmobile_defconfig (gcc-8): 2 warnings
    simpad_defconfig (gcc-8): 2 warnings
    socfpga_defconfig (gcc-8): 2 warnings
    spear13xx_defconfig (gcc-8): 3 warnings
    spear3xx_defconfig (gcc-8): 2 warnings
    spear6xx_defconfig (gcc-8): 2 warnings
    spitz_defconfig (gcc-8): 3 warnings
    sunxi_defconfig (gcc-8): 3 warnings
    tango4_defconfig (gcc-8): 3 warnings
    tct_hammer_defconfig (gcc-8): 2 warnings
    tegra_defconfig (gcc-8): 3 warnings
    trizeps4_defconfig (gcc-8): 3 warnings
    u300_defconfig (gcc-8): 1 warning
    u8500_defconfig (gcc-8): 3 warnings
    versatile_defconfig (gcc-8): 3 warnings
    vexpress_defconfig (gcc-8): 3 warnings
    viper_defconfig (gcc-8): 4 warnings
    vt8500_v6_v7_defconfig (gcc-8): 2 warnings
    xcep_defconfig (gcc-8): 3 warnings
    zeus_defconfig (gcc-8): 5 warnings

i386:
    i386_defconfig (gcc-8): 2 warnings
    i386_defconfig (gcc-8): 30 warnings

mips:
    32r2el_defconfig (gcc-8): 2 warnings
    32r2el_defconfig (gcc-8): 30 warnings
    ar7_defconfig (gcc-8): 2 warnings
    ath25_defconfig (gcc-8): 2 warnings
    ath79_defconfig (gcc-8): 2 warnings
    bcm47xx_defconfig (gcc-8): 2 warnings
    bcm63xx_defconfig (gcc-8): 2 warnings
    bmips_be_defconfig (gcc-8): 2 warnings
    bmips_stb_defconfig (gcc-8): 2 warnings
    capcella_defconfig (gcc-8): 2 warnings
    cavium_octeon_defconfig (gcc-8): 4 errors, 3 warnings
    ci20_defconfig (gcc-8): 2 warnings
    cobalt_defconfig (gcc-8): 2 warnings
    db1xxx_defconfig (gcc-8): 3 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
    gcw0_defconfig (gcc-8): 2 warnings
    gpr_defconfig (gcc-8): 2 warnings
    ip22_defconfig (gcc-8): 2 warnings
    jazz_defconfig (gcc-8): 2 warnings
    jmr3927_defconfig (gcc-8): 2 warnings
    lasat_defconfig (gcc-8): 2 warnings
    loongson1b_defconfig (gcc-8): 2 warnings
    loongson1c_defconfig (gcc-8): 2 warnings
    malta_defconfig (gcc-8): 2 warnings
    malta_kvm_defconfig (gcc-8): 2 warnings
    malta_kvm_guest_defconfig (gcc-8): 2 warnings
    malta_qemu_32r6_defconfig (gcc-8): 3 warnings
    maltaaprp_defconfig (gcc-8): 2 warnings
    maltasmvp_defconfig (gcc-8): 2 warnings
    maltasmvp_eva_defconfig (gcc-8): 2 warnings
    maltaup_defconfig (gcc-8): 2 warnings
    maltaup_xpa_defconfig (gcc-8): 2 warnings
    markeins_defconfig (gcc-8): 2 warnings
    mpc30x_defconfig (gcc-8): 2 warnings
    msp71xx_defconfig (gcc-8): 2 warnings
    mtx1_defconfig (gcc-8): 3 warnings
    nlm_xlr_defconfig (gcc-8): 3 warnings
    omega2p_defconfig (gcc-8): 2 warnings
    pistachio_defconfig (gcc-8): 2 warnings
    pnx8335_stb225_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 2 warnings
    rb532_defconfig (gcc-8): 2 warnings
    rbtx49xx_defconfig (gcc-8): 3 warnings
    rm200_defconfig (gcc-8): 2 warnings
    rt305x_defconfig (gcc-8): 2 warnings
    tb0219_defconfig (gcc-8): 2 warnings
    tb0226_defconfig (gcc-8): 2 warnings
    tb0287_defconfig (gcc-8): 2 warnings
    vocore2_defconfig (gcc-8): 2 warnings
    workpad_defconfig (gcc-8): 2 warnings
    xway_defconfig (gcc-8): 2 warnings

riscv:
    defconfig (gcc-8): 27 warnings
    rv32_defconfig (gcc-8): 8 warnings

x86_64:
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 27 warnings

Errors summary:

    2    drivers/staging/octeon/ethernet.c:516:29: error: type of formal pa=
rameter 2 is incomplete
    2    drivers/staging/octeon/ethernet.c:499:30: error: storage size of '=
link_info' isn't known
    2    drivers/staging/octeon/ethernet.c:463:30: error: storage size of '=
link_info' isn't known
    2    drivers/staging/octeon/ethernet.c:177:21: error: dereferencing poi=
nter to incomplete type 'struct cvmx_wqe'
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

Warnings summary:

    335  fs/io_uring.c:1730:13: warning: cast to pointer from integer of di=
fferent size [-Wint-to-pointer-cast]
    335  fs/io_uring.c:1729:9: warning: cast to pointer from integer of dif=
ferent size [-Wint-to-pointer-cast]
    128  WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    51   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    36   drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value,=
 in function returning void
    15   1 warning generated.
    12   sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunu=
sed-variable]
    11   include/linux/kern_levels.h:5:18: warning: format '%lu' expects ar=
gument of type 'long unsigned int', but argument 8 has type 'unsigned int' =
[-Wformat=3D]
    9    drivers/net/phy/mdio-cavium.h:113:48: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    5    2 warnings generated.
    4    drivers/net/phy/mdio-cavium.h:114:37: warning: cast to pointer fro=
m integer of different size [-Wint-to-pointer-cast]
    4    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    4    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/uas.ko needs unknown symbol usb_stor_adjust_quirks
    4    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    4    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    2    {standard input}:134: Warning: macro instruction expanded into mul=
tiple instructions
    2    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable 'rtd' [-=
Wunused-variable]
    2    kernel/debug/debug_core.c:470:18: warning: array subscript [0, 0] =
is outside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]
    2    kernel/debug/debug_core.c:469:33: warning: array subscript [0, 0] =
is outside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]
    2    kernel/debug/debug_core.c:452:17: warning: array subscript [0, 0] =
is outside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]
    2    drivers/staging/octeon/octeon-ethernet.h:94:12: warning: 'union cv=
mx_helper_link_info' declared inside parameter list will not be visible out=
side of this definition or declaration
    2    drivers/staging/octeon/ethernet.c:499:30: warning: unused variable=
 'link_info' [-Wunused-variable]
    2    drivers/staging/octeon/ethernet.c:463:30: warning: unused variable=
 'link_info' [-Wunused-variable]
    2    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    2    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/uas.ko needs unknown symbol usb_stor_adjust_quirks
    2    WARNING: modpost: missing MODULE_LICENSE() in drivers/dma/fsl-dpaa=
2-qdma/dpdmai.o
    2    .config:1166:warning: override: UNWINDER_GUESS changes choice state
    1    warning: same module names found:
    1    net/nfc/hci/llc_shdlc.c:687:34: warning: variable 'connect_wq' is =
uninitialized when used within its own initialization [-Wuninitialized]
    1    net/nfc/hci/command.c:59:34: warning: variable 'ew_wq' is uninitia=
lized when used within its own initialization [-Wuninitialized]
    1    mm/shmem.c:2737:35: warning: variable 'shmem_falloc_waitq' is unin=
itialized when used within its own initialization [-Wuninitialized]
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
@8/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@8/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@5/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@5/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@3/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@3/linux/build/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_clear_halt
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_CB_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_clear_halt
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-usbat.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr55.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_CB_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-sddr09.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-realtek.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-onetouch.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-karma.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-jumpshot.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-isd200.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-freecom.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-eneub6250.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-datafab.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-cypress.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage=
/ums-alauda.ko needs unknown symbol fill_inquiry_response
    1    /tmp/ccd5kj5C.s:18191: Warning: using r15 results in unpredictable=
 behaviour
    1    /tmp/ccd5kj5C.s:18119: Warning: using r15 results in unpredictable=
 behaviour
    1    ./.tmp.config.wBbw8UGIL9:3979:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.wBbw8UGIL9:3962:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.wBbw8UGIL9:3961:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.wBbw8UGIL9:3957:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.wBbw8UGIL9:3937:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.wBbw8UGIL9:3931:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.wBbw8UGIL9:3922:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.wBbw8UGIL9:3920:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.wBbw8UGIL9:3919:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.wBbw8UGIL9:3918:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.wBbw8UGIL9:3916:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.wBbw8UGIL9:3915:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.wBbw8UGIL9:3912:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.wBbw8UGIL9:3905:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.wBbw8UGIL9:3895:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.wBbw8UGIL9:3884:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.wBbw8UGIL9:3776:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.wBbw8UGIL9:3772:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.wBbw8UGIL9:3747:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.wBbw8UGIL9:3726:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.wBbw8UGIL9:3668:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.wBbw8UGIL9:3667:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.wBbw8UGIL9:3663:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.wBbw8UGIL9:3662:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.wBbw8UGIL9:3660:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.wBbw8UGIL9:3659:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.wBbw8UGIL9:3656:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.sKlWYIrnAa:4827:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.sKlWYIrnAa:4810:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.sKlWYIrnAa:4809:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.sKlWYIrnAa:4805:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.sKlWYIrnAa:4785:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.sKlWYIrnAa:4779:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.sKlWYIrnAa:4770:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.sKlWYIrnAa:4768:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.sKlWYIrnAa:4767:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.sKlWYIrnAa:4766:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.sKlWYIrnAa:4764:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.sKlWYIrnAa:4763:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.sKlWYIrnAa:4760:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.sKlWYIrnAa:4753:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.sKlWYIrnAa:4743:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.sKlWYIrnAa:4732:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.sKlWYIrnAa:4624:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.sKlWYIrnAa:4620:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.sKlWYIrnAa:4595:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.sKlWYIrnAa:4574:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.sKlWYIrnAa:4516:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.sKlWYIrnAa:4515:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.sKlWYIrnAa:4511:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.sKlWYIrnAa:4510:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.sKlWYIrnAa:4508:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.sKlWYIrnAa:4507:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.sKlWYIrnAa:4504:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ly9F8qgm9a:1745:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ly9F8qgm9a:1728:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ly9F8qgm9a:1727:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.ly9F8qgm9a:1723:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.ly9F8qgm9a:1703:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.ly9F8qgm9a:1697:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.ly9F8qgm9a:1688:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.ly9F8qgm9a:1686:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ly9F8qgm9a:1685:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.ly9F8qgm9a:1684:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.ly9F8qgm9a:1682:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.ly9F8qgm9a:1681:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.ly9F8qgm9a:1678:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ly9F8qgm9a:1671:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ly9F8qgm9a:1661:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.ly9F8qgm9a:1650:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ly9F8qgm9a:1542:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.ly9F8qgm9a:1538:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ly9F8qgm9a:1513:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.ly9F8qgm9a:1492:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ly9F8qgm9a:1434:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.ly9F8qgm9a:1433:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.ly9F8qgm9a:1429:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.ly9F8qgm9a:1428:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.ly9F8qgm9a:1426:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.ly9F8qgm9a:1425:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.ly9F8qgm9a:1422:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.gLXKEgtRcC:1745:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.gLXKEgtRcC:1728:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.gLXKEgtRcC:1727:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.gLXKEgtRcC:1723:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.gLXKEgtRcC:1703:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.gLXKEgtRcC:1697:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.gLXKEgtRcC:1688:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.gLXKEgtRcC:1686:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.gLXKEgtRcC:1685:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.gLXKEgtRcC:1684:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.gLXKEgtRcC:1682:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.gLXKEgtRcC:1681:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.gLXKEgtRcC:1678:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.gLXKEgtRcC:1671:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.gLXKEgtRcC:1661:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.gLXKEgtRcC:1650:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.gLXKEgtRcC:1542:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.gLXKEgtRcC:1538:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.gLXKEgtRcC:1513:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.gLXKEgtRcC:1492:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.gLXKEgtRcC:1434:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.gLXKEgtRcC:1433:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.gLXKEgtRcC:1429:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.gLXKEgtRcC:1428:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.gLXKEgtRcC:1426:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.gLXKEgtRcC:1425:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.gLXKEgtRcC:1422:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.dXv9VT1aou:7954:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.dXv9VT1aou:7937:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.dXv9VT1aou:7936:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.dXv9VT1aou:7932:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.dXv9VT1aou:7912:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.dXv9VT1aou:7906:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.dXv9VT1aou:7897:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.dXv9VT1aou:7895:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.dXv9VT1aou:7894:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.dXv9VT1aou:7893:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.dXv9VT1aou:7891:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.dXv9VT1aou:7890:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.dXv9VT1aou:7887:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.dXv9VT1aou:7880:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.dXv9VT1aou:7870:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.dXv9VT1aou:7859:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.dXv9VT1aou:7751:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.dXv9VT1aou:7747:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.dXv9VT1aou:7722:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.dXv9VT1aou:7701:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.dXv9VT1aou:7643:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.dXv9VT1aou:7642:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.dXv9VT1aou:7638:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.dXv9VT1aou:7637:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.dXv9VT1aou:7635:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.dXv9VT1aou:7634:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.dXv9VT1aou:7631:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.RSRwTUC65h:4890:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.RSRwTUC65h:4873:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.RSRwTUC65h:4872:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.RSRwTUC65h:4868:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.RSRwTUC65h:4848:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.RSRwTUC65h:4842:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.RSRwTUC65h:4833:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.RSRwTUC65h:4831:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.RSRwTUC65h:4830:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.RSRwTUC65h:4829:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.RSRwTUC65h:4827:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.RSRwTUC65h:4826:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.RSRwTUC65h:4823:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.RSRwTUC65h:4816:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.RSRwTUC65h:4806:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.RSRwTUC65h:4795:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.RSRwTUC65h:4687:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.RSRwTUC65h:4683:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.RSRwTUC65h:4658:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.RSRwTUC65h:4637:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.RSRwTUC65h:4579:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.RSRwTUC65h:4578:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.RSRwTUC65h:4574:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.RSRwTUC65h:4573:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.RSRwTUC65h:4571:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.RSRwTUC65h:4570:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.RSRwTUC65h:4567:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.PCTcV4jVTN:7954:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.PCTcV4jVTN:7937:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.PCTcV4jVTN:7936:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.PCTcV4jVTN:7932:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.PCTcV4jVTN:7912:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.PCTcV4jVTN:7906:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.PCTcV4jVTN:7897:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.PCTcV4jVTN:7895:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.PCTcV4jVTN:7894:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.PCTcV4jVTN:7893:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.PCTcV4jVTN:7891:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.PCTcV4jVTN:7890:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.PCTcV4jVTN:7887:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.PCTcV4jVTN:7880:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.PCTcV4jVTN:7870:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.PCTcV4jVTN:7859:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.PCTcV4jVTN:7751:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.PCTcV4jVTN:7747:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.PCTcV4jVTN:7722:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.PCTcV4jVTN:7701:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.PCTcV4jVTN:7643:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.PCTcV4jVTN:7642:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.PCTcV4jVTN:7638:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.PCTcV4jVTN:7637:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.PCTcV4jVTN:7635:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.PCTcV4jVTN:7634:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.PCTcV4jVTN:7631:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.MgeDb3FjFC:3364:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.MgeDb3FjFC:3347:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.MgeDb3FjFC:3346:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.MgeDb3FjFC:3342:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.MgeDb3FjFC:3322:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.MgeDb3FjFC:3316:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.MgeDb3FjFC:3307:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.MgeDb3FjFC:3305:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.MgeDb3FjFC:3304:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.MgeDb3FjFC:3303:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.MgeDb3FjFC:3301:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.MgeDb3FjFC:3300:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.MgeDb3FjFC:3297:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.MgeDb3FjFC:3290:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.MgeDb3FjFC:3280:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.MgeDb3FjFC:3269:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.MgeDb3FjFC:3161:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.MgeDb3FjFC:3157:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.MgeDb3FjFC:3132:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.MgeDb3FjFC:3111:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.MgeDb3FjFC:3053:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.MgeDb3FjFC:3052:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.MgeDb3FjFC:3048:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.MgeDb3FjFC:3047:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.MgeDb3FjFC:3045:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.MgeDb3FjFC:3044:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.MgeDb3FjFC:3041:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.KKgdvQ958v:3364:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.KKgdvQ958v:3347:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.KKgdvQ958v:3346:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.KKgdvQ958v:3342:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.KKgdvQ958v:3322:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.KKgdvQ958v:3316:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.KKgdvQ958v:3307:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.KKgdvQ958v:3305:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.KKgdvQ958v:3304:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.KKgdvQ958v:3303:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.KKgdvQ958v:3301:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.KKgdvQ958v:3300:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.KKgdvQ958v:3297:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.KKgdvQ958v:3290:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.KKgdvQ958v:3280:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.KKgdvQ958v:3269:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.KKgdvQ958v:3161:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.KKgdvQ958v:3157:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.KKgdvQ958v:3132:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.KKgdvQ958v:3111:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.KKgdvQ958v:3053:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.KKgdvQ958v:3052:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.KKgdvQ958v:3048:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.KKgdvQ958v:3047:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.KKgdvQ958v:3045:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.KKgdvQ958v:3044:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.KKgdvQ958v:3041:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ICHg1ij5Tn:4890:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ICHg1ij5Tn:4873:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ICHg1ij5Tn:4872:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.ICHg1ij5Tn:4868:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.ICHg1ij5Tn:4848:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.ICHg1ij5Tn:4842:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.ICHg1ij5Tn:4833:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.ICHg1ij5Tn:4831:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ICHg1ij5Tn:4830:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.ICHg1ij5Tn:4829:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.ICHg1ij5Tn:4827:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.ICHg1ij5Tn:4826:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.ICHg1ij5Tn:4823:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ICHg1ij5Tn:4816:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ICHg1ij5Tn:4806:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.ICHg1ij5Tn:4795:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ICHg1ij5Tn:4687:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.ICHg1ij5Tn:4683:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ICHg1ij5Tn:4658:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.ICHg1ij5Tn:4637:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ICHg1ij5Tn:4579:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.ICHg1ij5Tn:4578:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.ICHg1ij5Tn:4574:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.ICHg1ij5Tn:4573:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.ICHg1ij5Tn:4571:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.ICHg1ij5Tn:4570:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.ICHg1ij5Tn:4567:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.8AaMAhI13L:4827:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.8AaMAhI13L:4810:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.8AaMAhI13L:4809:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.8AaMAhI13L:4805:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.8AaMAhI13L:4785:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.8AaMAhI13L:4779:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.8AaMAhI13L:4770:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.8AaMAhI13L:4768:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.8AaMAhI13L:4767:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.8AaMAhI13L:4766:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.8AaMAhI13L:4764:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.8AaMAhI13L:4763:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.8AaMAhI13L:4760:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.8AaMAhI13L:4753:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.8AaMAhI13L:4743:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.8AaMAhI13L:4732:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.8AaMAhI13L:4624:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.8AaMAhI13L:4620:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.8AaMAhI13L:4595:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.8AaMAhI13L:4574:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.8AaMAhI13L:4516:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.8AaMAhI13L:4515:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.8AaMAhI13L:4511:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.8AaMAhI13L:4510:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.8AaMAhI13L:4508:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.8AaMAhI13L:4507:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.8AaMAhI13L:4504:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.6Qdj9pXcoH:3979:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6Qdj9pXcoH:3962:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.6Qdj9pXcoH:3961:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.6Qdj9pXcoH:3957:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.6Qdj9pXcoH:3937:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.6Qdj9pXcoH:3931:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.6Qdj9pXcoH:3922:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.6Qdj9pXcoH:3920:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.6Qdj9pXcoH:3919:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.6Qdj9pXcoH:3918:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.6Qdj9pXcoH:3916:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.6Qdj9pXcoH:3915:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.6Qdj9pXcoH:3912:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.6Qdj9pXcoH:3905:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.6Qdj9pXcoH:3895:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.6Qdj9pXcoH:3884:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6Qdj9pXcoH:3776:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.6Qdj9pXcoH:3772:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.6Qdj9pXcoH:3747:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.6Qdj9pXcoH:3726:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.6Qdj9pXcoH:3668:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.6Qdj9pXcoH:3667:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.6Qdj9pXcoH:3663:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.6Qdj9pXcoH:3662:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.6Qdj9pXcoH:3660:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.6Qdj9pXcoH:3659:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.6Qdj9pXcoH:3656:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.20H3TbGlxM:8529:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.20H3TbGlxM:8512:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.20H3TbGlxM:8511:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.20H3TbGlxM:8507:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.20H3TbGlxM:8487:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.20H3TbGlxM:8481:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.20H3TbGlxM:8472:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.20H3TbGlxM:8470:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.20H3TbGlxM:8469:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.20H3TbGlxM:8468:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.20H3TbGlxM:8466:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.20H3TbGlxM:8465:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.20H3TbGlxM:8462:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.20H3TbGlxM:8455:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.20H3TbGlxM:8445:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.20H3TbGlxM:8434:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.20H3TbGlxM:8326:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.20H3TbGlxM:8322:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.20H3TbGlxM:8297:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.20H3TbGlxM:8276:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.20H3TbGlxM:8218:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.20H3TbGlxM:8217:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.20H3TbGlxM:8213:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.20H3TbGlxM:8212:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.20H3TbGlxM:8210:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.20H3TbGlxM:8209:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.20H3TbGlxM:8206:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.1amCUcBCeg:8529:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.1amCUcBCeg:8512:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.1amCUcBCeg:8511:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.1amCUcBCeg:8507:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.1amCUcBCeg:8487:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.1amCUcBCeg:8481:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.1amCUcBCeg:8472:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.1amCUcBCeg:8470:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.1amCUcBCeg:8469:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.1amCUcBCeg:8468:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.1amCUcBCeg:8466:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.1amCUcBCeg:8465:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.1amCUcBCeg:8462:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.1amCUcBCeg:8455:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.1amCUcBCeg:8445:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.1amCUcBCeg:8434:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.1amCUcBCeg:8326:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.1amCUcBCeg:8322:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.1amCUcBCeg:8297:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.1amCUcBCeg:8276:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.1amCUcBCeg:8218:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.1amCUcBCeg:8217:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.1amCUcBCeg:8213:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.1amCUcBCeg:8212:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.1amCUcBCeg:8210:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.1amCUcBCeg:8209:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.1amCUcBCeg:8206:warning: override: reassigning to sy=
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
    2    WARNING: vmlinux.o(.text.unlikely+0x3630): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    2    WARNING: vmlinux.o(.text.unlikely+0x3320): Section mismatch in ref=
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
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 30 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.6Qdj9pXcoH:3656:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.6Qdj9pXcoH:3659:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.6Qdj9pXcoH:3660:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.6Qdj9pXcoH:3662:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.6Qdj9pXcoH:3663:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.6Qdj9pXcoH:3667:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.6Qdj9pXcoH:3668:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.6Qdj9pXcoH:3726:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.6Qdj9pXcoH:3747:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.6Qdj9pXcoH:3772:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.6Qdj9pXcoH:3776:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.6Qdj9pXcoH:3884:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.6Qdj9pXcoH:3895:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.6Qdj9pXcoH:3905:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.6Qdj9pXcoH:3912:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.6Qdj9pXcoH:3915:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.6Qdj9pXcoH:3916:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.6Qdj9pXcoH:3918:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.6Qdj9pXcoH:3919:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.6Qdj9pXcoH:3920:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.6Qdj9pXcoH:3922:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.6Qdj9pXcoH:3931:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.6Qdj9pXcoH:3937:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.6Qdj9pXcoH:3957:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.6Qdj9pXcoH:3961:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.6Qdj9pXcoH:3962:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.6Qdj9pXcoH:3979:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

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
allmodconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 20 warnings, 0 section =
mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    /tmp/ccd5kj5C.s:18119: Warning: using r15 results in unpredictable beha=
viour
    /tmp/ccd5kj5C.s:18191: Warning: using r15 results in unpredictable beha=
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
    fs/cifs/readdir.c:83:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1 warning generated.
    drivers/bluetooth/bluecard_cs.c:282:36: warning: variable 'wq' is unini=
tialized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/fuse/readdir.c:161:34: warning: variable 'wq' is uninitialized when =
used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/nfs/dir.c:448:34: warning: variable 'wq' is uninitialized when used =
within its own initialization [-Wuninitialized]
    fs/nfs/dir.c:1499:34: warning: variable 'wq' is uninitialized when used=
 within its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:148:20: warning: variable 'cmd' is =
uninitialized when used within its own initialization [-Wuninitialized]
    drivers/dma/fsl-dpaa2-qdma/dpdmai.c:148:25: warning: variable 'cfg' is =
uninitialized when used within its own initialization [-Wuninitialized]
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
allnoconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section mis=
matches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void

---------------------------------------------------------------------------=
-----
ar7_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
aspeed_g4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
aspeed_g5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ath25_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
ath79_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
axm55xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
bcm2835_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sect=
ion mismatches

Warnings:
    kernel/debug/debug_core.c:452:17: warning: array subscript [0, 0] is ou=
tside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]
    kernel/debug/debug_core.c:469:33: warning: array subscript [0, 0] is ou=
tside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]
    kernel/debug/debug_core.c:470:18: warning: array subscript [0, 0] is ou=
tside array bounds of 'struct debuggerinfo_struct[1]' [-Warray-bounds]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void

---------------------------------------------------------------------------=
-----
bcm47xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
bcm63xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
bigsur_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
bmips_be_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
bmips_stb_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
capcella_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

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
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
ci20_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
clps711x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings,=
 0 section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void

---------------------------------------------------------------------------=
-----
db1xxx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
ariable]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
decstation_64_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
decstation_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x3630): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

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
    ./.tmp.config.KKgdvQ958v:3041:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.KKgdvQ958v:3044:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.KKgdvQ958v:3045:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.KKgdvQ958v:3047:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.KKgdvQ958v:3048:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.KKgdvQ958v:3052:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.KKgdvQ958v:3053:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.KKgdvQ958v:3111:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.KKgdvQ958v:3132:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.KKgdvQ958v:3157:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.KKgdvQ958v:3161:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.KKgdvQ958v:3269:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.KKgdvQ958v:3280:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.KKgdvQ958v:3290:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.KKgdvQ958v:3297:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.KKgdvQ958v:3300:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.KKgdvQ958v:3301:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.KKgdvQ958v:3303:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.KKgdvQ958v:3304:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.KKgdvQ958v:3305:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.KKgdvQ958v:3307:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.KKgdvQ958v:3316:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.KKgdvQ958v:3322:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.KKgdvQ958v:3342:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.KKgdvQ958v:3346:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.KKgdvQ958v:3347:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.KKgdvQ958v:3364:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.dXv9VT1aou:7631:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.dXv9VT1aou:7634:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.dXv9VT1aou:7635:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.dXv9VT1aou:7637:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.dXv9VT1aou:7638:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.dXv9VT1aou:7642:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.dXv9VT1aou:7643:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.dXv9VT1aou:7701:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.dXv9VT1aou:7722:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.dXv9VT1aou:7747:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.dXv9VT1aou:7751:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.dXv9VT1aou:7859:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.dXv9VT1aou:7870:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.dXv9VT1aou:7880:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.dXv9VT1aou:7887:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.dXv9VT1aou:7890:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.dXv9VT1aou:7891:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.dXv9VT1aou:7893:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.dXv9VT1aou:7894:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.dXv9VT1aou:7895:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.dXv9VT1aou:7897:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.dXv9VT1aou:7906:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.dXv9VT1aou:7912:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.dXv9VT1aou:7932:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.dXv9VT1aou:7936:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.dXv9VT1aou:7937:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.dXv9VT1aou:7954:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
e55_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
ebsa110_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
efm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x710): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 173 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
alauda.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
cypress.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
datafab.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
eneub6250.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
freecom.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
isd200.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
jumpshot.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
karma.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
onetouch.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
realtek.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_CB_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr09.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
sddr55.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_clear_halt
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/ums-=
usbat.ko needs unknown symbol usb_stor_set_xfer_buf

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
fuloong2e_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
gcw0_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
gemini_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 30 warning=
s, 0 section mismatches

Warnings:
    ./.tmp.config.sKlWYIrnAa:4504:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.sKlWYIrnAa:4507:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.sKlWYIrnAa:4508:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.sKlWYIrnAa:4510:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.sKlWYIrnAa:4511:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.sKlWYIrnAa:4515:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.sKlWYIrnAa:4516:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.sKlWYIrnAa:4574:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.sKlWYIrnAa:4595:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.sKlWYIrnAa:4620:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.sKlWYIrnAa:4624:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.sKlWYIrnAa:4732:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.sKlWYIrnAa:4743:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.sKlWYIrnAa:4753:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.sKlWYIrnAa:4760:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.sKlWYIrnAa:4763:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.sKlWYIrnAa:4764:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.sKlWYIrnAa:4766:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.sKlWYIrnAa:4767:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.sKlWYIrnAa:4768:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.sKlWYIrnAa:4770:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.sKlWYIrnAa:4779:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.sKlWYIrnAa:4785:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.sKlWYIrnAa:4805:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.sKlWYIrnAa:4809:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.sKlWYIrnAa:4810:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.sKlWYIrnAa:4827:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

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
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
jmr3927_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
jornada720_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x7c8): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
keystone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
lart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
lasat_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
lemote2f_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
loongson1b_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
loongson1c_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 =
section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
loongson3_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
lpc18xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
lpd270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
lubbock_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
mainstone_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
malta_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
malta_kvm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
malta_kvm_guest_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warning=
s, 0 section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    {standard input}:134: Warning: macro instruction expanded into multiple=
 instructions
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
maltaaprp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
maltasmvp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
maltasmvp_eva_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings,=
 0 section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
maltaup_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
maltaup_xpa_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0=
 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mips_paravirt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
moxart_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mpc30x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mps2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 6 warnings, 0 section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@8/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@8/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 6 warnings, 0 section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@5/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@5/li=
nux/build/_modules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 =
warnings, 0 section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/uas.=
ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/uas.=
ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 33 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.20H3TbGlxM:8206:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.20H3TbGlxM:8209:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.20H3TbGlxM:8210:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.20H3TbGlxM:8212:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.20H3TbGlxM:8213:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.20H3TbGlxM:8217:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.20H3TbGlxM:8218:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.20H3TbGlxM:8276:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.20H3TbGlxM:8297:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.20H3TbGlxM:8322:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.20H3TbGlxM:8326:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.20H3TbGlxM:8434:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.20H3TbGlxM:8445:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.20H3TbGlxM:8455:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.20H3TbGlxM:8462:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.20H3TbGlxM:8465:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.20H3TbGlxM:8466:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.20H3TbGlxM:8468:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.20H3TbGlxM:8469:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.20H3TbGlxM:8470:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.20H3TbGlxM:8472:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.20H3TbGlxM:8481:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.20H3TbGlxM:8487:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.20H3TbGlxM:8507:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.20H3TbGlxM:8511:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.20H3TbGlxM:8512:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.20H3TbGlxM:8529:warning: override: reassigning to symbol =
USER_NS
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/uas.=
ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc3-next-20191018/kernel/drivers/usb/storage/uas.=
ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 32 warni=
ngs, 0 section mismatches

Warnings:
    ./.tmp.config.gLXKEgtRcC:1422:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.gLXKEgtRcC:1425:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.gLXKEgtRcC:1426:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.gLXKEgtRcC:1428:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.gLXKEgtRcC:1429:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.gLXKEgtRcC:1433:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.gLXKEgtRcC:1434:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.gLXKEgtRcC:1492:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.gLXKEgtRcC:1513:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.gLXKEgtRcC:1538:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.gLXKEgtRcC:1542:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.gLXKEgtRcC:1650:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.gLXKEgtRcC:1661:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.gLXKEgtRcC:1671:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.gLXKEgtRcC:1678:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.gLXKEgtRcC:1681:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.gLXKEgtRcC:1682:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.gLXKEgtRcC:1684:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.gLXKEgtRcC:1685:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.gLXKEgtRcC:1686:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.gLXKEgtRcC:1688:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.gLXKEgtRcC:1697:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.gLXKEgtRcC:1703:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.gLXKEgtRcC:1723:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.gLXKEgtRcC:1727:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.gLXKEgtRcC:1728:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.gLXKEgtRcC:1745:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]

---------------------------------------------------------------------------=
-----
nsim_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pic32mzda_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pistachio_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x840): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
rb532_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
rbtx49xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    sound/soc/txx9/txx9aclc.c:54:30: warning: unused variable 'rtd' [-Wunus=
ed-variable]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8e4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
rt305x_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
rv32_defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 8 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [-Wcpp]
    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemented [-W=
cpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
s3c2410_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
ariable]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void

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
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
sb1250_swarm_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x8c4): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x84c): Section mismatch in reference=
 from the function free_memmap() to the function .meminit.text:memblock_fre=
e()

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
spear3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
spear6xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
spitz_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void

---------------------------------------------------------------------------=
-----
stm32_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
sunxi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
tb0287_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
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
    .config:1166:warning: override: UNWINDER_GUESS changes choice state

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
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section =
mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void

---------------------------------------------------------------------------=
-----
vocore2_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
vt8500_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
workpad_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
x86_64_defconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 27 war=
nings, 0 section mismatches

Warnings:
    ./.tmp.config.RSRwTUC65h:4567:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.RSRwTUC65h:4570:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.RSRwTUC65h:4571:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.RSRwTUC65h:4573:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.RSRwTUC65h:4574:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.RSRwTUC65h:4578:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.RSRwTUC65h:4579:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.RSRwTUC65h:4637:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.RSRwTUC65h:4658:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.RSRwTUC65h:4683:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.RSRwTUC65h:4687:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.RSRwTUC65h:4795:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.RSRwTUC65h:4806:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.RSRwTUC65h:4816:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.RSRwTUC65h:4823:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.RSRwTUC65h:4826:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.RSRwTUC65h:4827:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.RSRwTUC65h:4829:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.RSRwTUC65h:4830:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.RSRwTUC65h:4831:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.RSRwTUC65h:4833:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.RSRwTUC65h:4842:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.RSRwTUC65h:4848:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.RSRwTUC65h:4868:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.RSRwTUC65h:4872:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.RSRwTUC65h:4873:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.RSRwTUC65h:4890:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
x86_64_defconfig+kvm_guest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section=
 mismatches

Warnings:
    fs/io_uring.c:1729:9: warning: cast to pointer from integer of differen=
t size [-Wint-to-pointer-cast]
    fs/io_uring.c:1730:13: warning: cast to pointer from integer of differe=
nt size [-Wint-to-pointer-cast]
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    drivers/bluetooth/btintel.h:188:9: warning: 'return' with a value, in f=
unction returning void
    sound/soc/soc-pcm.c:1207:8: warning: unused variable 'name' [-Wunused-v=
ariable]

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
