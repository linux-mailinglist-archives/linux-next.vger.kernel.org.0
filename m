Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A60713DE59
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 16:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgAPPM5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 10:12:57 -0500
Received: from mail-wr1-f51.google.com ([209.85.221.51]:45988 "EHLO
        mail-wr1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgAPPM4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jan 2020 10:12:56 -0500
Received: by mail-wr1-f51.google.com with SMTP id j42so19483638wrj.12
        for <linux-next@vger.kernel.org>; Thu, 16 Jan 2020 07:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=PYTh8r3LWDKDfBCFNrsp9nJkZH7OhwH9QF++6wpRQws=;
        b=lpBgP7v5TggxXLUgKfDPMOBBEF+K+lVvYivrxSgtaNz2I8EJLAatj75odbmcWoZndz
         kXR9vm1cEyjX9Zk8ro2WHpPLhlZ5AX0q2JpSjhX0v+ZPHsJ/nFeXk25U3F1tCzV1RQQQ
         MseMnpDqr/gfWPgKLqwZ4kzr8Wc3U09xA6MX44HNnDLtOV7yADNd8cTyB6Um0mImnoGn
         FGGNYaUWlviXaDmyctqRXNMiUyEUmG0qiXURQGtzLR2/JaDxqDkje9O3OCy26oSVzf4x
         QzQJQcyBProGa+jpFWe9DO01oFLD/aytqiCNTgf+vAVFfQvapwA7XgNttBygVWdfuZ9E
         GlxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=PYTh8r3LWDKDfBCFNrsp9nJkZH7OhwH9QF++6wpRQws=;
        b=pZlT5mysb3u5UQsn+7InLs7vMkV73PaAoOoC5Kq4K0ir6d1YKUI/bu5OdFCNKCW0jJ
         lss0ZkCsOMz+EimOnlMT5LB8ilu8G4/lWzGAGHMrP1NFMZfTRIkt6X4lJCiLzv06/wpE
         vH10gVAKP3v4EcALFV/q5EYaT/LBmpxAf74WcKfneAFALSwOtFdpQv/0JdaR7Xuj+RuR
         QcC+ZE9qCt5S0iiSMKgRPsF0o52yOuU9dJcunuUydLUg3pGRiOswE0li9dVEAYj0d5IN
         hG3zoSf5Z4iCX+Zn+rDvJEoxUmQyg3SY8NMI4Ymz6+IXDi0dVqlmDZC/aguFZrY9wzu6
         JVuQ==
X-Gm-Message-State: APjAAAVZzrqtXBdddTMF06IeoeTD0R2NIyQWtMUUbQJT2y0q6PUbLeSA
        gw/0zjfMhYL2tvfsQYPr+/x7iQtoHJvjfw==
X-Google-Smtp-Source: APXvYqzvpXOy/eNqx6cUrW1GV23lpX1UyejTFZjm6HTP/UAOSnZ8Ac5gw5bodWqCTTVSI6Zojr1Frg==
X-Received: by 2002:a5d:6048:: with SMTP id j8mr3830964wrt.41.1579187573013;
        Thu, 16 Jan 2020 07:12:53 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id l15sm28439614wrv.39.2020.01.16.07.12.52
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 07:12:52 -0800 (PST)
Message-ID: <5e207d74.1c69fb81.7f3c0.5e62@mx.google.com>
Date:   Thu, 16 Jan 2020 07:12:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20200116
Subject: next/master boot: 249 boots: 9 failed, 176 passed with 60 offline,
 4 untried/unknown (next-20200116)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 249 boots: 9 failed, 176 passed with 60 offline, 4 untrie=
d/unknown (next-20200116)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200116/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200116/

Tree: next
Branch: master
Git Describe: next-20200116
Git Commit: 2747d5fdab78f43210256cd52fb2718e0b3cce74
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 96 unique boards, 24 SoC families, 29 builds out of 215

Boot Regressions Detected:

arm:

    bcm2835_defconfig:
        gcc-8:
          bcm2835-rpi-b:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          dm365evm,legacy:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)

    exynos_defconfig:
        gcc-8:
          exynos5250-arndale:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          exynos5420-arndale-octa:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          exynos5422-odroidxu3:
              lab-collabora: failing since 3 days (last pass: next-20200110=
 - first fail: next-20200113)
          exynos5800-peach-pi:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)

    imx_v6_v7_defconfig:
        gcc-8:
          imx6dl-wandboard_dual:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          imx6dl-wandboard_solo:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          imx6q-wandboard:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          imx7s-warp:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          vf610-colibri-eval-v3:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)

    multi_v7_defconfig:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          at91-sama5d4ek:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          bcm4708-smartrg-sr400ac:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          exynos5250-arndale:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          exynos5420-arndale-octa:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          exynos5800-peach-pi:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          imx6dl-wandboard_dual:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          imx6dl-wandboard_solo:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          imx6q-wandboard:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          imx7s-warp:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          meson8b-odroidc1:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          mt7623n-bananapi-bpi-r2:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          mt7629-rfb:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          omap3-beagle:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          omap4-panda:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          socfpga_cyclone5_de0_sockit:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          stih410-b2120:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          sun5i-r8-chip:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          sun7i-a20-bananapi:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          tegra30-beaver:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          vf610-colibri-eval-v3:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          zynq-zc702:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)

    mvebu_v7_defconfig:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)

    omap2plus_defconfig:
        gcc-8:
          omap3-beagle:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          omap4-panda:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4ek:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)

    socfpga_defconfig:
        gcc-8:
          socfpga_cyclone5_de0_sockit:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          sun5i-r8-chip:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          sun7i-a20-bananapi:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)

    tegra_defconfig:
        gcc-8:
          tegra30-beaver:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200115)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: failing since 10 days (last pass: next-20191220 - =
first fail: next-20200106)
          apq8096-db820c:
              lab-bjorn: new failure (last pass: next-20200115)
          juno-r2:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          meson-axg-s400:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200115)
          meson-gxl-s905x-nexbox-a95x:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          meson-gxm-nexbox-a1:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          mt7622-rfb1:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: next-20200115)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          juno-r2:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          meson-axg-s400:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20200115)
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20200115)
          meson-gxl-s905x-nexbox-a95x:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          juno-r2:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          meson-axg-s400:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          meson-gxl-s905x-nexbox-a95x:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          meson-gxm-nexbox-a1:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          mt7622-rfb1:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191220 - first fail: next-20200115)
          sun50i-h5-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20200115)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: new failure (last pass: next-20191220)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            apq8096-db820c: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab

