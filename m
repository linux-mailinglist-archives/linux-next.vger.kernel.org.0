Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B76B2CB5A8
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2019 10:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729752AbfJDIDm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Oct 2019 04:03:42 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34965 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729252AbfJDIDm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Oct 2019 04:03:42 -0400
Received: by mail-wm1-f67.google.com with SMTP id y21so4823960wmi.0
        for <linux-next@vger.kernel.org>; Fri, 04 Oct 2019 01:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=trFJMY6UWNOJmVPdujkuYe6xBKx55zsLTF89z3ozBiE=;
        b=Dk0FFjjH8Ci5ArwHvno3E6zWn1sfLE2EuE4XGPMI+zWI6ZQcinlmq+gkqtbyWXnR0d
         QpjYxZ60R3/jfOgjEtQmordj1InDRI8o744uw6hfsOu42KbqJ49WPOrLT8dqOb4E3pUE
         +GE6LidDsdlfNqa7ZSvh37o93WlNb6t4Mmxz9xS0PGhYK5vkWmpEwlSh8PWAxWVw+osl
         w+i2VSOa0+5xzfifqvHLChxROr4ySNzRVi8ALxhEpm60ftA6Ah4CkvjK/wUxwHCVLjc/
         Lokyja819JNmff1kbySoC2lrRhd+23Uqtt1e/nnRJkBpiv6ajjtzKft4DGO1tGjfJM/D
         K2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=trFJMY6UWNOJmVPdujkuYe6xBKx55zsLTF89z3ozBiE=;
        b=VFb3pstJkesk5+y03G+ccGe0boM1I+tJclzhki8hzeTQXHbrY7aGZAdq63BbjydU9l
         Bwe4SzszsknlZ4r8tFbgaS8FISoozt41WZIjoSu269YHl+e+HfvkGTUIjJlvjcotEVsw
         RZ9BA2V04LG4X7MC9KM4MtsMqvWtRhQBaXXlgdhi12MWEl4jLD7RH8/jX0mSxHoRBUES
         qVdPQAmdEUP1ELUHbNUPcngvhG5M9ly43TprzO+Bx5oWqTWWwzMv+qEnsa48/fQA/OhO
         lI7it3H03Hw3QY1oNfd2INd7+0HEy7WRaJuEkk45lDOUnKcAVjEiEsGd2RI4nVwtpt1E
         JwwA==
X-Gm-Message-State: APjAAAWODdOrlDqGjRKPLcC7yJJ3Xq9CemVgQklQEFS9Q/f9cMRDbUtV
        OlLMGrJ0Yjn5pMsYTqhaUlLTLl6FNY8XLA==
X-Google-Smtp-Source: APXvYqyUFKN4M7rJ5MCDFmkxih97DHSj5cjOU70f2Ip+INpdJ94LhHAAHtHzLb/QMv7eiz6J3AfQJA==
X-Received: by 2002:a1c:2bc7:: with SMTP id r190mr10452955wmr.143.1570176210075;
        Fri, 04 Oct 2019 01:03:30 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id u10sm5387172wmm.0.2019.10.04.01.03.29
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 01:03:29 -0700 (PDT)
Message-ID: <5d96fcd1.1c69fb81.2e09b.958a@mx.google.com>
Date:   Fri, 04 Oct 2019 01:03:29 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: next-20191004
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master build: 218 builds: 5 failed, 213 passed, 8 errors,
 486 warnings (next-20191004)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master build: 218 builds: 5 failed, 213 passed, 8 errors, 486 warnings=
 (next-20191004)

Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191004/

Tree: next
Branch: master
Git Describe: next-20191004
Git Commit: 311ef88adfa3b69c40234bf3000d1269e718919a
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm64:
    allmodconfig: (clang-8) FAIL
    allmodconfig: (gcc-8) FAIL

arm:
    allmodconfig: (gcc-8) FAIL

mips:
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
    nsim_hs_defconfig (gcc-8): 30 warnings
    nsim_hs_smp_defconfig (gcc-8): 2 warnings
    nsimosci_hs_defconfig (gcc-8): 2 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 1 warning
    vdk_hs38_smp_defconfig (gcc-8): 1 warning

