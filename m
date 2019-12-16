Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3A62120238
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2019 11:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbfLPKVP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Dec 2019 05:21:15 -0500
Received: from mail-wr1-f42.google.com ([209.85.221.42]:44566 "EHLO
        mail-wr1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbfLPKVP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Dec 2019 05:21:15 -0500
Received: by mail-wr1-f42.google.com with SMTP id q10so6503527wrm.11
        for <linux-next@vger.kernel.org>; Mon, 16 Dec 2019 02:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=XRjdQ6dReQotwNfxM9VeP+O9fu5jdxF8FrLZC0dm6Zk=;
        b=BJIl/076SeJ9krLaVCUfjCpNguDs6mWVa4eIxpRMLDyeUFDRp+4aHm8PHcIz5v3h5v
         bo0vrVgw8VvtuNE33myOPqAOujfBwTh6pE3sijw4XAH0mRBFxrHSCtxXTevtgn/MDPna
         T0R+Vat0nsYE9SqQ0+zztFJhf0bT7AEAzt2a+QGCwzF7Iu+RNOwUuu18DI9cFdQbXyxl
         Sc8jJwEVB5Y/9/XzvpK5Alav0nSVoeurv8eizDAeFd1Gxy2aujdqBq2PwOYYmLw+DnPw
         dRNrFaNyKGZX3rc0GzbROOlxWx3I4xxnKeLEwvo9hxj3G200JWqG8OwkAGjDkQV8TyKK
         iNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=XRjdQ6dReQotwNfxM9VeP+O9fu5jdxF8FrLZC0dm6Zk=;
        b=FBov+9Zm9mJqw4Rgi4ZXMUaRyTjRYrW9OIzYuYa1YV2tmjreZA4bdH9+1PK+8mYWjo
         FEAbxkJeovelSJu33OOo4pp2MGtOPoZw30Qjvmj2UvCM4Isypr/C8HodGPWsxNEiFoax
         M/tIOw5OgVPrV7LZD8mgXcQIYfZu6ocJtQR1eFKFhL4Ob+Dpf+Eq/5LPE0cFPjAMxI80
         pDsXhl5WEteU062mo9bd71EM+NozNSVCRnSo3VGywUF8uvR++Q3VMG4ckWoTlUF526Qi
         fWF2OVHJlkte+NjbtuGIdCLtcc7HzSm1DkljPwTITgq4dCK794MgByuRJ8QdXcmFjpX8
         98Jg==
X-Gm-Message-State: APjAAAUl80/6YS+NSLKfqcshGMtYA6wyES1yCwV4jlJZEtw2aTDkbKL1
        MFu0G1GhrANuLoCu/CPn71ETVi7erb0=
X-Google-Smtp-Source: APXvYqzQVinLfn3AWf/zKCtrHwWjxm4oxdqpkX1YUh2zesQ9YLR+fOHoKvi+OLXKj6/QUsW2nH47Xw==
X-Received: by 2002:a5d:46d0:: with SMTP id g16mr30678360wrs.287.1576491670722;
        Mon, 16 Dec 2019 02:21:10 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id k4sm20999670wmk.26.2019.12.16.02.21.09
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 02:21:10 -0800 (PST)
Message-ID: <5df75a96.1c69fb81.3a77e.b0cb@mx.google.com>
Date:   Mon, 16 Dec 2019 02:21:10 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191216
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 217 boots: 7 failed, 135 passed with 74 offline,
 1 untried/unknown (next-20191216)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 217 boots: 7 failed, 135 passed with 74 offline, 1 untrie=
d/unknown (next-20191216)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191216/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191216/

Tree: next
Branch: master
Git Describe: next-20191216
Git Commit: cf2be78b22e07e6c4de17fe02b15999189c0fc26
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 92 unique boards, 26 SoC families, 29 builds out of 214

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: failing since 5 days (last pass: next-2=
0191209 - first fail: next-20191210)
          dm365evm,legacy:
              lab-baylibre-seattle: failing since 5 days (last pass: next-2=
0191209 - first fail: next-20191210)

    exynos_defconfig:
        gcc-8:
          exynos5250-arndale:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191211 - first fail: next-20191213)
          exynos5420-arndale-octa:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191211 - first fail: next-20191213)
          exynos5800-peach-pi:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191211 - first fail: next-20191213)

    imx_v6_v7_defconfig:
        gcc-8:
          imx6dl-wandboard_dual:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          imx6dl-wandboard_solo:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          imx6q-wandboard:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          imx7s-warp:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          vf610-colibri-eval-v3:
              lab-baylibre-seattle: new failure (last pass: next-20191213)

    multi_v7_defconfig:
        gcc-8:
          alpine-db:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          at91-sama5d4ek:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          bcm4708-smartrg-sr400ac:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          exynos5250-arndale:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          exynos5420-arndale-octa:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          exynos5800-peach-pi:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          imx6dl-wandboard_dual:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          imx6dl-wandboard_solo:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          imx6q-wandboard:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          imx7s-warp:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          meson8b-odroidc1:
              lab-baylibre: new failure (last pass: next-20191213)
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          mt7623n-bananapi-bpi-r2:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          mt7629-rfb:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          omap3-beagle:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          omap4-panda:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          qcom-apq8064-cm-qs600:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          socfpga_cyclone5_de0_sockit:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          stih410-b2120:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          sun5i-r8-chip:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          sun7i-a20-bananapi:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          tegra30-beaver:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          vf610-colibri-eval-v3:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          zynq-zc702:
              lab-baylibre-seattle: new failure (last pass: next-20191213)

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          armada-xp-openblocks-ax3-4:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191211 - first fail: next-20191213)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          meson8b-odroidc1:
              lab-baylibre: new failure (last pass: next-20191213)

    socfpga_defconfig:
        gcc-8:
          socfpga_cyclone5_de0_sockit:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191211 - first fail: next-20191213)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          sun5i-r8-chip:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          sun7i-a20-bananapi:
              lab-baylibre-seattle: new failure (last pass: next-20191213)

    tegra_defconfig:
        gcc-8:
          tegra30-beaver:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191211 - first fail: next-20191213)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: next-20191213)
          juno-r2:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          meson-g12b-s922x-khadas-vim3:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          meson-gxl-s905x-libretech-cc:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          meson-gxl-s905x-nexbox-a95x:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          meson-gxm-nexbox-a1:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          meson-sm1-khadas-vim3l:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          meson-sm1-sei610:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          mt7622-rfb1:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          sun50i-a64-pine64-plus:
              lab-baylibre-seattle: new failure (last pass: next-20191213)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20191213)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20191213)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          juno-r2:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20191213)
          meson-g12b-s922x-khadas-vim3:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          meson-gxl-s905x-libretech-cc:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          meson-gxl-s905x-nexbox-a95x:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          meson-gxm-nexbox-a1:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          meson-sm1-khadas-vim3l:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          meson-sm1-sei610:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          mt7622-rfb1:
              lab-baylibre-seattle: new failure (last pass: next-20191213)
          sun50i-a64-pine64-plus:
              lab-baylibre-seattle: new failure (last pass: next-20191213)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            meson8b-odroidc1: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            meson8b-odroidc1: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab

Offline Platforms:

arm:

    mvebu_v7_defconfig:
        gcc-8
            armada-xp-openblocks-ax3-4: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab
            dm365evm,legacy: 1 offline lab

    tegra_defconfig:
        gcc-8
            tegra30-beaver: 1 offline lab

    omap2plus_defconfig:
        gcc-8
            omap3-beagle: 1 offline lab
            omap4-panda: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5250-arndale: 1 offline lab
            exynos5420-arndale-octa: 1 offline lab
            exynos5800-peach-pi: 1 offline lab

    imx_v6_v7_defconfig:
        gcc-8
            imx6dl-wandboard_dual: 1 offline lab
            imx6dl-wandboard_solo: 1 offline lab
            imx6q-wandboard: 1 offline lab
            imx7s-warp: 1 offline lab
            vf610-colibri-eval-v3: 1 offline lab

    socfpga_defconfig:
        gcc-8
            socfpga_cyclone5_de0_sockit: 1 offline lab

    multi_v7_defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            armada-xp-openblocks-ax3-4: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4ek: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
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

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun4i-a10-cubieboard: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm64:

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab
            meson-sm1-sei610: 1 offline lab

    defconfig:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab
            meson-g12b-s922x-khadas-vim3: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab
            meson-gxm-nexbox-a1: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab
            meson-sm1-sei610: 1 offline lab
            mt7622-rfb1: 1 offline lab
            sun50i-a64-pine64-plus: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab
            meson-g12b-s922x-khadas-vim3: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-gxl-s905x-nexbox-a95x: 1 offline lab
            meson-gxm-nexbox-a1: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab
            meson-sm1-sei610: 1 offline lab
            mt7622-rfb1: 1 offline lab
            sun50i-a64-pine64-plus: 1 offline lab

---
For more info write to <info@kernelci.org>
