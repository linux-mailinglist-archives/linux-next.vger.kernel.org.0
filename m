Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBAB723C586
	for <lists+linux-next@lfdr.de>; Wed,  5 Aug 2020 08:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbgHEGBe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 5 Aug 2020 02:01:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbgHEGBe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 5 Aug 2020 02:01:34 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72BF7C06174A
        for <linux-next@vger.kernel.org>; Tue,  4 Aug 2020 23:01:34 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id 2so3888246pjx.5
        for <linux-next@vger.kernel.org>; Tue, 04 Aug 2020 23:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=m2F7s0yKRXmkmfe6PYQPItZjhHWGl0FNRyeKdYktYXQ=;
        b=TqyzMDoKsyrT1mSBSOBIAdH+8a/wIWjBlGsewwnTqsVwZ165oc64dinRr5/q4txwSK
         8DiYC9Gqrn5pu8IlA9luDStdWBWHErmqYn1+2UziRH4zCeMp3PgIimwUN+BOl5M2vUT9
         4lBtnhJlFLt7hhBJO1BWOg3PUWNDkamCRQ03wt4J3FiWVcuu7GGD5CPSuX1vV5xxepza
         /h7G0pCKhP03PAk0P8R86CsG6QOpZPPsJ2YOHxiWfuOvMHKpJl+QmK2Li7PBMcm3NRdK
         VGp75ns5aMzCzAOQovP1TyHmFGfoMo23CySHoie2ZdMoq7ftohy5feepMtT4yjb3CObX
         geSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=m2F7s0yKRXmkmfe6PYQPItZjhHWGl0FNRyeKdYktYXQ=;
        b=dZccBSJ/mRbSmnzFZniMOYHwrIVcgDyPdgA4BHS0efnPgUuqX20wFjssEsNg6tleKH
         3PO2zz6wn8ehGzNFGmClEwKX6XaecXOROaJxyh6/Xff8OG2qTJvTyR69rQf8x+MC4DU6
         niiyAF3rYtpITyl5vyCJxYE3hC/lesUoNFLR8eOUhJikMjgAcJRFFb1v1kICN6q89xFq
         943A2vzkVeLxknMNoCUOOj9Zy1J9oWJOpqezIJvFGAe75Q+HEGeztsPmSbZpmtKEjnUh
         0Dne061/ZbaGdowkcRDz7onR9oU+hdvFBkVww+7I9d/KctGKDAd8bdJefUqdQtQM4NKM
         17EQ==
X-Gm-Message-State: AOAM532v1K8X3qKzyQeeXzuMar3UO+GRL9ifB78apJT56wI2NuRMPHYN
        IJWzCiq0pe23PixBWi7Ij/Y01jWgCI8=
X-Google-Smtp-Source: ABdhPJwRulOjDv2hBbvn+TnUUR6n1Txwc9kUxJnFk+Jy9bRKl8d24iObCi1q1hJ+CREVWo0W/XR8Rg==
X-Received: by 2002:a17:90a:ee8d:: with SMTP id i13mr1739907pjz.19.1596607293375;
        Tue, 04 Aug 2020 23:01:33 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id fh14sm1372056pjb.38.2020.08.04.23.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 23:01:32 -0700 (PDT)
Message-ID: <5f2a4b3c.1c69fb81.4d56.305f@mx.google.com>
Date:   Tue, 04 Aug 2020 23:01:32 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.8-3221-g983112062f35
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 183 runs,
 27 regressions (v5.8-3221-g983112062f35)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 183 runs, 27 regressions (v5.8-3221-g983112062=
f35)

Regressions Summary
-------------------

platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =

exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | exynos_defconfig =
            | 0/1    =

exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 0/1    =

exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =

exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | multi_v7_defc...G=
_ARM_LPAE=3Dy | 0/1    =

omap3-beagle-xm       | arm  | lab-baylibre  | gcc-8    | omap2plus_defconf=
ig          | 0/1    =

omap4-panda           | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 4/5    =

omap4-panda           | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =

omap4-panda           | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =

rk3288-veyron-jaq     | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 63/69  =

rk3288-veyron-jaq     | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 63/69  =

rk3288-veyron-jaq     | arm  | lab-collabora | gcc-8    | multi_v7_defc...G=
_ARM_LPAE=3Dy | 63/69  =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-3221-g983112062f35/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-3221-g983112062f35
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      983112062f35f324bcd3fcfdaa679a7b5ce5095f =



Test Regressions
---------------- =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
at91-sama5d4_xplained | arm  | lab-baylibre  | gcc-8    | sama5_defconfig  =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2a15d89b8527ea7c52c1be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_x=
plained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_x=
plained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2a15d89b8527ea7c52c=
1bf
      failing since 91 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | exynos_defconfig =
            | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2a21a4b5cc0026f052c1c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: exynos_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/exynos_defconfig/gcc-8/lab-collabora/baseline-exynos5422-o=
droidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2a21a4b5cc0026f052c=
1c5
      new failure (last pass: v5.8-1558-g0359180fcb42) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2a1a4ee8988f3f5452c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422=
-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-exynos5422=
-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2a1a4ee8988f3f5452c=
1a7
      new failure (last pass: v5.8-1558-g0359180fcb42) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2a22f699e67c788252c1a9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2a22f699e67c788252c=
1aa
      new failure (last pass: v5.8-1558-g0359180fcb42) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
