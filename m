Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 432A6116129
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2019 09:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725878AbfLHIY1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 8 Dec 2019 03:24:27 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53811 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbfLHIY1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 8 Dec 2019 03:24:27 -0500
Received: by mail-wm1-f68.google.com with SMTP id n9so11676136wmd.3
        for <linux-next@vger.kernel.org>; Sun, 08 Dec 2019 00:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=lREpTwN+0pohbIRluqPiLzTHq4xUzpPKUExCvNhgWhs=;
        b=rAyZyuUo1DeQ4Abygn23AMlB9GdJnYrseGoMVyQ4jepr/W/kQkNNP+ZzgonbszCoFF
         /VyKOLxHeujhi3lTmqtaPR8FnQWSZ1SdCqgh29eMSvOzooBQok2LfxvOfHJpHHh7LvGY
         6POWPeBnZvrNvvVC6zpZwoew8jMCt5r5OZNbiurDHCCckjWXgu0Xa1mDqagr3H7k+VUk
         qQKFszF7QaK2/FIdesDULG1xXIClGRPFKiUn3F9OXdeexOnHiHRjR03htnBfVuh2mMtC
         wqBCGA5IPivmBnXNIPKP2Rm92fuyC+Qg4jqZelgEqRbLxGAIQuNo8iJvl6FuHW2JBaL5
         g28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=lREpTwN+0pohbIRluqPiLzTHq4xUzpPKUExCvNhgWhs=;
        b=A4OAx8TZmd+NfRRVXxBU+WXHZdpuH2Siu0jJqJnNIkGwEDdO5Vi4EWrN6+E6i6AinL
         6JClfrZ2yZYvHmWZlTZVF/mX2c9NDMg84h5fN1pJwSP5D9oLoSFRdhrViSEtAHTvfr77
         sVrERFr+GhJi0bKYlg2EcaKNmut95os00Zc6t1QfYBxbVEnDWEXGvyMIl/JGRWbf3NRR
         +QMJuGd0BWc7er+sZsyGi5VvNIbI4e8K5z/cDDevyo2mxz5OmuhrP5fFSeDAIYt4WuW2
         TuMDroJniHMcpSTV/O1AdgAUGKijkByMSSdF012u8CCdxf2E/d2BzA1JXE5OLt+Qc4Hs
         YBHg==
X-Gm-Message-State: APjAAAU8l507RW1uuAhDYHi7hTwwvIiybTNrf1YMZsnGN/HIG0USne8y
        o/N14Q3bYuq/K89nFpo0KDzsXq2ylWs=
X-Google-Smtp-Source: APXvYqzYrvbs/yGaF/UfuYp7wG19o8ZCgQZvXf/QbpSYxDyVQ5oUl2K4cHmL5yZmqO9Xni4qqSWsjA==
X-Received: by 2002:a7b:cd0d:: with SMTP id f13mr19206534wmj.66.1575793463733;
        Sun, 08 Dec 2019 00:24:23 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id o21sm8948594wmc.17.2019.12.08.00.24.22
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2019 00:24:22 -0800 (PST)
Message-ID: <5decb336.1c69fb81.5e033.53ac@mx.google.com>
Date:   Sun, 08 Dec 2019 00:24:22 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191208
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 241 boots: 47 failed, 178 passed with 6 offline,
 3 untried/unknown, 7 conflicts (next-20191208)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 241 boots: 47 failed, 178 passed with 6 offline, 3 untrie=
d/unknown, 7 conflicts (next-20191208)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191208/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191208/

Tree: next
Branch: master
Git Describe: next-20191208
Git Commit: c34be716fb373fad4ce1d2c4462b6267158070b1
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 94 unique boards, 26 SoC families, 30 builds out of 214

Boot Failures Detected:

arm:
    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            imx6q-sabrelite: 1 failed lab
            meson8b-odroidc1: 1 failed lab
            sun4i-a10-olinuxino-lime: 1 failed lab
            sun5i-a13-olinuxino-micro: 1 failed lab
            sun7i-a20-olinuxino-lime2: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            am335x-boneblack: 1 failed lab
            imx6q-sabrelite: 1 failed lab
            omap3-beagle-xm: 1 failed lab
            sun4i-a10-olinuxino-lime: 1 failed lab
            sun5i-a13-olinuxino-micro: 1 failed lab
            sun7i-a20-olinuxino-lime2: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

    bcm2835_defconfig:
        gcc-8:
            bcm2837-rpi-3-b: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun4i-a10-olinuxino-lime: 1 failed lab
            sun5i-a13-olinuxino-micro: 1 failed lab
            sun7i-a20-olinuxino-lime2: 1 failed lab
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h2-plus-orangepi-r1: 1 failed lab
            sun8i-h2-plus-orangepi-zero: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

arc:
    hsdk_defconfig:
        gcc-8:
            hsdk: 1 failed lab

riscv:
    defconfig:
        gcc-8:
            hifive-unleashed-a00: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxm-q200: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

    defconfig:
        gcc-8:
            imx8mn-ddr4-evk: 1 failed lab
            meson-g12a-sei510: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxm-q200: 1 failed lab
            r8a7795-salvator-x: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            imx8mn-ddr4-evk: 1 failed lab
            meson-g12a-sei510: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxm-q200: 1 failed lab
            r8a7795-salvator-x: 1 failed lab

Offline Platforms:

arm:

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            dm365evm,legacy: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun7i-a20-bananapi: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        omap4-panda:
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

    omap2plus_defconfig:
        omap4-panda:
            lab-baylibre: FAIL (gcc-8)
            lab-baylibre-seattle: PASS (gcc-8)
            lab-collabora: PASS (gcc-8)

    multi_v7_defconfig:
        meson8b-odroidc1:
            lab-baylibre: FAIL (gcc-8)
            lab-baylibre-seattle: PASS (gcc-8)
        omap4-panda:
            lab-baylibre: FAIL (gcc-8)
            lab-baylibre-seattle: PASS (gcc-8)
            lab-collabora: PASS (gcc-8)

i386:
    i386_defconfig:
        qemu_i386:
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

arm64:
    defconfig:
        r8a7796-m3ulcb:
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        r8a7796-m3ulcb:
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
