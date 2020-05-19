Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4077F1D93CF
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 11:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgESJvf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 05:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgESJvf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2020 05:51:35 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE84C061A0C
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 02:51:35 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id p21so6140378pgm.13
        for <linux-next@vger.kernel.org>; Tue, 19 May 2020 02:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=niPYfRiTQWJuIPCo1cgihblZtUr1COyLQL+MHpe2Kh8=;
        b=lRldKxITHPKglHLPzENljzjU1QiD9/htSeeJhOFg4VzPctpmcnO6uaGVg7hx/QT+tf
         28QNLdMuOfD/UntfU8ORj5u+oXQCamJGAQEJAO+T60l1WGSHYBRFpm1TEQJAXCy4IP50
         5Zw1FM15/xFyWKEJsMnuRh0nT+R0lnRGuNMp8J16FKMpKfDcDscSr1B+j/mLVyrCBOFL
         0pY4AGcAHOMj7UOx78AvxvqY3Dqi7TTCslQjNWcDK36fM7oHX1CsKMboY6p1RYLSUTnA
         4Zl0PTBmhbcMU/YmsBZWCpO7/JGJDcxuwqqJi9qCsz5TjH/3elV4W4VwgljBd5wiuI3g
         1N2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=niPYfRiTQWJuIPCo1cgihblZtUr1COyLQL+MHpe2Kh8=;
        b=FngCx/wDnGAuRwp+j3u1h4qy00bkeyesETE67uKzPR4uKigMQGctxWMB0ZuB2RS4uC
         ok+8Z4WMLiq9nHP9ly7W/qkUyCgXI8jaCjh4avPxbbvA5byiGlBYUIbQbJ9V5Sl/o7AF
         89R2oW2W5fVBXxQOrEmCbAGZ5IHH430Ib87m1f07nw316RoyUr+w33c6RoRQOxGSP+LO
         FOLrw/TMLREqhmXW35DUW/YF2rAOUSJhsVJdTPP99GcZJeDpQYEEvV0IVYPr5Stdw9Nl
         Jy9V8YAOdcYoC/wANScyaZw8B0w1vzsV2sfOq0iyfWyMQyX+AgF9omTvC9/fwL/0OATV
         srLA==
X-Gm-Message-State: AOAM531M3L7P1YsP35ag8GPiasaZT7nTcPus/1xGFwtqTQh5hwlU02gX
        gt0PyZDmyje3hK2R2KxmDtNHakTc92A=
X-Google-Smtp-Source: ABdhPJxC83TMMf4WP+H1+YScX8OfG62Rwmoz9jxGrM/rofFcTWjWUwO7Jov7mROT+AB5QGIZupRPYw==
X-Received: by 2002:a63:f59:: with SMTP id 25mr18629529pgp.420.1589881894079;
        Tue, 19 May 2020 02:51:34 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y75sm11161411pfb.212.2020.05.19.02.51.33
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 02:51:33 -0700 (PDT)
Message-ID: <5ec3ac25.1c69fb81.0948.47c9@mx.google.com>
Date:   Tue, 19 May 2020 02:51:33 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Kernel: v5.7-rc6-175-gcf2c233130ca
X-Kernelci-Report-Type: boot
X-Kernelci-Branch: pending-fixes
Subject: next/pending-fixes boot: 278 boots: 9 failed,
 257 passed with 4 offline, 8 untried/unknown (v5.7-rc6-175-gcf2c233130ca)
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
https://kernelci.org/test/job/next/branch/pending-fixes/kernel/v5.7-rc6-175=
-gcf2c233130ca/plan/baseline/

---------------------------------------------------------------------------=
----

next/pending-fixes boot: 278 boots: 9 failed, 257 passed with 4 offline, 8 =
untried/unknown (v5.7-rc6-175-gcf2c233130ca)

Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fi=
xes/kernel/v5.7-rc6-175-gcf2c233130ca/
Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/ke=
rnel/v5.7-rc6-175-gcf2c233130ca/

Tree: next
Branch: pending-fixes
Git Describe: v5.7-rc6-175-gcf2c233130ca
Git Commit: cf2c233130cab191dcbfc14613e5823c7bfc71b7
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
Tested: 106 unique boards, 26 SoC families, 31 builds out of 217

Boot Regressions Detected:

arm:

    exynos_defconfig:
        gcc-8:
          exynos5422-odroidxu3:
              lab-collabora: failing since 8 days (last pass: v5.7-rc4-407-=
g604da24420e3 - first fail: v5.7-rc4-552-g1e823790a7f1)

    multi_v7_defconfig:
        gcc-8:
          bcm2836-rpi-2-b:
              lab-collabora: failing since 94 days (last pass: v5.5-8839-g5=
6c8845edd39 - first fail: v5.6-rc1-311-ge58961fba99f)
          exynos5422-odroidxu3:
              lab-collabora: new failure (last pass: v5.7-rc5-310-g752f10c4=
a54e)
          sun8i-r40-bananapi-m2-ultra:
              lab-clabbe: new failure (last pass: v5.7-rc5-557-gf7a4ee5329e=
2)

    sama5_defconfig:
        gcc-8:
          at91-sama5d4_xplained:
              lab-baylibre: failing since 13 days (last pass: v5.7-rc3-277-=
ga37f92ef57b2 - first fail: v5.7-rc4-211-g6d4315023bc9)

    versatile_defconfig:
        gcc-8:
          versatile-pb:
              lab-collabora: new failure (last pass: v5.7-rc5-557-gf7a4ee53=
29e2)

arm64:

    defconfig:
        gcc-8:
          meson-gxm-q200:
              lab-baylibre: new failure (last pass: v5.7-rc5-557-gf7a4ee532=
9e2)
          sm8150-mtp:
              lab-bjorn: failing since 18 days (last pass: v5.7-rc3-194-g16=
31e20d9729 - first fail: v5.7-rc3-228-g76a37a4cf830)

    defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy:
        gcc-8:
          sun50i-a64-pine64-plus:
              lab-baylibre: failing since 1 day (last pass: v5.7-rc5-433-g6=
62b55c6e1a2 - first fail: v5.7-rc5-557-gf7a4ee5329e2)

    defconfig+CONFIG_RANDOMIZE_BASE=3Dy:
        gcc-8:
          meson-g12a-x96-max:
              lab-baylibre: new failure (last pass: v5.7-rc5-557-gf7a4ee532=
9e2)
          meson-gxbb-p200:
              lab-baylibre: new failure (last pass: v5.7-rc5-557-gf7a4ee532=
9e2)
          meson-gxl-s905d-p230:
              lab-baylibre: new failure (last pass: v5.7-rc5-557-gf7a4ee532=
9e2)
          sun50i-a64-pine64-plus:
              lab-baylibre: failing since 1 day (last pass: v5.7-rc5-433-g6=
62b55c6e1a2 - first fail: v5.7-rc5-557-gf7a4ee5329e2)

riscv:

    defconfig:
        gcc-8:
          sifive_fu540:
              lab-baylibre-seattle: failing since 38 days (last pass: v5.6-=
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
            exynos5422-odroidxu3: 1 failed lab

    exynos_defconfig:
        gcc-8:
            exynos5422-odroidxu3: 1 failed lab

    allmodconfig:
        gcc-8:
            stm32mp157c-dk2: 1 failed lab

arm64:
    defconfig:
        gcc-8:
            meson-gxm-q200: 1 failed lab
            sm8150-mtp: 1 failed lab
            sm8250-mtp: 1 failed lab

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