arm64:
    allmodconfig (clang-8): 1 error, 11 warnings
    allmodconfig (gcc-8): 1 error
    defconfig (gcc-8): 27 warnings

arm:
    allmodconfig (gcc-8): 1 error
    am200epdkit_defconfig (gcc-8): 1 warning
    at91_dt_defconfig (gcc-8): 1 warning
    axm55xx_defconfig (gcc-8): 1 warning
    cm_x2xx_defconfig (gcc-8): 1 warning
    cm_x300_defconfig (gcc-8): 1 warning
    cns3420vb_defconfig (gcc-8): 1 warning
    colibri_pxa270_defconfig (gcc-8): 1 warning
    colibri_pxa300_defconfig (gcc-8): 1 warning
    davinci_all_defconfig (gcc-8): 1 warning
    dove_defconfig (gcc-8): 1 warning
    em_x270_defconfig (gcc-8): 1 warning
    ep93xx_defconfig (gcc-8): 1 warning
    eseries_pxa_defconfig (gcc-8): 1 warning
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
    magician_defconfig (gcc-8): 1 warning
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
    s3c6400_defconfig (gcc-8): 1 warning
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
    zeus_defconfig (gcc-8): 1 warning

i386:
    i386_defconfig (gcc-8): 28 warnings

mips:
    32r2el_defconfig (gcc-8): 28 warnings
    db1xxx_defconfig (gcc-8): 1 warning
    ip32_defconfig (gcc-8): 1 warning
    jazz_defconfig (gcc-8): 1 warning
    malta_qemu_32r6_defconfig (gcc-8): 1 warning
    msp71xx_defconfig (gcc-8): 4 errors, 1 warning
    nlm_xlr_defconfig (gcc-8): 1 warning
    rm200_defconfig (gcc-8): 1 warning

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

Warnings summary:

    64   WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    26   <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    5    include/linux/kern_levels.h:5:18: warning: format '%lu' expects ar=
gument of type 'long unsigned int', but argument 8 has type 'unsigned int' =
[-Wformat=3D]
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
    1    fs/namei.c:3132:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    fs/namei.c:1644:34: warning: variable 'wq' is uninitialized when u=
sed within its own initialization [-Wuninitialized]
    1    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mism=
atch in conditional expression
    1    drivers/android/binderfs.c:657:41: warning: suggest braces around =
