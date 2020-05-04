Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1FC1C46F5
	for <lists+linux-next@lfdr.de>; Mon,  4 May 2020 21:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgEDTWE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 4 May 2020 15:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725956AbgEDTWE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 4 May 2020 15:22:04 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1341BC061A0E
        for <linux-next@vger.kernel.org>; Mon,  4 May 2020 12:22:04 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id x2so6026269pfx.7
        for <linux-next@vger.kernel.org>; Mon, 04 May 2020 12:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=Th5t5wDApmxpVXtujzdKvba79egW2BQ9cJexlXmx3WU=;
        b=dzOCeSirPU0VGiMqpTKWaQeazRo2RcOh/QQfstk9UeeT1eBjxg7oRgQvQqeIqHJVlt
         YJ8TTUvNr6dw3n2N5vatMWVPx2ISQI9P1T4wqeQjzfkwsTPqmFAnonDjd5xMCefBHB1i
         S4vU3TlsRYCWeh6gZduBnM6ag14EZwiD8nusQwhQO2qvUwY3ulFR16lVP2BRrBHwA3jU
         2jyTQHmF8ftbaQltnqP0yZugDxSU5DNLmZYe/4je76nHOtLy2xWtnEqbDBjWmYz14800
         iySGVYfleQh77qX2TFJ3NgavVEcjE/brNKuSlcpA/ejJA8m80cZMysAOM6EJA0g8Ju6F
         FemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=Th5t5wDApmxpVXtujzdKvba79egW2BQ9cJexlXmx3WU=;
        b=His/qlJoboY8oVNgAgvRJ4bgDlgxlFV9SlWl4UThIxThth7dK/1wIkOad5/sMhnoXb
         EkstVZE37quQsD1WuHjV8TG9ew4kN/+0V00ZORuYBmWPl6/NbZzYJnPf93k47yycNmfy
         bDypeXS0L5hlSdrVhJu2Pga476ueqxIG+jC97Aw+GnLvyPztQ6pPbLxX8MxwrYr7xBHh
         2N+g3G7HqTXwQ5eTluzdzp8dkl8Z1+yJG40UGkoY+BPbLKvR7DQ8eOfPp7zPgN+EBD4d
         ha/xTDYw9e9aPlynnvHMj9aMTijOUyGyi9ymNu9PKqqHNWXKRugS0GepfXR8FyyfZOdv
         nUfg==
X-Gm-Message-State: AGi0PuZ48Dvr2ooI0IrmP5uPt/TJeRIOSQH4q+fJQwz9952raFLjtLaG
        FCOigUKcF8b0sNUyjRl8lTDA5Eu+0uQ=
X-Google-Smtp-Source: APiQypIq59oBNCJHAE8GEiuvhXG50X3NkK6pE7jIC4QYY3emJstudFO9Q0l2HnDKRU1tTc2l2+TWkg==
X-Received: by 2002:a62:3181:: with SMTP id x123mr18485863pfx.109.1588620123205;
        Mon, 04 May 2020 12:22:03 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id s136sm9546236pfc.29.2020.05.04.12.22.02
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 12:22:02 -0700 (PDT)
Message-ID: <5eb06b5a.1c69fb81.4bfd2.4cb4@mx.google.com>
Date:   Mon, 04 May 2020 12:22:02 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200504
X-Kernelci-Report-Type: boot
Subject: next/master boot: 276 boots: 10 failed, 250 passed with 6 offline,
 8 untried/unknown, 2 conflicts (next-20200504)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 276 boots: 10 failed, 250 passed with 6 offline, 8 untrie=
d/unknown, 2 conflicts (next-20200504)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200504/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200504/

Tree: next
Branch: master
Git Describe: next-20200504
Git Commit: dfd71d381f7e1aa118e0368774aa05f5c4a48870
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 109 unique boards, 26 SoC families, 31 builds out of 231

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: next-20200501)

    multi_v7_defconfig:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: next-20200501)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: next-20200501)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200501)

arm64:

    defconfig:
        clang-10:
          sm8150-mtp:
              lab-bjorn: new failure (last pass: next-20200428)
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20200501)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200501)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20200501)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200501)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          bcm2711-rpi-4-b:
              lab-baylibre: new failure (last pass: next-20200501)

i386:

    i386_defconfig:
        gcc-8:
          qemu_i386:
              lab-collabora: new failure (last pass: next-20200501)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 38 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

arm64:
    defconfig:
        gcc-8:
            meson-gxbb-p200: 1 failed lab
            meson-gxl-s805x-p241: 1 failed lab
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-gxbb-p200: 1 failed lab

arm:
    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            omap3-beagle-xm: 1 failed lab

    allmodconfig:
        gcc-8:
            stm32mp157c-dk2: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

Offline Platforms:

riscv:

    defconfig:
        gcc-8
            sifive_fu540: 1 offline lab

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

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

i386:
    i386_defconfig:
        qemu_i386:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

x86_64:
    x86_64_defconfig+kselftest:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
