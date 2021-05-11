Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDA2F37A588
	for <lists+linux-next@lfdr.de>; Tue, 11 May 2021 13:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbhEKLQE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 11 May 2021 07:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbhEKLQD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 11 May 2021 07:16:03 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9424FC061574
        for <linux-next@vger.kernel.org>; Tue, 11 May 2021 04:14:57 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id t2-20020a17090ae502b029015b0fbfbc50so940127pjy.3
        for <linux-next@vger.kernel.org>; Tue, 11 May 2021 04:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:content-transfer-encoding:subject:to
         :from;
        bh=EI4DSPv8EDeEeBJSumIF33nljpjdhds1q1xZF3p1wWs=;
        b=WUK/uAY6sPw6GfkZ/P+c+zhFXJoKJiVDBVyngf4ZzquoYK8dcta+m/fukLnYOK1Av+
         Cpq876uMB9wK0eXEcp61e60wCuVD3uIDccDjMd69KhfvMZPo1d+50alZ/xqXdA9SQRfQ
         hWAkrnD2JoF1nfc6AVuw0787xnx6DOBRfzhBA1nlW8rWw0hEy5zjG28rYcgBA5nw3gDB
         zjMYv+ukQWXJRbZNM1KUc98oSNFrSlNywNUNtId87A0DmbWRWtC8ZRWuFVYmdevfsD0M
         kzgUN41VA6/NRPZBvWXOYMwFYyO/C+WjWfMP/Uh8ZWdQ272vjyGYu9J22JLfAnr2HF+K
         xEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version
         :content-transfer-encoding:subject:to:from;
        bh=EI4DSPv8EDeEeBJSumIF33nljpjdhds1q1xZF3p1wWs=;
        b=V6MNk3QkLUzD3OfAaU0HmVofmDP91yZLRY/3DE7bNHsXEkox2wU7vafPie81gNyzG+
         7Edr9FiBMtILX95HAv/kTc6D97hZTTgUDCroTAgQ7koNAtN/Sc+nvRbLh1W8VAD0SMx3
         kDNVnRVZCASYzHqvj+BWiG2jdsXrnk87pxK0fGthUg8/sOoEf2qNTxjXbkFRtu6u3G8L
         Et/d9Rc9U1JC4CX9WTmW/cCUtl1DsJu9+CYUkfvDD380wTaxo/bw2vJk2r7kHSRjUy8G
         CBsIBr5hxHPphrtuRr5nnqmpe//CSbn2x/1qGsqTRFBIbsuXPueb3EtdLayu2ckBo+oG
         x8NA==
X-Gm-Message-State: AOAM531KfvcY34uwi9Zt04SAKocfnv346/qVpGJuZHY427VOIq44BT4R
        4TYewjI2vBRjHapKCgSdRJSHYLCVQRsxRUa+
X-Google-Smtp-Source: ABdhPJz+14jJ7EghY0eDr5Ud1w1ZFAI0QQlcVy9zOkiutnDFt3+TmEiOTjRu81lhUvNO77mXCmbZtw==
X-Received: by 2002:a17:903:18b:b029:ee:d430:6c4d with SMTP id z11-20020a170903018bb02900eed4306c4dmr29709445plg.34.1620731696828;
        Tue, 11 May 2021 04:14:56 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id i24sm13187304pfd.35.2021.05.11.04.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 04:14:56 -0700 (PDT)
Message-ID: <609a6730.1c69fb81.c8bfb.86c5@mx.google.com>
Date:   Tue, 11 May 2021 04:14:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: test
X-Kernelci-Tree: next
X-Kernelci-Kernel: next-20210511
X-Kernelci-Branch: master
Subject: next/master baseline: 318 runs, 9 regressions (next-20210511)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/master baseline: 318 runs, 9 regressions (next-20210511)

Regressions Summary
-------------------

platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b      | arm  | lab-collabora   | gcc-8    | bcm2835_defconfi=
g            | 1          =

bcm2836-rpi-2-b      | arm  | lab-collabora   | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =

bcm2837-rpi-3-b-32   | arm  | lab-baylibre    | gcc-8    | bcm2835_defconfi=
g            | 1          =

qemu_arm-versatilepb | arm  | lab-baylibre    | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm  | lab-broonie     | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm  | lab-cip         | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm  | lab-collabora   | gcc-8    | versatile_defcon=
fig          | 1          =

qemu_arm-versatilepb | arm  | lab-linaro-lkft | gcc-8    | versatile_defcon=
fig          | 1          =

tegra124-nyan-big    | arm  | lab-collabora   | gcc-8    | tegra_defconfig =
             | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
210511/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20210511
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      4bf27b1f73303c33c5570b63f8ed734abcd1991f =



Test Regressions
---------------- =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b      | arm  | lab-collabora   | gcc-8    | bcm2835_defconfi=
g            | 1          =


  Details:     https://kernelci.org/test/plan/id/609a34b31b8f103eb66f5472

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210511/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210511/arm/=
bcm2835_defconfig/gcc-8/lab-collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a34b31b8f103eb66f5=
473
        failing since 43 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
bcm2836-rpi-2-b      | arm  | lab-collabora   | gcc-8    | multi_v7_defc...=
CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/609a37610921b951f26f54b9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210511/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210511/arm/=
multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-8/lab-collabora/baseline-bcm2836-rpi-=
2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a37610921b951f26f5=
4ba
        failing since 75 days (last pass: next-20210223, first fail: next-2=
0210224) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
bcm2837-rpi-3-b-32   | arm  | lab-baylibre    | gcc-8    | bcm2835_defconfi=
g            | 1          =


  Details:     https://kernelci.org/test/plan/id/609a2e9ba74f7b36e36f5484

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210511/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210511/arm/=
bcm2835_defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b-32.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a2e9ba74f7b36e36f5=
485
        failing since 46 days (last pass: next-20210324, first fail: next-2=
0210325) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-baylibre    | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a29f275fa2484356f547a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210511/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210511/arm/=
versatile_defconfig/gcc-8/lab-baylibre/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a29f275fa2484356f5=
47b
        failing since 174 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-broonie     | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a29e76d036967fb6f5467

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210511/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210511/arm/=
versatile_defconfig/gcc-8/lab-broonie/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a29e76d036967fb6f5=
468
        failing since 174 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-cip         | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a2a20a6869718806f5471

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210511/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210511/arm/=
versatile_defconfig/gcc-8/lab-cip/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a2a20a6869718806f5=
472
        failing since 174 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-collabora   | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a29a22024cdcde06f546e

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210511/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210511/arm/=
versatile_defconfig/gcc-8/lab-collabora/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a29a22024cdcde06f5=
46f
        failing since 174 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
qemu_arm-versatilepb | arm  | lab-linaro-lkft | gcc-8    | versatile_defcon=
fig          | 1          =


  Details:     https://kernelci.org/test/plan/id/609a299542567b20056f548b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: versatile_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210511/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210511/arm/=
versatile_defconfig/gcc-8/lab-linaro-lkft/baseline-qemu_arm-versatilepb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a299542567b20056f5=
48c
        failing since 174 days (last pass: next-20201113, first fail: next-=
20201117) =

 =



platform             | arch | lab             | compiler | defconfig       =
             | regressions
---------------------+------+-----------------+----------+-----------------=
-------------+------------
tegra124-nyan-big    | arm  | lab-collabora   | gcc-8    | tegra_defconfig =
             | 1          =


  Details:     https://kernelci.org/test/plan/id/609a37cb0aab0930ca6f54ae

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: tegra_defconfig
  Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
  Plain log:   https://storage.kernelci.org//next/master/next-20210511/arm/=
tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20210511/arm/=
tegra_defconfig/gcc-8/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020=
.05-5-g2f114cc7102b/armel/baseline/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/609a37cb0aab0930ca6f5=
4af
        new failure (last pass: next-20210510) =

 =20
