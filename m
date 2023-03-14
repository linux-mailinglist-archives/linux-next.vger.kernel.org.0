Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3ABA6B994B
	for <lists+linux-next@lfdr.de>; Tue, 14 Mar 2023 16:30:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbjCNPag (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Mar 2023 11:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231743AbjCNPaE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 14 Mar 2023 11:30:04 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD042DE54
        for <linux-next@vger.kernel.org>; Tue, 14 Mar 2023 08:29:14 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so5428116pjt.2
        for <linux-next@vger.kernel.org>; Tue, 14 Mar 2023 08:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112; t=1678807753;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4f3v08u037AxhN4Mn8FiS8Vyq6EqkgG1cDGKKpsmE14=;
        b=DGKGC7xhXYzJLJ8glZfa19bGv9Be4B/rsXHJGWaiIUL/eRM8QosikFifHGm6i9FCzL
         t/Sbb/7hAqTN/wFfIjhim4Es5pU3nARPi65uFQVmH7uGQkTf15iGg1Xoj8TiokqxoVMc
         DKnnYTMre/1Tvu71u/RQKDzb9b1VdJq8Tjynh5jWG4Zbs+L2+MFsI256JiRX02laIapz
         vNP7LxRaI4ABELr2bPtsagV6AVwQlGIWi7l4zg3vv2z2Dqx7SeoU76n+ptDE38X4Yrnc
         xj3MoHIM+EkecmVeg953J0UH0DLMZw/zttpxG+F+PujgEIOo52ZCWZs0lWbW5s38OJhA
         Rhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678807753;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4f3v08u037AxhN4Mn8FiS8Vyq6EqkgG1cDGKKpsmE14=;
        b=64hANpm7PZ9McBdO07X8fyYHAe+O40gnNlY5HaFVmLYBJzdysVO3zgpn73QiV+x7IM
         zKQUfdT+l5CooJ1+slu1ShoFq5cFU6eWpbmzeu43gosYB3rAU8++J5cTg3imK4r3aNf5
         auYj4ipIqsaKB7QzVYZtscHj5h/TIoACXtC9ShFEdSNtBi15evmYuomCDVNvsP37tqiQ
         umeCFGFknjRAsDnNL3zUEMuhsmrg0T3eunduqfePi3CSfBa9PZQY7iLy59Uwav1U5uC1
         vGHEvI26uUNrjdhJ3qmAgp8tkC5kZtYGAmOr0ZtEZsZ0v75rTTmQTJc3FuSfk7jgPcuV
         kHpg==
X-Gm-Message-State: AO0yUKVRDFy/PPYjGWdlzPFpSUlaQG/u9thiGd+HTdft4IkL+lEYbZKS
        hu8Oi2Xw3LOr4s6AdEh3HksqThX8zBhLiJd8LpWPTJbE
X-Google-Smtp-Source: AK7set+RsD5KS5MUbYCZKxrgQvV5kPu60afihUy/gSnoVz6UjnO/F66PNtwlo6Oce46eLYKcvM2QfQ==
X-Received: by 2002:a17:90a:d105:b0:23d:3fbe:2f7 with SMTP id l5-20020a17090ad10500b0023d3fbe02f7mr1799709pju.20.1678807752546;
        Tue, 14 Mar 2023 08:29:12 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id y6-20020a17090a390600b0023b5528b8d4sm1869728pjb.19.2023.03.14.08.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:29:12 -0700 (PDT)
Message-ID: <641092c8.170a0220.864de.4203@mx.google.com>
Date:   Tue, 14 Mar 2023 08:29:12 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Branch: pending-fixes
X-Kernelci-Tree: next
X-Kernelci-Kernel: v6.3-rc2-254-g7f35d1f08bb0
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 470 runs,
 44 regressions (v6.3-rc2-254-g7f35d1f08bb0)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 470 runs, 44 regressions (v6.3-rc2-254-g7f35d1=
f08bb0)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 2          =

imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 5          =

meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 3          =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =

r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.3-rc2-254-g7f35d1f08bb0/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.3-rc2-254-g7f35d1f08bb0
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      7f35d1f08bb088135b98b082bc7b88cff1ca4d1d =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/641079f432550196ce8c8659

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641079f432550196ce8c8=
65a
        failing since 155 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2835-rpi-b-rev2           | arm   | lab-broonie     | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64105b943d4d53e17e8c86d1

  Results:     50 PASS, 2 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/bcm2835_defconfig/gcc-10/lab-broonie/baseline-bcm2835-r=
pi-b-rev2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105b943d4d53e17e8c8708
        new failure (last pass: v6.3-rc1-336-gbec2983895c5)

    2023-03-14T11:33:15.151457  + set +x
    2023-03-14T11:33:15.155179  <8>[   19.098924] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 160175_1.5.2.4.1>
    2023-03-14T11:33:15.289269  / # #
    2023-03-14T11:33:15.391543  export SHELL=3D/bin/sh
    2023-03-14T11:33:15.392140  #
    2023-03-14T11:33:15.493808  / # export SHELL=3D/bin/sh. /lava-160175/en=
vironment
    2023-03-14T11:33:15.494316  =

    2023-03-14T11:33:15.595789  / # . /lava-160175/environment/lava-160175/=
bin/lava-test-runner /lava-160175/1
    2023-03-14T11:33:15.596876  =

    2023-03-14T11:33:15.603064  / # /lava-160175/bin/lava-test-runner /lava=
-160175/1 =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/64105ca678b04a3d868c8633

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105ca678b04a3d868c863c
        failing since 61 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-03-14T11:37:56.699723  / # #

    2023-03-14T11:37:56.801528  export SHELL=3D/bin/sh

    2023-03-14T11:37:56.802051  #

    2023-03-14T11:37:56.903482  / # export SHELL=3D/bin/sh. /lava-9607716/e=
nvironment

    2023-03-14T11:37:56.903993  =


    2023-03-14T11:37:57.005382  / # . /lava-9607716/environment/lava-960771=
6/bin/lava-test-runner /lava-9607716/1

    2023-03-14T11:37:57.006281  =


    2023-03-14T11:37:57.018394  / # /lava-9607716/bin/lava-test-runner /lav=
a-9607716/1

    2023-03-14T11:37:57.131783  + export 'TESTRUN_ID=3D1_bootrr'

    2023-03-14T11:37:57.132473  + cd /lava-9607716/1/tests/1_bootrr
 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64105dd3a43e16f27d8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
collabora/baseline-bcm2836-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64105dd3a43e16f27d8c8=
630
        failing since 15 days (last pass: v6.2-8700-gab98cc06b683, first fa=
il: v6.2-12625-g13efc3a9f23b) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/641059cf92ae82a9448c865b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641059cf92ae82a9448c8664
        failing since 55 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-14T11:25:44.071885  <8>[   14.930357] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3410290_1.5.2.4.1>
    2023-03-14T11:25:44.183032  / # #
    2023-03-14T11:25:44.288320  export SHELL=3D/bin/sh
    2023-03-14T11:25:44.289407  #
    2023-03-14T11:25:44.391706  / # export SHELL=3D/bin/sh. /lava-3410290/e=
nvironment
    2023-03-14T11:25:44.392863  =

    2023-03-14T11:25:44.495481  / # . /lava-3410290/environment/lava-341029=
0/bin/lava-test-runner /lava-3410290/1
    2023-03-14T11:25:44.497275  =

    2023-03-14T11:25:44.497792  / # <3>[   15.316974] Bluetooth: hci0: comm=
and 0xfc18 tx timeout
    2023-03-14T11:25:44.502427  /lava-3410290/bin/lava-test-runner /lava-34=
10290/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64105a714b49ea8f338c863a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105a714b49ea8f338c8643
        failing since 55 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-14T11:28:34.089585  <8>[   24.478066] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3410305_1.5.2.4.1>
    2023-03-14T11:28:34.196755  / # #
    2023-03-14T11:28:34.299886  export SHELL=3D/bin/sh
    2023-03-14T11:28:34.300834  #
    2023-03-14T11:28:34.402802  / # export SHELL=3D/bin/sh. /lava-3410305/e=
nvironment
    2023-03-14T11:28:34.403606  =

    2023-03-14T11:28:34.506371  / # . /lava-3410305/environment/lava-341030=
5/bin/lava-test-runner /lava-3410305/1
    2023-03-14T11:28:34.508154  =

    2023-03-14T11:28:34.512901  / # /lava-3410305/bin/lava-test-runner /lav=
a-3410305/1
    2023-03-14T11:28:34.606020  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/64105c6ebc54d3c1f28c863b

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105c6ebc54d3c1f28c8644
        failing since 55 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-14T11:37:04.138968  <8>[   14.751273] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3410331_1.5.2.4.1>
    2023-03-14T11:37:04.248488  / # #
    2023-03-14T11:37:04.352255  export SHELL=3D/bin/sh
    2023-03-14T11:37:04.353332  #
    2023-03-14T11:37:04.455546  / # export SHELL=3D/bin/sh. /lava-3410331/e=
nvironment
    2023-03-14T11:37:04.456455  =

    2023-03-14T11:37:04.456930  / # <3>[   14.997271] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-03-14T11:37:04.559368  . /lava-3410331/environment/lava-3410331/bi=
n/lava-test-runner /lava-3410331/1
    2023-03-14T11:37:04.561088  =

    2023-03-14T11:37:04.565925  / # /lava-3410331/bin/lava-test-runner /lav=
a-3410331/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/64105cf71822e126678c8650

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105cf71822e126678c8659
        failing since 55 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-14T11:39:13.930763  <8>[   16.661612] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3410408_1.5.2.4.1>
    2023-03-14T11:39:14.042029  / # #
    2023-03-14T11:39:14.145849  export SHELL=3D/bin/sh
    2023-03-14T11:39:14.146879  #
    2023-03-14T11:39:14.249204  / # export SHELL=3D/bin/sh. /lava-3410408/e=
nvironment
    2023-03-14T11:39:14.250420  =

    2023-03-14T11:39:14.352830  / # . /lava-3410408/environment/lava-341040=
8/bin/lava-test-runner /lava-3410408/1
    2023-03-14T11:39:14.354756  =

    2023-03-14T11:39:14.359593  / # /lava-3410408/bin/lava-test-runner /lav=
a-3410408/1
    2023-03-14T11:39:14.443741  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64105d8ad2a33e4e468c863e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105d8ad2a33e4e468c8647
        failing since 55 days (last pass: v6.1-13341-g16cba743aec0, first f=
ail: v6.2-rc4-302-g48ed69cf21b2)

    2023-03-14T11:41:34.388602  + set +x<8>[   15.283831] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3410416_1.5.2.4.1>
    2023-03-14T11:41:34.389242  =

    2023-03-14T11:41:34.499146  / # #
    2023-03-14T11:41:34.602692  export SHELL=3D/bin/sh
    2023-03-14T11:41:34.603542  #
    2023-03-14T11:41:34.705422  / # export SHELL=3D/bin/sh. /lava-3410416/e=
nvironment
    2023-03-14T11:41:34.706566  =

    2023-03-14T11:41:34.808869  / # . /lava-3410416/environment/lava-341041=
6/bin/lava-test-runner /lava-3410416/1
    2023-03-14T11:41:34.809888  =

    2023-03-14T11:41:34.814830  / # /lava-3410416/bin/lava-test-runner /lav=
a-3410416/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 2          =


  Details:     https://kernelci.org/test/plan/id/64105a0df099b931a28c862f

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64105a0df099b93=
1a28c8632
        failing since 11 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-13370-g5872d227b73f)
        30 lines

    2023-03-14T11:26:22.331470  kern  :alert : Register r6 information: NUL=
