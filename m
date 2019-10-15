Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B982D74D1
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2019 13:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbfJOLWJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Oct 2019 07:22:09 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35108 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfJOLWJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Oct 2019 07:22:09 -0400
Received: by mail-wr1-f65.google.com with SMTP id v8so23386035wrt.2
        for <linux-next@vger.kernel.org>; Tue, 15 Oct 2019 04:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=WFc7ghDEGPtcdHEYubZW3Juhv1QA1sKIfvihp5F7MSc=;
        b=sgLdNo79TY3t0uTYHMb3K2qxPEVZ6FhuL39pTqgZk95L20lp3KoapsrTV5z1jNkqrs
         eF3Q56XSL4JHrhNrplu9wfQlz87nB55/1q1yH/ryKIsFW6mm/3VQeG3taGa0q1VdqAFS
         0+FjGBb05P8acFPEqg8EnWF5wllvvoe3u+CDos7iL+GVpF3zocul2pJSCh/PHH4O5oL6
         6wnxxu36y1DjooOyE9F51AamdHG1Q1xsc6iAezlg8UNLE3FptVTcoQHpYRp+OeCU6Ubc
         U7yUfhXx5U5pxrZ4UuDoGgqTBZ1a1eIrQRlkZ7wA/qD/gZtCv8630iP4aM8AewZz1s9h
         VdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=WFc7ghDEGPtcdHEYubZW3Juhv1QA1sKIfvihp5F7MSc=;
        b=iePSv/DHa7lhQ7E6XV+wr6IWY/Ajq6WW09DenFH3miOQFnBrLd3XXI0lj0akJIPHzP
         5RREv0Nt+ltpGP01ZjKjQa5WE/Nahu85M7mo6qSU4X/cL12SaxYEBEASGW8Cm9luNPk+
         yBUVGkcV+F1Rg9cNpbDrQ5a3QkBYz8d8qLxc+KgMwENLw0LomD3B4D/LBTFQQfIKeltN
         PXqUQ3pP1G9K+bEY0x/LGuBrmMxYVO3iCgLxPK+wGz858Z6srncVuj7WojY8+bs3/Sda
         WjISJTjf9nqY1O2KgryDYIxMa50bE21lCNmCUc8fXSKlzCspmWcjmX6QLWE9oVyS8qK9
         pOOA==
X-Gm-Message-State: APjAAAUhR/Ocb/NTiIktox7pU754wrB9NMBM4D4VmCym1Hojdc7VOwy+
        TSLj/7icbZQvfRc3LeBuPp3dCuhtCa46Pg==
X-Google-Smtp-Source: APXvYqyVOLQg+YQh6atwuLOE1miqhFrJWYfCROGt64LhQLZNjrBFMjLIeR4ROrFv7DRpoDpMGPo1NA==
X-Received: by 2002:a5d:4b4a:: with SMTP id w10mr30146666wrs.60.1571138525762;
        Tue, 15 Oct 2019 04:22:05 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o18sm2015140wrm.11.2019.10.15.04.22.04
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 04:22:04 -0700 (PDT)
Message-ID: <5da5abdc.1c69fb81.27ff.8e5a@mx.google.com>
Date:   Tue, 15 Oct 2019 04:22:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191015
Subject: next/master boot: 283 boots: 37 failed, 169 passed with 71 offline,
 2 untried/unknown, 4 conflicts (next-20191015)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 283 boots: 37 failed, 169 passed with 71 offline, 2 untri=
ed/unknown, 4 conflicts (next-20191015)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191015/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191015/

Tree: next
Branch: master
Git Describe: next-20191015
Git Commit: 0e9d28bc6c81f47f94979ec7d0ab6ac42345fcee
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 25 SoC families, 28 builds out of 219

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: new failure (last pass: next-20191014)
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: next-20191014)

    exynos_defconfig:
        gcc-8:
          exynos5250-arndale:
              lab-baylibre-seattle: new failure (last pass: next-20191014)
          exynos5420-arndale-octa:
              lab-baylibre-seattle: new failure (last pass: next-20191014)
          exynos5800-peach-pi:
              lab-baylibre-seattle: new failure (last pass: next-20191014)

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: new failure (last pass: next-20191014)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: next-20191014)
          sun5i-r8-chip:
              lab-baylibre-seattle: new failure (last pass: next-20191014)
          sun7i-a20-bananapi:
              lab-baylibre-seattle: new failure (last pass: next-20191014)

    tegra_defconfig:
        gcc-8:
          tegra30-beaver:
              lab-baylibre-seattle: new failure (last pass: next-20191014)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12a-sei510: 1 failed lab
            meson-g12a-u200: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

    defconfig:
        gcc-8:
            meson-g12a-sei510: 1 failed lab
            meson-g12a-u200: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            meson-g12a-sei510: 1 failed lab
            meson-g12a-u200: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab

arm:
    sunxi_defconfig:
        gcc-8:
            sun7i-a20-cubieboard2: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            sun7i-a20-cubieboard2: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab

    davinci_all_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            sun7i-a20-cubieboard2: 1 failed lab

    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab
            sun7i-a20-cubieboard2: 1 failed lab

    multi_v5_defconfig:
        gcc-8:
            da850-lcdk: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-axg-s400: 1 offline lab
            meson-g12b-s922x-khadas-vim3: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab
            meson-gxm-nexbox-a1: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab
            meson-sm1-sei610: 1 offline lab
            rk3399-firefly: 1 offline lab

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-axg-s400: 1 offline lab
            meson-g12b-s922x-khadas-vim3: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab
            meson-gxm-nexbox-a1: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab
            meson-sm1-sei610: 1 offline lab
            rk3399-firefly: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            meson-axg-s400: 1 offline lab
            meson-g12b-s922x-khadas-vim3: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab
            meson-sm1-sei610: 1 offline lab

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm:

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            armada-xp-openblocks-ax3-4: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            armada-xp-openblocks-ax3-4: 1 offline lab
            bcm4708-smartrg-sr400ac: 1 offline lab
            exynos5250-arndale: 1 offline lab
            exynos5420-arndale-octa: 1 offline lab
            exynos5800-peach-pi: 1 offline lab
            imx6dl-wandboard_dual: 1 offline lab
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab
            imx7s-warp: 1 offline lab
            meson8b-odroidc1: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            mt7629-rfb: 1 offline lab
            omap3-beagle: 1 offline lab
            omap3-beagle-xm: 1 offline lab
            omap4-panda: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            stih410-b2120: 1 offline lab
            sun4i-a10-cubieboard: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab
            tegra30-beaver: 1 offline lab
            vf610-colibri-eval-v3: 1 offline lab
            zynq-zc702: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun4i-a10-cubieboard: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    omap2plus_defconfig:
        gcc-8
            omap3-beagle: 1 offline lab
            omap3-beagle-xm: 1 offline lab
            omap4-panda: 1 offline lab

    tegra_defconfig:
        gcc-8
            tegra30-beaver: 1 offline lab

    mvebu_v7_defconfig:
        gcc-8
            armada-xp-openblocks-ax3-4: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab
            imx7s-warp: 1 offline lab
            vf610-colibri-eval-v3: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5250-arndale: 1 offline lab
            exynos5420-arndale-octa: 1 offline lab
            exynos5800-peach-pi: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig:
        tegra124-jetson-tk1:
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        tegra124-jetson-tk1:
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

    tegra_defconfig:
        tegra124-jetson-tk1:
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        tegra124-jetson-tk1:
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
