Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58952BD4E5
	for <lists+linux-next@lfdr.de>; Wed, 25 Sep 2019 00:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410660AbfIXWY3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Sep 2019 18:24:29 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33462 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2410649AbfIXWY2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Sep 2019 18:24:28 -0400
Received: by mail-wr1-f67.google.com with SMTP id b9so3862816wrs.0
        for <linux-next@vger.kernel.org>; Tue, 24 Sep 2019 15:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EERGPGuHof6joj/nZqJh5imqvIN3Rmr/lPfR0OMWWIk=;
        b=Mv+EWtfWKiy6Cmd8eOpccpCQzYrBwhxF2rK+T+BnLkkDYIwduMK3ijq0wM9lgQ5YVo
         51PuKKm7DlXPLw3R6wRhIgDa4MfqFqpGmV3MV8z5gtzncT8m4RWv5yLXjXkHt/khxrbi
         1L+Kn8SCek8JqDoWr7lYFXzJumXKEsDaYs7eU/omj3tyl+W5rYHiVBUHz/cP4eS/SbbC
         N/Zv0j0VHnvRDxa1wjwXi7kXhg876ZL7UfCLwy/vhOjLktlLcpfrHep88OLEVcx1lRSL
         O2Rj18SK1cOx/UDfRJxC+x6AfkoH8MYnJtd2huYYNBeQgwaaKiOIHH6m61qSeQbhyTnA
         nqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EERGPGuHof6joj/nZqJh5imqvIN3Rmr/lPfR0OMWWIk=;
        b=UMyhPkMCnmx8oY8WqDxXKuc19uHzfMtTW8MAt0but0UNwbCudsV1O87I9L9MYue0k2
         yuZ6FarTieg5Hpq9Uak1WFdj8HSfFCmEZSimQo4WUup+p1wJWXlQAOmefNAo+xxC929r
         4+aDwIcAou4JDXSqq/zyLgriZqhw0fuGdDV9u4YFXAibLueEWFs0KgiH85t51oBKMEQP
         IBxxIrivNnHtHiWk28YSQFzFWduUD5FBuOnoo4yUSqcMEGPj0ZtBdxd8+mr1BmyUbakC
         fjjaIw8oriZOjkpzuUihOqlM4qEy2V9D2Y7/jVpLcl+oqYB21bW/moi9A6A18WZpqz6w
         iW8Q==
X-Gm-Message-State: APjAAAVh1SiO9agj0g1NsZrIgZ1PgU4KGO4Jxfi9VkrVH8idBIVgAbqP
        tZkd2BXw5jOuVYwczbYDVaN7+uUdZu11GA==
X-Google-Smtp-Source: APXvYqz3Svmdx3TD1AEPbfyO5g+8g6Cp34Xdpv8MnizItt81NfuYTSgRH0l83oAY6a0ebdElqMFVew==
X-Received: by 2002:a5d:4f0d:: with SMTP id c13mr5123142wru.317.1569363856195;
        Tue, 24 Sep 2019 15:24:16 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id d9sm5290074wrc.44.2019.09.24.15.24.15
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Sep 2019 15:24:15 -0700 (PDT)
Message-ID: <5d8a978f.1c69fb81.37b16.a552@mx.google.com>
Date:   Tue, 24 Sep 2019 15:24:15 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190924
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: master
Subject: next/master build: 218 builds: 6 failed, 212 passed, 10 errors,
 739 warnings (next-20190924)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 218 builds: 6 failed, 212 passed, 10 errors, 739 warning=
s (next-20190924)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190924/

Tree: next
Branch: master
Git Describe: next-20190924
Git Commit: 9e88347dedd8a211784431b49e2bea9c6370a7e4
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
    msp71xx_defconfig: (gcc-8) FAIL

x86_64:
    allmodconfig: (gcc-8) FAIL

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
    allmodconfig (clang-8): 1 error, 11 warnings
    allmodconfig (gcc-8): 1 error
    defconfig (gcc-8): 3 warnings
    defconfig (clang-8): 3 warnings
    defconfig (gcc-8): 3 warnings
    defconfig (gcc-8): 3 warnings
    defconfig (gcc-8): 30 warnings