exynos5422-odroidxu3  | arm  | lab-collabora | gcc-8    | multi_v7_defc...G=
_ARM_LPAE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2a244461656f324e52c1a6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
8/lab-collabora/baseline-exynos5422-odroidxu3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
8/lab-collabora/baseline-exynos5422-odroidxu3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2a244461656f324e52c=
1a7
      new failure (last pass: v5.8-1558-g0359180fcb42) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
omap3-beagle-xm       | arm  | lab-baylibre  | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2a18eb14c8b5b2c852c1b1

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap3-beag=
le-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/omap2plus_defconfig/gcc-8/lab-baylibre/baseline-omap3-beag=
le-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2a18eb14c8b5b2c852c=
1b2
      new failure (last pass: v5.8-1558-g0359180fcb42) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
omap4-panda           | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f2a1734638b5503cf52c1b0

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-pand=
a.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-pand=
a.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f2a1734638b550=
3cf52c1b4
      new failure (last pass: v5.8-1558-g0359180fcb42)
      60 lines =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
omap4-panda           | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f2a17b63f54c5186952c1b6

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-omap4-panda.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-omap4-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f2a17b63f54c51=
86952c1ba
      new failure (last pass: v5.8-1558-g0359180fcb42)
      60 lines =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
omap4-panda           | arm  | lab-collabora | gcc-8    | omap2plus_defconf=
ig          | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f2a190914c8b5b2c852c1c5

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: omap2plus_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-pan=
da.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/omap2plus_defconfig/gcc-8/lab-collabora/baseline-omap4-pan=
da.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f2a190914c8b5b2c852c=
1c6
      new failure (last pass: v5.8-1558-g0359180fcb42) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
rk3288-veyron-jaq     | arm  | lab-collabora | gcc-8    | multi_v7_defconfi=
g           | 63/69  =


  Details:     https://kernelci.org/test/plan/id/5f2a17830cc825f4c952c1a6

  Results:     63 PASS, 6 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-vey=
ron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-vey=
ron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.bootrr.cros-ec-dev-driver-present: https://kernelci.org/test/c=
ase/id/5f2a17830cc825f4c952c1ae
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42)* baseline.bootrr.cros-ec-dev-probed: https://kernelc=
i.org/test/case/id/5f2a17830cc825f4c952c1af
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42)* baseline.bootrr.cros-ec-i2c-tunnel-driver-present: =
https://kernelci.org/test/case/id/5f2a17830cc825f4c952c1b0
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42)* baseline.bootrr.cros-ec-i2c-tunnel-probed: https://=
kernelci.org/test/case/id/5f2a17830cc825f4c952c1b1
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42)* baseline.bootrr.cros-ec-keyb-driver-present: https:=
//kernelci.org/test/case/id/5f2a17830cc825f4c952c1b2
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42)* baseline.bootrr.cros-ec-keyb-probed: https://kernel=
ci.org/test/case/id/5f2a17830cc825f4c952c1b3
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
rk3288-veyron-jaq     | arm  | lab-collabora | gcc-8    | multi_v7_defc...C=
ONFIG_SMP=3Dn | 63/69  =


  Details:     https://kernelci.org/test/plan/id/5f2a193c73ad7e2cd552c1b2

  Results:     63 PASS, 6 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.bootrr.cros-ec-dev-driver-present: https://kernelci.org/test/c=
ase/id/5f2a193c73ad7e2cd552c1ba
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42)* baseline.bootrr.cros-ec-dev-probed: https://kernelc=
i.org/test/case/id/5f2a193c73ad7e2cd552c1bb
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42)* baseline.bootrr.cros-ec-i2c-tunnel-driver-present: =
https://kernelci.org/test/case/id/5f2a193c73ad7e2cd552c1bc
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42)* baseline.bootrr.cros-ec-i2c-tunnel-probed: https://=
kernelci.org/test/case/id/5f2a193c73ad7e2cd552c1bd
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42)* baseline.bootrr.cros-ec-keyb-driver-present: https:=
//kernelci.org/test/case/id/5f2a193c73ad7e2cd552c1be
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42)* baseline.bootrr.cros-ec-keyb-probed: https://kernel=
ci.org/test/case/id/5f2a193c73ad7e2cd552c1bf
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42) =



platform              | arch | lab           | compiler | defconfig        =
            | results
----------------------+------+---------------+----------+------------------=
------------+--------
rk3288-veyron-jaq     | arm  | lab-collabora | gcc-8    | multi_v7_defc...G=
_ARM_LPAE=3Dy | 63/69  =


  Details:     https://kernelci.org/test/plan/id/5f2a198331ce35475952c1a6

  Results:     63 PASS, 6 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-3221-g=
983112062f35/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.bootrr.cros-ec-dev-driver-present: https://kernelci.org/test/c=
ase/id/5f2a198331ce35475952c1ae
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42)* baseline.bootrr.cros-ec-dev-probed: https://kernelc=
i.org/test/case/id/5f2a198331ce35475952c1af
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42)* baseline.bootrr.cros-ec-i2c-tunnel-driver-present: =
https://kernelci.org/test/case/id/5f2a198331ce35475952c1b0
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42)* baseline.bootrr.cros-ec-i2c-tunnel-probed: https://=
kernelci.org/test/case/id/5f2a198331ce35475952c1b1
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42)* baseline.bootrr.cros-ec-keyb-driver-present: https:=
//kernelci.org/test/case/id/5f2a198331ce35475952c1b2
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42)* baseline.bootrr.cros-ec-keyb-probed: https://kernel=
ci.org/test/case/id/5f2a198331ce35475952c1b3
      failing since 0 day (last pass: v5.8-54-gefd7bdec601b, first fail: v5=
.8-1558-g0359180fcb42) =20