initialization of subobject [-Wmissing-braces]
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@8/linux/build/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@8/linux/build/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@6/linux/build/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@4/linux/build/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@4/linux/build/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers=
/usb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/driver=
s/usb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build=
@10/linux/build/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/driver=
s/usb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_clear_halt
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-usbat.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr55.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_CB_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol usb_stor_CB_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-sddr09.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-realtek.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-onetouch.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-karma.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-jumpshot.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-isd200.ko needs unknown symbol usb_stor_Bulk_transport
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_control_msg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-freecom.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_sg
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_bulk_srb
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-eneub6250.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-datafab.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_transparent_scsi_command
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-cypress.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_suspend
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_set_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_reset_resume
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_probe2
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_probe1
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_pre_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_post_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_host_template_init
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_disconnect
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_ctrl_transfer
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_bulk_transfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_access_xfer_buf
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol usb_stor_Bulk_reset
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/b=
uild/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/stora=
ge/ums-alauda.ko needs unknown symbol fill_inquiry_response
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage=
/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    1    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/bui=
ld/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage=
/uas.ko needs unknown symbol usb_stor_adjust_quirks
    1    cc1: all warnings being treated as errors
    1    2 warnings generated.
    1    .config:1172:warning: override: UNWINDER_GUESS changes choice state
    1    ./.tmp.config.zprgXmuD66:4833:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.zprgXmuD66:4817:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.zprgXmuD66:4816:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.zprgXmuD66:4812:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.zprgXmuD66:4792:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.zprgXmuD66:4786:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.zprgXmuD66:4777:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.zprgXmuD66:4775:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.zprgXmuD66:4774:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.zprgXmuD66:4773:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.zprgXmuD66:4771:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.zprgXmuD66:4770:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.zprgXmuD66:4767:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.zprgXmuD66:4760:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.zprgXmuD66:4750:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.zprgXmuD66:4739:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.zprgXmuD66:4631:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.zprgXmuD66:4627:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.zprgXmuD66:4602:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.zprgXmuD66:4581:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.zprgXmuD66:4523:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.zprgXmuD66:4522:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.zprgXmuD66:4518:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.zprgXmuD66:4517:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.zprgXmuD66:4515:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.zprgXmuD66:4514:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.zprgXmuD66:4511:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.r8yKwbyJ8T:7940:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.r8yKwbyJ8T:7924:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.r8yKwbyJ8T:7923:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.r8yKwbyJ8T:7919:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.r8yKwbyJ8T:7899:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.r8yKwbyJ8T:7893:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.r8yKwbyJ8T:7884:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.r8yKwbyJ8T:7882:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.r8yKwbyJ8T:7881:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.r8yKwbyJ8T:7880:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.r8yKwbyJ8T:7878:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.r8yKwbyJ8T:7877:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.r8yKwbyJ8T:7874:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.r8yKwbyJ8T:7867:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.r8yKwbyJ8T:7857:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.r8yKwbyJ8T:7846:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.r8yKwbyJ8T:7738:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.r8yKwbyJ8T:7734:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.r8yKwbyJ8T:7709:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.r8yKwbyJ8T:7688:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.r8yKwbyJ8T:7630:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.r8yKwbyJ8T:7629:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.r8yKwbyJ8T:7625:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.r8yKwbyJ8T:7624:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.r8yKwbyJ8T:7622:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.r8yKwbyJ8T:7621:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.r8yKwbyJ8T:7618:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.bcVqcNSWuv:3374:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.bcVqcNSWuv:3358:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.bcVqcNSWuv:3357:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.bcVqcNSWuv:3353:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.bcVqcNSWuv:3333:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.bcVqcNSWuv:3327:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.bcVqcNSWuv:3318:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.bcVqcNSWuv:3316:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.bcVqcNSWuv:3315:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.bcVqcNSWuv:3314:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.bcVqcNSWuv:3312:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.bcVqcNSWuv:3311:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.bcVqcNSWuv:3308:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.bcVqcNSWuv:3301:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.bcVqcNSWuv:3291:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.bcVqcNSWuv:3280:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.bcVqcNSWuv:3172:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.bcVqcNSWuv:3168:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.bcVqcNSWuv:3143:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.bcVqcNSWuv:3122:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.bcVqcNSWuv:3064:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.bcVqcNSWuv:3063:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.bcVqcNSWuv:3059:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.bcVqcNSWuv:3058:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.bcVqcNSWuv:3056:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.bcVqcNSWuv:3055:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.bcVqcNSWuv:3052:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.PSbE0OGNre:3983:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.PSbE0OGNre:3967:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.PSbE0OGNre:3966:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.PSbE0OGNre:3962:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.PSbE0OGNre:3942:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.PSbE0OGNre:3936:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.PSbE0OGNre:3927:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.PSbE0OGNre:3925:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.PSbE0OGNre:3924:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.PSbE0OGNre:3923:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.PSbE0OGNre:3921:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.PSbE0OGNre:3920:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.PSbE0OGNre:3917:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.PSbE0OGNre:3910:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.PSbE0OGNre:3900:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.PSbE0OGNre:3889:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.PSbE0OGNre:3781:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.PSbE0OGNre:3777:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.PSbE0OGNre:3752:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.PSbE0OGNre:3731:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.PSbE0OGNre:3673:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.PSbE0OGNre:3672:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.PSbE0OGNre:3668:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.PSbE0OGNre:3667:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.PSbE0OGNre:3665:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.PSbE0OGNre:3664:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.PSbE0OGNre:3661:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.NT11nT8yPA:4894:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.NT11nT8yPA:4878:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.NT11nT8yPA:4877:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.NT11nT8yPA:4873:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.NT11nT8yPA:4853:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.NT11nT8yPA:4847:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.NT11nT8yPA:4838:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.NT11nT8yPA:4836:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.NT11nT8yPA:4835:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.NT11nT8yPA:4834:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.NT11nT8yPA:4832:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.NT11nT8yPA:4831:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.NT11nT8yPA:4828:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.NT11nT8yPA:4821:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.NT11nT8yPA:4811:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.NT11nT8yPA:4800:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.NT11nT8yPA:4692:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.NT11nT8yPA:4688:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.NT11nT8yPA:4663:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.NT11nT8yPA:4642:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.NT11nT8yPA:4584:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.NT11nT8yPA:4583:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.NT11nT8yPA:4579:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.NT11nT8yPA:4578:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.NT11nT8yPA:4576:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.NT11nT8yPA:4575:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.NT11nT8yPA:4572:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.HleLRcQDW8:8493:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.HleLRcQDW8:8477:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.HleLRcQDW8:8476:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.HleLRcQDW8:8472:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.HleLRcQDW8:8452:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.HleLRcQDW8:8446:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.HleLRcQDW8:8437:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.HleLRcQDW8:8435:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.HleLRcQDW8:8434:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.HleLRcQDW8:8433:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.HleLRcQDW8:8431:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.HleLRcQDW8:8430:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.HleLRcQDW8:8427:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.HleLRcQDW8:8420:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.HleLRcQDW8:8410:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.HleLRcQDW8:8399:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.HleLRcQDW8:8291:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.HleLRcQDW8:8287:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.HleLRcQDW8:8262:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.HleLRcQDW8:8241:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.HleLRcQDW8:8183:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.HleLRcQDW8:8182:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.HleLRcQDW8:8178:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.HleLRcQDW8:8177:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.HleLRcQDW8:8175:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.HleLRcQDW8:8174:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.HleLRcQDW8:8171:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.7Uk1UHlzUr:1749:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7Uk1UHlzUr:1733:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.7Uk1UHlzUr:1732:warning: override: reassigning to sy=