arm:
    allmodconfig (gcc-8): 1 error
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
    malta_qemu_32r6_defconfig (gcc-8): 3 warnings
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
    allmodconfig (gcc-8): 1 error
    tinyconfig (gcc-8): 1 warning
    x86_64_defconfig (gcc-8): 27 warnings

Errors summary:

    3    collect2: error: ld returned 1 exit status
    1    clang: error: linker command failed with exit code 1 (use -v to se=
e invocation)
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
    5    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid=
 for REMOTEPROC
    5    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' =
invalid for REMOTEPROC
    4    1 warning generated.
    3    arch/mips/fw/arc/memory.c:163:16: warning: unused variable 'addr' =
[-Wunused-variable]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:134: Warning: macro instruction expanded into mul=
tiple instructions
    1    mm/shmem.c:2736:35: warning: variable 'shmem_falloc_waitq' is unin=
itialized when used within its own initialization [-Wuninitialized]
    1    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is uninitiali=
zed when used within its own initialization [-Wuninitialized]
    1    fs/proc/base.c:1894:35: warning: variable 'wq' is uninitialized wh=
en used within its own initialization [-Wuninitialized]
    1    fs/namei.c:3128:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    fs/namei.c:1640:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mism=
atch in conditional expression
    1    drivers/android/binderfs.c:657:41: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb=
/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb=
/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb=
/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@2/linux/build/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb=
/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/us=
b/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/us=
b/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
/linux/build/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/s=
torage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
/linux/build/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/s=
torage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-usbat.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-usbat.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-usbat.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-usbat.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-usbat.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-usbat.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-usbat.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-usbat.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-usbat.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-usbat.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-usbat.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-usbat.ko needs unknown symbol usb_stor_clear_halt
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-usbat.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-usbat.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-usbat.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-usbat.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr55.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr55.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr55.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr55.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr55.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr55.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr55.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr55.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr55.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr55.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr55.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr55.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr55.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_CB_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-sddr09.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-realtek.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-realtek.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-realtek.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-realtek.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-realtek.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-realtek.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-realtek.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-realtek.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-realtek.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-onetouch.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-onetouch.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-onetouch.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-onetouch.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-onetouch.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-onetouch.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-onetouch.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-onetouch.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-onetouch.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-karma.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-karma.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-karma.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-karma.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-karma.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-karma.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-karma.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-karma.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-karma.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-karma.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-karma.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-karma.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-jumpshot.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-jumpshot.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-jumpshot.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-jumpshot.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-jumpshot.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-jumpshot.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-jumpshot.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-jumpshot.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-jumpshot.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-jumpshot.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-jumpshot.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-jumpshot.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-jumpshot.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-jumpshot.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-jumpshot.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-isd200.ko needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-isd200.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-isd200.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-isd200.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-isd200.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-isd200.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-isd200.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-isd200.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-isd200.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-isd200.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-isd200.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-isd200.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-isd200.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-freecom.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-freecom.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-freecom.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-freecom.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-freecom.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-freecom.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-freecom.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-freecom.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-freecom.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-freecom.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-freecom.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-freecom.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-eneub6250.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-eneub6250.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-eneub6250.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-eneub6250.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-eneub6250.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-eneub6250.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-eneub6250.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-eneub6250.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-eneub6250.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-eneub6250.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-eneub6250.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-datafab.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-datafab.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-datafab.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-datafab.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-datafab.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-datafab.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-datafab.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-datafab.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-datafab.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-datafab.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-datafab.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-datafab.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-datafab.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-datafab.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-cypress.ko needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-cypress.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-cypress.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-cypress.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-cypress.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-cypress.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-cypress.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-cypress.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-cypress.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-cypress.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-cypress.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-alauda.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-alauda.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-alauda.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-alauda.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-alauda.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-alauda.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-alauda.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-alauda.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-alauda.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-alauda.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-alauda.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-alauda.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-alauda.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-alauda.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/u=
ms-alauda.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/uas=
.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/uas=
.ko needs unknown symbol usb_stor_adjust_quirks
    1    cc1: all warnings being treated as errors
    1    arch/mips/include/asm/octeon/cvmx-ipd.h:330:27: warning: unused va=
riable 'pip_sft_rst' [-Wunused-variable]
    1    arch/arm/configs/omap2plus_defconfig:487:warning: symbol value 'm'=
 invalid for REMOTEPROC
    1    arch/arm/configs/davinci_all_defconfig:231:warning: symbol value '=
