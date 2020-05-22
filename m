Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A93B1DE254
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 10:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729161AbgEVIkh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 May 2020 04:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729115AbgEVIkg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 May 2020 04:40:36 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FDB5C061A0E
        for <linux-next@vger.kernel.org>; Fri, 22 May 2020 01:40:35 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y18so4902174pfl.9
        for <linux-next@vger.kernel.org>; Fri, 22 May 2020 01:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=xLA8Ib3vHCYxFstkbUsDHrPwgRFl94w5LmosJwDWgIo=;
        b=vlqMeMrlA/3MYpNJh34LkQBuhs/lAqFZN7wCty+nlxe4W/EHvYNAL7hg1sxK65wprf
         deiTeUOmQ6f8/j2RkQM/BY8xAzzkvRA6b+QENzXTw8mHtLf281ZX/t2b3qp5LWLo5etH
         YGwr5k7CfGSj4Vphf9Dh0gn/GdEE8zlG5ElH0b68jYDGtSRbk5s2HdhGTKHhHyDYIrG1
         UsTcYir0ERYNpE62R2lUgQXeg3ATS173gsD+Ny6Diy225jZ4rGyyuL5xj2ZVQSIGyeS+
         3+rLdIDQ89J72EF19JZQlX6FUjvrRMRp1ew+ZcnS201WkHR/ErfTV9J921AaSee0etnZ
         86BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=xLA8Ib3vHCYxFstkbUsDHrPwgRFl94w5LmosJwDWgIo=;
        b=VttIFAEhxrOITCC9lv5KQeF+sL5zsInEq3MQM4NXw+ASZzgI0nS3GEMYIDI7KCbWcu
         wOcyHRQWRnnYFm4ROT0HQknow0HPflBNYhi4tHV7eBjb/znU4+WUYMiuUeIcS33iT/EW
         SPi3U014VjS8O1Qye30cKt4wMtHQexcJlpYGIPcdIUgqM05sq5LZi3s8O4HeDENqeNgm
         Pt9d/UdAAUpt+sHWWZIahn4oF/K059JkyOxkwR8wzMWwuOJU3bPNOHtr3KadlOJK22d4
         R4c+EkhcPbsrXMh3XIQ68VL/cESnynNiNhTXe4vvRlY69fLL1YOhLbsD+LgoOrRUPj75
         pFzA==
X-Gm-Message-State: AOAM531qg9l46+vYdYHNWWm5oTw+6nyh4S5qHaLOPu7XWOITUEKAl6Gi
        yVklar6YxSYto3matmJ+R/OdSIPNcFg=
X-Google-Smtp-Source: ABdhPJzI9kqSi49TwPd1YO6GR5ORUTiVCWv/Jn7uhpO6UJAX4f8ofp/IZURmH8VIdnNPhs1YY3PCLQ==
X-Received: by 2002:a65:51c7:: with SMTP id i7mr12803384pgq.382.1590136834415;
        Fri, 22 May 2020 01:40:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id l6sm6243331pfl.128.2020.05.22.01.40.33
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 01:40:33 -0700 (PDT)
Message-ID: <5ec79001.1c69fb81.cb5da.eef3@mx.google.com>
Date:   Fri, 22 May 2020 01:40:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc6-275-gdbacbfd47d67
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 239 boots: 7 failed,
 225 passed with 4 offline, 3 untried/unknown (v5.7-rc6-275-gdbacbfd47d67)
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
https://kernelci.org/test/job/next/branch/pending-fixes/kernel/v5.7-rc6-275=
-gdbacbfd47d67/plan/baseline/

---------------------------------------------------------------------------=
----

next/pending-fixes boot: 239 boots: 7 failed, 225 passed with 4 offline, 3 =
untried/unknown (v5.7-rc6-275-gdbacbfd47d67)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc6-275-gdbacbfd47d67/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc6-275-gdbacbfd47d67/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc6-275-gdbacbfd47d67
Git Commit: dbacbfd47d67736d5ebd724391a8d0d82f36d30f
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 100 unique boards, 24 SoC families, 30 builds out of 217

Boot Regressions Detected:

arm:

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 97 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 16 days (last pass: v5.7-rc3-277-=
ga37f92ef57b2 - first fail: v5.7-rc4-211-g6d4315023bc9)

arm64:

    defconfig:
        gcc-8:
          sm8150-mtp:
              lab-bjorn: failing since 21 days (last pass: v5.7-rc3-194-g16=
31e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          meson-sm1-khadas-vim3l:
              lab-baylibre: new failure (last pass: v5.7-rc6-239-gc0a2bce73=
a89)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 41 days (last pass: v5.6-=
12182-g8614d419a4d6 - first fail: v5.6-12503-g3a0f8793ae13)

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

    allmodconfig:
        gcc-8:
            stm32mp157c-dk2: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            sm8150-mtp: 1 failed lab
            sm8250-mtp: 1 failed lab

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

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
