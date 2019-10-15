Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C21FCD6F8D
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2019 08:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfJOGYV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Oct 2019 02:24:21 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33421 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbfJOGYU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Oct 2019 02:24:20 -0400
Received: by mail-wr1-f67.google.com with SMTP id b9so22280194wrs.0
        for <linux-next@vger.kernel.org>; Mon, 14 Oct 2019 23:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=NazTJSD/rtdZMNrda8f325Nc/r+rXOz5r7H91sYzIsc=;
        b=dE5AmaEaAe94HDu8cqsIHXU/joFvvMXFsGF83DjWgT+QUaLn6LSS6Bi9ooYZthA8rZ
         UIGasbt0jOS9864PtZlmILaRY0gL/lTH3ycl7ahDQa7DieWDP2kPPijICvsfE/DVGZYI
         lhxgCwD+PmlqsihYrQ0hsLQHd2leL+HEtwZb1sJMgs3Wj90fl9vkwgXz6I1wPigPmyel
         zRvc3AHR5/m0dhGsSbr3l51ElQhVP9ZGR3gNIjt8F9bTOSxIQ18Ibu7SRodet+0wPU4o
         cQFSDsrnvPlxnAROci0w8xSJRjaTD5a+x4R19isjYriDyF2qXrEAhru0t3sw0OAW/1DE
         QaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=NazTJSD/rtdZMNrda8f325Nc/r+rXOz5r7H91sYzIsc=;
        b=aw3PXGGQN2HusNEF48uCYvlEr8mXG5pvi+iWZhMsMzrIYHaEpCv147VfR6mS4QeM/n
         QkeHZjNxtGPFE6nQD3OZY/ml48+qh2P3sAlIB8BzDC6N06tlBfcWIHjeuEPbRSQbpbNP
         tKNFU3c7qgMN6BXDUbxItKEiJsGBU1jqyfjjDigXcvYh5M97MZHxfSPHMnh0Oqg8bu/6
         N7bz2a8udZ10ZHo2IDkp6JGLettB+ccfcaEfjkzuCJ0CVKA6TrWoDEUoSVmmtnzLnNuw
         WBNnjRjNQiRZC/DqgVkX+zIoEU3aDuBTVH1oZbNAiBRE12z/hp7reywTxg3ge4A1O5Yx
         F4EA==
X-Gm-Message-State: APjAAAW4B4nQWnjgo/Q2DsFcKORjNCjgsYlp2WvmH/67XYp1bzLyymb0
        xFFY2QxD28Sr69T4a53w1BhctiTL56WmvQ==
X-Google-Smtp-Source: APXvYqxxwVTFrPt8GNKTu5qh0rh6RoN8reMaAwQfLICXWAniZWSCeM5kpszvk8LoWDBG6alr9WLqaQ==
X-Received: by 2002:a5d:6445:: with SMTP id d5mr18780637wrw.149.1571120657263;
        Mon, 14 Oct 2019 23:24:17 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id x5sm37328686wrg.69.2019.10.14.23.24.16
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Oct 2019 23:24:16 -0700 (PDT)
Message-ID: <5da56610.1c69fb81.b7af.d144@mx.google.com>
Date:   Mon, 14 Oct 2019 23:24:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: v5.4-rc3-255-g70e06e51eda3
Subject: next/pending-fixes boot: 259 boots: 14 failed,
 173 passed with 71 offline, 1 untried/unknown (v5.4-rc3-255-g70e06e51eda3)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 259 boots: 14 failed, 173 passed with 71 offline, =
1 untried/unknown (v5.4-rc3-255-g70e06e51eda3)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.4-rc3-255-g70e06e51eda3/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.4-rc3-255-g70e06e51eda3/

Tree: next
Branch: pending-fixes
Git Describe: v5.4-rc3-255-g70e06e51eda3
Git Commit: 70e06e51eda30ae5398325ae37b80148665b417d
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 91 unique boards, 25 SoC families, 28 builds out of 215

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc2-630-gf=
df8dc3f1fdb)
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc2-630-gf=
df8dc3f1fdb)

    exynos_defconfig:
        gcc-8:
          exynos5250-arndale:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc2-630-gf=
df8dc3f1fdb)
          exynos5420-arndale-octa:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc2-630-gf=
df8dc3f1fdb)
          exynos5800-peach-pi:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc2-630-gf=
df8dc3f1fdb)

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc2-630-gf=
df8dc3f1fdb)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc2-630-gf=
df8dc3f1fdb)
          sun5i-r8-chip:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc2-630-gf=
df8dc3f1fdb)
          sun7i-a20-bananapi:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc2-630-gf=
df8dc3f1fdb)

    tegra_defconfig:
        gcc-8:
          tegra30-beaver:
              lab-baylibre-seattle: new failure (last pass: v5.4-rc2-630-gf=
df8dc3f1fdb)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12a-sei510: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab

    defconfig:
        gcc-8:
            meson-g12a-sei510: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab

    defconfig+kselftest:
        gcc-8:
            meson-g12a-sei510: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            r8a7796-m3ulcb: 2 failed labs
            rk3399-puma-haikou: 1 failed lab
            sun50i-h5-libretech-all-h3-cc: 1 failed lab

arm:
    multi_v7_defconfig+kselftest:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            rk3288-rock2-square: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            sun8i-h2-plus-orangepi-zero: 1 failed lab

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

---
For more info write to <info@kernelci.org>