m' invalid for REMOTEPROC
    1    2 warnings generated.
    1    .config:1172:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.xLTrv9AIxy:3376:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xLTrv9AIxy:3360:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.xLTrv9AIxy:3359:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.xLTrv9AIxy:3355:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.xLTrv9AIxy:3335:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.xLTrv9AIxy:3329:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.xLTrv9AIxy:3320:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.xLTrv9AIxy:3318:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.xLTrv9AIxy:3317:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.xLTrv9AIxy:3316:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.xLTrv9AIxy:3314:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.xLTrv9AIxy:3313:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.xLTrv9AIxy:3310:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.xLTrv9AIxy:3303:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.xLTrv9AIxy:3293:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.xLTrv9AIxy:3282:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xLTrv9AIxy:3174:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.xLTrv9AIxy:3170:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.xLTrv9AIxy:3145:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.xLTrv9AIxy:3124:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.xLTrv9AIxy:3066:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.xLTrv9AIxy:3065:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.xLTrv9AIxy:3061:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.xLTrv9AIxy:3060:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.xLTrv9AIxy:3058:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.xLTrv9AIxy:3057:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.xLTrv9AIxy:3054:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.vWsmQmhUGH:8484:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vWsmQmhUGH:8468:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.vWsmQmhUGH:8467:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.vWsmQmhUGH:8463:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.vWsmQmhUGH:8443:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.vWsmQmhUGH:8437:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.vWsmQmhUGH:8428:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.vWsmQmhUGH:8426:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.vWsmQmhUGH:8425:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.vWsmQmhUGH:8424:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.vWsmQmhUGH:8422:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.vWsmQmhUGH:8421:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.vWsmQmhUGH:8418:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.vWsmQmhUGH:8411:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.vWsmQmhUGH:8401:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.vWsmQmhUGH:8390:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vWsmQmhUGH:8282:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.vWsmQmhUGH:8278:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.vWsmQmhUGH:8253:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.vWsmQmhUGH:8232:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.vWsmQmhUGH:8174:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.vWsmQmhUGH:8173:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.vWsmQmhUGH:8169:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.vWsmQmhUGH:8168:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.vWsmQmhUGH:8166:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.vWsmQmhUGH:8165:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.vWsmQmhUGH:8162:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.pkdYYoTE1i:1749:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.pkdYYoTE1i:1733:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.pkdYYoTE1i:1732:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.pkdYYoTE1i:1728:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.pkdYYoTE1i:1708:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.pkdYYoTE1i:1702:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.pkdYYoTE1i:1693:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.pkdYYoTE1i:1691:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.pkdYYoTE1i:1690:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.pkdYYoTE1i:1689:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.pkdYYoTE1i:1687:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.pkdYYoTE1i:1686:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.pkdYYoTE1i:1683:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.pkdYYoTE1i:1676:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.pkdYYoTE1i:1666:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.pkdYYoTE1i:1655:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.pkdYYoTE1i:1547:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.pkdYYoTE1i:1543:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.pkdYYoTE1i:1518:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.pkdYYoTE1i:1497:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.pkdYYoTE1i:1439:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.pkdYYoTE1i:1438:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.pkdYYoTE1i:1434:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.pkdYYoTE1i:1433:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.pkdYYoTE1i:1431:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.pkdYYoTE1i:1430:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.pkdYYoTE1i:1427:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ZXOWR0Sbg9:7925:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ZXOWR0Sbg9:7909:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ZXOWR0Sbg9:7908:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.ZXOWR0Sbg9:7904:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.ZXOWR0Sbg9:7884:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.ZXOWR0Sbg9:7878:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.ZXOWR0Sbg9:7869:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.ZXOWR0Sbg9:7867:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ZXOWR0Sbg9:7866:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.ZXOWR0Sbg9:7865:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.ZXOWR0Sbg9:7863:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.ZXOWR0Sbg9:7862:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.ZXOWR0Sbg9:7859:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.ZXOWR0Sbg9:7852:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.ZXOWR0Sbg9:7842:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.ZXOWR0Sbg9:7831:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ZXOWR0Sbg9:7723:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.ZXOWR0Sbg9:7719:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.ZXOWR0Sbg9:7694:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.ZXOWR0Sbg9:7673:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.ZXOWR0Sbg9:7615:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.ZXOWR0Sbg9:7614:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.ZXOWR0Sbg9:7610:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.ZXOWR0Sbg9:7609:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.ZXOWR0Sbg9:7607:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.ZXOWR0Sbg9:7606:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.ZXOWR0Sbg9:7603:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.MWvfkWxcDE:4836:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.MWvfkWxcDE:4820:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.MWvfkWxcDE:4819:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.MWvfkWxcDE:4815:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.MWvfkWxcDE:4795:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.MWvfkWxcDE:4789:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.MWvfkWxcDE:4780:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.MWvfkWxcDE:4778:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.MWvfkWxcDE:4777:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.MWvfkWxcDE:4776:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.MWvfkWxcDE:4774:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.MWvfkWxcDE:4773:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.MWvfkWxcDE:4770:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.MWvfkWxcDE:4763:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.MWvfkWxcDE:4753:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.MWvfkWxcDE:4742:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.MWvfkWxcDE:4634:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.MWvfkWxcDE:4630:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.MWvfkWxcDE:4605:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.MWvfkWxcDE:4584:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.MWvfkWxcDE:4526:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.MWvfkWxcDE:4525:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.MWvfkWxcDE:4521:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.MWvfkWxcDE:4520:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.MWvfkWxcDE:4518:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.MWvfkWxcDE:4517:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.MWvfkWxcDE:4514:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.8oUarM48ee:4897:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.8oUarM48ee:4881:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.8oUarM48ee:4880:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.8oUarM48ee:4876:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.8oUarM48ee:4856:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.8oUarM48ee:4850:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.8oUarM48ee:4841:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.8oUarM48ee:4839:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.8oUarM48ee:4838:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.8oUarM48ee:4837:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.8oUarM48ee:4835:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.8oUarM48ee:4834:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.8oUarM48ee:4831:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.8oUarM48ee:4824:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.8oUarM48ee:4814:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.8oUarM48ee:4803:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.8oUarM48ee:4695:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.8oUarM48ee:4691:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.8oUarM48ee:4666:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.8oUarM48ee:4645:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.8oUarM48ee:4587:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.8oUarM48ee:4586:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.8oUarM48ee:4582:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.8oUarM48ee:4581:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.8oUarM48ee:4579:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.8oUarM48ee:4578:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.8oUarM48ee:4575:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.3QLlM7LWaI:3984:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.3QLlM7LWaI:3968:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.3QLlM7LWaI:3967:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.3QLlM7LWaI:3963:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.3QLlM7LWaI:3943:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.3QLlM7LWaI:3937:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.3QLlM7LWaI:3928:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.3QLlM7LWaI:3926:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.3QLlM7LWaI:3925:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.3QLlM7LWaI:3924:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.3QLlM7LWaI:3922:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.3QLlM7LWaI:3921:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.3QLlM7LWaI:3918:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.3QLlM7LWaI:3911:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.3QLlM7LWaI:3901:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.3QLlM7LWaI:3890:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.3QLlM7LWaI:3782:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.3QLlM7LWaI:3778:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.3QLlM7LWaI:3753:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.3QLlM7LWaI:3732:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.3QLlM7LWaI:3674:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.3QLlM7LWaI:3673:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.3QLlM7LWaI:3669:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.3QLlM7LWaI:3668:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.3QLlM7LWaI:3666:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.3QLlM7LWaI:3665:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.3QLlM7LWaI:3662:warning: override: reassigning to sy=
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
    ./.tmp.config.3QLlM7LWaI:3662:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.3QLlM7LWaI:3665:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.3QLlM7LWaI:3666:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.3QLlM7LWaI:3668:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.3QLlM7LWaI:3669:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.3QLlM7LWaI:3673:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.3QLlM7LWaI:3674:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.3QLlM7LWaI:3732:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.3QLlM7LWaI:3753:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.3QLlM7LWaI:3778:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.3QLlM7LWaI:3782:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.3QLlM7LWaI:3890:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.3QLlM7LWaI:3901:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.3QLlM7LWaI:3911:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.3QLlM7LWaI:3918:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.3QLlM7LWaI:3921:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.3QLlM7LWaI:3922:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.3QLlM7LWaI:3924:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.3QLlM7LWaI:3925:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.3QLlM7LWaI:3926:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.3QLlM7LWaI:3928:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.3QLlM7LWaI:3937:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.3QLlM7LWaI:3943:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.3QLlM7LWaI:3963:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.3QLlM7LWaI:3967:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.3QLlM7LWaI:3968:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.3QLlM7LWaI:3984:warning: override: reassigning to symbol =
