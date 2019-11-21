Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26712105498
	for <lists+linux-next@lfdr.de>; Thu, 21 Nov 2019 15:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbfKUOgw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 Nov 2019 09:36:52 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42752 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbfKUOgv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 Nov 2019 09:36:51 -0500
Received: by mail-wr1-f67.google.com with SMTP id a15so4671243wrf.9
        for <linux-next@vger.kernel.org>; Thu, 21 Nov 2019 06:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=2C25QeZXdlF3QZzORhSjq23oeJkyyfSAd4bIxqXGd8g=;
        b=oY5FVqrCWEX889nVplUmXYWV9e44eHMhmiKiShEV61JJepJ8iLoUW/9wU/m1XZK7c9
         E3sUvRXlEdqAqShH8USb8oGChY5w079oh/vUBMJoMA49Uc8zU7TTGpF2bF7naniveisY
         Keo0zMtlaZQCtbxGj5zNlYkC8QddrG3igIgNbBdnGUEM/G0ygcn3hdI2rYtMW621XsC3
         LWm1RWdZ/JmBjoFDdTE0VhF8cj1X1/g2I5rOTVSkmYwu99lxlfRJYOqfSesIu7RjRhQh
         kVlrgTMlTghvDF1F/ndm30OSLqUi6TUEZeVMiS+QWKSXq7PR2CX5kEP820P+PnhRSZo6
         OxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=2C25QeZXdlF3QZzORhSjq23oeJkyyfSAd4bIxqXGd8g=;
        b=PhFMTdS8/rt6PabQxiXYNSmZknb0dhIHfV4Q/JGbt8vNDQCALMVmJcrPGian2EVoap
         A3Bwks3tFpQXRmcOvJB6WJBHCz7GElBGCmjYLUDhh4rLBn8b/uvIvJIhX1lDeXAoDKJZ
         2kaCY1Y5EJKN9k9Z+A3Y4rFsTypmgCp6rLecfGEmaLLhGC+Ttf5Tuxx20O29HlibBjFo
         6JuWZx2LOfEo5tefHPltvBjzjqdtVX3futl7FWpjcsv4KiotksDAiX+IK3iFQOgrtOKm
         gBvLRCeUox3JNIA5M5DzEiXXMA04OyIRISylWKi7SAq1oXNO/i6Qhsf0WzbQ1fhAOPY2
         /sIA==
X-Gm-Message-State: APjAAAU/vgGF8qtPAm5TUP8I38665KZ1MnffeuP0KdSrLUiz9N0JpMTt
        g62IaUi80q9N0E6yQNtQnxGnwKQ835FMJg==
X-Google-Smtp-Source: APXvYqwTODe0Zl55cEKv17poP6XNE0uw7A1m/mjg1sEBBLY5h3OZke/lIIR6k6RyE54WtVh1YWEycw==
X-Received: by 2002:adf:979a:: with SMTP id s26mr11373649wrb.92.1574347009418;
        Thu, 21 Nov 2019 06:36:49 -0800 (PST)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id 19sm4167383wrc.47.2019.11.21.06.36.47
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 06:36:47 -0800 (PST)
Message-ID: <5dd6a0ff.1c69fb81.60a8e.4449@mx.google.com>
Date:   Thu, 21 Nov 2019 06:36:47 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Kernel: next-20191121
Subject: next/master boot: 272 boots: 9 failed, 255 passed with 5 offline,
 1 untried/unknown, 2 conflicts (next-20191121)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 272 boots: 9 failed, 255 passed with 5 offline, 1 untried=
/unknown, 2 conflicts (next-20191121)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20191121/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20191121/

Tree: next
Branch: master
Git Describe: next-20191121
Git Commit: 9942eae47585ee056b140bbfa306f6a1d6b8f383
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 101 unique boards, 27 SoC families, 27 builds out of 216

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5250-snow:
              lab-collabora: new failure (last pass: next-20191120)

    multi_v7_defconfig:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: next-20191120)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: next-20191120)
          rk3288-veyron-jaq:
              lab-collabora: new failure (last pass: next-20191120)

arm64:

    defconfig:
        gcc-8:
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: failing since 1 day (last pass: next-20191115 -=
 first fail: next-20191120)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20191120)
          sun50i-a64-bananapi-m64:
              lab-clabbe: new failure (last pass: next-20191120)
          sun50i-h6-orangepi-one-plus:
              lab-clabbe: new failure (last pass: next-20191120)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            sun50i-a64-bananapi-m64: 1 failed lab
            sun50i-h6-orangepi-one-plus: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            am335x-boneblack: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5250-snow: 1 failed lab

    qcom_defconfig:
        gcc-8:
            qcom-apq8064-cm-qs600: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            am335x-boneblack: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab

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

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

arm64:
    defconfig:
        meson-gxl-s905x-libretech-cc:
            lab-baylibre: PASS (gcc-8)
            lab-clabbe: FAIL (gcc-8)
            lab-baylibre-seattle: PASS (gcc-8)

arm:
    multi_v7_defconfig:
        imx6q-sabrelite:
            lab-collabora: FAIL (gcc-8)
            lab-baylibre: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
