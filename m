Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02E81E1FD2
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 12:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbgEZKhI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 06:37:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726944AbgEZKhH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 06:37:07 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37DDDC03E97E
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 03:37:07 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id x11so7540791plv.9
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 03:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=4Qk8Pvs6X/DwfmGDJ8iEDXp43StnhRAxjhbfiwTnpXE=;
        b=A4jBE5GwfzAXFgAxwiDVqFOmhQhszscnouniC17dBwkNCwIveHocO4CQJNWra+ecRY
         xikS7tccy4jAvqfKXyCLqmaQJS2skffXqzR7eZ/J6f2NNRgkOq9/ZI43AcYp2F6ZhgPj
         bdQ6EIpbWlvh0TzplYYmaI5dN7ZXOKxg979urGjtnvOBXSwVbFWNBzB+i3J3WHli7kvD
         DPrd3I53w/daA8tiaP8v6+MD+6Pq3GjPBL98kDOi4TUl5tKT1IJ5F5qmCt52rdCmo9VV
         IPpODGcFLFqhEC/KD4D7KzMbNJdRMYBqHS7KouDAR8sNZ8iUWnRwY3S0OTMS5PQvbNbL
         e/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=4Qk8Pvs6X/DwfmGDJ8iEDXp43StnhRAxjhbfiwTnpXE=;
        b=uD1cCxjPfveeVIRZdcG7jXrhVUalUpzK/6u3nMVBwaUuiYy883ZRhxibWSJAowaHZ9
         GXPsk/wez2ym2NDlIvKwM6zNtEvzcTyAeU1O8mYUbr1WyzCpXFy2dnmHtorBtlnVOjVN
         cyL6farC5PJOWU8KHpblzxy15z/5GLhy5r+Zi16P23tUCOV4gDDKqOX7QLHjiy+xWM2v
         oQBgFmoWdh+Ulfpm5Czq7kRh0QTXl/U7XAFkAh5YJZmG/SgtfrEfB0CUnBX2ceTW9xaD
         vNx6AQ53GdsNhXb9o31LcQGdfAwrRpHKoN2MSK/Fr+tUCPCHzdZpym3NgcICcOUMf+Ow
         xVtQ==
X-Gm-Message-State: AOAM533sqpbxBPVj4OxoLTA+6OltxRlQCHVJPps0WmhCB71eRc12nJT1
        VlrNxWH+MqxsBBuzKuH7yJuj4aaaz4U=
X-Google-Smtp-Source: ABdhPJxvJyTOswr2LB9FXmP58WUueegW446NIsMIQve+Xng7ldT9stINsbCLsgSpWxm7K285vPVB8Q==
X-Received: by 2002:a17:90a:aa88:: with SMTP id l8mr16217225pjq.43.1590489426212;
        Tue, 26 May 2020 03:37:06 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id o201sm16358793pfd.115.2020.05.26.03.37.05
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 03:37:05 -0700 (PDT)
Message-ID: <5eccf151.1c69fb81.989f7.35c4@mx.google.com>
Date:   Tue, 26 May 2020 03:37:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20200525
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: master
Subject: next/master boot: 272 boots: 21 failed, 239 passed with 4 offline,
 7 untried/unknown, 1 conflict (next-20200525)
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
https://kernelci.org/test/job/next/branch/master/kernel/next-20200525/plan/=
baseline/

---------------------------------------------------------------------------=
----

next/master boot: 272 boots: 21 failed, 239 passed with 4 offline, 7 untrie=
d/unknown, 1 conflict (next-20200525)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/master/ker=
nel/next-20200525/
Full Build Summary: https://kernelci.org/build/next/branch/master/kernel/ne=
xt-20200525/

Tree: next
Branch: master
Git Describe: next-20200525
Git Commit: 7b4cb0a48db03a67d1ce21c4f97b1508a241a2e7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 105 unique boards, 24 SoC families, 29 builds out of 228

Boot Regressions Detected:

arm:

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 98 days (last pass: next-20200214=
 - first fail: next-20200217)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: next-20200519)

arm64:

    defconfig:
        clang-9:
          sm8150-mtp:
              lab-bjorn: failing since 7 days (last pass: next-20200511 - f=
irst fail: next-20200518)
        gcc-8:
          meson-g12a-u200:
              lab-baylibre: failing since 3 days (last pass: next-20200519 =
- first fail: next-20200521)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: failing since 3 days (last pass: next-20200519 =
- first fail: next-20200521)
          meson-sm1-khadas-vim3l:
              lab-baylibre: failing since 3 days (last pass: next-20200515 =
- first fail: next-20200521)
          meson-sm1-sei610:
              lab-baylibre: failing since 3 days (last pass: next-20200519 =
- first fail: next-20200521)
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: next-20200522)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: next-20200522)
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: next-20200522)
          meson-sm1-khadas-vim3l:
              lab-baylibre: failing since 3 days (last pass: next-20200515 =
- first fail: next-20200521)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-g12a-u200:
              lab-baylibre: failing since 3 days (last pass: next-20200519 =
- first fail: next-20200521)
          meson-g12b-a311d-khadas-vim3:
              lab-baylibre: failing since 3 days (last pass: next-20200519 =
- first fail: next-20200521)
          meson-gxl-s805x-p241:
              lab-baylibre: new failure (last pass: next-20200515)
          meson-sm1-khadas-vim3l:
              lab-baylibre: failing since 3 days (last pass: next-20200515 =
- first fail: next-20200521)
          meson-sm1-sei610:
              lab-baylibre: failing since 3 days (last pass: next-20200519 =
- first fail: next-20200521)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 59 days (last pass: next-=
20200326 - first fail: next-20200327)

x86_64:

    x86_64_defconfig:
        gcc-8:
          qemu_x86_64:
              lab-baylibre: new failure (last pass: next-20200521)

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
            meson-gxbb-p200: 1 failed lab
            meson-gxm-q200: 1 failed lab
            meson-sm1-khadas-vim3l: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

Conflicting Boot Failure Detected: (These likely are not failures as other =
labs are reporting PASS. Needs review.)

x86_64:
    x86_64_defconfig:
        qemu_x86_64:
            lab-baylibre: FAIL (gcc-8)
            lab-collabora: PASS (gcc-8)

---
For more info write to <info@kernelci.org>
