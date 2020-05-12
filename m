Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 301071CFFD4
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 22:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbgELUvN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 16:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725938AbgELUvM (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 16:51:12 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB098C061A0C
        for <linux-next@vger.kernel.org>; Tue, 12 May 2020 13:51:12 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 18so6957026pfv.8
        for <linux-next@vger.kernel.org>; Tue, 12 May 2020 13:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=+kGQ0QEK+rNidtzUYtR2mGqOPB9LrRoMVcoToEu5hBA=;
        b=uYmaw/CDQH26IiET1tbZeLUl/rs3B50HBgGNVYPhF+no+mvEwolKKjNkP4V7YRqz4u
         /JNkUaVm1vWT7Z9UW9bFUW/WjDs7S79t1u8R7NH4USKCAFTUmlq8oGr60o6t8vtKmUq2
         X9fgCIFuISt3pqY+Xe6mKcRowsvfPORphEjFM4a7tfkX2OxgTrZdrGrmgxtMhQU6NrG3
         IaNklB03pXCTuAhpiDI1SIgN8Vyg9kk6r9fv5lJcmF8qgkYB3w03JsIXNDPTOc4OzMLI
         5lDwJheaGQwgPCu9+JZwOr+hXGmHC6Osto8XkOq1AtxWFZsg0iABlNV/Fj8QWRxvR9p6
         34+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=+kGQ0QEK+rNidtzUYtR2mGqOPB9LrRoMVcoToEu5hBA=;
        b=IdxiJb3JQnG+vkL4PKu3KrFziu1/AMl+9Zr9FP2+PHsXHigeDrNWTgoxu0KZ9bYik9
         iRQJN2pJAMgXMioeEoaFsavaIfjCz34xFShrIjcf2sWOGVX1BPafFqbBYM3NtdCXdskm
         iNiQywPsyaopwyHiCAqe6n5xh57bKV3DaF4YAdUSmG1dDbYdoxWefp1hzEAPM9Hx8fu3
         xEc9R8oTCmTFTUy7woH39i/2ZqCP30eOdO9a+nETcYsAS5Zl4OImVklxvezSngDmlByv
         kUwl3FAZ7jsuRyrk2eytpLch9KSPWTSzpmzFJhL68/S1W+5SKzrknswgtoOfq6Qww4ZQ
         XO7w==
X-Gm-Message-State: AOAM53384MDBxRdvtAbyHAA4SXFXIu3n7Eyn3B3elh8U8YgdJTGOJrb6
        3l/rxSoNuf7FXI81adjXC4+Wz0cOnVU=
X-Google-Smtp-Source: ABdhPJyOleEhirRQ6qZNcI32rgt0O/AdJ4b/mmBYpb1vUnDF6yHm8tR55/oujd3Ly+D2qIusMKzIIw==
X-Received: by 2002:a65:6854:: with SMTP id q20mr7782389pgt.448.1589316671998;
        Tue, 12 May 2020 13:51:11 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id x19sm13332914pjq.54.2020.05.12.13.51.09
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 13:51:10 -0700 (PDT)
Message-ID: <5ebb0c3e.1c69fb81.31107.0727@mx.google.com>
Date:   Tue, 12 May 2020 13:51:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200512
X-Kernelci-Report-Type: boot
Subject: next/master boot: 281 boots: 23 failed, 243 passed with 5 offline,
 7 untried/unknown, 3 conflicts (next-20200512)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 281 boots: 23 failed, 243 passed with 5 offline, 7 untrie=
d/unknown, 3 conflicts (next-20200512)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200512/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200512/

Tree: next
Branch: master
Git Describe: next-20200512
Git Commit: e098d7762d602be640c53565ceca342f81e55ad2
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 111 unique boards, 25 SoC families, 30 builds out of 228

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          sun8i-r40-bananapi-m2-ultra:
              lab-clabbe: new failure (last pass: next-20191004)
          tegra124-jetson-tk1:
              lab-collabora: failing since 5 days (last pass: next-20200505=
 - first fail: next-20200507)
          tegra124-nyan-big:
              lab-collabora: failing since 5 days (last pass: next-20200505=
 - first fail: next-20200507)

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
          tegra124-jetson-tk1:
              lab-collabora: failing since 5 days (last pass: next-20200505=
 - first fail: next-20200507)
          tegra124-nyan-big:
              lab-collabora: failing since 5 days (last pass: next-20200505=
 - first fail: next-20200507)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          tegra124-jetson-tk1:
              lab-collabora: failing since 5 days (last pass: next-20200505=
 - first fail: next-20200507)
          tegra124-nyan-big:
              lab-collabora: failing since 5 days (last pass: next-20200505=
 - first fail: next-20200507)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 84 days (last pass: next-20200214=
 - first fail: next-20200217)

    sunxi_defconfig:
        gcc-8:
          sun7i-a20-cubietruck:
              lab-baylibre: new failure (last pass: next-20200511)

    tegra_defconfig:
        gcc-8:
          tegra124-jetson-tk1:
              lab-collabora: failing since 5 days (last pass: next-20200505=
 - first fail: next-20200507)
          tegra124-nyan-big:
              lab-collabora: failing since 5 days (last pass: next-20200505=
 - first fail: next-20200507)
          tegra30-beaver:
              lab-baylibre-seattle: failing since 5 days (last pass: next-2=
0200505 - first fail: next-20200507)

arm64:

    defconfig:
        gcc-8:
          apq8016-sbc:
              lab-bjorn: new failure (last pass: next-20200501)
          hip07-d05:
              lab-collabora: new failure (last pass: next-20200507)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200511)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 46 days (last pass: next-=
20200326 - first fail: next-20200327)

x86_64:

    x86_64_defconfig+kvm_guest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: next-20200511)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            apq8016-sbc: 1 failed lab
            mt7622-rfb1: 1 failed lab
            sm8150-mtp: 1 failed lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            mt7622-rfb1: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab
            sun8i-r40-bananapi-m2-ultra: 1 failed lab
            tegra124-jetson-tk1: 2 failed labs
            tegra124-nyan-big: 1 failed lab
            tegra30-beaver: 1 failed lab

    multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs
            tegra124-nyan-big: 1 failed lab

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs
            tegra124-nyan-big: 1 failed lab

    davinci_all_defconfig:
        gcc-8:
            da850-evm: 1 failed lab

    tegra_defconfig:
        gcc-8:
            tegra124-jetson-tk1: 2 failed labs
            tegra124-nyan-big: 1 failed lab
            tegra30-beaver: 1 failed lab

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

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

i386:
    i386_defconfig:
        qemu_i386:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

x86_64:
    x86_64_defconfig:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

    x86_64_defconfig+kvm_guest:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
