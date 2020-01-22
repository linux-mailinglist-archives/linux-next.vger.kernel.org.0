Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26903145777
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2020 15:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgAVOJz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jan 2020 09:09:55 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:42221 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgAVOJz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jan 2020 09:09:55 -0500
Received: by mail-wr1-f43.google.com with SMTP id q6so7379424wro.9
        for <linux-next@vger.kernel.org>; Wed, 22 Jan 2020 06:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=vCoK6dwFPRP92WQn/cRQGxpYKYCK570Lgw68r8KgxpQ=;
        b=0c2hSpuHbbD+vJka0cWnGeBrSZh42axo18AYOrdg73vsTw+91nj457B1yAzeGVeWIo
         ORpbSHwqJXy0cVmaoIWOvo8pFPC8IeEIJrGzeIrgunDTd3dDKIo8CgB/cn1D/s4zEWWn
         r/SigHZwGbKT6cKS9X2uD9MuiwjId327lYvihUTNEzVozmngKkKDkDb3AMWhJJztK+/C
         XusNz3vOm+8Q3ZFc75uv8PS0a/RGL/467qbk1VkMbsNnFSDkq4JBc6ojCUMRJVtn3s/c
         5Ip0qbqNIGLertjTrD9hFaH02dQCHZ5sITUHUA1VkeeEXTqzUC9YdSVRuzOxMysDBKzr
         32bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=vCoK6dwFPRP92WQn/cRQGxpYKYCK570Lgw68r8KgxpQ=;
        b=Bk6ncoFBWIgIig64qLprBR/E+9MmnwFq5n4bVmFwmyB9MphGy6AQebY23eWrb3sLMm
         XUhR+jJ2MUE82S2MlZsA6ENkgdEn/DVbbXUnRivODGnng9c/VXvFYrKCk2IAQJQ2veB3
         gnx62/UINI0R7tm6NjvQBjP2K2qMdHsJbZowIuv7Qwl/sWwTE/P1NnO3XfBCBL4nRI7+
         YKMeltrXZ+6IxzQZXF9iNMMV/k4R2ZIpHVI8/O23a2NTwEIJGITfgNxPTlA7KTSA8Cvv
         fCNu5NJjBg1IxUlfXfJXWomHwkAoVir2mMRiDjtggaxMEuenC49gpGOABvl76L/JQCau
         wSZw==
X-Gm-Message-State: APjAAAUq05jdkEeyNjpKcid8qDU1eKyZeY1KadgFm6vlspyOxSaXPd71
        p35HSrH5usV7aI+oOdCyix0sM8RHmWNeDg==
X-Google-Smtp-Source: APXvYqw+rY9jFjSmN4GYD9Tw1jfzATbzqPgW+sl7G5AsLtUGXlb8XPayuITSVVkPybUDevzB+YOWdg==
X-Received: by 2002:adf:ef0b:: with SMTP id e11mr11995823wro.128.1579702192882;
        Wed, 22 Jan 2020 06:09:52 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id w17sm57368548wrt.89.2020.01.22.06.09.51
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 06:09:51 -0800 (PST)
Message-ID: <5e2857af.1c69fb81.5d284.6063@mx.google.com>
Date:   Wed, 22 Jan 2020 06:09:51 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20200122
Subject: next/master boot: 256 boots: 12 failed, 227 passed with 15 offline,
 2 untried/unknown (next-20200122)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 256 boots: 12 failed, 227 passed with 15 offline, 2 untri=
ed/unknown (next-20200122)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200122/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200122/

Tree: next
Branch: master
Git Describe: next-20200122
Git Commit: ba0b4dfd6466b7e2984dbe52242686e0dd184bf1
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 100 unique boards, 24 SoC families, 30 builds out of 215

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-lcdk:
              lab-baylibre: new failure (last pass: next-20200117)

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200121)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4ek:
              lab-baylibre-seattle: new failure (last pass: next-20200121)

    socfpga_defconfig:
        gcc-8:
          socfpga_cyclone5_de0_sockit:
              lab-baylibre-seattle: new failure (last pass: next-20200121)

arm64:

    defconfig:
        gcc-8:
          bcm2837-rpi-3-b:
              lab-baylibre: new failure (last pass: next-20200121)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200121)

Boot Failures Detected:

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab

    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            bcm2837-rpi-3-b: 1 failed lab
            msm8998-mtp: 1 failed lab

arm:
    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            meson8b-odroidc1: 2 failed labs

    davinci_all_defconfig:
        gcc-8:
            da850-evm: 1 failed lab
            da850-lcdk: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            meson8b-odroidc1: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig:
        gcc-8
            juno-r2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            juno-r2: 1 offline lab

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

    socfpga_defconfig:
        gcc-8
            socfpga_cyclone5_de0_sockit: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4ek: 1 offline lab

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            at91-sama5d4ek: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            socfpga_cyclone5_de0_sockit: 1 offline lab
            sun5i-r8-chip: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

---
For more info write to <info@kernelci.org>