USER_NS
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, clang-8) =E2=80=94 FAIL, 1 error, 11 warnings, 0 secti=
on mismatches

Errors:
    clang: error: linker command failed with exit code 1 (use -v to see inv=
ocation)

Warnings:
    mm/shmem.c:2736:35: warning: variable 'shmem_falloc_waitq' is uninitial=
ized when used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/proc/base.c:1894:35: warning: variable 'wq' is uninitialized when us=
ed within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/proc/proc_sysctl.c:705:35: warning: variable 'wq' is uninitialized w=
hen used within its own initialization [-Wuninitialized]
    1 warning generated.
    fs/namei.c:1640:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    fs/namei.c:3128:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    2 warnings generated.
    drivers/android/binderfs.c:657:41: warning: suggest braces around initi=
alization of subobject [-Wmissing-braces]
    1 warning generated.

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section =
mismatches

Errors:
    collect2: error: ld returned 1 exit status

---------------------------------------------------------------------------=
-----
allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section mi=
smatches

Errors:
    collect2: error: ld returned 1 exit status

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 section=
 mismatches

Errors:
    collect2: error: ld returned 1 exit status

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
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

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
    ./.tmp.config.xLTrv9AIxy:3054:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.xLTrv9AIxy:3057:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.xLTrv9AIxy:3058:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.xLTrv9AIxy:3060:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.xLTrv9AIxy:3061:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.xLTrv9AIxy:3065:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.xLTrv9AIxy:3066:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.xLTrv9AIxy:3124:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.xLTrv9AIxy:3145:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.xLTrv9AIxy:3170:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.xLTrv9AIxy:3174:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.xLTrv9AIxy:3282:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.xLTrv9AIxy:3293:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.xLTrv9AIxy:3303:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.xLTrv9AIxy:3310:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.xLTrv9AIxy:3313:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.xLTrv9AIxy:3314:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.xLTrv9AIxy:3316:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.xLTrv9AIxy:3317:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.xLTrv9AIxy:3318:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.xLTrv9AIxy:3320:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.xLTrv9AIxy:3329:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.xLTrv9AIxy:3335:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.xLTrv9AIxy:3355:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.xLTrv9AIxy:3359:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.xLTrv9AIxy:3360:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.xLTrv9AIxy:3376:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 30 warnings, 0=
 section mismatches