mbol STAGING
    1    ./.tmp.config.7Uk1UHlzUr:1728:warning: override: reassigning to sy=
mbol SECURITYFS
    1    ./.tmp.config.7Uk1UHlzUr:1708:warning: override: reassigning to sy=
mbol IPV6_GRE
    1    ./.tmp.config.7Uk1UHlzUr:1702:warning: override: reassigning to sy=
mbol NET_CLS_FLOWER
    1    ./.tmp.config.7Uk1UHlzUr:1693:warning: override: reassigning to sy=
mbol IPV6
    1    ./.tmp.config.7Uk1UHlzUr:1691:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.7Uk1UHlzUr:1690:warning: override: reassigning to sy=
mbol NET_SCHED
    1    ./.tmp.config.7Uk1UHlzUr:1689:warning: override: reassigning to sy=
mbol NET_CLS_ACT
    1    ./.tmp.config.7Uk1UHlzUr:1687:warning: override: reassigning to sy=
mbol CGROUP_BPF
    1    ./.tmp.config.7Uk1UHlzUr:1686:warning: override: reassigning to sy=
mbol TEST_BPF
    1    ./.tmp.config.7Uk1UHlzUr:1683:warning: override: reassigning to sy=
mbol BPF_SYSCALL
    1    ./.tmp.config.7Uk1UHlzUr:1676:warning: override: reassigning to sy=
mbol ANDROID
    1    ./.tmp.config.7Uk1UHlzUr:1666:warning: override: reassigning to sy=
mbol NOTIFIER_ERROR_INJECTION
    1    ./.tmp.config.7Uk1UHlzUr:1655:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7Uk1UHlzUr:1547:warning: override: reassigning to sy=
mbol NET_NS
    1    ./.tmp.config.7Uk1UHlzUr:1543:warning: override: reassigning to sy=
mbol USER_NS
    1    ./.tmp.config.7Uk1UHlzUr:1518:warning: override: reassigning to sy=
mbol NET_ACT_GACT
    1    ./.tmp.config.7Uk1UHlzUr:1497:warning: override: reassigning to sy=
mbol NET_SCH_INGRESS
    1    ./.tmp.config.7Uk1UHlzUr:1439:warning: override: reassigning to sy=
mbol VLAN_8021Q
    1    ./.tmp.config.7Uk1UHlzUr:1438:warning: override: reassigning to sy=