L pointer
    2023-03-14T11:26:22.376247  kern  :alert : Register r7 information: non=
-paged memory
    2023-03-14T11:26:22.376493  kern  :alert : Register r8 information: sla=
b kmalloc-512 start c4e3c200 pointer offset 4 size 512
    2023-03-14T11:26:22.376671  kern  :alert : Register r9 information: non=
-paged memory
    2023-03-14T11:26:22.376822  kern  :alert : Register r10 information: NU=
LL pointer
    2023-03-14T11:26:22.376966  kern  :alert : Register r11 information: 5-=
page vmalloc region starting at 0xbf470000 allocated at load_module+0x898/0=
x1b10
    2023-03-14T11:26:22.379382  kern  :alert : Register r12 information: no=
n-paged memory
    2023-03-14T11:26:22.468347  kern  :emerg : Internal error: Oops: 17 [#1=
] PREEMPT ARM
    2023-03-14T11:26:22.468827  kern  :emerg : Process udevd (pid: 66, stac=
k limit =3D 0xb0748807)
    2023-03-14T11:26:22.469008  kern  :emerg : Stack: (0xc8905cf8 to 0xc890=
6000) =

    ... (8 line(s) more)  =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64105a0df099b93=
1a28c8633
        failing since 414 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        18 lines

    2023-03-14T11:26:22.285430  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-03-14T11:26:22.286196  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800
    2023-03-14T11:26:22.286726  kern  :alert : 8<--- cut here ---
    2023-03-14T11:26:22.287202  kern  :alert : Unable to handle kernel NULL=
 pointer dereference at virtual address 00000060 when read
    2023-03-14T11:26:22.287670  kern  :alert : [00000060] *pgd=3Dc4a06831, =