arm:
    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            meson8b-odroidc1: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            meson8b-odroidc1: 1 failed lab

Offline Platforms:

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab
            meson-gxm-nexbox-a1: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab
            meson-gxm-nexbox-a1: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab

arm:

    sunxi_defconfig:
        gcc-8
            sun4i-a10-cubieboard: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4ek: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5250-arndale: 1 offline lab
            exynos5420-arndale-octa: 1 offline lab
            exynos5800-peach-pi: 1 offline lab

    mvebu_v7_defconfig:
        gcc-8
            armada-xp-openblocks-ax3-4: 1 offline lab

    tegra_defconfig:
        gcc-8
            tegra30-beaver: 1 offline lab

    socfpga_defconfig:
        gcc-8
            socfpga_cyclone5_de0_sockit: 1 offline lab

    omap2plus_defconfig:
        gcc-8
            omap3-beagle: 1 offline lab
            omap4-panda: 1 offline lab

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            armada-xp-openblocks-ax3-4: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            armada-xp-openblocks-ax3-4: 1 offline lab
            at91-sama5d4ek: 1 offline lab
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
            omap4-panda: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            socfpga_cyclone5_de0_sockit: 1 offline lab
            stih410-b2120: 1 offline lab
            sun4i-a10-cubieboard: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab
            tegra30-beaver: 1 offline lab
            vf610-colibri-eval-v3: 1 offline lab
            zynq-zc702: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab
            dm365evm,legacy: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab
            imx7s-warp: 1 offline lab
            vf610-colibri-eval-v3: 1 offline lab

---
For more info write to <info@kernelci.org>