mbol BRIDGE
    1    ./.tmp.config.7Uk1UHlzUr:1434:warning: override: reassigning to sy=
mbol VETH
    1    ./.tmp.config.7Uk1UHlzUr:1433:warning: override: reassigning to sy=
mbol IPV6_MULTIPLE_TABLES
    1    ./.tmp.config.7Uk1UHlzUr:1431:warning: override: reassigning to sy=
mbol NET_L3_MASTER_DEV
    1    ./.tmp.config.7Uk1UHlzUr:1430:warning: override: reassigning to sy=
mbol NET_VRF
    1    ./.tmp.config.7Uk1UHlzUr:1427:warning: override: reassigning to sy=
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
    1    WARNING: vmlinux.o(.text.unlikely+0x365c): Section mismatch in ref=
erence from the function pmax_setup_memory_region() to the function .init.t=
ext:add_memory_region()
    1    WARNING: vmlinux.o(.text.unlikely+0x32bc): Section mismatch in ref=
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
    ./.tmp.config.PSbE0OGNre:3661:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.PSbE0OGNre:3664:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.PSbE0OGNre:3665:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.PSbE0OGNre:3667:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.PSbE0OGNre:3668:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.PSbE0OGNre:3672:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.PSbE0OGNre:3673:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.PSbE0OGNre:3731:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.PSbE0OGNre:3752:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.PSbE0OGNre:3777:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.PSbE0OGNre:3781:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.PSbE0OGNre:3889:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.PSbE0OGNre:3900:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.PSbE0OGNre:3910:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.PSbE0OGNre:3917:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.PSbE0OGNre:3920:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.PSbE0OGNre:3921:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.PSbE0OGNre:3923:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.PSbE0OGNre:3924:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.PSbE0OGNre:3925:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.PSbE0OGNre:3927:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.PSbE0OGNre:3936:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.PSbE0OGNre:3942:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.PSbE0OGNre:3962:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.PSbE0OGNre:3966:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.PSbE0OGNre:3967:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.PSbE0OGNre:3983:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]

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
    fs/namei.c:1644:34: warning: variable 'wq' is uninitialized when used w=
ithin its own initialization [-Wuninitialized]
    fs/namei.c:3132:34: warning: variable 'wq' is uninitialized when used w=
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
allnoconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
    WARNING: vmlinux.o(.text.unlikely+0x365c): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
decstation_r4k_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings=
, 0 section mismatches

Section mismatches:
    WARNING: vmlinux.o(.text.unlikely+0x32bc): Section mismatch in referenc=
e from the function pmax_setup_memory_region() to the function .init.text:a=
dd_memory_region()

