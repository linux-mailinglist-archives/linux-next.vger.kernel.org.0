Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3383FD25D
	for <lists+linux-next@lfdr.de>; Wed,  1 Sep 2021 06:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234291AbhIAEdW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 1 Sep 2021 00:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbhIAEdT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 1 Sep 2021 00:33:19 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E104DC061760
        for <linux-next@vger.kernel.org>; Tue, 31 Aug 2021 21:32:22 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d17so726049plr.12
        for <linux-next@vger.kernel.org>; Tue, 31 Aug 2021 21:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=cWABxnr2ezNg8A99v2W2+lCCMkbvYnK96cfghfp+n0E=;
        b=LZD0QZcWfXHXC3rsM4gMH73HR05sTbCOHdJh0AciqkrqiPxFMf+YZeqzLZIJnVRGaq
         4854gl1VzdR8E/b4goFmNzc9XuqDbQQXdg+UkXwug4/jbOMC8aDatmVueni5MUioV5mY
         J/9/CydewiQxjtbOznoScQ23LctFGhfnrJeYdTfdPd14SvtA2XviE/oFxb61zOvVqp04
         UtU6AOGAu2F1NAtZq9HXw5g0+NCK4nrDmuM7/Jhm1psrk6B/+Dp/FE1xckxC9HZE6BMO
         t1Uhq5MiojrlSYtwcrLeJ/yO1BNW+/DyPEGYO1GCu0TFH98Cfd+N50Rn8IsAR+GL5u3l
         hlJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=cWABxnr2ezNg8A99v2W2+lCCMkbvYnK96cfghfp+n0E=;
        b=qwKAyCPUUXaXOad7r55XrpdaOBYKmoacqdID05QyeZ3lF4fHEIR5F+FVyilIvlwoRq
         x6Rd2qCVazxyoaK4EthEH4BXYVZdh6gk8zgt+solTCqNd1aTyM+mQ2ZVch3U2BMgBFab
         93L6zgPHprOPhsX9+qtG3X3tuMu4jfYAY5vk8fcScsEuDSttMGlvWwAd2B5kAHM5Igdx
         XX0tYmcO7S5NzmpU1Hu0Knb2L1wau+9Qc0A62YFLsfF5eIaGfsDfThDrVGN4/sd24psZ
         h+iBusPq+Pt3JDZDCmTdBGSN6GjeLeA6JybY+J9NQlM3eG2ZntR4UxcqUWAUgvbmp6/k
         H/OQ==
X-Gm-Message-State: AOAM5331d04ivzsLIOT3/erMdbd4Bn++oJj2OHnK8y5dxJ+kQYwNVWgl
        ZBOLXI8ufexwHUoFY98SDoe/u0nekNLlrqc9
X-Google-Smtp-Source: ABdhPJw+0IjiqBQTTMihqKYFFNSLHlVmE51Ju3GI5LCN2XWLP0Zt77l8ToHfGSTVr6VZp2esPGXJjw==
X-Received: by 2002:a17:902:e0cc:b0:134:7191:f39 with SMTP id e12-20020a170902e0cc00b0013471910f39mr7959391pla.36.1630470742059;
        Tue, 31 Aug 2021 21:32:22 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id e16sm7006699pfj.90.2021.08.31.21.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 21:32:21 -0700 (PDT)
Message-ID: <612f0255.1c69fb81.2e171.417d@mx.google.com>
Date:   Tue, 31 Aug 2021 21:32:21 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v5.14-2864-gb16f07edf2d7
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 461 runs,
 13 regressions (v5.14-2864-gb16f07edf2d7)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 461 runs, 13 regressions (v5.14-2864-gb16f07ed=
f2d7)

Regressions Summary
-------------------

platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =

beagle-xm            | arm   | lab-baylibre    | gcc-8    | multi_v7_defcon=
fig+ima       | 1          =

beagle-xm            | arm   | lab-baylibre    | gcc-8    | multi_v7_defcon=
fig           | 1          =

beagle-xm            | arm   | lab-baylibre    | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =

imx6sll-evk          | arm   | lab-nxp         | gcc-8    | multi_v7_defcon=
fig           | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+ima  =
              | 1          =

imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =

meson-gxbb-p200      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =

qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =

qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.14-2864-gb16f07edf2d7/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.14-2864-gb16f07edf2d7
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      b16f07edf2d73c358f7e60ce89f6354d47353e99 =



