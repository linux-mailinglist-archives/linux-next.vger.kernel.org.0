Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E07CC89EC6
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 14:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfHLMvH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 08:51:07 -0400
Received: from mail-wm1-f53.google.com ([209.85.128.53]:34034 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfHLMvH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Aug 2019 08:51:07 -0400
Received: by mail-wm1-f53.google.com with SMTP id e8so10500574wme.1
        for <linux-next@vger.kernel.org>; Mon, 12 Aug 2019 05:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EEDDqNK8ghoJzvI5oUBbOl8U1FjUhBlNn5dzdKLJOLI=;
        b=ayRVKN0cG94NLT76AKBmlOhbEDdrabR+w3MBqYhbroWHm77rajXfUwEEbU462KWNjv
         kfyYaMjrBr0qGL/XRO1a0SPxLakkQHjjlMzIC9amkJuoeX1HlVFJ9dlC5cKJf/t4PRXm
         mxC9OEKBpGHvUcUk4VhnxDq9Hb7sgBYBNrXsG3pmFZRWvLML8WaXSbicy556RsRIlhUu
         5C+O1vje6ssf+23GgEkSWOl9gMX+UACR44y3s20LT/E85TPF8ELzUtMn0QBWSsED9bFZ
         4m4pf0fR2aR5efmO+NpZGPO6DRfEEmmG+JevoNPuLkxRDuql7GJgfde9nRr7Z30ezMY1
         cOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EEDDqNK8ghoJzvI5oUBbOl8U1FjUhBlNn5dzdKLJOLI=;
        b=RVHTEYqEUM8laZK2zLG6Hc2Lal9KjTjZd8yo07oOz0tJJKpl0pmr7+vLkVhXIDqmWa
         CDjxA020z8ewMdIIr12r84jAsO/6G8pNtArsbcVDzMqrhu4FPH9lDPeGvfFZhg1pSHH3
         3KNxeCZXYN1i76p6dQA2S/lN46l52Dq7JpfqblNb3D3GC+/srmF5d4dE7x1zA0Qb2HTA
         5llryvGWkjMFCmO+NK9xy8XWALO+KT0LXf8Lr4OHjcqWbX8b6bJQsSFqNbSaQUoOHDQz
         xVeCRszI+zeuwDxCnxN47V87qGLKfsGg5Bly3LgfflHAdMj5gGakp+w4/w6ehxl39pdT
         McBQ==
X-Gm-Message-State: APjAAAVuOI2d/8M+JgmCt4NokKabWINE+gyOKHBgYRWK0X+sY8xKiQ+T
        AcnFXausNOCqMV9wp6GRiXp4rORmabA=
X-Google-Smtp-Source: APXvYqz3o0eO0FTSL0dKQeiAFcsA7jfknrC3+3SenH9LGnd97N1rPG93g2+yD95u1G6/3o980iwDoA==
X-Received: by 2002:a1c:6a03:: with SMTP id f3mr26271550wmc.35.1565614257970;
        Mon, 12 Aug 2019 05:50:57 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id f134sm30234468wmg.20.2019.08.12.05.50.57
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 05:50:57 -0700 (PDT)
Message-ID: <5d5160b1.1c69fb81.bf958.8042@mx.google.com>
Date:   Mon, 12 Aug 2019 05:50:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.3-rc4-148-g65a07a9f5dd2
X-Kernelci-Tree: next
X-Kernelci-Report-Type: build
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes build: 222 builds: 3 failed, 219 passed, 3 errors,
 425 warnings (v5.3-rc4-148-g65a07a9f5dd2)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes build: 222 builds: 3 failed, 219 passed, 3 errors, 425 w=
arnings (v5.3-rc4-148-g65a07a9f5dd2)

Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.3-rc4-148-g65a07a9f5dd2/

Tree: next
Branch: pending-fixes
Git Describe: v5.3-rc4-148-g65a07a9f5dd2
Git Commit: 65a07a9f5dd2daf903d979dd2e7b24d0e212ad1f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Built: 7 unique architectures

Build Failures Detected:

arm:
    axm55xx_defconfig: (gcc-8) FAIL
    keystone_defconfig: (gcc-8) FAIL
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy: (gcc-8) FAIL

Errors and Warnings Detected:

arc:
    allnoconfig (gcc-8): 1 warning
    axs103_defconfig (gcc-8): 3 warnings
    axs103_smp_defconfig (gcc-8): 3 warnings
    haps_hs_defconfig (gcc-8): 3 warnings
    haps_hs_smp_defconfig (gcc-8): 3 warnings
    hsdk_defconfig (gcc-8): 3 warnings
    nsim_hs_defconfig (gcc-8): 3 warnings
    nsim_hs_defconfig (gcc-8): 3 warnings
    nsim_hs_smp_defconfig (gcc-8): 3 warnings
    nsimosci_hs_defconfig (gcc-8): 3 warnings
    nsimosci_hs_smp_defconfig (gcc-8): 3 warnings
    tinyconfig (gcc-8): 1 warning
    vdk_hs38_defconfig (gcc-8): 2 warnings
    vdk_hs38_smp_defconfig (gcc-8): 2 warnings

arm64:
    allmodconfig (gcc-8): 12 warnings
    defconfig (gcc-8): 5 warnings
    defconfig (gcc-8): 5 warnings
    defconfig (gcc-8): 5 warnings
    defconfig (gcc-8): 5 warnings

arm:
    assabet_defconfig (gcc-8): 2 warnings
    at91_dt_defconfig (gcc-8): 4 warnings
    axm55xx_defconfig (gcc-8): 1 error
    badge4_defconfig (gcc-8): 2 warnings
    cerfcube_defconfig (gcc-8): 2 warnings
    collie_defconfig (gcc-8): 2 warnings
    exynos_defconfig (gcc-8): 1 warning
    footbridge_defconfig (gcc-8): 1 warning
    h3600_defconfig (gcc-8): 2 warnings
    imx_v4_v5_defconfig (gcc-8): 1 warning
    keystone_defconfig (gcc-8): 1 error
    lpc32xx_defconfig (gcc-8): 1 warning
    mini2440_defconfig (gcc-8): 2 warnings
    multi_v5_defconfig (gcc-8): 4 warnings
    multi_v7_defconfig (gcc-8): 21 warnings
    multi_v7_defconfig (gcc-8): 21 warnings
    multi_v7_defconfig (gcc-8): 1 error, 16 warnings
    multi_v7_defconfig (gcc-8): 21 warnings
    multi_v7_defconfig (gcc-8): 21 warnings
    neponset_defconfig (gcc-8): 2 warnings
    omap2plus_defconfig (gcc-8): 4 warnings
    pleb_defconfig (gcc-8): 2 warnings
    pxa_defconfig (gcc-8): 3 warnings
    qcom_defconfig (gcc-8): 2 warnings
    rpc_defconfig (gcc-8): 2 warnings
    s3c6400_defconfig (gcc-8): 1 warning
    s5pv210_defconfig (gcc-8): 1 warning
    sama5_defconfig (gcc-8): 4 warnings
    shannon_defconfig (gcc-8): 2 warnings
    shmobile_defconfig (gcc-8): 2 warnings
    simpad_defconfig (gcc-8): 2 warnings
    sunxi_defconfig (gcc-8): 2 warnings
    tct_hammer_defconfig (gcc-8): 2 warnings
    u8500_defconfig (gcc-8): 6 warnings

i386:
    i386_defconfig (gcc-8): 1 warning
    i386_defconfig (gcc-8): 1 warning

mips:
    32r2el_defconfig (gcc-8): 3 warnings
    32r2el_defconfig (gcc-8): 3 warnings
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
    cavium_octeon_defconfig (gcc-8): 7 warnings
    ci20_defconfig (gcc-8): 2 warnings
    cobalt_defconfig (gcc-8): 2 warnings
    db1xxx_defconfig (gcc-8): 2 warnings
    decstation_64_defconfig (gcc-8): 6 warnings
    decstation_defconfig (gcc-8): 2 warnings
    decstation_r4k_defconfig (gcc-8): 2 warnings
    e55_defconfig (gcc-8): 2 warnings
    fuloong2e_defconfig (gcc-8): 6 warnings
    gcw0_defconfig (gcc-8): 1 warning
    gpr_defconfig (gcc-8): 3 warnings
    ip22_defconfig (gcc-8): 3 warnings
    ip27_defconfig (gcc-8): 7 warnings
    ip28_defconfig (gcc-8): 7 warnings
    ip32_defconfig (gcc-8): 7 warnings
    jazz_defconfig (gcc-8): 2 warnings
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
    markeins_defconfig (gcc-8): 3 warnings
    mips_paravirt_defconfig (gcc-8): 6 warnings
    mpc30x_defconfig (gcc-8): 2 warnings
    msp71xx_defconfig (gcc-8): 2 warnings
    mtx1_defconfig (gcc-8): 3 warnings
    nlm_xlp_defconfig (gcc-8): 7 warnings
    nlm_xlr_defconfig (gcc-8): 3 warnings
    omega2p_defconfig (gcc-8): 1 warning
    pic32mzda_defconfig (gcc-8): 2 warnings
    pistachio_defconfig (gcc-8): 2 warnings
    pnx8335_stb225_defconfig (gcc-8): 2 warnings
    qi_lb60_defconfig (gcc-8): 4 warnings
    rb532_defconfig (gcc-8): 2 warnings
    rbtx49xx_defconfig (gcc-8): 2 warnings
    rm200_defconfig (gcc-8): 3 warnings
    rt305x_defconfig (gcc-8): 2 warnings
    sb1250_swarm_defconfig (gcc-8): 4 warnings
    tb0219_defconfig (gcc-8): 2 warnings
    tb0226_defconfig (gcc-8): 3 warnings
    tb0287_defconfig (gcc-8): 2 warnings
    tinyconfig (gcc-8): 1 warning
    vocore2_defconfig (gcc-8): 1 warning
    workpad_defconfig (gcc-8): 2 warnings
    xway_defconfig (gcc-8): 2 warnings

riscv:
    rv32_defconfig (gcc-8): 6 warnings

x86_64:
    tinyconfig (gcc-8): 1 warning

Errors summary:

    1    dma-mapping.c:(.init.text+0x18): undefined reference to `dma_atomi=
c_pool_init'
    1    /home/buildslave/workspace/workspace/kernel-build/linux/build/../a=
rch/arm/mm/dma-mapping.c:2427: undefined reference to `dma_atomic_pool_init'
    1    /home/buildslave/workspace/kernel-build/linux/build/../arch/arm/mm=
/dma-mapping.c:2427: undefined reference to `dma_atomic_pool_init'

Warnings summary:

    196  <stdin>:1511:2: warning: #warning syscall clone3 not implemented [=
-Wcpp]
    12   include/linux/compiler.h:328:5: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    11   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this sta=
tement may fall through [-Wimplicit-fallthrough=3D]
    11   drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this sta=
tement may fall through [-Wimplicit-fallthrough=3D]
    10   drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    10   drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    9    printk(KERN_WARNING "SA1100 flash: unknown base address "
    9    include/linux/printk.h:309:2: warning: this statement may fall thr=
ough [-Wimplicit-fallthrough=3D]
    9    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    8    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    8    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    8    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    8    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    7    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
    7    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
    7    drivers/dma/imx-dma.c:542:6: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    6    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:992:6: warning: this statem=
ent may fall through [-Wimplicit-fallthrough=3D]
    5    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    4    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    4    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    4    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    3    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this stat=
ement may fall through [-Wimplicit-fallthrough=3D]
    2    drivers/watchdog/jz4740_wdt.c:165:6: warning: unused variable 'ret=
' [-Wunused-variable]
    2    drivers/usb/gadget/udc/s3c2410_udc.c:418:7: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    2    drivers/usb/gadget/udc/s3c2410_udc.c:314:7: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    2    drivers/scsi/wd33c93.c:1856:11: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    2    arch/x86/kernel/apic/probe_32.c:183:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    2    <stdin>:830:2: warning: #warning syscall fstat64 not implemented [=
-Wcpp]
    2    <stdin>:1127:2: warning: #warning syscall fstatat64 not implemente=
d [-Wcpp]
    1    {standard input}:131: Warning: macro instruction expanded into mul=
tiple instructions
    1    sound/soc/ti/rx51.c:57:6: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    1    include/linux/device.h:1499:2: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    1    drivers/watchdog/wdt285.c:170:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    1    drivers/video/fbdev/jz4740_fb.c:300:8: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    1    drivers/video/fbdev/acornfb.c:860:9: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    1    drivers/usb/host/ohci-tmio.c:103:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    1    drivers/usb/host/ohci-tmio.c:101:7: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    1    drivers/usb/gadget/udc/lpc32xx_udc.c:2231:3: warning: this stateme=
nt may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/soundwire/slave.c:16:12: warning: 'sdw_slave_add' defined =
but not used [-Wunused-function]
    1    drivers/mtd/nand/raw/au1550nd.c:443:57: warning: pointer type mism=
atch in conditional expression
    1    drivers/hsi/clients/ssi_protocol.c:466:7: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/hsi/clients/ssi_protocol.c:291:6: warning: this statement =
may fall through [-Wimplicit-fallthrough=3D]
    1    drivers/gpu/drm/arm/malidp_hw.c:387:8: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    1    drivers/gpu/drm/arm/malidp_hw.c:1311:4: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]
    1    drivers/cpufreq/ti-cpufreq.c:79:20: warning: this statement may fa=
ll through [-Wimplicit-fallthrough=3D]
    1    arch/mips/include/asm/octeon/cvmx-sli-defs.h:47:6: warning: this s=
tatement may fall through [-Wimplicit-fallthrough=3D]
    1    arch/arm/mach-rpc/riscpc.c:48:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    1    .config:1175:warning: override: UNWINDER_GUESS changes choice state

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
32r2el_defconfig+kselftest (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnin=
gs, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
acs5k_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
acs5k_tiny_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
allmodconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 12 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/arm/malidp_hw.c:387:8: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/arm/malidp_hw.c:1311:4: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:992:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/soundwire/slave.c:16:12: warning: 'sdw_slave_add' defined but n=
ot used [-Wunused-function]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
allmodconfig (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
am200epdkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
assabet_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
at91_dt_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

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
axm55xx_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 secti=
on mismatches

Errors:
    /home/buildslave/workspace/kernel-build/linux/build/../arch/arm/mm/dma-=
mapping.c:2427: undefined reference to `dma_atomic_pool_init'

---------------------------------------------------------------------------=
-----
axs103_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
axs103_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 s=
ection mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
badge4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

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
cavium_octeon_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings,=
 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    arch/mips/include/asm/octeon/cvmx-sli-defs.h:47:6: warning: this statem=
ent may fall through [-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
cerfcube_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

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
cm_x2xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cm_x300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
cns3420vb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
cobalt_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
colibri_pxa270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
colibri_pxa300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings,=
 0 section mismatches

---------------------------------------------------------------------------=
-----
collie_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
corgi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
davinci_all_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

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
defconfig (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 section mi=
smatches

Warnings:
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 5 warnings, 0 section mismatches

Warnings:
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
defconfig+CONFIG_RANDOMIZE_BASE=3Dy (arm64, gcc-8) =E2=80=94 PASS, 0 errors=
, 5 warnings, 0 section mismatches

Warnings:
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
defconfig+kselftest (riscv, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
defconfig+kselftest (arm64, gcc-8) =E2=80=94 PASS, 0 errors, 5 warnings, 0 =
section mismatches

Warnings:
    drivers/iommu/arm-smmu-v3.c:1189:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
dove_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
em_x270_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
ep93xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
eseries_pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 =
section mismatches

---------------------------------------------------------------------------=
-----
exynos_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sectio=
n mismatches

Warnings:
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
ezx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
footbridge_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 se=
ction mismatches

Warnings:
    drivers/watchdog/wdt285.c:170:3: warning: this statement may fall throu=
gh [-Wimplicit-fallthrough=3D]

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
gpr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
h3600_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
h5000_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
hackkit_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
haps_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
haps_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
hisi_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
hsdk_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section=
 mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
i386_defconfig (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 section=
 mismatches

Warnings:
    arch/x86/kernel/apic/probe_32.c:183:7: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
i386_defconfig+kselftest (i386, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning,=
 0 section mismatches

Warnings:
    arch/x86/kernel/apic/probe_32.c:183:7: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
imote2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
imx_v4_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sec=
tion mismatches

Warnings:
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
imx_v6_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
integrator_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
iop13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
iop32x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
iop33x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
ip22_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/scsi/wd33c93.c:1856:11: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ip27_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ip28_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/scsi/wd33c93.c:1856:11: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
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
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
ixp4xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
jazz_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
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
keystone_defconfig (arm, gcc-8) =E2=80=94 FAIL, 1 error, 0 warnings, 0 sect=
ion mismatches

Errors:
    /home/buildslave/workspace/workspace/kernel-build/linux/build/../arch/a=
rm/mm/dma-mapping.c:2427: undefined reference to `dma_atomic_pool_init'

---------------------------------------------------------------------------=
-----
ks8695_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
lpc32xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/usb/gadget/udc/lpc32xx_udc.c:2231:3: warning: this statement ma=
y fall through [-Wimplicit-fallthrough=3D]

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
magician_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

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
    {standard input}:131: Warning: macro instruction expanded into multiple=
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
markeins_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 se=
ction mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
milbeaut_m10v_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, =
0 section mismatches

---------------------------------------------------------------------------=
-----
mini2440_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/usb/gadget/udc/s3c2410_udc.c:314:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/s3c2410_udc.c:418:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]

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
mmp2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

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
msp71xx_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
mtx1_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
multi_v4t_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
multi_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 21 warnings, 0 se=
ction mismatches

Warnings:
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:992:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy (arm, gcc-8) =E2=80=94 PASS, 0=
 errors, 21 warnings, 0 section mismatches

Warnings:
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:992:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy (arm, gcc-8) =E2=80=
=94 FAIL, 1 error, 16 warnings, 0 section mismatches

Errors:
    dma-mapping.c:(.init.text+0x18): undefined reference to `dma_atomic_poo=
l_init'

Warnings:
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+CONFIG_SMP=3Dn (arm, gcc-8) =E2=80=94 PASS, 0 errors, 21=
 warnings, 0 section mismatches

Warnings:
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:992:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
multi_v7_defconfig+kselftest (arm, gcc-8) =E2=80=94 PASS, 0 errors, 21 warn=
ings, 0 section mismatches

Warnings:
    drivers/dma/imx-dma.c:542:6: warning: this statement may fall through [=
-Wimplicit-fallthrough=3D]
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may =
fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:851:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:853:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sti/sti_hdmi.c:855:13: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:992:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
mv78xx0_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
mvebu_v5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mvebu_v7_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
mxs_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section =
mismatches

---------------------------------------------------------------------------=
-----
neponset_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
netwinder_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
nhk8815_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
nlm_xlp_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 7 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nlm_xlr_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_defconfig+kselftest (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnin=
gs, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsim_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 =
section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nsimosci_hs_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
nuc910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
nuc950_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
nuc960_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
omap1_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

---------------------------------------------------------------------------=
-----
omap2plus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 se=
ction mismatches

Warnings:
    drivers/cpufreq/ti-cpufreq.c:79:20: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/hsi/clients/ssi_protocol.c:291:6: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/hsi/clients/ssi_protocol.c:466:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    sound/soc/ti/rx51.c:57:6: warning: this statement may fall through [-Wi=
mplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
omega2p_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
orion5x_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
oxnas_v6_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
palmz72_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
pcm027_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

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
pleb_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
pnx8335_stb225_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings=
, 0 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
prima2_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa168_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa255-idp_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 s=
ection mismatches

---------------------------------------------------------------------------=
-----
pxa3xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa910_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
pxa_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 section =
mismatches

Warnings:
    include/linux/device.h:1499:2: warning: this statement may fall through=
 [-Wimplicit-fallthrough=3D]
    drivers/usb/host/ohci-tmio.c:101:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]
    drivers/usb/host/ohci-tmio.c:103:7: warning: this statement may fall th=
rough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
qcom_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section=
 mismatches

Warnings:
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:815:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]
    drivers/pinctrl/qcom/pinctrl-spmi-gpio.c:820:20: warning: this statemen=
t may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
qi_lb60_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    drivers/video/fbdev/jz4740_fb.c:300:8: warning: this statement may fall=
 through [-Wimplicit-fallthrough=3D]
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
realview_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
rm200_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 secti=
on mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
rpc_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 section =
mismatches

Warnings:
    arch/arm/mach-rpc/riscpc.c:48:13: warning: this statement may fall thro=
ugh [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/acornfb.c:860:9: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]

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
s3c6400_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
s5pv210_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 1 warning, 0 secti=
on mismatches

Warnings:
    drivers/mmc/host/sdhci-s3c.c:613:19: warning: this statement may fall t=
hrough [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
sama5_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 4 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/mmc/host/atmel-mci.c:2415:30: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2422:28: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/mmc/host/atmel-mci.c:2426:40: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/atmel_usba_udc.c:329:13: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

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
shannon_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
shmobile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    drivers/video/fbdev/sh_mobile_lcdcfb.c:2086:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]
    drivers/video/fbdev/sh_mobile_lcdcfb.c:1596:22: warning: this statement=
 may fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
simpad_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 secti=
on mismatches

Warnings:
    drivers/mtd/maps/sa1100-flash.c:82:3: warning: this statement may fall =
through [-Wimplicit-fallthrough=3D]
    printk(KERN_WARNING "SA1100 flash: unknown base address "

---------------------------------------------------------------------------=
-----
socfpga_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
spear13xx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

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
    drivers/gpu/drm/sun4i/sun4i_tcon.c:316:7: warning: this statement may f=
all through [-Wimplicit-fallthrough=3D]
    drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c:992:6: warning: this statement m=
ay fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
tango4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 secti=
on mismatches

---------------------------------------------------------------------------=
-----
tb0219_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
tb0226_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 3 warnings, 0 sect=
ion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/printk.h:309:2: warning: this statement may fall through =
[-Wimplicit-fallthrough=3D]
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
tct_hammer_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 s=
ection mismatches

Warnings:
    drivers/usb/gadget/udc/s3c2410_udc.c:314:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]
    drivers/usb/gadget/udc/s3c2410_udc.c:418:7: warning: this statement may=
 fall through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
tegra_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
    .config:1175:warning: override: UNWINDER_GUESS changes choice state

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
trizeps4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
u300_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
u8500_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 6 warnings, 0 sectio=
n mismatches

Warnings:
    drivers/usb/phy/phy-ab8500-usb.c:424:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:440:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:459:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:332:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:352:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]
    drivers/usb/phy/phy-ab8500-usb.c:370:9: warning: this statement may fal=
l through [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
vdk_hs38_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sec=
tion mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
vdk_hs38_smp_defconfig (arc, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0=
 section mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    include/linux/compiler.h:328:5: warning: this statement may fall throug=
h [-Wimplicit-fallthrough=3D]

---------------------------------------------------------------------------=
-----
versatile_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 se=
ction mismatches

---------------------------------------------------------------------------=
-----
vexpress_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sec=
tion mismatches

---------------------------------------------------------------------------=
-----
vf610m4_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sect=
ion mismatches

---------------------------------------------------------------------------=
-----
viper_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 sectio=
n mismatches

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
x86_64_defconfig+kselftest (x86_64, gcc-8) =E2=80=94 PASS, 0 errors, 0 warn=
ings, 0 section mismatches

---------------------------------------------------------------------------=
-----
xcep_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
xway_defconfig (mips, gcc-8) =E2=80=94 PASS, 0 errors, 2 warnings, 0 sectio=
n mismatches

Warnings:
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]
    <stdin>:1511:2: warning: #warning syscall clone3 not implemented [-Wcpp]

---------------------------------------------------------------------------=
-----
zeus_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section=
 mismatches

---------------------------------------------------------------------------=
-----
zx_defconfig (arm, gcc-8) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>
