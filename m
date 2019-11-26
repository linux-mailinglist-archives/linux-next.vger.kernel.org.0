Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14A4E109D06
	for <lists+linux-next@lfdr.de>; Tue, 26 Nov 2019 12:31:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728020AbfKZLb3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Nov 2019 06:31:29 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:45191 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727218AbfKZLb3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Nov 2019 06:31:29 -0500
Received: by mail-wr1-f54.google.com with SMTP id z10so21934425wrs.12
        for <linux-next@vger.kernel.org>; Tue, 26 Nov 2019 03:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GKv2NBJbrncv+cbGc3JDxkXrUdeN689Fg5tfewJwnfg=;
        b=PEuQUczRzhBpgV2Meqw2YGdoVvKVE2W0uK3cUhU6OTZ0wkRejEtP6x8wb8kDL+FO4Z
         ZhVERWuf4fE3estq4PDrlgGUrBNUXt7/ig0XuBIgFyszYPzmpqx7FxnxU4dIeCkErHUq
         IjVlcTEYk6BHW1O8KNV/VIfxkwPqgzrSdk7XDzPplhXylqOJmfucIX+4gB6oDwi3hEI4
         m7V+s0OzXI8GQN+m85asXNGQbcQjcKPFTkWFNyfK+lRQcKR+EdpL4NoL7QawOGh3leF+
         S1d0vadKKYneyydRHAhZZJIZQy69s46lAGOkLI6Nxirpb8MQ0/+0wqzgRONXCCuTjukv
         jmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GKv2NBJbrncv+cbGc3JDxkXrUdeN689Fg5tfewJwnfg=;
        b=LJrN5HuBuGzJ2ZK/S6l+aq13tqnH3XGaRe9wHJK3jPUwveZWEQ9OQ/GcnSwUXwaPyG
         b0f8O1GTOY8kncX5HWqsY0xKvsq900LAmU+/eiMdDEcSNy5wKcrahucVq2cAVlD39+tu
         dlQXj5LmFoD6D00mzwLvDgKnjt+KeCeifMyGVt6mZKEUVTxovb+Bg2B9hLh6q9kypc0J
         XW8YvdOdeJaCmX34uoPFaq9JWlNZOuRTOhPfHPpsEsy6nXMdZuw/WjZA7KUSRnXmng6s
         YxcpXDsC3V/RLNQWCSEDV/IIqpTdIHRoEq6z7fdaP1j+zh9HiondnAUs3SEIppjMJ56m
         1hjg==
X-Gm-Message-State: APjAAAVSACfKA4qk5WM7Eydnd1cZAsAF8LfUkC3ZJyT/2K3+8m7qY6Au
        Jj+q0xEui41Fn2Rtb509VvumK+UlordBxg==
X-Google-Smtp-Source: APXvYqwNlElKNkHncTWW0t3W/CBfvrtwSrBB0xmsz8TUqj5Sta4kuXOOhmucR2T1rnTc52dKQkYp/Q==
X-Received: by 2002:adf:e58c:: with SMTP id l12mr22884185wrm.156.1574767884996;
        Tue, 26 Nov 2019 03:31:24 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id y8sm2640390wmi.9.2019.11.26.03.31.24
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2019 03:31:24 -0800 (PST)
Message-ID: <5ddd0d0c.1c69fb81.2edf7.c574@mx.google.com>
Date:   Tue, 26 Nov 2019 03:31:24 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: v5.4-876-gb69afedac6a4
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 266 boots: 189 failed,
 65 passed with 6 offline, 6 conflicts (v5.4-876-gb69afedac6a4)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 266 boots: 189 failed, 65 passed with 6 offline, 6=
 conflicts (v5.4-876-gb69afedac6a4)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-876-gb69afedac6a4/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-876-gb69afedac6a4/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-876-gb69afedac6a4
Git Commit: b69afedac6a4dbd855ed545f917f2c13b5bfd8af
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 26 SoC families, 28 builds out of 216

Boot Regressions Detected:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          sun50i-h6-pine-h64:
              lab-collabora: new failure (last pass: v5.4-rc8-192-gdeacf707=
906e)

Boot Failures Detected:

i386:
    i386_defconfig:
        gcc-8:
            qemu_i386: 2 failed labs

    i386_defconfig+kselftest:
        gcc-8:
            qemu_i386: 2 failed labs

x86_64:
    x86_64_defconfig+kselftest:
        gcc-8:
            qemu_x86_64: 2 failed labs

    x86_64_defconfig+kvm_guest:
        gcc-8:
            minnowboard-turbot-E3826: 1 failed lab
            qemu_x86_64: 2 failed labs

    x86_64_defconfig:
        gcc-8:
            minnowboard-turbot-E3826: 1 failed lab
            qemu_x86_64: 2 failed labs

arm:
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

    bcm2835_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

    omap2plus_defconfig:
        gcc-8:
            am335x-boneblack: 2 failed labs
            am57xx-beagle-x15: 1 failed lab
            omap3-beagle-xm: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab
            exynos5250-snow: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 1 failed lab
            rk3288-rock2-square: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab
            tegra124-jetson-tk1: 2 failed labs
            tegra124-nyan-big: 1 failed lab

    multi_v5_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs
            tegra124-nyan-big: 1 failed lab

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
            omap3-beagle-xm: 1 failed lab
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
            tegra124-nyan-big: 1 failed lab

    multi_v7_defconfig+kselftest:
        gcc-8:
            qemu_arm-virt-gicv2: 2 failed labs
            qemu_arm-virt-gicv3: 2 failed labs

    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

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
            tegra124-nyan-big: 1 failed lab

    davinci_all_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            hifive-unleashed-a00: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab
            hip07-d05: 1 failed lab
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
            meson-gxm-khadas-vim2: 1 failed lab
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
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            qemu_arm64-virt-gicv2: 2 failed labs
            qemu_arm64-virt-gicv3: 2 failed labs

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab
            hip07-d05: 1 failed lab
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
            meson-gxm-khadas-vim2: 1 failed lab
            qemu_arm64-virt-gicv2: 2 failed labs
            qemu_arm64-virt-gicv3: 2 failed labs
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-gru-kevin: 1 failed lab
            sun50i-a64-bananapi-m64: 1 failed lab
            sun50i-h5-libretech-all-h3-cc: 1 failed lab
            sun50i-h6-orangepi-one-plus: 1 failed lab
            sun50i-h6-pine-h64: 3 failed labs

arc:
    hsdk_defconfig:
        gcc-8:
            hsdk: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm64:
    defconfig:
        meson-gxl-s905x-libretech-cc:
            lab-clabbe: FAIL (gcc-8)
            lab-baylibre-seattle: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        meson-gxl-s905x-libretech-cc:
            lab-clabbe: FAIL (gcc-8)
            lab-baylibre-seattle: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        meson-gxl-s905x-libretech-cc:
            lab-clabbe: FAIL (gcc-8)
            lab-baylibre-seattle: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)

arm:
    multi_v7_defconfig:
        meson8b-odroidc1:
            lab-baylibre-seattle: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)
        omap4-panda:
            lab-baylibre-seattle: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: FAIL (gcc-8)

    omap2plus_defconfig:
        omap4-panda:
            lab-baylibre-seattle: PASS (gcc-8)
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
