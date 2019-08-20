Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACC90962B9
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2019 16:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729838AbfHTOo1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 10:44:27 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41855 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729810AbfHTOo1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Aug 2019 10:44:27 -0400
Received: by mail-wr1-f68.google.com with SMTP id j16so12679871wrr.8
        for <linux-next@vger.kernel.org>; Tue, 20 Aug 2019 07:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=CowLYxCpbX8gSeH3jDXPW/sqgGaalBPP/cq4LST/gAw=;
        b=mQCPf4tpZ8qd5zZeWrWcXSLxPZtgN+xTORLWSCvIxnLq94WH+rmXzE9xufrH+CFsdy
         K3GPln16hOUFwv6Hqkc8LIq9XrgVHBQm1ez0H6jEui14K+1ISQNdJN+WRmh2fND8BjdY
         QreBVnIH5bw4MDRbSO1ruu6cx6E4uSC6quW4DoCgEB4eJJknYgrpRdgMaGvnw57Wg8ty
         VwevVx+JF0hOO5b5O8L5P4HSSX0OIz8CBCSf6Lm2eEft2gnwTU/1io07IVaBkPB/wdx8
         mKBiq1OmLjnaZuYFezV5fqhtUUCY3nOVh0cZboDf7elJu+EdUYwYJ34Ys9R4h12lqqem
         2rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=CowLYxCpbX8gSeH3jDXPW/sqgGaalBPP/cq4LST/gAw=;
        b=bQZIJj8VqD7VXVqQOu3ikkUz35yEDDfYpPnNHUZEyuo4kK5Il6yWW9etn/diDblmzd
         sSnvM5tw7jaqp23BPIomrVEMedxhBN4JWsRgsH03bWjI7MEIhhSDxoXzNtzhIWJIaQX0
         Ygh8aOR9+aNR/DS5p0UdCHDYQTgIAUTavDTEAMjEkcngRtz/rgVtURMLQnwqsDvlogdh
         OOvNdypY6+DxFg6jqij/lHmBzW4CRCW03OijJqes4R5Jz+zbk4DcP/dHsIvaBhwKpbju
         fBbU7TuUIZI+KM++Ih6u1GboWT7jq8H6gzIPB/L9d+Y7667BcRZESWlHuziC2/nYecXC
         lmdg==
X-Gm-Message-State: APjAAAUCnXdLzE5Qv9XwoJjWKJsRTZ37j5lxLo7B+2YR4ghkr4kdbYbg
        9tMbY8/Al1KtmZH371Ax7EI3i+Oy6lU/VA==
X-Google-Smtp-Source: APXvYqyVAWo/0+3O9eu1Wdz4bVctE/eSVenuTWhy71aW0XpoQMyo/x/VNBPXcBZ7FPVZ78K0JnZ5xA==
X-Received: by 2002:adf:a54d:: with SMTP id j13mr26735802wrb.261.1566312265338;
        Tue, 20 Aug 2019 07:44:25 -0700 (PDT)
Received: from [148.251.42.114] ([2a01:4f8:201:9271::2])
        by smtp.gmail.com with ESMTPSA id z7sm16041875wrh.67.2019.08.20.07.44.24
        for <linux-next@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2019 07:44:24 -0700 (PDT)
Message-ID: <5d5c0748.1c69fb81.f73cf.b4fd@mx.google.com>
Date:   Tue, 20 Aug 2019 07:44:24 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Kernel: next-20190820
X-Kernelci-Tree: next
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 276 boots: 12 failed, 239 passed with 24 offline,
 1 untried/unknown (next-20190820)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 276 boots: 12 failed, 239 passed with 24 offline, 1 untri=
ed/unknown (next-20190820)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20190820/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20190820/

Tree: next
Branch: master
Git Describe: next-20190820
Git Commit: 54c851a8cc739ce7f1aaea583940054cdfe2223f
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 87 unique boards, 28 SoC families, 22 builds out of 222

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            rk3399-firefly: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        clang-8:
            meson-gxl-s805x-p241: 1 failed lab
            meson-gxl-s905x-khadas-vim: 1 failed lab
            meson-gxl-s905x-libretech-cc: 1 failed lab
            meson-gxm-khadas-vim2: 1 failed lab

arm:
    omap2plus_defconfig:
        gcc-8:
            am57xx-beagle-x15: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            am57xx-beagle-x15: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            exynos4412-odroidx2: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            am57xx-beagle-x15: 1 failed lab

    oxnas_v6_defconfig:
        gcc-8:
            ox820-cloudengines-pogoplug-series-3: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab
            mt7622-rfb1: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            apq8016-sbc: 1 offline lab
            juno-r2: 1 offline lab
            meson-gxbb-odroidc2: 1 offline lab

arm:

    bcm2835_defconfig:
        gcc-8
            bcm2835-rpi-b: 1 offline lab

    sama5_defconfig:
        gcc-8
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab

    multi_v7_defconfig:
        gcc-8
            alpine-db: 1 offline lab
            at91-sama5d4_xplained: 1 offline lab
            at91-sama5d4ek: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab
            sun5i-r8-chip: 1 offline lab
            sun7i-a20-bananapi: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab
            qcom-apq8064-ifc6410: 1 offline lab

    sunxi_defconfig:
        gcc-8
            sun5i-r8-chip: 1 offline lab

---
For more info write to <info@kernelci.org>
