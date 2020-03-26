Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 906CF194529
	for <lists+linux-next@lfdr.de>; Thu, 26 Mar 2020 18:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbgCZRNA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Mar 2020 13:13:00 -0400
Received: from mail-pf1-f170.google.com ([209.85.210.170]:35402 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbgCZRNA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2020 13:13:00 -0400
Received: by mail-pf1-f170.google.com with SMTP id u68so3101729pfb.2
        for <linux-next@vger.kernel.org>; Thu, 26 Mar 2020 10:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=C8lW3IFZXzYM8D8PtJktFpRFtlh8KMKZY2+EgSzaYvo=;
        b=TqxBr4uZBPLcdZeda/OaHCMooREqqYDqhIEn/iqoX2vZmN02Fj3Hwj6Usonz8zvWBH
         fwqwbTD15cRqcAIUD/EKZAdFaW8FTXUBHrGJNM5z5HB485F4FIeZY7n1/mJ6j75WP8pZ
         YJGPlLRTICrC2tkZ7Bd7st7eB/egTDF5LoLS5EgbJhMzSHMB/LbptxgzlWEHkQkAvfhc
         RhOrEhYaplyfeui3OCQ+839TPGF5LC5Fu6PBXHCOwjbLuEotXOxpMFt4pyYVm5Rm/Ph0
         iHWh4S2bOvfLKtBseXsBbKMo46hX9zgQ+mK5TFzlhlhpAnuXqDt9gbHfq5T0DsKw4o1s
         z8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=C8lW3IFZXzYM8D8PtJktFpRFtlh8KMKZY2+EgSzaYvo=;
        b=nwTpYLGIK0Htw9bBG4V/paa3FAw/Vmp0FLM9Yv+0kOiW4qxdA8CmKJyNsrik4xtaxq
         sfoeF8i0kOlXPC/dlDT+9qJU7wER+PZ0wr3VcUnHq6T1GqPbpNu8gY93L0/TceZUVYQ+
         v3BNejXdYiO7jnZPfx04YoWU8Vhk+X4KaM61Rnw89jdIFnI7LdF69dWyA7MCx3YMe1NL
         i0wefBTjqsWUGqFeyy7tG4Jo4hoaQ5ZtzVjXCaJOkr9isyUCuOi9VtTga4bu4Pmuust5
         AqJra3wvClt+7C8Y+BLOzFBNxCYqa1EFvdpUlFllNT0CfqhuiiAcLZQmxLGAAN4QkGtS
         L/2g==
X-Gm-Message-State: ANhLgQ1kbwoaExoxIdsOu7AMiMq/tk3m9ledcuhhOV0tSfV/JAaDy99S
        5Jp/Q7aSweVG3UxAdyVoLJKv3F8HQIg=
X-Google-Smtp-Source: ADFU+vvBSL4OBa0x0CR0B56xbsH092HNTP8gvQJ2+P7SZ1lJ69N3y+A0HCU5nDY3ZYNZcTHFO++D7Q==
X-Received: by 2002:a63:c050:: with SMTP id z16mr9158912pgi.177.1585242777307;
        Thu, 26 Mar 2020 10:12:57 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f5sm2213238pfq.63.2020.03.26.10.12.55
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 10:12:56 -0700 (PDT)
Message-ID: <5e7ce298.1c69fb81.efbff.9491@mx.google.com>
Date:   Thu, 26 Mar 2020 10:12:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20200326
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
X-Kernelci-Tree: next
Subject: next/master boot: 270 boots: 27 failed, 234 passed with 3 offline,
 6 untried/unknown (next-20200326)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 270 boots: 27 failed, 234 passed with 3 offline, 6 untrie=
d/unknown (next-20200326)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200326/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200326/

Tree: next
Branch: master
Git Describe: next-20200326
Git Commit: 89295c59c1f063b533d071ca49d0fa0c0783ca6f
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 104 unique boards, 25 SoC families, 30 builds out of 227

Boot Regressions Detected:

arm:

    bcm2835_defconfig:
        gcc-8:
          bcm2835-rpi-b:
              lab-baylibre-seattle: new failure (last pass: next-20200325)
          bcm2836-rpi-2-b:
              lab-collabora: new failure (last pass: next-20200325)
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: next-20200325)

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 5 days (last pass: next-20200319=
 - first fail: next-20200320)

    multi_v7_defconfig:
        gcc-8:
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: new failure (last pass: next-20200325)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: new failure (last pass: next-20200325)
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: new failure (last pass: next-20200325)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 37 days (last pass: next-20200214=
 - first fail: next-20200217)

    sunxi_defconfig:
        gcc-8:
          sun7i-a20-olinuxino-lime2:
              lab-baylibre: new failure (last pass: next-20200325)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200325)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: new failure (last pass: next-20200325)
          bcm2711-rpi-4-b:
              lab-baylibre: new failure (last pass: next-20200325)
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: next-20200325)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20200325)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200325)
          sun50i-h6-pine-h64:
              lab-clabbe: new failure (last pass: next-20200325)
              lab-collabora: new failure (last pass: next-20200325)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200325)
          meson-gxl-s805x-p241:
              lab-baylibre: failing since 1 day (last pass: next-20200324 -=
 first fail: next-20200325)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20200325)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200325)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          bcm2711-rpi-4-b:
              lab-baylibre: new failure (last pass: next-20200325)
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: next-20200325)
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200325)
          meson-gxl-s905x-khadas-vim:
              lab-baylibre: new failure (last pass: next-20200325)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200325)
          sun50i-h6-pine-h64:
              lab-clabbe: new failure (last pass: next-20200325)
              lab-collabora: new failure (last pass: next-20200325)

Boot Failures Detected:

arm:
    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            sun7i-a20-olinuxino-lime2: 1 failed lab

    bcm2835_defconfig:
        gcc-8:
            bcm2835-rpi-b: 1 failed lab
            bcm2836-rpi-2-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            sun7i-a20-olinuxino-lime2: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun7i-a20-olinuxino-lime2: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            vf610-colibri-eval-v3: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            bcm2711-rpi-4-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxm-q200: 1 failed lab
            sun50i-h6-pine-h64: 2 failed labs

    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            bcm2711-rpi-4-b: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxm-q200: 1 failed lab
            sun50i-h6-pine-h64: 2 failed labs

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s905x-khadas-vim: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
