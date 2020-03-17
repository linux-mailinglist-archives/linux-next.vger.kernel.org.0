Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 164E5188930
	for <lists+linux-next@lfdr.de>; Tue, 17 Mar 2020 16:30:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgCQPar (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 11:30:47 -0400
Received: from mail-pf1-f175.google.com ([209.85.210.175]:33870 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726019AbgCQPar (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Mar 2020 11:30:47 -0400
Received: by mail-pf1-f175.google.com with SMTP id 23so12161366pfj.1
        for <linux-next@vger.kernel.org>; Tue, 17 Mar 2020 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=dc1NuV0ndcXMLi1UoE+L1BqYhmpmN5TTkM9RVIgyQmQ=;
        b=esBB0Ngv/pQlFv1agozvolnjrD0EFb6v670VDBfY++VKcH0B4RrpYLCZ3f8g2KKjsj
         w9Xac8uFy6CuBuheaRknG50dgN5AmQ/NsGDVFiCylzB8ig0nCj7a8d00jQaqRhoFP1n1
         zJmpYmFH++8t7/3vNWLkxyPjNV038fF/Riw0lP4YCiLHzgWTO3HBEXQAWP6oIoKlT3Ak
         QSphMEq6iQUr6xFSTm+llJOfq56d0Zo04JIsL8Ut8HyE4R1F39gKwkpWMOwhZiOnuSZi
         aqMA5TDob0mKRrVNuvwpYodoFNHsgqhrRyNDrEwRHUSxz12lSoSxbgK1eCluHvmu0KDu
         mbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=dc1NuV0ndcXMLi1UoE+L1BqYhmpmN5TTkM9RVIgyQmQ=;
        b=NupZj6w2sUmnPmezb+cLpDOMM0YufDumlQ9TifOBV1lsnPtAX4pZ0WJKO6RHAIvkGx
         2jfnY/s4i3IOKH12WhnFjnUs0ozLJysx7QLuvozkW43zZXJFSDaAFsZnbE1J1gDY7jO5
         3sY5+KUyJRjEUVqzislyzHFoWwfw8yfVlr0I8eXh8fMfRzJAoViMIzCI4+NEEPlQTRWH
         ujtnBDuCT/twrCD+qv1PACG1amdA0rRI5IXALzrhIGpE+Kg9jbA+XrGigFGNOiGkWPZ1
         qXMRLH7fjpL2szLdXoBvFGWz8bQnSyXLeba3l5HK3QLCAqdd5aD/eg7MMfJoRl8GZ1xb
         9ltQ==
X-Gm-Message-State: ANhLgQ02hEDiEt0lFezHJcPTlZ3bv1OCnnniNbkydesob9Ga7krCg9lE
        OCFqvgSt8WyiaQezw4TEOMke/y6f1f8=
X-Google-Smtp-Source: ADFU+vsyDSnLRr+dhk1Bf4iF2dVsv2sZKvGTUMz5MkqeXnR6w/gnCZcBbh7cpwxwp8eVrN3V8yEm2g==
X-Received: by 2002:a62:a501:: with SMTP id v1mr6043096pfm.7.1584459045344;
        Tue, 17 Mar 2020 08:30:45 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s39sm163631pjb.10.2020.03.17.08.30.44
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2020 08:30:44 -0700 (PDT)
Message-ID: <5e70ed24.1c69fb81.2c114.06e1@mx.google.com>
Date:   Tue, 17 Mar 2020 08:30:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200317
X-Kernelci-Report-Type: boot
Subject: next/master boot: 278 boots: 19 failed, 246 passed with 7 offline,
 6 untried/unknown (next-20200317)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 278 boots: 19 failed, 246 passed with 7 offline, 6 untrie=
d/unknown (next-20200317)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200317/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200317/

Tree: next
Branch: master
Git Describe: next-20200317
Git Commit: ec947d0be5f959fff44d59161401515a98a837f3
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 105 unique boards, 23 SoC families, 30 builds out of 329

Boot Regressions Detected:

arm:

    imx_v4_v5_defconfig:
        gcc-8:
          imx27-phytec-phycard-s-rdk:
              lab-pengutronix: failing since 1 day (last pass: next-2019101=
1 - first fail: next-20200316)

    imx_v6_v7_defconfig:
        gcc-8:
          imx6ul-pico-hobbit:
              lab-pengutronix: failing since 1 day (last pass: next-2019101=
1 - first fail: next-20200316)

    multi_v5_defconfig:
        gcc-8:
          imx27-phytec-phycard-s-rdk:
              lab-pengutronix: failing since 1 day (last pass: next-2019101=
1 - first fail: next-20200316)

    multi_v7_defconfig:
        gcc-8:
          imx6ul-pico-hobbit:
              lab-pengutronix: failing since 1 day (last pass: next-2019101=
1 - first fail: next-20200316)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: next-20200316)
          tegra124-nyan-big:
              lab-collabora: failing since 1 day (last pass: next-20200226 =
- first fail: next-20200316)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          rk3288-veyron-jaq:
              lab-collabora: failing since 3 days (last pass: next-20200312=
 - first fail: next-20200313)
          tegra124-nyan-big:
              lab-collabora: failing since 3 days (last pass: next-20200312=
 - first fail: next-20200313)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          imx6ul-pico-hobbit:
              lab-pengutronix: failing since 1 day (last pass: next-2019101=
1 - first fail: next-20200316)
          tegra124-nyan-big:
              lab-collabora: failing since 1 day (last pass: next-20200226 =
- first fail: next-20200316)

    omap2plus_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: failing since 1 day (last pass: next-20200313 -=
 first fail: next-20200316)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 28 days (last pass: next-20200214=
 - first fail: next-20200217)

    tegra_defconfig:
        gcc-8:
          tegra124-nyan-big:
              lab-collabora: failing since 3 days (last pass: next-20200312=
 - first fail: next-20200313)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200316)

    vexpress_defconfig:
        gcc-8:
          vexpress-v2p-ca9:
              lab-collabora: failing since 1 day (last pass: next-20200313 =
- first fail: next-20200316)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200316)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200316)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20200316)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200316)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200316)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200316)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
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
            tegra124-nyan-big: 1 failed lab

    tegra_defconfig:
        gcc-8:
            tegra124-nyan-big: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            imx6ul-pico-hobbit: 1 failed lab
            vf610-colibri-eval-v3: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            imx6ul-pico-hobbit: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab
            tegra124-nyan-big: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905d-p230: 1 failed lab
            meson-gxm-q200: 1 failed lab

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