Warnings:
    arch/arm64/configs/defconfig:726:warning: symbol value 'm' invalid for =
REMOTEPROC
    ./.tmp.config.ZXOWR0Sbg9:7603:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.ZXOWR0Sbg9:7606:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.ZXOWR0Sbg9:7607:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.ZXOWR0Sbg9:7609:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.ZXOWR0Sbg9:7610:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.ZXOWR0Sbg9:7614:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.ZXOWR0Sbg9:7615:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.ZXOWR0Sbg9:7673:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.ZXOWR0Sbg9:7694:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.ZXOWR0Sbg9:7719:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.ZXOWR0Sbg9:7723:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.ZXOWR0Sbg9:7831:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.ZXOWR0Sbg9:7842:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.ZXOWR0Sbg9:7852:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.ZXOWR0Sbg9:7859:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.ZXOWR0Sbg9:7862:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.ZXOWR0Sbg9:7863:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.ZXOWR0Sbg9:7865:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.ZXOWR0Sbg9:7866:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.ZXOWR0Sbg9:7867:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.ZXOWR0Sbg9:7869:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.ZXOWR0Sbg9:7878:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.ZXOWR0Sbg9:7884:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.ZXOWR0Sbg9:7904:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.ZXOWR0Sbg9:7908:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.ZXOWR0Sbg9:7909:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.ZXOWR0Sbg9:7925:warning: override: reassigning to symbol =
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
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-al=
auda.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-al=
auda.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-al=
auda.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-al=
auda.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-al=
auda.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-al=
auda.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-al=
auda.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-al=
auda.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-al=
auda.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-al=
auda.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-al=
auda.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-al=
auda.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-al=
auda.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-al=
auda.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-al=
auda.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-cy=
press.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-cy=
press.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-cy=
press.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-cy=
press.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-cy=
press.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-cy=
press.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-cy=
press.ko needs unknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-cy=
press.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-cy=
press.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-cy=
press.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-cy=
press.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-da=
tafab.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-da=
tafab.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-da=
tafab.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-da=
tafab.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-da=
tafab.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-da=
tafab.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-da=
tafab.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-da=
tafab.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-da=
tafab.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-da=
tafab.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-da=
tafab.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-da=
tafab.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-da=
tafab.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-da=
tafab.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-en=
eub6250.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-en=
eub6250.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-en=
eub6250.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-en=
eub6250.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-en=
eub6250.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-en=
eub6250.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-en=
eub6250.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-en=
eub6250.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-en=
eub6250.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-en=
eub6250.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-en=
eub6250.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-en=
eub6250.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-en=
eub6250.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-fr=
eecom.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-fr=
eecom.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-fr=
eecom.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-fr=
eecom.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-fr=
eecom.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-fr=
eecom.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-fr=
eecom.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-fr=
eecom.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-fr=
eecom.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-fr=
eecom.ko needs unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-fr=
eecom.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-fr=
eecom.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-is=
d200.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-is=
d200.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-is=
d200.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-is=
d200.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-is=
d200.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-is=
d200.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-is=
d200.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-is=
d200.ko needs unknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-is=
d200.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-is=
d200.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-is=
d200.ko needs unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-is=
d200.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-is=
d200.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ju=
mpshot.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ju=
mpshot.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ju=
mpshot.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ju=
mpshot.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ju=
mpshot.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ju=
mpshot.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ju=
mpshot.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ju=
mpshot.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ju=
mpshot.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ju=
mpshot.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ju=
mpshot.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ju=
mpshot.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ju=
mpshot.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ju=
mpshot.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ju=
mpshot.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ka=
rma.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ka=
rma.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ka=
rma.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ka=
rma.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ka=
rma.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ka=
rma.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ka=
rma.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ka=
rma.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ka=
rma.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ka=
rma.ko needs unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ka=
rma.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-ka=
rma.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-on=
etouch.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-on=
etouch.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-on=
etouch.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-on=
etouch.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-on=
etouch.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-on=
etouch.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-on=
etouch.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-on=
etouch.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-on=
etouch.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-re=
altek.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-re=
altek.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-re=
altek.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-re=
altek.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-re=
altek.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-re=
altek.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-re=
altek.ko needs unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-re=
altek.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-re=
altek.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_CB_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr09.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr55.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr55.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr55.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr55.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr55.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr55.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr55.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr55.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr55.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr55.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr55.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr55.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-sd=
dr55.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-us=
bat.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-us=
bat.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-us=
bat.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-us=
bat.ko needs unknown symbol usb_stor_clear_halt
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-us=
bat.ko needs unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-us=
bat.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-us=
bat.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-us=
bat.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-us=
bat.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-us=
bat.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-us=
bat.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-us=
bat.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-us=
bat.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-us=
bat.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-us=
bat.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/ums-us=
bat.ko needs unknown symbol usb_stor_set_xfer_buf

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
    ./.tmp.config.MWvfkWxcDE:4514:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.MWvfkWxcDE:4517:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.MWvfkWxcDE:4518:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.MWvfkWxcDE:4520:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.MWvfkWxcDE:4521:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.MWvfkWxcDE:4525:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.MWvfkWxcDE:4526:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.MWvfkWxcDE:4584:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.MWvfkWxcDE:4605:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.MWvfkWxcDE:4630:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.MWvfkWxcDE:4634:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.MWvfkWxcDE:4742:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.MWvfkWxcDE:4753:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.MWvfkWxcDE:4763:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.MWvfkWxcDE:4770:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.MWvfkWxcDE:4773:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.MWvfkWxcDE:4774:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.MWvfkWxcDE:4776:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.MWvfkWxcDE:4777:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.MWvfkWxcDE:4778:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.MWvfkWxcDE:4780:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.MWvfkWxcDE:4789:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.MWvfkWxcDE:4795:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.MWvfkWxcDE:4815:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.MWvfkWxcDE:4819:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.MWvfkWxcDE:4820:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.MWvfkWxcDE:4836:warning: override: reassigning to symbol =
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
malta_qemu_32r6_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warning=
s, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    {standard input}:134: Warning: macro instruction expanded into multiple=
 instructions
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
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@10/l=
inux/build/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/sto=
rage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@10/l=
inux/build/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/sto=
rage/uas.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 5 warnings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/uas.ko n=
eeds unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storage/uas.ko n=
eeds unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 5 warnings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build/linu=
x/build/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storag=
e/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build/linu=
x/build/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/storag=
e/uas.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 5 =
warnings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/stor=
age/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@2/li=
nux/build/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/stor=
age/uas.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 30 warn=
ings, 0 section mismatches

