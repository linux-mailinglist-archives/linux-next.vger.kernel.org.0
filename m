Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02B7C186BF3
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 14:24:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731250AbgCPNYJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 09:24:09 -0400
Received: from mail-pj1-f51.google.com ([209.85.216.51]:53253 "EHLO
        mail-pj1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731225AbgCPNYI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2020 09:24:08 -0400
Received: by mail-pj1-f51.google.com with SMTP id l36so8335703pjb.3
        for <linux-next@vger.kernel.org>; Mon, 16 Mar 2020 06:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=kNT8p2WRRmzYzGy/neC4sVnubN6GAkRswm1RtwEBxVM=;
        b=Zho+rZ/FNeFLg6DeJ/6bTVHpdxVYC5FqOVv4wroA8FY6wd+VVWdEhkGGpPTDLxinfy
         V2OL3Yd8miG6bMSH7KpJ07R8LKg4jbyiok9ssY6wZt6sLefIHX3Ra4M9bBm/ml77J3nK
         4dCGG0AJOAIqsuwHNjtzpMGvj+TzHYEQ6I/Uek/ndm3i7Y67yg1LGDfW37qJ3qYRuGn8
         njuiAKh7KWlDh6T0F19TdNpiwzVn234Hrel2LVtzXCiVQxvg9ggKltzBmSWo6JGqDHK1
         wFjgx2S5UEFpwqi8YNW6BGT+nSLC9anfBqS71jMWhPhEwMgmdt1DUUope+Snj/FGL4BH
         rGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=kNT8p2WRRmzYzGy/neC4sVnubN6GAkRswm1RtwEBxVM=;
        b=NL8jAcrruxNNCXsiRHGW9NvJLeMRmJQi/4zzqngm9m9r2CIqtMEUYwUTDzioXpRwYd
         GHFqiVECzJrNeH7d0tFE7pzC+WqbajeLWqOYTwMUhb6g7ymebVKBKAXYxmz51E0Tl0J2
         MbJLovPcQj+LdamHlLdoGzGPDILCZBP4qMmG9mAIisyStpfgwhofucBUbf5M50+keE2N
         MzTunqRMsM3WBxm6XZ/AYkmSr1zC6D6lIre2gCWVqFiFjuVftwOXm38PpD6VaKSIJnow
         7Lgsir/z3IsDwR81Sj7hgvqe4epFT/SscNqL7Dxkj/YgNQEvA95GlHaic6OsegejoNZv
         GSTA==
X-Gm-Message-State: ANhLgQ2z9Rwx9L8RIDouDRo4lEzrrgfXhjEhuBN7Lxj47zAmxi6F2QsZ
        eoqxyh0sGbTpoViYD8ebkNDRjoxOE8M=
X-Google-Smtp-Source: ADFU+vtwX04zn7buNxo4AHnETr63+1XJuzXCVd9ReRbZSMI9euIEvx3dZJxZHlICykJUvkOQEccZzg==
X-Received: by 2002:a17:90a:bf0b:: with SMTP id c11mr26534631pjs.28.1584365046752;
        Mon, 16 Mar 2020 06:24:06 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id 136sm64628660pgh.26.2020.03.16.06.24.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 06:24:06 -0700 (PDT)
Message-ID: <5e6f7df6.1c69fb81.bf0f2.942b@mx.google.com>
Date:   Mon, 16 Mar 2020 06:24:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200316
X-Kernelci-Report-Type: boot
Subject: next/master boot: 275 boots: 23 failed, 233 passed with 7 offline,
 12 untried/unknown (next-20200316)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 275 boots: 23 failed, 233 passed with 7 offline, 12 untri=
ed/unknown (next-20200316)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200316/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200316/

Tree: next
Branch: master
Git Describe: next-20200316
Git Commit: 8548fd2f20ed19b0e8c0585b71fdfde1ae00ae3c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 104 unique boards, 23 SoC families, 30 builds out of 329

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200313)

    imx_v4_v5_defconfig:
        gcc-8:
          imx27-phytec-phycard-s-rdk:
              lab-pengutronix: new failure (last pass: next-20191011)

    imx_v6_v7_defconfig:
        gcc-8:
          imx6ul-pico-hobbit:
              lab-pengutronix: new failure (last pass: next-20191011)

    multi_v5_defconfig:
        gcc-8:
          imx27-phytec-phycard-s-rdk:
              lab-pengutronix: new failure (last pass: next-20191011)

    multi_v7_defconfig:
        gcc-8:
          imx6ul-pico-hobbit:
              lab-pengutronix: new failure (last pass: next-20191011)
          tegra124-nyan-big:
              lab-collabora: new failure (last pass: next-20200226)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200313)
          rk3288-veyron-jaq:
              lab-collabora: failing since 2 days (last pass: next-20200312=
 - first fail: next-20200313)
          tegra124-nyan-big:
              lab-collabora: failing since 2 days (last pass: next-20200312=
 - first fail: next-20200313)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          imx6ul-pico-hobbit:
              lab-pengutronix: new failure (last pass: next-20191011)
          tegra124-nyan-big:
              lab-collabora: new failure (last pass: next-20200226)

    omap2plus_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: next-20200313)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 27 days (last pass: next-20200214=
 - first fail: next-20200217)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: next-20200313)
          sun8i-h2-plus-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20200313)

    tegra_defconfig:
        gcc-8:
          tegra124-nyan-big:
              lab-collabora: failing since 2 days (last pass: next-20200312=
 - first fail: next-20200313)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200313)

    vexpress_defconfig:
        gcc-8:
          vexpress-v2p-ca15-tc1:
              lab-collabora: new failure (last pass: next-20200313)
              lab-baylibre: new failure (last pass: next-20200313)
          vexpress-v2p-ca9:
              lab-collabora: new failure (last pass: next-20200313)
              lab-baylibre: new failure (last pass: next-20200313)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 9 days (last pass: next-20200304 - f=
irst fail: next-20200306)
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: next-20200313)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200313)
          meson-g12a-sei510:
              lab-baylibre: new failure (last pass: next-20200313)
          meson-gxl-s905d-p230:
              lab-baylibre: failing since 2 days (last pass: next-20200306 =
- first fail: next-20200313)
          meson-sm1-sei610:
              lab-baylibre: new failure (last pass: next-20200313)
          sun50i-h5-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20200313)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200313)
          meson-gxl-s905x-libretech-cc:
              lab-clabbe: new failure (last pass: next-20200313)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200313)
          meson-gxm-khadas-vim2:
              lab-baylibre: new failure (last pass: next-20200313)
          sun50i-h5-libretech-all-h3-cc:
              lab-baylibre: new failure (last pass: next-20200313)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab
            tegra124-nyan-big: 1 failed lab

    omap2plus_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

    imx_v4_v5_defconfig:
        gcc-8:
            imx27-phytec-phycard-s-rdk: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v5_defconfig:
        gcc-8:
            imx27-phytec-phycard-s-rdk: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            imx6ul-pico-hobbit: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab
            sun4i-a10-cubieboard: 1 failed lab
            tegra124-nyan-big: 1 failed lab

    tegra_defconfig:
        gcc-8:
            tegra124-nyan-big: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            imx6ul-pico-hobbit: 1 failed lab
            vf610-colibri-eval-v3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            imx6ul-pico-hobbit: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab
            tegra124-nyan-big: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-khadas-vim2: 1 failed lab

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
