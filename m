Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C33C10A24F
	for <lists+linux-next@lfdr.de>; Tue, 26 Nov 2019 17:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727674AbfKZQjJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Nov 2019 11:39:09 -0500
Received: from mail-wr1-f53.google.com ([209.85.221.53]:45004 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbfKZQjJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Nov 2019 11:39:09 -0500
Received: by mail-wr1-f53.google.com with SMTP id i12so23217732wrn.11
        for <linux-next@vger.kernel.org>; Tue, 26 Nov 2019 08:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/fcbbPmrJpOPkoDfcUuQ444Hat5Qw/SkA4M0pEQZ91Y=;
        b=es8vzbkEceKalkj5B76kcQJ/thBBr1hX+r2d43SN5xIhUXhMT9KAdYqfG3tBiPqnNc
         jfQlvAwzLH3ff5TVcECh9yR4tMuobfkXVNZsUPDkSCeoWEoP29w4nxy62CgL1iPVOli6
         Nvy+w2y8mqSbElozpABY2BtGthpu1CC7qcwWoaKF4MHto/SNArzO5Us2ndY4TYpbgHMf
         H3STm/dptAXs9Qahwn68BCx8V4N2quIzSOClEEr9SXWRIZ1N4ooYncdaqghI8VRKt07X
         GqKtStACyfxCDAf66pIQj50I0TLKjFVEqAX3xoBgIqBlSK4GzCXIBlUV9VNAg9m3ecTt
         bvaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/fcbbPmrJpOPkoDfcUuQ444Hat5Qw/SkA4M0pEQZ91Y=;
        b=dsoMV/KxRWGrflMPmn81sbrV7xHTD2G+jT3qkreJQsbm/TP3G5ZESBv3QfRSceBehM
         50nPrGo/fN1ROEr1PHMp9jlVhfHjnfEOIR2S+UsnRorgPRhf31r4y1im+5X+JJnAhKTs
         kYxC1XKV9aX+wuV1vNkKPVcomf2xzN+PCx42lMR7IvimRCTrz9FrAH6Ky9F4BevDKSfF
         rjKz2nRgqxAfKjRxkDih7SGwRc/hWY8sBSJcop8K8kzbwWhC4ftzQkVojnOeA9V5CtCg
         ApIrs4vHUsB6htn9THVOR0SHRyBmzRQFZTLdVVKo3Ib2HoT59uLrCVW8oemPGvIUN9Fw
         C0GQ==
X-Gm-Message-State: APjAAAXYVmErPIhDM8kwlrNZmip/827muDTiI8c2GxnZ7BUVY9J2gW7R
        cziuc55F+zlgWq58T6A+uNeDdsc/qqNfAw==
X-Google-Smtp-Source: APXvYqwh2Mr2yP/ch7sD3ZQI9i6W2cSo9sywd0H/WqiZN9CmusjKjbDF5o7g0hkcyN50IzRF0qibPg==
X-Received: by 2002:adf:fe12:: with SMTP id n18mr2508951wrr.158.1574786345701;
        Tue, 26 Nov 2019 08:39:05 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id s9sm3533220wmj.22.2019.11.26.08.39.03
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 08:39:04 -0800 (PST)
Message-ID: <5ddd5528.1c69fb81.91647.107a@mx.google.com>
Date:   Tue, 26 Nov 2019 08:39:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20191126
X-Kernelci-Report-Type: boot
Subject: next/master boot: 196 boots: 196 failed, 0 passed (next-20191126)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 196 boots: 196 failed, 0 passed (next-20191126)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191126/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191126/

Tree: next
Branch: master
Git Describe: next-20191126
Git Commit: 131b7b67e6c2926531dd92915647335bec2e64fb
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 59 unique boards, 18 SoC families, 22 builds out of 217

Boot Regressions Detected:

arm:

    oxnas_v6_defconfig:
        gcc-8:
          ox820-cloudengines-pogoplug-series-3:
              lab-baylibre: new failure (last pass: next-20191125)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab
            hip07-d05: 1 failed lab
            imx8mn-ddr4-evk: 1 failed lab
            meson-g12a-sei510: 1 failed lab
            meson-g12a-u200: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 2 failed labs
            meson-gxm-khadas-vim2: 1 failed lab
            meson-gxm-q200: 1 failed lab
            qemu_arm64-virt-gicv2: 2 failed labs
            qemu_arm64-virt-gicv3: 2 failed labs
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-gru-kevin: 1 failed lab
            sun50i-a64-bananapi-m64: 1 failed lab
            sun50i-h5-libretech-all-h3-cc: 1 failed lab
            sun50i-h6-orangepi-one-plus: 1 failed lab
            sun50i-h6-pine-h64: 3 failed labs

    defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab
            hip07-d05: 1 failed lab
            imx8mn-ddr4-evk: 1 failed lab
            meson-g12a-sei510: 1 failed lab
            meson-g12a-u200: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 2 failed labs
            meson-gxm-khadas-vim2: 1 failed lab
            meson-gxm-q200: 1 failed lab
            qemu_arm64-virt-gicv2: 2 failed labs
            qemu_arm64-virt-gicv3: 2 failed labs
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-gru-kevin: 1 failed lab
            sun50i-a64-bananapi-m64: 1 failed lab
            sun50i-h5-libretech-all-h3-cc: 1 failed lab
            sun50i-h6-orangepi-one-plus: 1 failed lab
            sun50i-h6-pine-h64: 3 failed labs

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 2 failed labs
            meson-gxm-khadas-vim2: 1 failed lab
            meson-gxm-q200: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qemu_arm64-virt-gicv2: 2 failed labs
            qemu_arm64-virt-gicv3: 2 failed labs

i386:
    i386_defconfig:
        gcc-8:
            qemu_i386: 2 failed labs

    i386_defconfig+kselftest:
        gcc-8:
            qemu_i386: 2 failed labs

x86_64:
    x86_64_defconfig+kvm_guest:
        gcc-8:
            minnowboard-turbot-E3826: 1 failed lab
            qemu_x86_64: 2 failed labs

    x86_64_defconfig:
        gcc-8:
            minnowboard-turbot-E3826: 1 failed lab
            qemu_x86_64: 2 failed labs

    x86_64_defconfig+kselftest:
        gcc-8:
            qemu_x86_64: 2 failed labs

riscv:
    defconfig:
        gcc-8:
            hifive-unleashed-a00: 1 failed lab

arc:
    hsdk_defconfig:
        gcc-8:
            hsdk: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            am335x-boneblack: 2 failed labs
            am57xx-beagle-x15: 1 failed lab
            bcm2836-rpi-2-b: 1 failed lab
            exynos4412-odroidx2: 1 failed lab
            exynos5250-snow: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 1 failed lab
            imx6q-sabrelite: 2 failed labs
            meson8b-odroidc1: 1 failed lab
            omap3-beagle-xm: 1 failed lab
            omap4-panda: 2 failed labs
            qemu_arm-virt-gicv2: 2 failed labs
            qemu_arm-virt-gicv3: 2 failed labs
            rk3288-rock2-square: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab
            sun4i-a10-olinuxino-lime: 1 failed lab
            sun5i-a13-olinuxino-micro: 1 failed lab
            sun7i-a20-cubieboard2: 2 failed labs
            sun7i-a20-olinuxino-lime2: 1 failed lab
            sun8i-a33-olinuxino: 1 failed lab
            sun8i-a83t-bananapi-m3: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-orangepi-pc: 1 failed lab
            tegra124-jetson-tk1: 2 failed labs

    exynos_defconfig:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab
            exynos5250-snow: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            am335x-boneblack: 2 failed labs
            am57xx-beagle-x15: 1 failed lab
            bcm2836-rpi-2-b: 1 failed lab
            exynos4412-odroidx2: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 1 failed lab
            imx6q-sabrelite: 2 failed labs
            meson8b-odroidc1: 1 failed lab
            omap3-beagle-xm: 1 failed lab
            omap4-panda: 2 failed labs
            qemu_arm-virt-gicv2: 2 failed labs
            qemu_arm-virt-gicv3: 2 failed labs
            rk3288-rock2-square: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab
            sun4i-a10-olinuxino-lime: 1 failed lab
            sun5i-a13-olinuxino-micro: 1 failed lab
            sun7i-a20-cubieboard2: 2 failed labs
            sun7i-a20-olinuxino-lime2: 1 failed lab
            sun8i-a33-olinuxino: 1 failed lab
            sun8i-a83t-bananapi-m3: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-orangepi-pc: 1 failed lab
            tegra124-jetson-tk1: 2 failed labs

    davinci_all_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

    multi_v5_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 1 failed lab
            rk3288-rock2-square: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab
            tegra124-jetson-tk1: 2 failed labs

    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    omap2plus_defconfig:
        gcc-8:
            am335x-boneblack: 2 failed labs
            am57xx-beagle-x15: 1 failed lab
            omap3-beagle-xm: 1 failed lab
            omap4-panda: 2 failed labs

    bcm2835_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun4i-a10-olinuxino-lime: 1 failed lab
            sun5i-a13-olinuxino-micro: 1 failed lab
            sun7i-a20-cubieboard2: 2 failed labs
            sun7i-a20-olinuxino-lime2: 1 failed lab
            sun8i-a33-olinuxino: 1 failed lab
            sun8i-a83t-bananapi-m3: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-orangepi-pc: 1 failed lab

    multi_v7_defconfig+kselftest:
        gcc-8:
            qemu_arm-virt-gicv2: 2 failed labs
            qemu_arm-virt-gicv3: 2 failed labs

    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

---
For more info write to <info@kernelci.org>
