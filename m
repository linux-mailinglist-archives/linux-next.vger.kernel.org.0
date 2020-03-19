Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBA1218B4AF
	for <lists+linux-next@lfdr.de>; Thu, 19 Mar 2020 14:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728795AbgCSNLx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Mar 2020 09:11:53 -0400
Received: from mail-pf1-f177.google.com ([209.85.210.177]:44070 "EHLO
        mail-pf1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728792AbgCSNLv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Mar 2020 09:11:51 -0400
Received: by mail-pf1-f177.google.com with SMTP id b72so1394440pfb.11
        for <linux-next@vger.kernel.org>; Thu, 19 Mar 2020 06:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=SsoGtViQCGpo9X69B1ousRVafbBvhQ3OEiByuYXN3fA=;
        b=WmJxh6UCy9LgAQ7xkwHKotSRgs8uTYtmph6eAvmtKSY3AYX1o66JuhyZXojwkok1nn
         Ao7Zb01xJUknQrwln52GKzDO45lcx40sz+S1kgkTvKOgEsDrRHDRfseeGL5xOtUUgYIs
         Ocor+da8c+ChISeHby/figBMN2pAbC5nbfmlj7agaFAa2IrtfZ3xbxueTe1NqVW8NZAc
         kR6usNTlDRsgJVHlRdp2JLyrKI+z/aHq1GIossXxnfqEiqaunZiZVIyKrubqxYXJeUhy
         2G3Ma9QH/KLGEW0QAeF7aWzWFalC6zgnSXUoobjNf7rW05piG7K4nVdtTP70lAyMWvdg
         kU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=SsoGtViQCGpo9X69B1ousRVafbBvhQ3OEiByuYXN3fA=;
        b=UXCWlVXtWvrLEfd40s5nppWrYFI+plWvwZZw6PKIg3v8/pwTlNaNvYjMzZNVyXILto
         b3e0BvbG1F7rPFSOrC5uxMfzGGhU/DY1GJistb1TjrSrDUt3TGxYtEdKEHxB7MSXbwAv
         we7GJ353263ZgfIrHDRh9p/4TqIA2Q4zn++zdpCtQ8VCes1ECcm5EZJGpqTMqxgXmtO3
         NYGnwlGhFwnTgaJD9O9y4iaiLCiRBYtsFrLOkTu32qhiuCLjB1D3UCVfhuyJHcGYmpKJ
         hXB2xxl16WYR+e+lDPlzDaBomDOI5zyJ/inBoxydh+07tJK3ylunoB6IXM37P7THElqL
         H25w==
X-Gm-Message-State: ANhLgQ12X2eeuc/Xjg4enKvxmgs3794eFRLNxaxoWALGqGUGezy1+wc9
        xy9rGN5aoMBCsEOlmb1uEXKYZ8jQSCc=
X-Google-Smtp-Source: ADFU+vuHzU0u4M9K6dkKdH8bXv9p5nQHNMaHbdSgv5yFbRJNlpnKrCClKpHl74w7+ozP7OLJFnMtlw==
X-Received: by 2002:a63:2e03:: with SMTP id u3mr3237559pgu.205.1584623509653;
        Thu, 19 Mar 2020 06:11:49 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j25sm2488755pfh.22.2020.03.19.06.11.48
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 06:11:48 -0700 (PDT)
Message-ID: <5e736f94.1c69fb81.2bb2d.8cd7@mx.google.com>
Date:   Thu, 19 Mar 2020 06:11:48 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200319
X-Kernelci-Report-Type: boot
Subject: next/master boot: 278 boots: 16 failed, 253 passed with 3 offline,
 6 untried/unknown (next-20200319)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 278 boots: 16 failed, 253 passed with 3 offline, 6 untrie=
d/unknown (next-20200319)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200319/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200319/

Tree: next
Branch: master
Git Describe: next-20200319
Git Commit: aff7e57f8266549245eb4a272ce149b752dfce77
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 105 unique boards, 23 SoC families, 31 builds out of 329

Boot Regressions Detected:

arm:

    imx_v4_v5_defconfig:
        gcc-8:
          imx27-phytec-phycard-s-rdk:
              lab-pengutronix: failing since 3 days (last pass: next-201910=
11 - first fail: next-20200316)

    imx_v6_v7_defconfig:
        gcc-8:
          imx6ul-pico-hobbit:
              lab-pengutronix: failing since 3 days (last pass: next-201910=
11 - first fail: next-20200316)

    multi_v5_defconfig:
        gcc-8:
          imx27-phytec-phycard-s-rdk:
              lab-pengutronix: failing since 3 days (last pass: next-201910=
11 - first fail: next-20200316)

    multi_v7_defconfig:
        gcc-8:
          imx6ul-pico-hobbit:
              lab-pengutronix: failing since 3 days (last pass: next-201910=
11 - first fail: next-20200316)
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: failing since 1 day (last pass: next-20200316 -=
 first fail: next-20200317)
          tegra124-nyan-big:
              lab-collabora: failing since 3 days (last pass: next-20200226=
 - first fail: next-20200316)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          rk3288-veyron-jaq:
              lab-collabora: failing since 5 days (last pass: next-20200312=
 - first fail: next-20200313)
          tegra124-nyan-big:
              lab-collabora: failing since 5 days (last pass: next-20200312=
 - first fail: next-20200313)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          imx6ul-pico-hobbit:
              lab-pengutronix: failing since 3 days (last pass: next-201910=
11 - first fail: next-20200316)
          tegra124-nyan-big:
              lab-collabora: failing since 3 days (last pass: next-20200226=
 - first fail: next-20200316)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 30 days (last pass: next-20200214=
 - first fail: next-20200217)

    tegra_defconfig:
        gcc-8:
          tegra124-nyan-big:
              lab-collabora: failing since 5 days (last pass: next-20200312=
 - first fail: next-20200313)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200318)

arm64:

    defconfig:
        gcc-8:
          apq8096-db820c:
              lab-bjorn: failing since 12 days (last pass: next-20200304 - =
first fail: next-20200306)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxl-s905x-libretech-cc:
              lab-clabbe: new failure (last pass: next-20200317)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200317)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab
            tegra124-nyan-big: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    imx_v4_v5_defconfig:
        gcc-8:
            imx27-phytec-phycard-s-rdk: 1 failed lab

    multi_v5_defconfig:
        gcc-8:
            imx27-phytec-phycard-s-rdk: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            imx6ul-pico-hobbit: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab
            tegra124-nyan-big: 1 failed lab

    tegra_defconfig:
        gcc-8:
            tegra124-nyan-big: 1 failed lab

    imx_v6_v7_defconfig:
        gcc-8:
            imx6ul-pico-hobbit: 1 failed lab
            vf610-colibri-eval-v3: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            imx6ul-pico-hobbit: 1 failed lab
            rk3288-veyron-jaq: 1 failed lab
            tegra124-nyan-big: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8096-db820c: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
