Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 456F5100846
	for <lists+linux-next@lfdr.de>; Mon, 18 Nov 2019 16:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbfKRPaG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 10:30:06 -0500
Received: from mail-wm1-f50.google.com ([209.85.128.50]:55800 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfKRPaG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Nov 2019 10:30:06 -0500
Received: by mail-wm1-f50.google.com with SMTP id b11so17853797wmb.5
        for <linux-next@vger.kernel.org>; Mon, 18 Nov 2019 07:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=sHKAEPe+H0671o8HfYRmeWwPLftzFHPLYmyYT0/Nt90=;
        b=bKtphTjX+jnldseqawdXfBlc38s/aq/njNEKJ0qo+yU7hGcUMeWPJRGMD4jd/flgPm
         qvNyEInce+zFt3Zetp07f2uOqOO+qfZdwHcPfRUdg+HBmuzwtxHO172iGBYaDg8VG95y
         oB3PPbI6VFVeUnks7XHE/fEnPl0Onri6JEJ19emY7EnuMFZicLJGDhKPa9lTDKOycw4G
         vhRLUrWghjdLjZC5I/9+Wv3HPJCVscZBUkYDb8KykpC9CI1SRI2H96gcAqvvKbwHIqir
         /vbn4Yabr7SBDX/4DcnVQWC/sPyI36U3R66MbNj9BcbRPEK/uGlDRVH3o+4K1P6cmRMT
         MOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=sHKAEPe+H0671o8HfYRmeWwPLftzFHPLYmyYT0/Nt90=;
        b=Cs2pN73lCmI4LWM/OLG03di+kQluVk3E/coYNNlXjhG8MLq5x51cac9WMMcVIoGZUh
         LZDWPYEKDgr74JmJnD5KSg49e+J9/1J/pmcHUvtXSENZMenVA9olWHdXZdSztXNQO2cI
         kwQd2r+4gA+dyyMd68vHpaMZyvYplgNmwu80EvME3yaxxabCCDy0wwapwswOsf7xss2S
         yPsGaZIdSGKb5nvtmwdLCx2AUv8SizCrWHBKrbuqLLNOaAv1aa2/SlxBOIZK3a3LXUI7
         6kmBgcBduCGTFlG5dlhDmXx25WRuc69PjeoOi/XGTwFAG3l/yqsbkbndEb2CCZAcwFJ8
         lMsQ==
X-Gm-Message-State: APjAAAWIZWO01GpeB/tMd/ZTw1/WqnbdWImdDqKvHwOSdv965hEEhyrJ
        0vqbQsHbQ+WFiBId95pb7aRyI9IPZLYs8g==
X-Google-Smtp-Source: APXvYqxM87DDzAx+1tLA2QMvm8FivFBJy8zrFd7XVw+9gn4A4ur5nYzZ8J/hUcQyfbwFbGv9X6BHGw==
X-Received: by 2002:a7b:c10c:: with SMTP id w12mr31366379wmi.114.1574091003720;
        Mon, 18 Nov 2019 07:30:03 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id g133sm20572124wme.42.2019.11.18.07.30.02
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2019 07:30:02 -0800 (PST)
Message-ID: <5dd2b8fa.1c69fb81.b324d.1bd9@mx.google.com>
Date:   Mon, 18 Nov 2019 07:30:02 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191118
Subject: next/master boot: 181 boots: 8 failed,
 141 passed with 32 offline (next-20191118)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 181 boots: 8 failed, 141 passed with 32 offline (next-201=
91118)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191118/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191118/

Tree: next
Branch: master
Git Describe: next-20191118
Git Commit: 519ead8f6a3215406afc6e56c596388a690f2edc
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 79 unique boards, 22 SoC families, 22 builds out of 217

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5250-arndale:
              lab-baylibre-seattle: new failure (last pass: next-20191115)
          exynos5420-arndale-octa:
              lab-baylibre-seattle: new failure (last pass: next-20191115)
          exynos5800-peach-pi:
              lab-baylibre-seattle: new failure (last pass: next-20191115)

    socfpga_defconfig:
        gcc-8:
          socfpga_cyclone5_de0_sockit:
              lab-baylibre-seattle: new failure (last pass: next-20191115)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            msm8998-mtp: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            exynos5250-arndale: 1 failed lab
            exynos5420-arndale-octa: 1 failed lab
            vf610-colibri-eval-v3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5250-arndale: 1 failed lab
            exynos5420-arndale-octa: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            vf610-colibri-eval-v3: 1 failed lab

Offline Platforms:

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab
            meson-g12b-s922x-khadas-vim3: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab
            meson-g12b-s922x-khadas-vim3: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            juno-r2: 1 offline lab
            meson-axg-s400: 1 offline lab
            meson-gxl-s905x-libretech-cc: 1 offline lab
            meson-sm1-khadas-vim3l: 1 offline lab

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

arm:

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4ek: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            bcm4708-smartrg-sr400ac: 1 offline lab
            exynos5800-peach-pi: 1 offline lab
            mt7623n-bananapi-bpi-r2: 1 offline lab
            mt7629-rfb: 1 offline lab
            socfpga_cyclone5_de0_sockit: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    socfpga_defconfig:
        gcc-8
            socfpga_cyclone5_de0_sockit: 1 offline lab

---
For more info write to <info@kernelci.org>
