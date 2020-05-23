Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791FC1DF58A
	for <lists+linux-next@lfdr.de>; Sat, 23 May 2020 09:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387672AbgEWHYH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 23 May 2020 03:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387622AbgEWHYH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 23 May 2020 03:24:07 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360A3C061A0E
        for <linux-next@vger.kernel.org>; Sat, 23 May 2020 00:24:07 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id f21so3061746pgg.12
        for <linux-next@vger.kernel.org>; Sat, 23 May 2020 00:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=7HSkJmw9pORdSYrpKFGaVaLHrw7lQkWODEPHF7RFuuc=;
        b=vOdljKn0qfBZmF0J2332q2CjMVXvJFbsoDri41j5qzTb6PLSTzV8lAEPtJk46zFsZ3
         SkAZsa0twQvxSoN6qQsThtv6sIpFPefZTGnj0HfY8ymS8UmKQBAmOpvmPsfp5OoemUYV
         26XDwHS24KfavSMAZwC2wFjJJgavoKFpUD1h76lie3b2wSY7hzoh+hsNqFJGT1XF2nxK
         gWpLLtHzZroTpUnsNKXwjM+XBvXLtMIBofwoW9GxjRM7jPhqFo2s7YxQRde06C5IeMjJ
         cCAod9hbR0JK/B0Ew3b75Ejth62g1SnGMtuRxSTcSeXlsTTDL/ZJEoP/3Xy3iwckqBGv
         IGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=7HSkJmw9pORdSYrpKFGaVaLHrw7lQkWODEPHF7RFuuc=;
        b=D5CKTb7yYgZmEeP3MT+/+oUthR8SSSPPuvIdXEw17lIiJnLQgUjyah9fOa9Q/UiExT
         cilNWCa/9XLTRGPRaCAalgAsm28w+dMCCfho4E8ZR6suF7b4Quec0GB4SkrA9gazD2kT
         Qfkwq/HcjltFTee5pete7np1tPRHYXcaBHRRC1yMMeWYho2qWuckdTXVlBe292f2Y82U
         NBgCO5RyWrH7tEqGZGwYEW5In5e5IKReurD7BSit3MC6VHHOGQPCsatYsmtgp3yE/MZK
         kYdPIqJ6CoQkhJv3bd2FdHcT2VgWLK5HYj8of0bjqBOGQZjbihoDr1hBcBhvW58PtIu2
         CO6g==
X-Gm-Message-State: AOAM532zRlnnn6VhRXJbsedt3tGJmEF+nK5/iY+UITs9HaxQ+gf2//Bf
        dG6vwaG5CGIKekzdVvDWtHlYcsxhyLM=
X-Google-Smtp-Source: ABdhPJy5I1R0eGAA49jpkI5SkaSHbb+5X6fDOiC8dzqfla9VRGKulOjv8nmU1q7YPgC4EfK3SfN7UA==
X-Received: by 2002:a63:381:: with SMTP id 123mr16988976pgd.240.1590218646429;
        Sat, 23 May 2020 00:24:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id a2sm8452207pfl.12.2020.05.23.00.24.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 00:24:05 -0700 (PDT)
Message-ID: <5ec8cf95.1c69fb81.fa25d.7e77@mx.google.com>
Date:   Sat, 23 May 2020 00:24:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200522
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 244 boots: 19 failed, 216 passed with 6 offline,
 3 untried/unknown (next-20200522)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

******************************************
* WARNING: Boot tests are now deprecated *
******************************************

As kernelci.org is expanding its functional testing capabilities, the conce=
pt
of boot testing is now deprecated.  Boot results are scheduled to be droppe=
d on
*5th June 2020*.  The full schedule for boot tests deprecation is available=
 on
this GitHub issue: https://github.com/kernelci/kernelci-backend/issues/238

The new equivalent is the *baseline* test suite which also runs sanity chec=
ks
using dmesg and bootrr: https://github.com/kernelci/bootrr

See the *baseline results for this kernel revision* on this page:
https://kernelci.org/test/job/next/branch/master/kernel/next-20200522/plan/=
baseline/

---------------------------------------------------------------------------=
----

next/master boot: 244 boots: 19 failed, 216 passed with 6 offline, 3 untrie=
d/unknown (next-20200522)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200522/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200522/

Tree: next
Branch: master
Git Describe: next-20200522
Git Commit: c11d28ab4a691736e30b49813fb801847bd44e83
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 102 unique boards, 25 SoC families, 29 builds out of 228

Boot Regressions Detected:

arm:

    davinci_all_defconfig:
        gcc-8:
          da850-evm:
              lab-baylibre-seattle: new failure (last pass: next-20200521)
          dm365evm,legacy:
              lab-baylibre-seattle: new failure (last pass: next-20200521)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 95 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        clang-9:
          sm8150-mtp:
              lab-bjorn: failing since 4 days (last pass: next-20200511 - f=
irst fail: next-20200518)
        gcc-8:
          meson-g12a-u200:
              lab-baylibre: failing since 1 day (last pass: next-20200519 -=
 first fail: next-20200521)
          meson-g12a-x96-max:
              lab-baylibre: failing since 1 day (last pass: next-20200519 -=
 first fail: next-20200521)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: failing since 1 day (last pass: next-20200519 -=
 first fail: next-20200521)
          meson-sm1-khadas-vim3l:
              lab-baylibre: failing since 1 day (last pass: next-20200515 -=
 first fail: next-20200521)
          meson-sm1-sei610:
              lab-baylibre: failing since 1 day (last pass: next-20200519 -=
 first fail: next-20200521)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-sm1-khadas-vim3l:
              lab-baylibre: failing since 1 day (last pass: next-20200515 -=
 first fail: next-20200521)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: next-20200521)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-g12a-u200:
              lab-baylibre: failing since 1 day (last pass: next-20200519 -=
 first fail: next-20200521)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: failing since 1 day (last pass: next-20200519 -=
 first fail: next-20200521)
          meson-sm1-khadas-vim3l:
              lab-baylibre: failing since 1 day (last pass: next-20200515 -=
 first fail: next-20200521)
          meson-sm1-sei610:
              lab-baylibre: failing since 1 day (last pass: next-20200519 -=
 first fail: next-20200521)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 56 days (last pass: next-=
20200326 - first fail: next-20200327)

Boot Failures Detected:

riscv:
    defconfig:
        gcc-8:
            sifive_fu540: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

arm64:
    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
            meson-g12a-u200: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            mt7622-rfb1: 1 failed lab

    defconfig:
        gcc-8:
            meson-g12a-u200: 1 failed lab
            meson-g12a-x96-max: 1 failed lab
            meson-g12b-a311d-khadas-vim3: 1 failed lab
            meson-g12b-odroid-n2: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab
            meson-sm1-sei610: 1 failed lab
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-sm1-khadas-vim3l: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    davinci_all_defconfig:
        gcc-8
            da850-evm: 1 offline lab
            dm365evm,legacy: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