---------------------------------------------------------------------------=
-----
defconfig (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
defconfig (arm64, clang-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

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
    ./.tmp.config.bcVqcNSWuv:3052:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.bcVqcNSWuv:3055:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.bcVqcNSWuv:3056:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.bcVqcNSWuv:3058:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.bcVqcNSWuv:3059:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.bcVqcNSWuv:3063:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.bcVqcNSWuv:3064:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.bcVqcNSWuv:3122:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.bcVqcNSWuv:3143:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.bcVqcNSWuv:3168:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.bcVqcNSWuv:3172:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.bcVqcNSWuv:3280:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.bcVqcNSWuv:3291:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.bcVqcNSWuv:3301:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.bcVqcNSWuv:3308:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.bcVqcNSWuv:3311:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.bcVqcNSWuv:3312:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.bcVqcNSWuv:3314:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.bcVqcNSWuv:3315:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.bcVqcNSWuv:3316:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.bcVqcNSWuv:3318:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.bcVqcNSWuv:3327:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.bcVqcNSWuv:3333:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.bcVqcNSWuv:3353:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.bcVqcNSWuv:3357:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.bcVqcNSWuv:3358:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.bcVqcNSWuv:3374:warning: override: reassigning to symbol =
USER_NS

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 27 warnings, 0=
 section mismatches

Warnings:
    ./.tmp.config.r8yKwbyJ8T:7618:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.r8yKwbyJ8T:7621:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.r8yKwbyJ8T:7622:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.r8yKwbyJ8T:7624:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.r8yKwbyJ8T:7625:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.r8yKwbyJ8T:7629:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.r8yKwbyJ8T:7630:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.r8yKwbyJ8T:7688:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.r8yKwbyJ8T:7709:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.r8yKwbyJ8T:7734:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.r8yKwbyJ8T:7738:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.r8yKwbyJ8T:7846:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.r8yKwbyJ8T:7857:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.r8yKwbyJ8T:7867:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.r8yKwbyJ8T:7874:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.r8yKwbyJ8T:7877:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.r8yKwbyJ8T:7878:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.r8yKwbyJ8T:7880:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.r8yKwbyJ8T:7881:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.r8yKwbyJ8T:7882:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.r8yKwbyJ8T:7884:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.r8yKwbyJ8T:7893:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.r8yKwbyJ8T:7899:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.r8yKwbyJ8T:7919:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.r8yKwbyJ8T:7923:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.r8yKwbyJ8T:7924:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.r8yKwbyJ8T:7940:warning: override: reassigning to symbol =
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
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-alauda.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-alauda.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-alauda.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-alauda.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-alauda.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-alauda.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-alauda.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-alauda.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-alauda.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-alauda.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-alauda.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-alauda.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-alauda.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-alauda.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-alauda.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-cypress.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-cypress.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-cypress.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-cypress.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-cypress.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-cypress.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-cypress.ko needs unknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-cypress.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-cypress.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-cypress.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-cypress.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-datafab.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-datafab.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-datafab.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-datafab.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-datafab.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-datafab.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-datafab.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-datafab.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-datafab.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-datafab.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-datafab.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-datafab.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-datafab.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-datafab.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-eneub6250.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-eneub6250.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-eneub6250.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-eneub6250.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-eneub6250.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-eneub6250.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-eneub6250.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-eneub6250.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-eneub6250.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-eneub6250.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-eneub6250.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-eneub6250.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-freecom.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-freecom.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-freecom.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-freecom.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-freecom.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-freecom.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-freecom.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-freecom.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-freecom.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-freecom.ko needs unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-freecom.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-freecom.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-isd200.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-isd200.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-isd200.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-isd200.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-isd200.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-isd200.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-isd200.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-isd200.ko needs unknown symbol usb_stor_transparent_scsi_command
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-isd200.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-isd200.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-isd200.ko needs unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-isd200.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-isd200.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-jumpshot.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-jumpshot.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-jumpshot.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-jumpshot.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-jumpshot.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-jumpshot.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-jumpshot.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-jumpshot.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-jumpshot.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-jumpshot.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-jumpshot.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-jumpshot.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-jumpshot.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-jumpshot.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-jumpshot.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-karma.ko needs unknown symbol usb_stor_Bulk_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-karma.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-karma.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-karma.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-karma.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-karma.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-karma.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-karma.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-karma.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-karma.ko needs unknown symbol usb_stor_Bulk_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-karma.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-karma.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-onetouch.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-onetouch.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-onetouch.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-onetouch.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-onetouch.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-onetouch.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-onetouch.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-onetouch.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-onetouch.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-realtek.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-realtek.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-realtek.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-realtek.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-realtek.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-realtek.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-realtek.ko needs unknown symbol usb_stor_control_msg
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-realtek.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-realtek.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_bulk_srb
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_CB_transport
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr09.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr55.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr55.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr55.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr55.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr55.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr55.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr55.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr55.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr55.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr55.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr55.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr55.ko needs unknown symbol usb_stor_bulk_transfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-sddr55.ko needs unknown symbol usb_stor_set_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-usbat.ko needs unknown symbol usb_stor_bulk_transfer_sg
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-usbat.ko needs unknown symbol usb_stor_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-usbat.ko needs unknown symbol usb_stor_probe1
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-usbat.ko needs unknown symbol usb_stor_clear_halt
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-usbat.ko needs unknown symbol usb_stor_CB_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-usbat.ko needs unknown symbol usb_stor_suspend
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-usbat.ko needs unknown symbol usb_stor_ctrl_transfer
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-usbat.ko needs unknown symbol usb_stor_reset_resume
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-usbat.ko needs unknown symbol usb_stor_pre_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-usbat.ko needs unknown symbol usb_stor_host_template_init
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-usbat.ko needs unknown symbol fill_inquiry_response
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-usbat.ko needs unknown symbol usb_stor_probe2
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-usbat.ko needs unknown symbol usb_stor_disconnect
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-usbat.ko needs unknown symbol usb_stor_post_reset
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-usbat.ko needs unknown symbol usb_stor_access_xfer_buf
    depmod: WARNING: /home/buildslave/workspace/kernel-build@2/linux/build/=
_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/um=
s-usbat.ko needs unknown symbol usb_stor_set_xfer_buf

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
    ./.tmp.config.zprgXmuD66:4511:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.zprgXmuD66:4514:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.zprgXmuD66:4515:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.zprgXmuD66:4517:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.zprgXmuD66:4518:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.zprgXmuD66:4522:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.zprgXmuD66:4523:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.zprgXmuD66:4581:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.zprgXmuD66:4602:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.zprgXmuD66:4627:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.zprgXmuD66:4631:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.zprgXmuD66:4739:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.zprgXmuD66:4750:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.zprgXmuD66:4760:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.zprgXmuD66:4767:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.zprgXmuD66:4770:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.zprgXmuD66:4771:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.zprgXmuD66:4773:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.zprgXmuD66:4774:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.zprgXmuD66:4775:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.zprgXmuD66:4777:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.zprgXmuD66:4786:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.zprgXmuD66:4792:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.zprgXmuD66:4812:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.zprgXmuD66:4816:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.zprgXmuD66:4817:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.zprgXmuD66:4833:warning: override: reassigning to symbol =
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
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@10/l=
inux/build/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb=
/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@10/l=
inux/build/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb=
/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 3 warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@8/li=
nux/build/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@8/li=
nux/build/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@6/li=
nux/build/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 =
warnings, 0 section mismatches

Warnings:
    WARNING: "return_address" [vmlinux] is a static EXPORT_SYMBOL_GPL
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@4/li=
nux/build/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/workspace/kernel-build@4/li=
nux/build/_modules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/=
storage/uas.ko needs unknown symbol usb_stor_adjust_quirks

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 30 warn=
ings, 0 section mismatches

Warnings:
    ./.tmp.config.HleLRcQDW8:8171:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.HleLRcQDW8:8174:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.HleLRcQDW8:8175:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.HleLRcQDW8:8177:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.HleLRcQDW8:8178:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.HleLRcQDW8:8182:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.HleLRcQDW8:8183:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.HleLRcQDW8:8241:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.HleLRcQDW8:8262:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.HleLRcQDW8:8287:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.HleLRcQDW8:8291:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.HleLRcQDW8:8399:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.HleLRcQDW8:8410:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.HleLRcQDW8:8420:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.HleLRcQDW8:8427:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.HleLRcQDW8:8430:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.HleLRcQDW8:8431:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.HleLRcQDW8:8433:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.HleLRcQDW8:8434:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.HleLRcQDW8:8435:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.HleLRcQDW8:8437:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.HleLRcQDW8:8446:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.HleLRcQDW8:8452:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.HleLRcQDW8:8472:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.HleLRcQDW8:8476:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.HleLRcQDW8:8477:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.HleLRcQDW8:8493:warning: override: reassigning to symbol =
USER_NS
    include/linux/kern_levels.h:5:18: warning: format '%lu' expects argumen=
t of type 'long unsigned int', but argument 8 has type 'unsigned int' [-Wfo=
rmat=3D]
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/uas.=
ko needs unknown symbol usb_stor_sense_invalidCDB
    depmod: WARNING: /home/buildslave/workspace/kernel-build/linux/build/_m=
odules_/lib/modules/5.4.0-rc1-next-20191004/kernel/drivers/usb/storage/uas.=
ko needs unknown symbol usb_stor_adjust_quirks

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
    ./.tmp.config.7Uk1UHlzUr:1427:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.7Uk1UHlzUr:1430:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.7Uk1UHlzUr:1431:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.7Uk1UHlzUr:1433:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.7Uk1UHlzUr:1434:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.7Uk1UHlzUr:1438:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.7Uk1UHlzUr:1439:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.7Uk1UHlzUr:1497:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.7Uk1UHlzUr:1518:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.7Uk1UHlzUr:1543:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.7Uk1UHlzUr:1547:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.7Uk1UHlzUr:1655:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.7Uk1UHlzUr:1666:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.7Uk1UHlzUr:1676:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.7Uk1UHlzUr:1683:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.7Uk1UHlzUr:1686:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.7Uk1UHlzUr:1687:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.7Uk1UHlzUr:1689:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.7Uk1UHlzUr:1690:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.7Uk1UHlzUr:1691:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.7Uk1UHlzUr:1693:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.7Uk1UHlzUr:1702:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.7Uk1UHlzUr:1708:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.7Uk1UHlzUr:1728:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.7Uk1UHlzUr:1732:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.7Uk1UHlzUr:1733:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.7Uk1UHlzUr:1749:warning: override: reassigning to symbol =
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
tinyconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

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
tinyconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section mi=
smatches

---------------------------------------------------------------------------=
-----
tinyconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section m=
ismatches

Warnings:
    .config:1172:warning: override: UNWINDER_GUESS changes choice state

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
    ./.tmp.config.NT11nT8yPA:4572:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.NT11nT8yPA:4575:warning: override: reassigning to symbol =
NET_VRF
    ./.tmp.config.NT11nT8yPA:4576:warning: override: reassigning to symbol =
NET_L3_MASTER_DEV
    ./.tmp.config.NT11nT8yPA:4578:warning: override: reassigning to symbol =
IPV6_MULTIPLE_TABLES
    ./.tmp.config.NT11nT8yPA:4579:warning: override: reassigning to symbol =
VETH
    ./.tmp.config.NT11nT8yPA:4583:warning: override: reassigning to symbol =
BRIDGE
    ./.tmp.config.NT11nT8yPA:4584:warning: override: reassigning to symbol =
VLAN_8021Q
    ./.tmp.config.NT11nT8yPA:4642:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.NT11nT8yPA:4663:warning: override: reassigning to symbol =
NET_ACT_GACT
    ./.tmp.config.NT11nT8yPA:4688:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.NT11nT8yPA:4692:warning: override: reassigning to symbol =
NET_NS
    ./.tmp.config.NT11nT8yPA:4800:warning: override: reassigning to symbol =
USER_NS
    ./.tmp.config.NT11nT8yPA:4811:warning: override: reassigning to symbol =
NOTIFIER_ERROR_INJECTION
    ./.tmp.config.NT11nT8yPA:4821:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.NT11nT8yPA:4828:warning: override: reassigning to symbol =
BPF_SYSCALL
    ./.tmp.config.NT11nT8yPA:4831:warning: override: reassigning to symbol =
TEST_BPF
    ./.tmp.config.NT11nT8yPA:4832:warning: override: reassigning to symbol =
CGROUP_BPF
    ./.tmp.config.NT11nT8yPA:4834:warning: override: reassigning to symbol =
NET_CLS_ACT
    ./.tmp.config.NT11nT8yPA:4835:warning: override: reassigning to symbol =
NET_SCHED
    ./.tmp.config.NT11nT8yPA:4836:warning: override: reassigning to symbol =
NET_SCH_INGRESS
    ./.tmp.config.NT11nT8yPA:4838:warning: override: reassigning to symbol =
IPV6
    ./.tmp.config.NT11nT8yPA:4847:warning: override: reassigning to symbol =
NET_CLS_FLOWER
    ./.tmp.config.NT11nT8yPA:4853:warning: override: reassigning to symbol =
IPV6_GRE
    ./.tmp.config.NT11nT8yPA:4873:warning: override: reassigning to symbol =
SECURITYFS
    ./.tmp.config.NT11nT8yPA:4877:warning: override: reassigning to symbol =
STAGING
    ./.tmp.config.NT11nT8yPA:4878:warning: override: reassigning to symbol =
ANDROID
    ./.tmp.config.NT11nT8yPA:4894:warning: override: reassigning to symbol =
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
