Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E9D23B732
	for <lists+linux-next@lfdr.de>; Tue,  4 Aug 2020 11:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729999AbgHDJCx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 05:02:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729390AbgHDJCw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Aug 2020 05:02:52 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4591C06174A
        for <linux-next@vger.kernel.org>; Tue,  4 Aug 2020 02:02:51 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id c6so1624425pje.1
        for <linux-next@vger.kernel.org>; Tue, 04 Aug 2020 02:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=/k6YWIZzYSEr5CKwjySdJlvhAInzPxsH25A740uPypc=;
        b=EiwQhXjHUMTlB06Lrjz01buwMBIuljLAxWuglcyr70h3yj2aEZCFX53Z11ImYkao78
         1GA3cVtujcnhe6/YTweoiNNJhFd/EOUafvw2UokKRxzEHD4xZAWuUZ0Dq0EmzadXRM74
         4q3U3bC/cdRjm7YtIPCGZQy3vyqc57kEEz62l1RDVO2hxNCu9eP6qIg7plh2tC2MrF4p
         xBC1Y8zNf76wHgALCTgmucjViw4XciGC+LhBnoRhsQ2bsHPOU2+DI1lG9+rzgbkFYoU7
         4lWsT5rb1gs7V4x431xvpANvf1fO2eCbMLPR/dvM9Ja8eBi0OtYFlPdbSQQxG+BR91AS
         d5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=/k6YWIZzYSEr5CKwjySdJlvhAInzPxsH25A740uPypc=;
        b=G+Zov+tjEnJpi35eOOowVOhAryPH9nMK8aUs827nJ+dRAUd/TupzlVaJXcaR9Mvj+O
         wNpJUNBzh6kyL5SiGSZQotfpRFtWijF24rq8YkQEfAWcMBRPsvnMGx6ZVzEcKZzYi9Gw
         RpEM8sQyGwtbmz5aDguwakoJuSZFn2h+YU4SmXvPFdHbeCI7xtwcdcSmDfmUv3b9KWwx
         HNfWbI0aGFJyA3ZF/l5LvvrzdJu7REJtViwBJ4CfIEU1kQgkHBJk172fJCVPwWwO8JdM
         OwFl9nSCh9ZoiJtOqTqzlBBJ85aPdbv0Z4Ptl72w5m8zKkoEC2jtujUnFZ54FjS+YY4e
         M14g==
X-Gm-Message-State: AOAM532Gwa3CS4zOidAs3GAo6Of5wurr+H0bbCH2NUAHCG+TyX3/6EGa
        FTn6h7k7+FVG/0V8R1jjeidqwmfKrN0=
X-Google-Smtp-Source: ABdhPJzS4UCJ3zr9ypdmyhX2GU0mjKoUijTZag8/xR4FYMje1MtcQ3dmzI0auwwm9YqoTrqC2u0FIw==
X-Received: by 2002:a17:90a:bd0e:: with SMTP id y14mr3477788pjr.13.1596531770726;
        Tue, 04 Aug 2020 02:02:50 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id q16sm23065672pfg.153.2020.08.04.02.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 02:02:49 -0700 (PDT)
Message-ID: <5f292439.1c69fb81.424fc.ccb2@mx.google.com>
Date:   Tue, 04 Aug 2020 02:02:49 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: v5.8-1558-g0359180fcb42
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
Subject: next/pending-fixes baseline: 341 runs,
 23 regressions (v5.8-1558-g0359180fcb42)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 341 runs, 23 regressions (v5.8-1558-g0359180fc=
b42)

Regressions Summary
-------------------

platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
at91-sama5d4_xplained   | arm   | lab-baylibre  | gcc-8    | sama5_defconfi=
g              | 0/1    =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 4/5    =

bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 4/5    =

rk3288-veyron-jaq       | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 63/69  =

rk3288-veyron-jaq       | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 63/69  =

rk3288-veyron-jaq       | arm   | lab-collabora | gcc-8    | multi_v7_defco=
nfig           | 63/69  =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 0/1    =

sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
               | 0/1    =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v5.8-1558-g0359180fcb42/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v5.8-1558-g0359180fcb42
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      0359180fcb429256f9396fae83916bd0185f01fe =



Test Regressions
---------------- =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
at91-sama5d4_xplained   | arm   | lab-baylibre  | gcc-8    | sama5_defconfi=
g              | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f28e88c1dfcfaaef252c1bb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: sama5_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-1558-g=
0359180fcb42/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_x=
plained.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-1558-g=
0359180fcb42/arm/sama5_defconfig/gcc-8/lab-baylibre/baseline-at91-sama5d4_x=
plained.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f28e88c1dfcfaaef252c=
1bc
      failing since 90 days (last pass: v5.7-rc3-277-ga37f92ef57b2, first f=
ail: v5.7-rc4-211-g6d4315023bc9) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f28e83540915ca63452c1d0

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-1558-g=
0359180fcb42/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/b=
aseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-1558-g=
0359180fcb42/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-baylibre/b=
aseline-bcm2837-rpi-3-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f28e83540915ca6=
3452c1d3
      failing since 1 day (last pass: v5.8-rc7-210-gb684091a3d8c, first fai=
l: v5.8-54-gefd7bdec601b)
      4 lines =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
bcm2837-rpi-3-b         | arm64 | lab-baylibre  | gcc-8    | defconfig     =
               | 4/5    =


  Details:     https://kernelci.org/test/plan/id/5f28e9898a78ce3f8c52c1fa

  Results:     4 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-1558-g=
0359180fcb42/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-1558-g=
0359180fcb42/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.ht=
ml
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f28e9898a78ce3f=
8c52c1fd
      new failure (last pass: v5.8-54-gefd7bdec601b)
      2 lines =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
rk3288-veyron-jaq       | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..CONFIG_SMP=3Dn | 63/69  =


  Details:     https://kernelci.org/test/plan/id/5f28ea195d195a348052c1fe

  Results:     63 PASS, 6 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-1558-g=
0359180fcb42/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-1558-g=
0359180fcb42/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/base=
line-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.bootrr.cros-ec-dev-driver-present: https://kernelci.org/test/c=
ase/id/5f28ea195d195a348052c206
      new failure (last pass: v5.8-54-gefd7bdec601b)* baseline.bootrr.cros-=
ec-dev-probed: https://kernelci.org/test/case/id/5f28ea195d195a348052c207
      new failure (last pass: v5.8-54-gefd7bdec601b)* baseline.bootrr.cros-=
ec-i2c-tunnel-driver-present: https://kernelci.org/test/case/id/5f28ea195d1=
95a348052c208
      new failure (last pass: v5.8-54-gefd7bdec601b)* baseline.bootrr.cros-=
ec-i2c-tunnel-probed: https://kernelci.org/test/case/id/5f28ea195d195a34805=
2c209
      new failure (last pass: v5.8-54-gefd7bdec601b)* baseline.bootrr.cros-=
ec-keyb-driver-present: https://kernelci.org/test/case/id/5f28ea195d195a348=
052c20a
      new failure (last pass: v5.8-54-gefd7bdec601b)* baseline.bootrr.cros-=
ec-keyb-probed: https://kernelci.org/test/case/id/5f28ea195d195a348052c20b
      new failure (last pass: v5.8-54-gefd7bdec601b) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
rk3288-veyron-jaq       | arm   | lab-collabora | gcc-8    | multi_v7_defc.=
..G_ARM_LPAE=3Dy | 63/69  =


  Details:     https://kernelci.org/test/plan/id/5f28eada77d3d794cc52c1e8

  Results:     63 PASS, 6 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-1558-g=
0359180fcb42/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
8/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-1558-g=
0359180fcb42/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/gcc-=
8/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.bootrr.cros-ec-dev-driver-present: https://kernelci.org/test/c=
ase/id/5f28eada77d3d794cc52c1f0
      new failure (last pass: v5.8-54-gefd7bdec601b)* baseline.bootrr.cros-=
ec-dev-probed: https://kernelci.org/test/case/id/5f28eada77d3d794cc52c1f1
      new failure (last pass: v5.8-54-gefd7bdec601b)* baseline.bootrr.cros-=
