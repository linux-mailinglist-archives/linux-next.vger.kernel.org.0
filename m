Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E64A1BE376
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 18:10:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgD2QKh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Apr 2020 12:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726476AbgD2QKg (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Apr 2020 12:10:36 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F63C03C1AD
        for <linux-next@vger.kernel.org>; Wed, 29 Apr 2020 09:10:36 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id hi11so956722pjb.3
        for <linux-next@vger.kernel.org>; Wed, 29 Apr 2020 09:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=1m6LUhFFP6pHN6EPqUHiV5qPNFjPMSIQIEKOd9Hx8q8=;
        b=rZTGY4JuAPtBa6soM6LVsg7KI+9f8JGH6lS1KjlZDje0RusBPJgASzSArzdmV04nrZ
         47uXUbckrDDEvmmuM2stm7gXcJ8CqFCFXWhfAzHVb08B751J4ipq7+0XjJVQITea1Vha
         xZrdV+qjt/8JHajGpObOf8HkHBVCdCUoSdsntYgiWrG/+HuHwKDSFDCF0jZ9EaG2daDG
         KFH/yBMQMGAKd4ej6rSBrkz9qFAxAh7w0e8HzPdTgCm1i7I/0KKLKQP+yMbKOS8j0pKg
         jSKOWZM5C7796mJ2jogxo2MQ8kikE3rs/HSdwsnoAMMH8uGmJoXw88cbD7KIWejFfM/i
         vHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=1m6LUhFFP6pHN6EPqUHiV5qPNFjPMSIQIEKOd9Hx8q8=;
        b=noT1s9bYcLwGNC2rERwsx6WaIQpMuLhzQffdcvUfPHW0Pr1FGQreL6quSsLsKqqZlv
         RuM8B3uNJmC3HZHdrDP3ellN3NeC8XJkKYw7f+GYrP6H8++9lSXQ02+806QSSF8R1U9o
         Z4y8rWWoYvjlEJJSt/LvhRSFD5/jojYUEAPuvwuHQ1gDDK934LCsPSJRoPihC+swj17z
         T9pBwSq3UEX0mXepT/tlKHYuZLHtPkTevrthtFxpgL+TZbsQ/UiRpH+fAJWrxmHNP6KZ
         zDW8rJRkaBV0j3GZHdvgxG3zkSL6Hne2luAcVWOrsqY+N3RMFo/nbgSxqhIQZEw7Usti
         FY2g==
X-Gm-Message-State: AGi0PuaKuZLmpsIVwZkKuszDY/ToDHu+luNaXlMydzNavSBU6tLFmyht
        CxOkS5E9mD0NuKNfCKD1SQifNHkapic=
X-Google-Smtp-Source: APiQypKc6LVzbYF2GvLBRrifWNEeQJr5eJO7PKk/SG5GE1BvTJLKqFm7+gS61vLglgr55riux+DWRQ==
X-Received: by 2002:a17:902:56c:: with SMTP id 99mr34173335plf.124.1588176635985;
        Wed, 29 Apr 2020 09:10:35 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id r31sm1326198pgl.86.2020.04.29.09.10.34
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:10:35 -0700 (PDT)
Message-ID: <5ea9a6fb.1c69fb81.b3c54.395a@mx.google.com>
Date:   Wed, 29 Apr 2020 09:10:35 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: master
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200429
X-Kernelci-Report-Type: boot
Subject: next/master boot: 289 boots: 8 failed, 264 passed with 7 offline,
 7 untried/unknown, 3 conflicts (next-20200429)
To:     linux-next@vger.kernel.org
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master boot: 289 boots: 8 failed, 264 passed with 7 offline, 7 untried=
/unknown, 3 conflicts (next-20200429)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200429/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200429/

Tree: next
Branch: master
Git Describe: next-20200429
Git Commit: 861978d1331b7e988e0295a2275c669c767fa3f1
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 109 unique boards, 24 SoC families, 31 builds out of 231

Boot Regressions Detected:

arc:

    hsdk_defconfig:
        gcc-8:
          hsdk:
              lab-baylibre: new failure (last pass: next-20200428)

arm:

    multi_v7_defconfig:
        gcc-8:
          sun8i-h2-plus-orangepi-r1:
              lab-baylibre: new failure (last pass: next-20200428)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          am335x-boneblack:
              lab-baylibre: new failure (last pass: next-20200428)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 71 days (last pass: next-20200214=
 - first fail: next-20200217)

arm64:

    defconfig:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200428)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200428)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200428)
          meson-sm1-khadas-vim3l:
              lab-baylibre: new failure (last pass: next-20200428)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-axg-s400:
              lab-baylibre-seattle: new failure (last pass: next-20200428)
          meson-g12a-sei510:
              lab-baylibre: new failure (last pass: next-20200428)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: new failure (last pass: next-20200428)
          sun50i-a64-pine64-plus:
              lab-baylibre: new failure (last pass: next-20200428)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 33 days (last pass: next-=
20200326 - first fail: next-20200327)

x86_64:

    x86_64_defconfig+kselftest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: next-20200428)

    x86_64_defconfig+kvm_guest:
        gcc-8:
          qemu_x86_64:
              lab-collabora: new failure (last pass: next-20200428)

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
            meson-g12a-sei510: 1 failed lab
            mt7622-rfb1: 1 failed lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
            meson-sm1-khadas-vim3l: 1 failed lab

arm:
    sama5_defconfig:
        gcc-8:
            at91-sama5d4_xplained: 1 failed lab

    multi_v7_defconfig:
        gcc-8:
            bcm2836-rpi-2-b: 1 failed lab

Offline Platforms:

arm64:

    defconfig:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8
            meson-axg-s400: 1 offline lab

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

Conflicting Boot Failures Detected: (These likely are not failures as other=
 labs are reporting PASS. Needs review.)

i386:
    i386_defconfig+kselftest:
        qemu_i386:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

x86_64:
    x86_64_defconfig+kselftest:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

    x86_64_defconfig+kvm_guest:
        qemu_x86_64:
            lab-baylibre: PASS (gcc-8)
            lab-collabora: FAIL (gcc-8)

---
For more info write to <info@kernelci.org>
