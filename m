Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF3A184E86
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 19:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgCMSVl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 14:21:41 -0400
Received: from mail-pj1-f44.google.com ([209.85.216.44]:40500 "EHLO
        mail-pj1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgCMSVl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2020 14:21:41 -0400
Received: by mail-pj1-f44.google.com with SMTP id bo3so3340442pjb.5
        for <linux-next@vger.kernel.org>; Fri, 13 Mar 2020 11:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=98NbQfx8OKFH/ZQj9DKRepfRXkcigXPXCbKHdF/wztI=;
        b=G4s2GhsQKqqAmepCbxXfcZCgenta46sBlYMQpQdF/BMNXs6+km/nHvre2K7KM1TveK
         SAd8dKTUtOJI2slSEW5hClG/AQjqug43djW5uF5B54/EejHhW7R66hPDiCZuGn+r3Kjc
         5F1y0pbSXflagFg6L9RPj84UPq7Va3eogzTekvVBClljsJV+3jxWWJVCeZgA/FRXCzVu
         CfBp7xleVXfSL792TpgSXlP0gfqqXZ7RuiZAprb7OPVI+fSS2feNtqpOXBKNQQWcEC0p
         zyqkyJesv9j+C/oxLTBJ6fAfDCBIurISS91PyMiyQZLElWmfzLF/3VJZqEugAKXiLdAL
         CSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=98NbQfx8OKFH/ZQj9DKRepfRXkcigXPXCbKHdF/wztI=;
        b=gNmunUE4/KqJhDFO8VV1mE2JPhA+b5h+w+9ErGFQ8ZfY0TihSEPmaAeKRSuLFojxPl
         DVO4eRY3wDh5AIhjTv/eXQojBFcnmqL3DDksR3Lca3UOd4R6rA1cCLfr+r4UcVUzqV66
         SRlTQ6/UPZ7onc5mN1IHS0xy+D3zhZTIYXtt2W+rmDxe1OPIgTAnO6TgkktyfI404AzR
         hypBxS3kRPMc5QqBFM9bmlKT8YVsQY7rkbEz1Yla16KdRDOM0y28tvB3zs0M0wlT3p1k
         2Mj2FAUzIvOsxabsxgTUrKTnXPSEeBd3SkxtRuhGXBySiY3ajUBg0QNGo1mlLhVg39Jv
         vMaA==
X-Gm-Message-State: ANhLgQ259PI1VENuxLjfA1K11ArNrxnzdwsplnprqoFWLRwHeDp9OLm7
        YrDEnKxFlPP/2CspLX1qYgvij2uYl1c=
X-Google-Smtp-Source: ADFU+vvgwo4GiGWFFXlPnYsGA5vkVR1cb4h7fI3V5wAlsLsipfp5RYdLnvCuVDsx0PUiFicQzotjpA==
X-Received: by 2002:a17:902:e981:: with SMTP id f1mr7502568plb.103.1584123700141;
        Fri, 13 Mar 2020 11:21:40 -0700 (PDT)
Received: from [10.0.9.4] ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id f19sm49541898pgf.33.2020.03.13.11.21.38
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 11:21:39 -0700 (PDT)
Message-ID: <5e6bcf33.1c69fb81.e805f.d718@mx.google.com>
Date:   Fri, 13 Mar 2020 11:21:39 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200313
X-Kernelci-Report-Type: boot
Subject: next/master boot: 202 boots: 5 failed, 188 passed with 7 offline,
 2 untried/unknown (next-20200313)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 202 boots: 5 failed, 188 passed with 7 offline, 2 untried=
/unknown (next-20200313)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200313/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200313/

Tree: next
Branch: master
Git Describe: next-20200313
Git Commit: 2e602db729948ce577bf07e2b113f2aa806b62c7
Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 100 unique boards, 23 SoC families, 27 builds out of 329

Boot Regressions Detected:

arm:

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          rk3288-veyron-jaq:
              lab-collabora: new failure (last pass: next-20200312)
          tegra124-nyan-big:
              lab-collabora: new failure (last pass: next-20200312)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 24 days (last pass: next-20200214=
 - first fail: next-20200217)

    tegra_defconfig:
        gcc-8:
          tegra124-nyan-big:
              lab-collabora: new failure (last pass: next-20200312)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200312)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200306)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: next-20200306)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200306)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200306)

Boot Failures Detected:

arm:
    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            rk3288-veyron-jaq: 1 failed lab
            tegra124-nyan-big: 1 failed lab

    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    tegra_defconfig:
        gcc-8:
            tegra124-nyan-big: 1 failed lab

arm64:
    defconfig:
        clang-9:
            apq8096-db820c: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

    qcom_defconfig:
        gcc-8
            qcom-apq8064-cm-qs600: 1 offline lab

arm64:

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

---
For more info write to <info@kernelci.org>