Test Regressions
---------------- =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612ec93f6633373a328e2c7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/=
baseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ec93f6633373a328e2=
c80
        failing since 56 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
bcm2837-rpi-3-b      | arm64 | lab-baylibre    | gcc-8    | defconfig      =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/612eca94e6d771b5008e2c8f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.t=
xt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.h=
tml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612eca94e6d771b5008e2=
c90
        failing since 56 days (last pass: v5.13-3495-gfbf137d9483a, first f=
ail: v5.13-11972-g079b16c442fd) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
beagle-xm            | arm   | lab-baylibre    | gcc-8    | multi_v7_defcon=
fig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/612ec8d7189f7fafc68e2c79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-beagle=
-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm/multi_v7_defconfig+ima/gcc-8/lab-baylibre/baseline-beagle=
-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ec8d7189f7fafc68e2=
c7a
        new failure (last pass: v5.14-1642-g50a532577e29) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
beagle-xm            | arm   | lab-baylibre    | gcc-8    | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/612eca2e66a4e970c98e2cff

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.=
txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm/multi_v7_defconfig/gcc-8/lab-baylibre/baseline-beagle-xm.=
html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612eca2e66a4e970c98e2=
d00
        failing since 8 days (last pass: v5.14-rc6-152-g898ee1d3a2b1, first=
 fail: v5.14-rc7-72-geeb46b4d4bd9) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
beagle-xm            | arm   | lab-baylibre    | gcc-8    | multi_v7_defc..=
.CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/612ecbf79f623974aa8e2c78

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-baylibre/base=
line-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ecbf79f623974aa8e2=
c79
        failing since 50 days (last pass: v5.10-rc7-201-gc9b6935dc4f4, firs=
t fail: v5.14-rc1-225-g25a1eba130d1) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx6sll-evk          | arm   | lab-nxp         | gcc-8    | multi_v7_defcon=
fig           | 1          =


  Details:     https://kernelci.org/test/plan/id/612ecce5eddc57f80c8e2c86

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm/multi_v7_defconfig/gcc-8/lab-nxp/baseline-imx6sll-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ecce5eddc57f80c8e2=
c87
        new failure (last pass: v5.14-1642-g50a532577e29) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+ima  =
              | 1          =


  Details:     https://kernelci.org/test/plan/id/612ecc209f623974aa8e2c98

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm64/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm64/defconfig+ima/gcc-8/lab-nxp/baseline-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ecc209f623974aa8e2=
c99
        new failure (last pass: v5.14-1642-g50a532577e29) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
imx8mp-evk           | arm64 | lab-nxp         | gcc-8    | defconfig+CON..=
.OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612ece26a067a7e8a88e2c79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/basel=
ine-imx8mp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-nxp/basel=
ine-imx8mp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ece26a067a7e8a88e2=
c7a
        failing since 1 day (last pass: v5.14-rc7-142-gd92736edf498, first =
fail: v5.14-1642-g50a532577e29) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
meson-gxbb-p200      | arm64 | lab-baylibre    | gcc-8    | defconfig+CON..=
.BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/612ecd31825e4b37788e2c87

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-8/lab-baylibre/=
baseline-meson-gxbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/arm64be/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ecd31825e4b37788e2=
c88
        new failure (last pass: v5.14-1642-g50a532577e29) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-baylibre    | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612ec2b2262a75a5068e2cd9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-=
versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm/versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-=
versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ec2b2262a75a5068e2=
cda
        failing since 288 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-broonie     | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612ec3027c8965bd6c8e2cdc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-v=
ersatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm/versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-v=
ersatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ec3027c8965bd6c8e2=
cdd
        failing since 288 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-cip         | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612ec2b86dfab6c6f68e2c79

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versa=
tilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm/versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versa=
tilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ec2b86dfab6c6f68e2=
c7a
        failing since 288 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =



platform             | arch  | lab             | compiler | defconfig      =
              | regressions
---------------------+-------+-----------------+----------+----------------=
--------------+------------
qemu_arm-versatilepb | arm   | lab-linaro-lkft | gcc-8    | versatile_defco=
nfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/612ec270ad06b356188e2c93

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.14-2864-=
gb16f07edf2d7/arm/versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_a=
rm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-6-g8983f3b738df/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/612ec270ad06b356188e2=
c94
        failing since 288 days (last pass: v5.10-rc3-420-g5364e201065c, fir=
st fail: v5.10-rc3-639-ga24d51ed9363) =

 =20