ec-i2c-tunnel-driver-present: https://kernelci.org/test/case/id/5f28eada77d=
3d794cc52c1f2
      new failure (last pass: v5.8-54-gefd7bdec601b)* baseline.bootrr.cros-=
ec-i2c-tunnel-probed: https://kernelci.org/test/case/id/5f28eada77d3d794cc5=
2c1f3
      new failure (last pass: v5.8-54-gefd7bdec601b)* baseline.bootrr.cros-=
ec-keyb-driver-present: https://kernelci.org/test/case/id/5f28eada77d3d794c=
c52c1f4
      new failure (last pass: v5.8-54-gefd7bdec601b)* baseline.bootrr.cros-=
ec-keyb-probed: https://kernelci.org/test/case/id/5f28eada77d3d794cc52c1f5
      new failure (last pass: v5.8-54-gefd7bdec601b) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
rk3288-veyron-jaq       | arm   | lab-collabora | gcc-8    | multi_v7_defco=
nfig           | 63/69  =


  Details:     https://kernelci.org/test/plan/id/5f28ee3aaa4c165e4652c1a7

  Results:     63 PASS, 6 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-1558-g=
0359180fcb42/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-vey=
ron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-1558-g=
0359180fcb42/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-rk3288-vey=
ron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/armel/baseline/rootfs.cpio.gz =


  * baseline.bootrr.cros-ec-dev-driver-present: https://kernelci.org/test/c=
ase/id/5f28ee3aaa4c165e4652c1af
      new failure (last pass: v5.8-54-gefd7bdec601b)* baseline.bootrr.cros-=
ec-dev-probed: https://kernelci.org/test/case/id/5f28ee3aaa4c165e4652c1b0
      new failure (last pass: v5.8-54-gefd7bdec601b)* baseline.bootrr.cros-=
ec-i2c-tunnel-driver-present: https://kernelci.org/test/case/id/5f28ee3aaa4=
c165e4652c1b1
      new failure (last pass: v5.8-54-gefd7bdec601b)* baseline.bootrr.cros-=
ec-i2c-tunnel-probed: https://kernelci.org/test/case/id/5f28ee3aaa4c165e465=
2c1b2
      new failure (last pass: v5.8-54-gefd7bdec601b)* baseline.bootrr.cros-=
ec-keyb-driver-present: https://kernelci.org/test/case/id/5f28ee3aaa4c165e4=
652c1b3
      new failure (last pass: v5.8-54-gefd7bdec601b)* baseline.bootrr.cros-=
ec-keyb-probed: https://kernelci.org/test/case/id/5f28ee3aaa4c165e4652c1b4
      new failure (last pass: v5.8-54-gefd7bdec601b) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig+CON.=
..OMIZE_BASE=3Dy | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f28e8bffcbe55327a52c1be

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-1558-g=
0359180fcb42/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/bas=
eline-sun50i-a64-bananapi-m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-1558-g=
0359180fcb42/arm64/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-8/lab-clabbe/bas=
eline-sun50i-a64-bananapi-m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f28e8bffcbe55327a52c=
1bf
      failing since 4 days (last pass: v5.8-rc7-165-ga7813a12c4b9, first fa=
il: v5.8-rc7-210-gb684091a3d8c) =



platform                | arch  | lab           | compiler | defconfig     =
               | results
------------------------+-------+---------------+----------+---------------=
---------------+--------
sun50i-a64-bananapi-m64 | arm64 | lab-clabbe    | gcc-8    | defconfig     =
               | 0/1    =


  Details:     https://kernelci.org/test/plan/id/5f28ea105d195a348052c1c4

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v5.8-1558-g=
0359180fcb42/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-=
m64.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v5.8-1558-g=
0359180fcb42/arm64/defconfig/gcc-8/lab-clabbe/baseline-sun50i-a64-bananapi-=
m64.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05/arm64/baseline/rootfs.cpio.gz =


  * baseline.login: https://kernelci.org/test/case/id/5f28ea105d195a348052c=
1c5
      new failure (last pass: v5.8-54-gefd7bdec601b) =20
