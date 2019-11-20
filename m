Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C66B2103D68
	for <lists+linux-next@lfdr.de>; Wed, 20 Nov 2019 15:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728438AbfKTOjT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 20 Nov 2019 09:39:19 -0500
Received: from mail-wm1-f48.google.com ([209.85.128.48]:37302 "EHLO
        mail-wm1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728407AbfKTOjT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 20 Nov 2019 09:39:19 -0500
Received: by mail-wm1-f48.google.com with SMTP id b17so8099162wmj.2
        for <linux-next@vger.kernel.org>; Wed, 20 Nov 2019 06:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=GdBLUsSqNFbFRFVgJmA4pcWiks1NyqIUD9HfEAhIc+M=;
        b=H0kaS1s4hjQweC+UaQxeC+UhTs4HQFk35V8OiWK9kRdJnskCx2GWKaLQ/uQmaqi8nm
         FzlYPQ1scJARyu0WajLfRGYnT7M3XmsACB4l7zkZARHt3fOJ9Q+Qsa/dt065yhjj9irG
         S1ni5NwV7dsXv9nRkTcR8+6VAoFE2WoXV8RFAwTgAXSzXi0rZkurQbLkt0fEkAZ7Ruhm
         xFLz5zWULYv/LqLehLtOEvhjM0sDXm26NNbSzrTIqdD96fPJ6mAln2XAmmQgjOFumkol
         nsF52dYxKGDw1P82C+kQNUuikKIqVreZNQtbESWIgfroPoLMc4HEKfvQ5K/CK42G/JRz
         C9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=GdBLUsSqNFbFRFVgJmA4pcWiks1NyqIUD9HfEAhIc+M=;
        b=kAvu53hyq943DzcUTa7JS9x9iNBE4di0mTOy2eFeWKFMfw/2S78Q4MEmRpWAh0tFJD
         3/MD2rC2C3Uvi+/seu+2NY2Uti3C+KpfsAyXG1YzrQB2ViUOJplfbs50fnQ9Rrj6mSyq
         P0YDmAXBPNLmpMl7VMUJT+eD6e18Uuv7luQi5fUJQriq4pLtoeb3f2XzR56uOD2mzh1l
         h/fG/7zOJqeKHfmo59mupw9XkLEHFLEM0EXGTeKN2INT7V9A86L6hoJBUOpp13F3hisY
         D98VX3xT8fA0iHimkQ4sofTJYC/UgQmOMWPjU1EL6p72r/kdgJIAhIqBKH/W7RsXwrVo
         KA+Q==
X-Gm-Message-State: APjAAAUlKyDZoUYiWHT6PaatZG4jZ38V+uSpZXmtG0GfNFToN8v/cmaI
        /wyGwGPOpE/hg6vcdA+O+EpvmgZJCKw=
X-Google-Smtp-Source: APXvYqwWWpAZqpQDMRZM9SsJpGrMKQut5cvNHzgQMcnghoPNxDJBm78pdWm+IXK5/znTlcd5prXElg==
X-Received: by 2002:a05:600c:28c:: with SMTP id 12mr3566964wmk.25.1574260755469;
        Wed, 20 Nov 2019 06:39:15 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id c11sm17461686wrv.92.2019.11.20.06.39.14
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 06:39:14 -0800 (PST)
Message-ID: <5dd55012.1c69fb81.774bc.3c82@mx.google.com>
Date:   Wed, 20 Nov 2019 06:39:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191120
Subject: next/master boot: 271 boots: 12 failed, 252 passed with 6 offline,
 1 conflict (next-20191120)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 271 boots: 12 failed, 252 passed with 6 offline, 1 confli=
ct (next-20191120)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191120/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191120/

Tree: next
Branch: master
Git Describe: next-20191120
Git Commit: 1fef9976397fc9b951ee54467eccd65e0c508785
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 99 unique boards, 27 SoC families, 28 builds out of 217

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5250-arndale:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191115 - first fail: next-20191118)
          exynos5420-arndale-octa:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191115 - first fail: next-20191118)
          exynos5800-peach-pi:
              lab-collabora: failing since 1 day (last pass: next-20191115 =
- first fail: next-20191119)
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191115 - first fail: next-20191118)

    multi_v7_defconfig:
        gcc-8:
          exynos5800-peach-pi:
              lab-collabora: new failure (last pass: next-20191119)

arm64:

    defconfig:
        gcc-8:
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20191115)
          rk3399-gru-kevin:
              lab-collabora: new failure (last pass: next-20191119)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20191119)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

    defconfig:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            exynos5250-arndale: 1 failed lab
            exynos5420-arndale-octa: 1 failed lab
            exynos5800-peach-pi: 1 failed lab
            vf610-colibri-eval-v3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5250-arndale: 1 failed lab
            exynos5420-arndale-octa: 1 failed lab
            exynos5800-peach-pi: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            vf610-colibri-eval-v3: 1 failed lab

Offline Platforms:

arm:

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        meson-gxl-s905x-libretech-cc:
            lab-baylibre: FAIL (gcc-8)
            lab-clabbe: PASS (gcc-8)
            lab-baylibre-seattle: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
