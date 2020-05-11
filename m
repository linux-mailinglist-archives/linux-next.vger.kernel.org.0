Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22F0F1CE5AE
	for <lists+linux-next@lfdr.de>; Mon, 11 May 2020 22:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729842AbgEKUg7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 May 2020 16:36:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729801AbgEKUg6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 May 2020 16:36:58 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAB02C061A0C
        for <linux-next@vger.kernel.org>; Mon, 11 May 2020 13:36:58 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d184so5275124pfd.4
        for <linux-next@vger.kernel.org>; Mon, 11 May 2020 13:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=MF+WJ6DfbRumLiydy3F4fjQ1+kZTp2GDwmahNUldPQg=;
        b=JrxnTrNrmuzDuR8ALTdIOrU8US7fPOfL97rTNebPBcrSXk5SiEkUN3jSnDyP6kL4uC
         Z5ffLKTZ95god3R8FUShYJRXuccqNqiJCljbf60nkABhdKBkOU5BlFW4e01z7WI0pqAl
         v9HG4+GkmpmKV5MW9jDJdmUooereu3ZWY4usCSY+Ps6auClNlKFKOHbUuKRfNrM+zNKG
         NBLiOm1js/9fHSaKeogXZGGZZyywNbg2VNnAKqC/79dQQ8yGx7PAzpgRm27Wynz6Cm77
         BLSuJsQzbvGOvAwgHhJEupniUBSo9AzF39GgPn2iuq0qBZ2kHQGA0pOmBZl8Gjul7/HQ
         yN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=MF+WJ6DfbRumLiydy3F4fjQ1+kZTp2GDwmahNUldPQg=;
        b=HJ1bpNf8liXfTD9vwya8896bXIcSLk+QMpkmbp/SAt8RfD/w3y6y5eSSyYaHUasnQp
         C8Y+HbbmTooEsqp5T4vT1maSboOMwDBV42glXLSXdLEJP58SSlggDdTOSxwbz7QhSJfw
         j4nTSU32itc2z7LuzyK3EBnT3Tupkmn5AdVHK6wbmFuU/iOsOvdWgqLeaSonQThOSYd/
         gHABICleaxTBaAic759JsFUETu/tS8OqPSsYQvBC3hQRq4YU+gYPfcXQzFOWsHxqDK+P
         TtXBFQj9yOBFHNdWeA8c5e3A9bkYSOREfpc5AA5whaxS0TsL1/eWRrmm5GVBjW+dSZEz
         8Ikg==
X-Gm-Message-State: AGi0PuZPbX5ppX4B/D/M6rALKumvaJp3i1gsGxpq+CP+k5qjnSSfWSVr
        OyjUdVkT7yhevMEXhUyzjLp62+jN19o=
X-Google-Smtp-Source: APiQypLLqzjNJ0SW9hfrcrcUWf04Fjmm0JvWOPw0AwWkzyrIEnLSwAbbZTB8xUhipVOWDUcXT1ArFg==
X-Received: by 2002:a62:be0c:: with SMTP id l12mr17555115pff.95.1589229417827;
        Mon, 11 May 2020 13:36:57 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f6sm10016077pfn.189.2020.05.11.13.36.56
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 13:36:57 -0700 (PDT)
Message-ID: <5eb9b769.1c69fb81.cd8a3.470e@mx.google.com>
Date:   Mon, 11 May 2020 13:36:57 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200511
X-Kernelci-Report-Type: boot
Subject: next/master boot: 249 boots: 13 failed, 225 passed with 5 offline,
 6 untried/unknown (next-20200511)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 249 boots: 13 failed, 225 passed with 5 offline, 6 untrie=
d/unknown (next-20200511)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200511/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200511/

Tree: next
Branch: master
Git Describe: next-20200511
Git Commit: 4b20e7462caa697f8a2cdab04ed8a5881cc65427
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 104 unique boards, 24 SoC families, 29 builds out of 228

Boot Regressions Detected:

arm:

    imx_v6_v7_defconfig:
        gcc-8:
          imx6dl-wandboard_dual:
              lab-baylibre-seattle: new failure (last pass: next-20200508)
          imx6dl-wandboard_solo:
              lab-baylibre-seattle: new failure (last pass: next-20200508)

    multi_v7_defconfig:
        gcc-8:
          tegra124-jetson-tk1:
              lab-collabora: failing since 4 days (last pass: next-20200505=
 - first fail: next-20200507)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          tegra124-jetson-tk1:
              lab-collabora: failing since 4 days (last pass: next-20200505=
 - first fail: next-20200507)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          tegra124-jetson-tk1:
              lab-collabora: failing since 4 days (last pass: next-20200505=
 - first fail: next-20200507)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 83 days (last pass: next-20200214=
 - first fail: next-20200217)

    tegra_defconfig:
        gcc-8:
          tegra124-jetson-tk1:
              lab-collabora: failing since 4 days (last pass: next-20200505=
 - first fail: next-20200507)
          tegra30-beaver:
              lab-baylibre-seattle: failing since 4 days (last pass: next-2=
0200505 - first fail: next-20200507)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200508)

arm64:

    defconfig:
        clang-9:
          apq8016-sbc:
              lab-bjorn: failing since 4 days (last pass: next-20200505 - f=
irst fail: next-20200507)
        gcc-8:
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200508)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s805x-libretech-ac:
              lab-baylibre: new failure (last pass: next-20200508)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200508)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 45 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            mt7622-rfb1: 1 failed lab
            sun50i-a64-pine64-plus: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxl-s805x-libretech-ac: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab
            tegra30-beaver: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab
            tegra30-beaver: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            tegra124-jetson-tk1: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
