Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 063B8150096
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2020 03:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgBCCb6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 2 Feb 2020 21:31:58 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:52003 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbgBCCb5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 2 Feb 2020 21:31:57 -0500
Received: by mail-wm1-f43.google.com with SMTP id t23so14139986wmi.1
        for <linux-next@vger.kernel.org>; Sun, 02 Feb 2020 18:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=IZKCYvXO9wsi67HagyGDiG1nlIQyhIOqDg5CTN5vVfw=;
        b=PYchCcwg4fq6JuW1b5ck7KPgv91UVlvGtDpqptMW4aXR02WJQyb7NHwSLduRQG7wsD
         G5WChI0yv0/0I2eRTh0BfNg5gb4Plkb9otuDIWcK8j5EkDpkzcipwtuRMTbuEWvOzZl5
         EK9SklkGzN8HupGNxV+z8nOwTW3lWrW7zr5dME8xmuyKRuZvujwGJhdP4huZRn9UOH2R
         JS54wxKuIKA4kF8YuxF38p0PAZ2S+DdgjaaQ+zMNqYqVizuTMPM4cAiDZ0Y744pY3FZQ
         qEKj0W1NEAwn+ZbE5NPaj4ItmFIszpURGxoGV6dT68lxCQr1gL/0jiz7oNl4d3c39Csm
         bfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=IZKCYvXO9wsi67HagyGDiG1nlIQyhIOqDg5CTN5vVfw=;
        b=HvjMis0+7MuU/HIXDUrpglqrTMCiprzLABd+CNVZswryLwqEg2cFAwxsKmH9QQY9gx
         bgKo9xag/UcGcma0HRBxH6s4tzoMVb9PtgkrK2DT+PKzFHbSmuJ7IjPCpNAhfaVx3rYE
         aIFQOcGEOe8K6Gad5EO659n0nwB1VL/Cf5Gv6KsGKW/Sp1Lg3m3NnZ1EqfQfTKhz1Fin
         ECpsHVnwtAqm47HCMcehZdjK8XyQWmBmLsKViGNtmFNvcbn7gMGLv4p9VV3jTzu8il1h
         OF72UCPrhgQ1uN5GO6iZUM6PWsNikDaT9K62+O/yYZYO9EYwUhwzvdf9A9vgg7F8uPVm
         +BVg==
X-Gm-Message-State: APjAAAVNPfv/Y2EUzy1G+gOIpTahWa3k8nrpHzasZUFL194D3Xu62yCg
        KJcs5uFE0qxP1gf4Owy43S/L66maZFk=
X-Google-Smtp-Source: APXvYqyTg8yzTcFBsV1/9s3sqMYzkJzlb9+iO7jWr8Z3f6aw2l8H6cMFtMQH80WSG4AjgdSuzOMrXw==
X-Received: by 2002:a1c:6a15:: with SMTP id f21mr25153374wmc.126.1580697115531;
        Sun, 02 Feb 2020 18:31:55 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id e17sm10340392wrn.62.2020.02.02.18.31.54
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2020 18:31:54 -0800 (PST)
Message-ID: <5e37861a.1c69fb81.6d746.906c@mx.google.com>
Date:   Sun, 02 Feb 2020 18:31:54 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.5-8839-g56c8845edd39
X-Kernelci-Report-Type: boot
Subject: next/pending-fixes boot: 260 boots: 13 failed,
 242 passed with 3 offline, 2 untried/unknown (v5.5-8839-g56c8845edd39)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes boot: 260 boots: 13 failed, 242 passed with 3 offline, 2=
 untried/unknown (v5.5-8839-g56c8845edd39)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.5-8839-g56c8845edd39/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.5-8839-g56c8845edd39/

Tree: next
Branch: pending-fixes
Git Describe: v5.5-8839-g56c8845edd39
Git Commit: 56c8845edd39fbfad2a9c3ff22fa6fbe647d823e
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 97 unique boards, 25 SoC families, 28 builds out of 202

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos4412-odroidx2:
              lab-collabora: failing since 4 days (last pass: v5.5-rc7-273-=
g56dd35ec1a09 - first fail: v5.5-3974-gf60232fa162d)
          exynos5250-arndale:
              lab-baylibre-seattle: new failure (last pass: v5.5-7780-g4206=
17c9e573)
          exynos5800-peach-pi:
              lab-baylibre-seattle: new failure (last pass: v5.5-7780-g4206=
17c9e573)

    multi_v7_defconfig:
        gcc-8:
          mt7629-rfb:
              lab-baylibre-seattle: new failure (last pass: v5.5-5439-gb111=
1a46ce07)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          exynos4412-odroidx2:
              lab-collabora: failing since 4 days (last pass: v5.5-rc7-366-=
g2e30f8d48084 - first fail: v5.5-3974-gf60232fa162d)

    sunxi_defconfig:
        gcc-8:
          sun4i-a10-cubieboard:
              lab-baylibre-seattle: new failure (last pass: v5.5-7780-g4206=
17c9e573)

    tegra_defconfig:
        gcc-8:
          tegra30-beaver:
              lab-baylibre-seattle: new failure (last pass: v5.5-7780-g4206=
17c9e573)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.5-5439-gb1111a46ce0=
7)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 4 days (last pass: v5.5-rc7-366-g2e3=
0f8d48084 - first fail: v5.5-3974-gf60232fa162d)
          meson-gxl-s905x-libretech-cc:
              lab-clabbe: new failure (last pass: v5.5-5439-gb1111a46ce07)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.5-5439-gb1111a46ce07)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: v5.5-5439-gb1111a46ce07)

Boot Failures Detected:

arm:
    omap2plus_defconfig:
        gcc-8:
            omap3-beagle-xm: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    sunxi_defconfig:
        gcc-8:
            sun4i-a10-cubieboard: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab
            exynos5250-arndale: 1 failed lab
            exynos5422-odroidxu3: 1 failed lab
            exynos5800-peach-pi: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            msm8998-mtp: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxm-q200: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            mt7629-rfb: 1 offline lab
            tegra30-beaver: 1 offline lab

    tegra_defconfig:
        gcc-8
            tegra30-beaver: 1 offline lab

---
For more info write to <info@kernelci.org>
