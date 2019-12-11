Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D537911A51F
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2019 08:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbfLKHcW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Dec 2019 02:32:22 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41423 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbfLKHcV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Dec 2019 02:32:21 -0500
Received: by mail-wr1-f66.google.com with SMTP id c9so22842445wrw.8
        for <linux-next@vger.kernel.org>; Tue, 10 Dec 2019 23:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=ozy1D33gRPq/u9JPlhzTlcwn86mnAU0Fst40J8zwjGY=;
        b=ei9Njcdz8fKe9ehWUeWnxHBmuCgkLegK+G6S0F9THL7M3f+Aq1byUUypLWVqtEcvwZ
         EPjG/QlHXEdE9IhCdFEZPp6d5gIxTIG8SYrueK+cz1aZoGIbAxQyU6+z0j6T0rMSCyTh
         sXVTsZRWuKYmX4c9wqcha/xodx01oN/BBefkZ0ehPGxg4CCUpAzJUpqrUpPasAYJ3HtC
         8WksyiPfDcdtBKE/Pqjt0ozycC//DI4TKv4vQWNrgF7oramGHA4+G3uLOhwe8YXMhfsY
         wy4lhnbba3HDzMc1VHjECM2eR0X7zyrmhqPFYjZ9sppPCbiVIrz1olRoRsJ1E1tev+de
         /2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=ozy1D33gRPq/u9JPlhzTlcwn86mnAU0Fst40J8zwjGY=;
        b=p8WaxQyjp8UxbGyL7bvw4jXJkm8iuwUDs1dWSmxU7kI5G0SBI3KoERBPDYXx1gDvSV
         SfE3XsucdbL82gewDe+2IHv5A6D4OBHUkN3eS4nU/rxSFk1UJ9NhI5UrmHo3yHciuUDj
         p203DGh/myAiPTjazGfYTBUTp6asyPsrEbORhdhD+aEgwLzEt/FbBfTObz6Ay10ttgBv
         LGEFSnxNZVXhTTuW1xCzXAEtG0HTiQQamPPzYK9GQ84LexW4LsRon8hYeeZAz2lax0i5
         c73sK7n22+HzNl4mECTnKD0nZJl2Xe8NlBn0x/3Si52oDoIg/7VDiyE84DpMW9NPv0VD
         Isdg==
X-Gm-Message-State: APjAAAUre9ReXH3KjNYqS0eLawQSJH1Nmf/Lmp7MlXBAYbtmF9bhzqxp
        Bz4koUwHSKqqGV4va6+UChNy9azBsi0=
X-Google-Smtp-Source: APXvYqxn1WSZBoag+QdXAMpulRHM6465BS4doOxvQJFGHHdNlMoCL6Yxlmf8mNmhTwQ7gfnjyWgoxA==
X-Received: by 2002:a5d:42c5:: with SMTP id t5mr2097973wrr.73.1576049538577;
        Tue, 10 Dec 2019 23:32:18 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id n188sm1288474wme.14.2019.12.10.23.32.17
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 23:32:17 -0800 (PST)
Message-ID: <5df09b81.1c69fb81.7eddd.5313@mx.google.com>
Date:   Tue, 10 Dec 2019 23:32:17 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191211
X-Kernelci-Tree: next
X-Kernelci-Branch: master
Subject: next/master boot: 293 boots: 88 failed, 188 passed with 8 offline,
 6 untried/unknown, 3 conflicts (next-20191211)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 293 boots: 88 failed, 188 passed with 8 offline, 6 untrie=
d/unknown, 3 conflicts (next-20191211)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191211/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191211/

Tree: next
Branch: master
Git Describe: next-20191211
Git Commit: 938f49c85b36076b19251b316eeaa5435c50ff6e
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 99 unique boards, 26 SoC families, 30 builds out of 214

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191209 - first fail: next-20191210)
          dm365evm,legacy:
              lab-baylibre-seattle: failing since 1 day (last pass: next-20=
191209 - first fail: next-20191210)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: new failure (last pass: next-20191209)
          apq8096-db820c:
              lab-bjorn: failing since 1 day (last pass: next-20191208 - fi=
rst fail: next-20191209)

Boot Failures Detected:

arm:
    davinci_all_defconfig:
        gcc-8:
            da850-evm: 1 failed lab
            da850-lcdk: 1 failed lab

    omap2plus_defconfig:
        gcc-8:
            omap3-beagle: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab
            tegra124-jetson-tk1: 2 failed labs

    exynos_defconfig:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab
            exynos5250-arndale: 1 failed lab
            exynos5250-snow: 1 failed lab
            exynos5422-odroidxu3: 2 failed labs
            exynos5800-peach-pi: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            imx6q-sabrelite: 2 failed labs
            tegra124-jetson-tk1: 2 failed labs

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs

    sunxi_defconfig:
        gcc-8:
            sun8i-h2-plus-libretech-all-h3-cc: 1 failed lab
            sun8i-h3-libretech-all-h3-cc: 1 failed lab

arm64:
    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-axg-s400: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 3 failed labs
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            meson-gxm-q200: 2 failed labs
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab

    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            apq8096-db820c: 1 failed lab
            meson-g12a-sei510: 1 failed lab
            meson-g12a-u200: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-g12b-s922x-khadas-vim3: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 3 failed labs
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            meson-gxm-nexbox-a1: 1 failed lab
            meson-gxm-q200: 2 failed labs
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 2 failed labs
            msm8998-mtp: 1 failed lab
            rk3399-gru-kevin: 1 failed lab
            sun50i-h6-pine-h64: 2 failed labs

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-axg-s400: 1 failed lab
            meson-g12a-sei510: 1 failed lab
            meson-g12a-u200: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-g12b-s922x-khadas-vim3: 1 failed lab
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-libretech-ac: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905d-p230: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 3 failed labs
            meson-gxl-s905x-nexbox-a95x: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab
            meson-gxm-nexbox-a1: 1 failed lab
            meson-gxm-q200: 2 failed labs
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 2 failed labs
            r8a7795-salvator-x: 1 failed lab
            rk3399-gru-kevin: 1 failed lab

Offline Platforms:

arm:

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

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

arm64:

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm:
    multi_v7_defconfig+CONFIG_SMP=3Dn:
        qemu_arm-virt-gicv3:
            lab-baylibre: PASS (gcc-8)
            lab-clabbe: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)
        imx6q-sabrelite:
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

x86_64:
    x86_64_defconfig:
        qemu_x86_64:
            lab-baylibre: FAIL (gcc-8)
            lab-clabbe: PASS (gcc-8)
            lab-collabora: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