Warnings:
    arch/arm/configs/multi_v7_defconfig:936:warning: symbol value 'm' inval=
id for REMOTEPROC
    ./.tmp.config.vWsmQmhUGH:8162:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.vWsmQmhUGH:8165:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.vWsmQmhUGH:8166:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.vWsmQmhUGH:8168:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.vWsmQmhUGH:8169:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.vWsmQmhUGH:8173:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.vWsmQmhUGH:8174:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.vWsmQmhUGH:8232:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.vWsmQmhUGH:8253:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.vWsmQmhUGH:8278:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.vWsmQmhUGH:8282:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.vWsmQmhUGH:8390:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.vWsmQmhUGH:8401:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.vWsmQmhUGH:8411:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.vWsmQmhUGH:8418:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.vWsmQmhUGH:8421:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.vWsmQmhUGH:8422:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.vWsmQmhUGH:8424:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.vWsmQmhUGH:8425:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.vWsmQmhUGH:8426:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.vWsmQmhUGH:8428:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.vWsmQmhUGH:8437:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.vWsmQmhUGH:8443:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.vWsmQmhUGH:8463:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.vWsmQmhUGH:8467:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.vWsmQmhUGH:8468:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.vWsmQmhUGH:8484:warning: override: reassigning to symbol =
USER_NS
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/stor=
age/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.3.0-next-20190924/kernel/drivers/usb/stor=
age/uas.ko needs unknown symbol usb_stor_adjust_quirks

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
    ./.tmp.config.pkdYYoTE1i:1427:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.pkdYYoTE1i:1430:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.pkdYYoTE1i:1431:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.pkdYYoTE1i:1433:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.pkdYYoTE1i:1434:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.pkdYYoTE1i:1438:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.pkdYYoTE1i:1439:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.pkdYYoTE1i:1497:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.pkdYYoTE1i:1518:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.pkdYYoTE1i:1543:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.pkdYYoTE1i:1547:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.pkdYYoTE1i:1655:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.pkdYYoTE1i:1666:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.pkdYYoTE1i:1676:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.pkdYYoTE1i:1683:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.pkdYYoTE1i:1686:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.pkdYYoTE1i:1687:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.pkdYYoTE1i:1689:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.pkdYYoTE1i:1690:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.pkdYYoTE1i:1691:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.pkdYYoTE1i:1693:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.pkdYYoTE1i:1702:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.pkdYYoTE1i:1708:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.pkdYYoTE1i:1728:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.pkdYYoTE1i:1732:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.pkdYYoTE1i:1733:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.pkdYYoTE1i:1749:warning: override: reassigning to symbol =
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
    .config:1172:warning: override: UNWINDER_GUESS changes choice state

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
    ./.tmp.config.8oUarM48ee:4575:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.8oUarM48ee:4578:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.8oUarM48ee:4579:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.8oUarM48ee:4581:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.8oUarM48ee:4582:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.8oUarM48ee:4586:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.8oUarM48ee:4587:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.8oUarM48ee:4645:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.8oUarM48ee:4666:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.8oUarM48ee:4691:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.8oUarM48ee:4695:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.8oUarM48ee:4803:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.8oUarM48ee:4814:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.8oUarM48ee:4824:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.8oUarM48ee:4831:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.8oUarM48ee:4834:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.8oUarM48ee:4835:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.8oUarM48ee:4837:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.8oUarM48ee:4838:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.8oUarM48ee:4839:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.8oUarM48ee:4841:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.8oUarM48ee:4850:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.8oUarM48ee:4856:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.8oUarM48ee:4876:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.8oUarM48ee:4880:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.8oUarM48ee:4881:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.8oUarM48ee:4897:warning: override: reassigning to symbol =
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