*pte=3D00000000, *ppte=3D00000000
    2023-03-14T11:26:22.288137  kern  :alert : Register r0 information: non=
-paged memory
    2023-03-14T11:26:22.328354  kern  :alert : Register r1 information: 2-p=
age vmalloc region starting at 0xc8904000 allocated at kernel_clone+0x98/0x=
3a0
    2023-03-14T11:26:22.328604  kern  :alert : Register r2 information: non=
-slab/vmalloc memory
    2023-03-14T11:26:22.328785  kern  :alert : Register r3 information: non=
-paged memory
    2023-03-14T11:26:22.328935  kern  :alert : R<8><LAVA_SIGNAL_TESTCASE TE=
ST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D18> =

    ... (2 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6qp-wandboard-revd1       | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64105fda15975204028c869f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-pengutronix/baselin=
e-imx6qp-wandboard-revd1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64105fda15975204028c8=
6a0
        failing since 180 days (last pass: v6.0-rc4-291-g83a56f559828, firs=
t fail: v6.0-rc5-197-ga6a750a2f4166) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6sx-sdb                   | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64105c312f53fa75868c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx6s=
x-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105c312f53fa75868c8637
        failing since 68 days (last pass: v6.1-rc4-405-g5cc6cef624e2, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-14T11:36:00.575533  <8>[   47.405746] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1172411_1.5.2.4.1>
    2023-03-14T11:36:00.681265  / # #
    2023-03-14T11:36:01.840309  export SHELL=3D/bin/sh
    2023-03-14T11:36:01.845853  #
    2023-03-14T11:36:03.393106  / # export SHELL=3D/bin/sh. /lava-1172411/e=
nvironment
    2023-03-14T11:36:03.398819  =

    2023-03-14T11:36:06.221437  / # . /lava-1172411/environment/lava-117241=
1/bin/lava-test-runner /lava-1172411/1
    2023-03-14T11:36:06.227495  =

    2023-03-14T11:36:06.239675  / # /lava-1172411/bin/lava-test-runner /lav=
a-1172411/1
    2023-03-14T11:36:06.329464  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (21 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7d-sdb                    | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64105a5105e77fbee08c86af

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7d=
-sdb.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105a5105e77fbee08c86b6
        failing since 68 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-14T11:28:00.044001  + set<8>[   38.492787] <LAVA_SIGNAL_ENDRUN =
0_dmesg 1172410_1.5.2.4.1>
    2023-03-14T11:28:00.044177   +x
    2023-03-14T11:28:00.148079  / # #
    2023-03-14T11:28:01.306990  export SHELL=3D/bin/sh
    2023-03-14T11:28:01.312473  #
    2023-03-14T11:28:02.859396  / # export SHELL=3D/bin/sh. /lava-1172410/e=
nvironment
    2023-03-14T11:28:02.865105  =

    2023-03-14T11:28:05.687781  / # . /lava-1172410/environment/lava-117241=
0/bin/lava-test-runner /lava-1172410/1
    2023-03-14T11:28:05.693866  =

    2023-03-14T11:28:05.700311  / # /lava-1172410/bin/lava-test-runner /lav=
a-1172410/1 =

    ... (23 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx7ulp-evk                  | arm   | lab-nxp         | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/64105c0dc578c1646e8c86cf

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+crypto/gcc-10/lab-nxp/baseline-imx7u=
lp-evk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105c0dc578c1646e8c86d6
        failing since 68 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-03-14T11:34:58.474364  + set +x
    2023-03-14T11:34:58.475488  <8>[   67.082662] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 1172413_1.5.2.4.1>
    2023-03-14T11:34:58.585405  / # #
    2023-03-14T11:34:59.745226  export SHELL=3D/bin/sh
    2023-03-14T11:34:59.750887  #
    2023-03-14T11:34:59.751208  / # export SHELL=3D/bin/sh
    2023-03-14T11:35:01.297749  / # . /lava-1172413/environment
    2023-03-14T11:35:04.124360  /lava-1172413/bin/lava-test-runner /lava-11=
72413/1
    2023-03-14T11:35:04.130406  . /lava-1172413/environment
    2023-03-14T11:35:04.130695  / # /lava-1172413/bin/lava-test-runner /lav=
a-1172413/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64105a7091da7348178c865b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64105a7091da7348178c8=
65c
        failing since 318 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+ima                | 5          =


  Details:     https://kernelci.org/test/plan/id/64105b5a0aa460c9fb8c86e3

  Results:     90 PASS, 5 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm64/defconfig+ima/gcc-10/lab-kontron/baseline-kontron-kbo=
x-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105b5a0aa460c9fb8c86ea
        failing since 15 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T11:32:14.247941  <8>[   22.271100] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 294969_1.5.2.4.1>
    2023-03-14T11:32:14.353440  / # #
    2023-03-14T11:32:14.455350  export SHELL=3D/bin/sh
    2023-03-14T11:32:14.455806  <6>[   22.329123] fsl_enetc 0000:00:00.2: e=
nabling device (0400 -> 0402)
    2023-03-14T11:32:14.456099  #
    2023-03-14T11:32:14.456329  / # <6>[   22.405108] usb 1-1.6: new full-s=
peed USB device number 5 using xhci-hcd
    2023-03-14T11:32:14.456553  <6>[   22.445114] fsl_enetc 0000:00:00.6: e=
nabling device (0400 -> 0402)
    2023-03-14T11:32:14.557889  export SHELL=3D/bin/sh. /lava-294969/enviro=
nment
    2023-03-14T11:32:14.558459  =

    2023-03-14T11:32:14.558737  / # <3>[   22.547366] hid-generic 0003:064F=
:2AF9.0003: device has no listeners, quitting =

    ... (25 line(s) more)  =


  * baseline.bootrr.fsl_enetc-enetc2-probed: https://kernelci.org/test/case=
/id/64105b5a0aa460c9fb8c86ee
        failing since 15 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T11:32:16.830477  /lava-294969/1/../bin/lava-test-case
    2023-03-14T11:32:16.830851  <8>[   24.839369] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc2-probed RESULT=3Dfail>
    2023-03-14T11:32:16.831092  /lava-294969/1/../bin/lava-test-case   =


  * baseline.bootrr.mscc_felix-probed: https://kernelci.org/test/case/id/64=
105b5a0aa460c9fb8c86f0
        failing since 15 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T11:32:17.890708  /lava-294969/1/../bin/lava-test-case
    2023-03-14T11:32:17.891097  <8>[   25.879162] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dmscc_felix-probed RESULT=3Dfail>
    2023-03-14T11:32:17.891338  /lava-294969/1/../bin/lava-test-case
    2023-03-14T11:32:17.891563  <8>[   25.895936] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dleds-gpio-driver-present RESULT=3Dpass>   =


  * baseline.bootrr.fsl_enetc-enetc0-probed: https://kernelci.org/test/case=
/id/64105b5a0aa460c9fb8c86f5
        failing since 15 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T11:32:18.964485  /lava-294969/1/../bin/lava-test-case   =


  * baseline.bootrr.fsl_enetc-enetc1-probed: https://kernelci.org/test/case=
/id/64105b5a0aa460c9fb8c86f6
        failing since 15 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T11:32:18.967633  <8>[   26.991083] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dfsl_enetc-enetc0-probed RESULT=3Dfail>
    2023-03-14T11:32:20.026805  /lava-294969/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64105b3cb26eae3ab68c8641

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a=
-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-g12a=
-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105b3cb26eae3ab68c864a
        failing since 15 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T11:31:52.222628  + set +x<8>[   18.063315] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3410364_1.5.2.4.1>
    2023-03-14T11:31:52.326820  / # #
    2023-03-14T11:31:52.428918  export SHELL=3D/bin/sh
    2023-03-14T11:31:52.429332  #
    2023-03-14T11:31:52.530747  / # export SHELL=3D/bin/sh. /lava-3410364/e=
nvironment
    2023-03-14T11:31:52.531210  =

    2023-03-14T11:31:52.531447  / # <3>[   18.308984] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-14T11:31:52.632833  . /lava-3410364/environment/lava-3410364/bi=
n/lava-test-runner /lava-3410364/1
    2023-03-14T11:31:52.634159  =

    2023-03-14T11:31:52.638672  / # /lava-3410364/bin/lava-test-runner /lav=
a-3410364/1 =

    ... (15 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64105b65a84e8267188c8630

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb=
-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxbb=
-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105b65a84e8267188c8639
        failing since 15 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T11:32:22.739274  + set +x<8>[   18.398091] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3410350_1.5.2.4.1>
    2023-03-14T11:32:22.739508  =

    2023-03-14T11:32:22.844924  / # #
    2023-03-14T11:32:22.946802  export SHELL=3D/bin/sh
    2023-03-14T11:32:22.947202  #
    2023-03-14T11:32:23.048574  / # export SHELL=3D/bin/sh. /lava-3410350/e=
nvironment
    2023-03-14T11:32:23.049100  =

    2023-03-14T11:32:23.150444  / # . /lava-3410350/environment/lava-341035=
0/bin/lava-test-runner /lava-3410350/1
    2023-03-14T11:32:23.151058  =

    2023-03-14T11:32:23.156087  / # /lava-3410350/bin/lava-test-runner /lav=
a-3410350/1 =

    ... (17 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-nanopi-k2         | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 3          =


  Details:     https://kernelci.org/test/plan/id/64105be163a69e1c358c8652

  Results:     3 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxbb-nanopi-k2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxbb-nanopi-k2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64be/rootfs.cpio.gz =



  * baseline.dmesg.emerg: https://kernelci.org/test/case/id/64105be163a69e1=
c358c8655
        new failure (last pass: v6.3-rc1-336-gbec2983895c5)
        2 lines

    2023-03-14T11:34:36.336649  kern  :alert :   EC =3D 0x25: DABT (current=
 EL), IL =3D 32 bits
    2023-03-14T11:34:36.336894  kern  :alert :   SET =3D 0, FnV =3D 0
    2023-03-14T11:34:36.337155  kern  :alert :   <8>[   18.799075] <LAVA_SI=
GNAL_TESTCASE TEST_CASE_ID=3Demerg RESULT=3Dfail UNITS=3Dlines MEASUREMENT=
=3D2>
    2023-03-14T11:34:36.337414  EA =3D 0, S1P<8>[   18.808655] <LAVA_SIGNAL=
_ENDRUN 0_dmesg 3410384_1.5.2.4.1>
    2023-03-14T11:34:36.337669  TW =3D 0   =


  * baseline.dmesg.alert: https://kernelci.org/test/case/id/64105be163a69e1=
c358c8656
        new failure (last pass: v6.3-rc1-336-gbec2983895c5)
        12 lines

    2023-03-14T11:34:36.334666  kern  <8>[   18.777413] <LAVA_SIGNAL_TESTCA=
SE TEST_CASE_ID=3Dalert RESULT=3Dfail UNITS=3Dlines MEASUREMENT=3D12>
    2023-03-14T11:34:36.334985  :alert : Mem abort info:
    2023-03-14T11:34:36.335267  kern  :alert :   ESR =3D 0x0000000096000005=
   =


  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105be163a69e1c358c865b
        failing since 18 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-14T11:34:36.340782  kern  :alert :   FSC =3D 0x05: level 1 tran=
slation fault
    2023-03-14T11:34:36.341027  kern  :alert : Data abort info:
    2023-03-14T11:34:36.381939  kern  :alert :   ISV =3D 0, ISS =3D 0x00000=
005
    2023-03-14T11:34:36.382594  kern  :alert :   CM =3D 0, WnR =3D 0
    2023-03-14T11:34:36.382840  kern  :alert : swapper pgtable: 4k pages, 4=
8-bit VAs, pgdp=3D000000000991b000
    2023-03-14T11:34:36.383108  kern  :alert : [ffff804001233574] pgd=3D100=
000007ffff003, p4d=3D100000007ffff003, pud=3D0000000000000000
    2023-03-14T11:34:36.383369  kern  :emerg : Internal error: Oops: 000000=
0096000005 [#1] PREEMPT SMP
    2023-03-14T11:34:36.385595  kern  :emerg : Code: f9001bf7 9ac324c6 5100=
0484 aa6607f6 (b9400021) =

    2023-03-14T11:34:36.385860  + set +x
    2023-03-14T11:34:36.489873  / # # =

    ... (25 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64105b6aa27571f9b88c863e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-=
s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-gxl-=
s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105b6aa27571f9b88c8647
        failing since 15 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T11:32:24.981858  / # #
    2023-03-14T11:32:25.083555  export SHELL=3D/bin/sh
    2023-03-14T11:32:25.084047  #
    2023-03-14T11:32:25.185575  / # export SHELL=3D/bin/sh. /lava-3410362/e=
nvironment
    2023-03-14T11:32:25.186176  =

    2023-03-14T11:32:25.287768  / # . /lava-3410362/environment/lava-341036=
2/bin/lava-test-runner /lava-3410362/1
    2023-03-14T11:32:25.288450  =

    2023-03-14T11:32:25.293084  / # /lava-3410362/bin/lava-test-runner /lav=
a-3410362/1
    2023-03-14T11:32:25.371993  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-14T11:32:25.372622  + cd /lava-3410362/1/tests/1_bootrr =

    ... (9 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxl-s805x-libretech-ac | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64105bef343ab908638c863a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxl-s805x-libretech-ac.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-gxl-s805x-libretech-ac.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105bef343ab908638c8643
        failing since 18 days (last pass: v6.2-1218-g2d4a54ee969d, first fa=
il: v6.2-8700-gab98cc06b683)

    2023-03-14T11:34:46.142762  / # #
    2023-03-14T11:34:46.244519  export SHELL=3D/bin/sh
    2023-03-14T11:34:46.245039  #
    2023-03-14T11:34:46.346436  / # export SHELL=3D/bin/sh. /lava-3410392/e=
nvironment
    2023-03-14T11:34:46.346956  =

    2023-03-14T11:34:46.448490  / # . /lava-3410392/environment/lava-341039=
2/bin/lava-test-runner /lava-3410392/1
    2023-03-14T11:34:46.449272  =

    2023-03-14T11:34:46.453844  / # /lava-3410392/bin/lava-test-runner /lav=
a-3410392/1
    2023-03-14T11:34:46.531775  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-14T11:34:46.532376  + cd /lava-3410392/1/tests/1_bootrr =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON...BIG_ENDIAN=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64105ca7900e08be7d8c8689

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm64/defconfig+CONFIG_CPU_BIG_ENDIAN=3Dy/gcc-10/lab-baylib=
re/baseline-meson-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64be/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105ca7900e08be7d8c8692
        new failure (last pass: v6.3-rc1-336-gbec2983895c5)

    2023-03-14T11:37:54.485761  / # #
    2023-03-14T11:37:54.587374  export SHELL=3D/bin/sh
    2023-03-14T11:37:54.587771  #
    2023-03-14T11:37:54.587948  / # <3>[   18.774885] mmc2: tuning executio=
n failed: -5
    2023-03-14T11:37:54.588091  <3>[   18.774937] mmc2: error -5 whilst ini=
tialising SDIO card
    2023-03-14T11:37:54.689193  export SHELL=3D/bin/sh. /lava-3410387/envir=
onment
    2023-03-14T11:37:54.689590  =

    2023-03-14T11:37:54.790894  / # . /lava-3410387/environment/lava-341038=
7/bin/lava-test-runner /lava-3410387/1
    2023-03-14T11:37:54.791663  =

    2023-03-14T11:37:54.803739  / # /lava-3410387/bin/lava-test-runner /lav=
a-3410387/1 =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+ima                | 1          =


  Details:     https://kernelci.org/test/plan/id/64105b3eb26eae3ab68c864e

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+ima
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-=
sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm64/defconfig+ima/gcc-10/lab-baylibre/baseline-meson-sm1-=
sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/64105b3eb26eae3ab68c8657
        failing since 15 days (last pass: v6.2-rc8-211-g05def2d212c6, first=
 fail: v6.2-12625-g13efc3a9f23b)

    2023-03-14T11:31:51.494203  / # #
    2023-03-14T11:31:51.596109  export SHELL=3D/bin/sh
    2023-03-14T11:31:51.596619  #
    2023-03-14T11:31:51.697940  / # export SHELL=3D/bin/sh. /lava-3410368/e=
nvironment
    2023-03-14T11:31:51.698386  =

    2023-03-14T11:31:51.698623  / # <3>[   18.176628] brcmfmac: brcmf_sdio_=
htclk: HT Avail timeout (1000000): clkctl 0x50
    2023-03-14T11:31:51.799911  . /lava-3410368/environment/lava-3410368/bi=
n/lava-test-runner /lava-3410368/1
    2023-03-14T11:31:51.800625  =

    2023-03-14T11:31:51.816592  / # /lava-3410368/bin/lava-test-runner /lav=
a-3410368/1
    2023-03-14T11:31:51.871548  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/64105ab0f7df7918cd8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64105ab0f7df7918cd8c8=
630
        failing since 153 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64105efacb9eb0ba8f8c8678

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64105efacb9eb0ba8f8c8=
679
        failing since 153 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6410604d756aa18b8b8c8658

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410604d756aa18b8b8c8=
659
        failing since 153 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64105ef7bf8db114908c8675

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64105ef7bf8db114908c8=
676
        failing since 153 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv2-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64106024469ade90978c867d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv2-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64106024469ade90978c8=
67e
        failing since 153 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64105ef6cb9eb0ba8f8c8674

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64105ef6cb9eb0ba8f8c8=
675
        failing since 153 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3          | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64105ffc76a972c92f8c8652

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64105ffc76a972c92f8c8=
653
        failing since 153 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/64105ef943f5918a4a8c8634

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-baylibre/baseline-q=
emu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64105ef943f5918a4a8c8=
635
        failing since 153 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-virt-gicv3-uefi     | arm   | lab-broonie     | gcc-10   | multi_v=
7_defconfig+debug     | 1          =


  Details:     https://kernelci.org/test/plan/id/6410603976430bbf178c867f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+debug
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+debug/gcc-10/lab-broonie/baseline-qe=
mu_arm-virt-gicv3-uefi.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410603976430bbf178c8=
680
        failing since 153 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
r8a7743-iwg20d-q7            | arm   | lab-cip         | gcc-10   | shmobil=
e_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/6410577807534f3dbe8c8646

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: shmobile_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/shmobile_defconfig/gcc-10/lab-cip/baseline-r8a7743-iwg2=
0d-q7.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/6410577807534f3dbe8c8=
647
        failing since 6 days (last pass: v6.3-rc1-156-g1bb628591feb, first =
fail: v6.3-rc1-217-g03913bd4e939) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64105b017c5ed10eab8c862f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64105b017c5ed10eab8c8=
630
        failing since 89 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/641059c32caa74eec18c86aa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/641059c32caa74eec18c8=
6ab
        failing since 89 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-h2-plus-orangepi-zero  | arm   | lab-baylibre    | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/641058b7a81c0314f48c86cc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/sunxi_defconfig/gcc-10/lab-baylibre/baseline-sun8i-h2-p=
lus-orangepi-zero.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/641058b7a81c0314f48c86d5
        failing since 11 days (last pass: v6.2-12625-g13efc3a9f23b, first f=
ail: v6.2-13370-g5872d227b73f)

    2023-03-14T11:21:01.710198  / # #
    2023-03-14T11:21:01.816361  export SHELL=3D/bin/sh
    2023-03-14T11:21:01.818011  #
    2023-03-14T11:21:01.921591  / # export SHELL=3D/bin/sh. /lava-3410246/e=
nvironment
    2023-03-14T11:21:01.923349  =

    2023-03-14T11:21:02.027305  / # . /lava-3410246/environment/lava-341024=
6/bin/lava-test-runner /lava-3410246/1
    2023-03-14T11:21:02.030207  =

    2023-03-14T11:21:02.047701  / # /lava-3410246/bin/lava-test-runner /lav=
a-3410246/1
    2023-03-14T11:21:02.191550  + export 'TESTRUN_ID=3D1_bootrr'
    2023-03-14T11:21:02.193301  + cd /lava-3410246/1/tests/1_bootrr =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/64105a27612fa980668c8633

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.3-rc2-25=
4-g7f35d1f08bb0/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230310.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/64105a27612fa980668c8=
634
        failing since 88 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =20
