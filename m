Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AFE01E2FBC
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 22:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729086AbgEZUDp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 16:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728113AbgEZUDo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 16:03:44 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 585B3C03E96D
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 13:03:43 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id z15so289324pjb.0
        for <linux-next@vger.kernel.org>; Tue, 26 May 2020 13:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=rZzaS1uZZND5Tp3vTMjA5qLVqq6fThNXurEa9cLudLY=;
        b=mWBTAyb0/S4MQi+zrq3iGvCY48H1EAC6ziGymplNbbg1HptSqvGDspL+y6FAFT5uN+
         lkPhWgwe54HxwjMR09KFbnJCWXoaP17S4ZnqKIKqtzZ3I5Ch7DyCUVlCLRGNRMs0qNwr
         vUIBENhqtxpcovIcBOcZoniKhiYITC2jxEGXfZfKQHHWxV8AcpR/jyF3HO1AlXcDxqkf
         44PYsxSreoxyqWRI7THHGMQcPY+sxQ7n8mYCFSULCOIhEyosw8NgGV55JqgSFVKS4t0T
         N+vxuv2Ie1IBrkEmMHrB95sv8Nev+cmkudnL17qr51P+mHDJE7HpL5/X1OCZD49Wi4gq
         rfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=rZzaS1uZZND5Tp3vTMjA5qLVqq6fThNXurEa9cLudLY=;
        b=nS1z79IQP7WPcAbuhWx/JuhgUObqJrBRJWHLbdlhisjFsEs3eIXe6GhOQdg2ZOyk5e
         EVHRtMzsq9OnHwZLFZkWhdG2r7k7iSEMK7k73D94+k0JrnaWVOQ57aN65ZRgt8KyZHyG
         /UYEaTTXuPiq9YkXYjeQbFIKRam3rqVlpZ3w7ukuvoExZVEFIFSPF7RR6/HZN/NcfQPK
         ChdTVG5JzWP2eMpd99ba1ympC45B25cCHaiYpUcZppcl2YHHKImYZiXieCAesI9uxGP/
         d10xF1ozsrCCWbZINSxAB2FyCsRJdvtFxXifICSYAi5xSI02LANv74Nb976FIKZVxFBG
         /I7g==
X-Gm-Message-State: AOAM532Hvv074XYDeuHuDgCV9pNC22dIJOxW0w5U11oqBfEUcAG6IMPH
        PkXLGN/d2/ctGkoEGV+Y013XbtyHyCQ=
X-Google-Smtp-Source: ABdhPJw4ltBQnnvT1i9ve0bELOsW17hn0D48QeW3PRRoq5FaV8AHysb8B6+FRTe2kKQPyff4F4knzQ==
X-Received: by 2002:a17:902:a714:: with SMTP id w20mr2534472plq.336.1590523422114;
        Tue, 26 May 2020 13:03:42 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id b23sm388716pgs.33.2020.05.26.13.03.41
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 13:03:41 -0700 (PDT)
Message-ID: <5ecd761d.1c69fb81.f3b5f.14a3@mx.google.com>
Date:   Tue, 26 May 2020 13:03:41 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc7-144-g6edb22d07477
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 264 boots: 8 failed,
 244 passed with 5 offline, 7 untried/unknown (v5.7-rc7-144-g6edb22d07477)
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
https://kernelci.org/test/job/next/branch/pending-fixes/kernel/v5.7-rc7-144=
-g6edb22d07477/plan/baseline/

---------------------------------------------------------------------------=
----

next/pending-fixes boot: 264 boots: 8 failed, 244 passed with 5 offline, 7 =
untried/unknown (v5.7-rc7-144-g6edb22d07477)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc7-144-g6edb22d07477/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc7-144-g6edb22d07477/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc7-144-g6edb22d07477
Git Commit: 6edb22d074776a37273a470ad7aa041671a1b9f3
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 101 unique boards, 25 SoC families, 30 builds out of 217

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.7-rc6-275-gdbacbfd4=
7d67)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 102 days (last pass: v5.5-8839-g=
56c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: v5.7-rc6-175-gcf2c23313=
0ca)

    multi_v7_defconfig+CONFIG_SMP=3Dn:
        gcc-8:
          omap3-beagle-xm:
              lab-baylibre: new failure (last pass: v5.7-rc6-175-gcf2c23313=
0ca)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 21 days (last pass: v5.7-rc3-277-=
ga37f92ef57b2 - first fail: v5.7-rc4-211-g6d4315023bc9)

arm64:

    defconfig:
        gcc-8:
          sm8150-mtp:
              lab-bjorn: failing since 25 days (last pass: v5.7-rc3-194-g16=
31e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          sun50i-h6-orangepi-3:
              lab-clabbe: new failure (last pass: v5.7-rc6-387-ge8afbc5782a=
5)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 46 days (last pass: v5.6-=
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
            omap3-beagle-xm: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    allmodconfig:
        gcc-8:
            stm32mp157c-dk2: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            sm8150-mtp: 1 failed lab
            sm8250-mtp: 1 failed lab

Offline Platforms:

arm:

    multi_v7_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab
            imx6q-wandboard: 1 offline lab
            qcom-apq8064-cm-qs600: 1 offline lab
            stih410-b2120: 1 offline lab

    exynos_defconfig:
        gcc-8
            exynos5800-peach-pi: 1 offline lab

---
For more info write to <info@kernelci.org>
