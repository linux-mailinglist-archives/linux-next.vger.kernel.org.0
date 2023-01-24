Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17EF2679495
	for <lists+linux-next@lfdr.de>; Tue, 24 Jan 2023 10:54:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233224AbjAXJyg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Jan 2023 04:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233151AbjAXJyf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Jan 2023 04:54:35 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786721BDE
        for <linux-next@vger.kernel.org>; Tue, 24 Jan 2023 01:54:31 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id z13so14201006plg.6
        for <linux-next@vger.kernel.org>; Tue, 24 Jan 2023 01:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ci9IU6YBdcXJGjIhSVfMTNqjPDFfDwTtGzEqBYqDqpU=;
        b=hVPKXV7MnyrJJuUG3mN+KPzWttmxv6OGYLJTkWL/ic3AMnguSQiK+e+BjvFLkdxtmZ
         D7q9OjKjR03NUo1SkFgDQwAktN3M5AqtB/p4Kk61Erd9dB/Xa1tUzAsva+C/8341L55p
         BYANtk2oKYXzZSeCckHB8yhEzU3tAsj5EiXXJgAZtvA5z79OUZr2Phv2QTLPE2o3w3+H
         3vVxKYc/7KfXrpQLehI8E/tpewTP9Yn1dsX2rXrOszxdBRliORrh/c+1SgfGZXv9bf4t
         OXNCiua4SYSHRiJlhzaCrXsOLwGYGo3jyjzQXHAg7uZIl6t1TWLKEe1gWxLjZP/Qjuy2
         zNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ci9IU6YBdcXJGjIhSVfMTNqjPDFfDwTtGzEqBYqDqpU=;
        b=x66BfwmmdGqcxU6AHSEiPiRh5LRNfftlTGasn36N2Kw1X1eP+oVvI0HjOpZJx9AQss
         XhsVuLkdYS0XtpYs/xK0ZbkaKrWwuAzxSoR4lx06DQ5QQoKLiSwcO3DQ1lWkyb/0Hblu
         6uuITpBsBJCASjUizuS+0x4GuCeHsyx1xYfE7h8nqKbSoB0A2g93qFKQAj2oCVSn9ClH
         pdLio8xNHLUS7RLOXwppsXjHAfsKev6ohG3CUP37twBTuadYMw41g9/71gqhCoCPvcXk
         GAioFwdcd339D3+hL87LwQyehjPCFtKTrvy6uX5JPryk1QOGuzka84oh5TlOdjsFOKlV
         b5Dg==
X-Gm-Message-State: AFqh2kpEvx/eLAIqATg06q6NdRrJAFjxuO+fjoZRLm7la7ssBUbvQTXO
        J6ibKnXh8CSRi8flbKd1rR055nVV9sqX0jXmh54=
X-Google-Smtp-Source: AMrXdXuOVEfm8QiugDyJ4kS+k++Ou6La7FbdqARaMkbxlLOrrn4BVZOEjaDrx9qY7YMPaPvY1pUOyA==
X-Received: by 2002:a17:903:2306:b0:194:6e8d:89ac with SMTP id d6-20020a170903230600b001946e8d89acmr40579763plh.24.1674554070007;
        Tue, 24 Jan 2023 01:54:30 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id je12-20020a170903264c00b00192588bcce7sm1245336plb.125.2023.01.24.01.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 01:54:29 -0800 (PST)
Message-ID: <63cfaad5.170a0220.ac9e7.2424@mx.google.com>
Date:   Tue, 24 Jan 2023 01:54:29 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: pending-fixes
X-Kernelci-Kernel: v6.2-rc5-174-gc5f142de047d
X-Kernelci-Report-Type: test
Subject: next/pending-fixes baseline: 716 runs,
 30 regressions (v6.2-rc5-174-gc5f142de047d)
To:     linux-next@vger.kernel.org, kernel-build-reports@lists.linaro.org,
        kernelci-results@groups.io
From:   "kernelci.org bot" <bot@kernelci.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

next/pending-fixes baseline: 716 runs, 30 regressions (v6.2-rc5-174-gc5f142=
de047d)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =

beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =

fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =

imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =

jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =

mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =

ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =

qemu_mips-malta              | mips  | lab-collabora   | gcc-10   | malta_d=
efconfig              | 1          =

rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =

sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =

sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =

tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:  https://kernelci.org/test/job/next/branch/pending-fixes/kernel/=
v6.2-rc5-174-gc5f142de047d/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   pending-fixes
  Describe: v6.2-rc5-174-gc5f142de047d
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      c5f142de047d84593e76201356647dbc696fa7aa =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf6ae5d84ff7cd3d915f7f

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-linaro-lkf=
t/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf6ae5d84ff7cd3d915=
f80
        failing since 106 days (last pass: v6.0-6424-g1af0c6a154d32, first =
fail: v6.0-9666-g02c05e0b8d5c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
bcm2836-rpi-2-b              | arm   | lab-collabora   | gcc-10   | bcm2835=
_defconfig            | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf63bcae4df4f6b2915ef8

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: bcm2835_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/bcm2835_defconfig/gcc-10/lab-collabora/baseline-bcm2836=
-rpi-2-b.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf63bcae4df4f6b2915efd
        failing since 12 days (last pass: v6.2-rc3-243-g3145d9dfed32, first=
 fail: v6.2-rc3-296-g79fa898551af)

    2023-01-24T04:50:52.583008  / # #
    2023-01-24T04:50:52.685956  export SHELL=3D/bin/sh
    2023-01-24T04:50:52.686705  #
    2023-01-24T04:50:52.788743  / # export SHELL=3D/bin/sh. /lava-8848283/e=
nvironment
    2023-01-24T04:50:52.789489  =

    2023-01-24T04:50:52.891549  / # . /lava-8848283/environment/lava-884828=
3/bin/lava-test-runner /lava-8848283/1
    2023-01-24T04:50:52.892800  =

    2023-01-24T04:50:52.903646  / # /lava-8848283/bin/lava-test-runner /lav=
a-8848283/1
    2023-01-24T04:50:53.018387  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T04:50:53.018873  + cd /lava-8848283/1/tests/1_bootrr =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf68e8bf1458fc59915f11

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf68e8bf1458fc59915=
f12
        failing since 2 days (last pass: v6.2-rc4-412-g665ddd640630, first =
fail: v6.2-rc4-480-gb1867226dfbb) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf6813171fbd90a6915f5c

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
baylibre/baseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf6813171fbd90a6915f61
        failing since 6 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-24T05:09:22.234774  <8>[   15.178549] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3195228_1.5.2.4.1>
    2023-01-24T05:09:22.345029  / # #
    2023-01-24T05:09:22.446647  export SHELL=3D/bin/sh
    2023-01-24T05:09:22.447083  #
    2023-01-24T05:09:22.548417  / # export SHELL=3D/bin/sh. /lava-3195228/e=
nvironment
    2023-01-24T05:09:22.549205  =

    2023-01-24T05:09:22.651128  / # . /lava-3195228/environment/lava-319522=
8/bin/lava-test-runner /lava-3195228/1
    2023-01-24T05:09:22.652245  =

    2023-01-24T05:09:22.652593  / # <3>[   15.531082] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-01-24T05:09:22.706702  /lava-3195228/bin/lava-test-runner /lava-31=
95228/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf68a2bbc595fbe8915eda

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+ima/gcc-10/lab-baylibre/baseline-cub=
ietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf68a2bbc595fbe8915edf
        failing since 6 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-24T05:11:48.931667  + set +x<8>[   14.886961] <LAVA_SIGNAL_ENDR=
UN 0_dmesg 3195258_1.5.2.4.1>
    2023-01-24T05:11:48.931876  =

    2023-01-24T05:11:49.038057  / # #
    2023-01-24T05:11:49.139494  export SHELL=3D/bin/sh
    2023-01-24T05:11:49.139824  #
    2023-01-24T05:11:49.240932  / # export SHELL=3D/bin/sh. /lava-3195258/e=
nvironment
    2023-01-24T05:11:49.241268  =

    2023-01-24T05:11:49.342463  / # . /lava-3195258/environment/lava-319525=
8/bin/lava-test-runner /lava-3195258/1
    2023-01-24T05:11:49.343582  =

    2023-01-24T05:11:49.343867  / # /lava-3195258/bin/lava-test-runner /lav=
a-3195258/1<3>[   15.288594] Bluetooth: hci0: command 0x0c03 tx timeout =

    ... (13 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf6946889371af2a915ebc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig/gcc-10/lab-baylibre/baseline-cubietr=
uck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf6946889371af2a915ec1
        failing since 6 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-24T05:14:24.448059  <8>[   16.455939] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3195290_1.5.2.4.1>
    2023-01-24T05:14:24.558684  / # #
    2023-01-24T05:14:24.661769  export SHELL=3D/bin/sh
    2023-01-24T05:14:24.662713  #
    2023-01-24T05:14:24.764856  / # export SHELL=3D/bin/sh. /lava-3195290/e=
nvironment
    2023-01-24T05:14:24.765876  =

    2023-01-24T05:14:24.766394  / # <3>[   16.727993] Bluetooth: hci0: comm=
and 0x0c03 tx timeout
    2023-01-24T05:14:24.868544  . /lava-3195290/environment/lava-3195290/bi=
n/lava-test-runner /lava-3195290/1
    2023-01-24T05:14:24.870497  =

    2023-01-24T05:14:24.875322  / # /lava-3195290/bin/lava-test-runner /lav=
a-3195290/1 =

    ... (12 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf6b715462e202a9915ef1

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-baylibre/b=
aseline-cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf6b715462e202a9915ef6
        failing since 6 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-24T05:23:36.216612  <8>[   16.617173] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3195381_1.5.2.4.1>
    2023-01-24T05:23:36.323428  / # #
    2023-01-24T05:23:36.424959  export SHELL=3D/bin/sh
    2023-01-24T05:23:36.425318  #
    2023-01-24T05:23:36.526477  / # export SHELL=3D/bin/sh. /lava-3195381/e=
nvironment
    2023-01-24T05:23:36.526919  =

    2023-01-24T05:23:36.628266  / # . /lava-3195381/environment/lava-319538=
1/bin/lava-test-runner /lava-3195381/1
    2023-01-24T05:23:36.628781  =

    2023-01-24T05:23:36.633294  / # /lava-3195381/bin/lava-test-runner /lav=
a-3195381/1
    2023-01-24T05:23:36.714452  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (10 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
cubietruck                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf6cf2881918e724915ed3

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+crypto/gcc-10/lab-baylibre/baseline-=
cubietruck.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf6cf2881918e724915ed8
        failing since 6 days (last pass: v6.1-13341-g16cba743aec0, first fa=
il: v6.2-rc4-302-g48ed69cf21b2)

    2023-01-24T05:29:58.667869  <8>[   24.246634] <LAVA_SIGNAL_ENDRUN 0_dme=
sg 3195511_1.5.2.4.1>
    2023-01-24T05:29:58.776845  / # #
    2023-01-24T05:29:58.879541  export SHELL=3D/bin/sh
    2023-01-24T05:29:58.880534  #
    2023-01-24T05:29:58.982709  / # export SHELL=3D/bin/sh. /lava-3195511/e=
nvironment
    2023-01-24T05:29:58.983480  =

    2023-01-24T05:29:59.085079  / # . /lava-3195511/environment/lava-319551=
1/bin/lava-test-runner /lava-3195511/1
    2023-01-24T05:29:59.086317  =

    2023-01-24T05:29:59.091077  / # /lava-3195511/bin/lava-test-runner /lav=
a-3195511/1
    2023-01-24T05:29:59.184127  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
da850-lcdk                   | arm   | lab-baylibre    | gcc-10   | davinci=
_all_defconfig        | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf67179d233b3b9e915f28

  Results:     4 PASS, 2 FAIL, 1 SKIP
  Full config: davinci_all_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/davinci_all_defconfig/gcc-10/lab-baylibre/baseline-da85=
0-lcdk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.dmesg.alert: https://kernelci.org/test/case/id/63cf67179d233b3=
b9e915f30
        failing since 365 days (last pass: v5.16-11577-gffd79fec234d, first=
 fail: v5.17-rc1-180-g86539e2bdb99)
        3 lines

    2023-01-24T05:05:11.971576  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3000
    2023-01-24T05:05:11.971837  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3400
    2023-01-24T05:05:11.974668  kern  :alert : BUG: Bad page state in proce=
ss kworker/u2:0  pfn:c3800   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
fsl-ls1088a-rdb              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf6ea68f2a909a72915efe

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm64/defconfig+debug/gcc-10/lab-nxp/baseline-fsl-ls1088a-r=
db.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf6ea68f2a909a72915=
eff
        failing since 29 days (last pass: v6.1-rc6-391-gf445421fe4c7, first=
 fail: v6.2-rc1-87-g81c29d2c4600) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6dl-udoo                  | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf664165f046d1c9915ed6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6dl-=
udoo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf664165f046d1c9915=
ed7
        failing since 138 days (last pass: v5.19-rc5-383-g73ad9bd963c1, fir=
st fail: v6.0-rc4-291-g83a56f559828) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6q-udoo                   | arm   | lab-broonie     | gcc-10   | imx_v6_=
v7_defconfig          | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf65de68851caaa0915efa

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: imx_v6_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/imx_v6_v7_defconfig/gcc-10/lab-broonie/baseline-imx6q-u=
doo.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf65de68851caaa0915=
efb
        failing since 140 days (last pass: v6.0-rc3-415-gf29d411eb4af, firs=
t fail: v6.0-rc4-270-gdea3dab2e6fc) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
jetson-tk1                   | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf68e9bf1458fc59915f1b

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-baylibre/baseline-jetson-tk1.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf68e9bf1458fc59915=
f1c
        failing since 269 days (last pass: v5.18-rc2-366-ga3e1163f7eb1a, fi=
rst fail: v5.18-rc4-464-g425675974eb3) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12a-sei510            | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf6d38de3db05c52915f9d

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-sei510.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12a-sei510.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf6d38de3db05c52915=
f9e
        failing since 5 days (last pass: v6.2-rc4-350-g5ce527a369f5, first =
fail: v6.2-rc4-412-g665ddd640630) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-g12b-a311d-khadas-vim3 | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf6d4be163792a42915f7a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-a311d-khadas-vim3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-g12b-a311d-khadas-vim3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf6d4be163792a42915=
f7b
        failing since 5 days (last pass: v6.2-rc4-350-g5ce527a369f5, first =
fail: v6.2-rc4-412-g665ddd640630) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-khadas-vim3l       | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf6ed75901dc1b4f915ecc

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-sm1-khadas-vim3l.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-sm1-khadas-vim3l.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf6ed75901dc1b4f915=
ecd
        failing since 5 days (last pass: v6.2-rc4-350-g5ce527a369f5, first =
fail: v6.2-rc4-412-g665ddd640630) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-sm1-sei610             | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+kselftest          | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf6e036e13842cde915f36

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-sm1-sei610.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm64/defconfig+kselftest/gcc-10/lab-baylibre/baseline-meso=
n-sm1-sei610.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf6e036e13842cde915=
f37
        failing since 5 days (last pass: v6.2-rc4-350-g5ce527a369f5, first =
fail: v6.2-rc4-412-g665ddd640630) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
mt8173-elm-hana              | arm64 | lab-collabora   | gcc-10   | defconf=
ig+arm...ok+kselftest | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf6c3e4c7f2917d0915ed9

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+arm64-chromebook+kselftest
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm64/defconfig+arm64-chromebook+kselftest/gcc-10/lab-colla=
bora/baseline-mt8173-elm-hana.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf6c3e4c7f2917d0915=
eda
        new failure (last pass: v6.2-rc5-157-g1f16e03afb18) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
ox820-clouden...lug-series-3 | arm   | lab-baylibre    | gcc-10   | oxnas_v=
6_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf67bebb3cb3c794915ef6

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: oxnas_v6_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/oxnas_v6_defconfig/gcc-10/lab-baylibre/baseline-ox820-c=
loudengines-pogoplug-series-3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf67bebb3cb3c794915=
ef7
        failing since 104 days (last pass: v6.0-9666-g02c05e0b8d5c, first f=
ail: v6.0-11312-g1778d6da389c) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_mips-malta              | mips  | lab-collabora   | gcc-10   | malta_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf679edb73c724f7915f08

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: malta_defconfig
  Compiler:    gcc-10 (mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/mips/malta_defconfig/gcc-10/lab-collabora/baseline-qemu_mip=
s-malta.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/mipsel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf679edb73c724f7915=
f09
        new failure (last pass: v6.2-rc5-157-g1f16e03afb18) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-rock2-square          | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf6c2fdcaf40f4a8915ee0

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-rock2-square.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf6c2fdcaf40f4a8915=
ee1
        failing since 39 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3288-veyron-jaq            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf6fda37dea749ac915ed3

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-rk3288-veyron-jaq.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf6fda37dea749ac915=
ed4
        failing since 39 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun50i-h5-lib...ch-all-h3-cc | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+debug              | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf6ea827458c6d78915edb

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+debug
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm64/defconfig+debug/gcc-10/lab-baylibre/baseline-sun50i-h=
5-libretech-all-h3-cc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf6ea827458c6d78915=
edc
        failing since 96 days (last pass: v6.0-10339-g565da9e84d8f, first f=
ail: v6.1-rc1-192-gdfe701541ba9) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf67dabc6ad18e8b915f09

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-=
clabbe/baseline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf67dabc6ad18e8b915f0c
        failing since 19 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-24T05:08:21.915235  [   19.172820] <LAVA_SIGNAL_ENDRUN 0_dmesg =
384425_1.5.2.4.1>
    2023-01-24T05:08:22.032363  / # #
    2023-01-24T05:08:22.134871  export SHELL=3D/bin/sh
    2023-01-24T05:08:22.135598  [   19.206206] usb-storage 1-1.1:1.0: USB M=
ass Storage device detected
    2023-01-24T05:08:22.135950  [   19.215187] scsi host0: usb-storage 1-1.=
1:1.0
    2023-01-24T05:08:22.136267  [   19.227855] usbcore: registered new inte=
rface driver uas
    2023-01-24T05:08:22.136561  #
    2023-01-24T05:08:22.238092  / # export SHELL=3D/bin/sh. /lava-384425/en=
vironment
    2023-01-24T05:08:22.238661  =

    2023-01-24T05:08:22.340104  / # . /lava-384425/environment/lava-384425/=
bin/lava-test-runner /lava-384425/1 =

    ... (26 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+ima       | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf682735167fc0df915eb9

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+ima
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+ima/gcc-10/lab-clabbe/baseline-sun8i=
-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf682735167fc0df915ebc
        failing since 19 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-24T05:09:51.234126  / # #
    2023-01-24T05:09:51.336487  export SHELL=3D/bin/sh
    2023-01-24T05:09:51.337163  #
    2023-01-24T05:09:51.438755  / # export SHELL=3D/bin/sh. /lava-384428/en=
vironment
    2023-01-24T05:09:51.439413  =

    2023-01-24T05:09:51.541108  / # . /lava-384428/environment/lava-384428/=
bin/lava-test-runner /lava-384428/1
    2023-01-24T05:09:51.542167  =

    2023-01-24T05:09:51.557096  / # /lava-384428/bin/lava-test-runner /lava=
-384428/1
    2023-01-24T05:09:51.672197  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T05:09:51.672958  + cd /lava-384428/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf68c76843603d1a915ebc

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83=
t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf68c76843603d1a915ebf
        failing since 19 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-24T05:12:31.422929  / # #
    2023-01-24T05:12:31.525139  export SHELL=3D/bin/sh
    2023-01-24T05:12:31.525805  #
    2023-01-24T05:12:31.627453  / # export SHELL=3D/bin/sh. /lava-384438/en=
vironment
    2023-01-24T05:12:31.628055  =

    2023-01-24T05:12:31.729751  / # . /lava-384438/environment/lava-384438/=
bin/lava-test-runner /lava-384438/1
    2023-01-24T05:12:31.730807  =

    2023-01-24T05:12:31.746218  / # /lava-384438/bin/lava-test-runner /lava=
-384438/1
    2023-01-24T05:12:31.863288  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T05:12:31.864010  + cd /lava-384438/1/tests/1_bootrr =

    ... (22 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defc...CONFIG_SMP=3Dn | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf6a943547b05847915ec0

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_SMP=3Dn
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/bas=
eline-sun8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_SMP=3Dn/gcc-10/lab-clabbe/bas=
eline-sun8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf6a943547b05847915ec3
        failing since 19 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-24T05:19:55.677490  [   20.944234] <LAVA_SIGNAL_ENDRUN 0_dmesg =
384452_1.5.2.4.1>
    2023-01-24T05:19:55.783155  / # #
    2023-01-24T05:19:55.885152  export SHELL=3D/bin/sh
    2023-01-24T05:19:55.885812  #
    2023-01-24T05:19:55.886074  / # export SHELL=3D/bin/sh[   21.133961] us=
b-storage 2-1.1:1.0: USB Mass Storage device detected
    2023-01-24T05:19:55.886288  [   21.144352] scsi host0: usb-storage 2-1.=
1:1.0
    2023-01-24T05:19:55.987856  . /lava-384452/environment
    2023-01-24T05:19:55.988553  =

    2023-01-24T05:19:55.988797  / # [   21.186655] usbcore: registered new =
interface driver uas
    2023-01-24T05:19:56.090087  . /lava-384452/environment/lava-384452/bin/=
lava-test-runner /lava-384452/1 =

    ... (26 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | multi_v=
7_defconfig+crypto    | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf6b865f9fd14f86915ed2

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+crypto
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+crypto/gcc-10/lab-clabbe/baseline-su=
n8i-a83t-bananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf6b865f9fd14f86915ed5
        failing since 19 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-24T05:23:57.907565  / # #
    2023-01-24T05:23:58.009795  export SHELL=3D/bin/sh
    2023-01-24T05:23:58.010445  #
    2023-01-24T05:23:58.112141  / # export SHELL=3D/bin/sh. /lava-384463/en=
vironment
    2023-01-24T05:23:58.112793  =

    2023-01-24T05:23:58.214526  / # . /lava-384463/environment/lava-384463/=
bin/lava-test-runner /lava-384463/1
    2023-01-24T05:23:58.215768  =

    2023-01-24T05:23:58.228639  / # /lava-384463/bin/lava-test-runner /lava=
-384463/1
    2023-01-24T05:23:58.351704  + export 'TESTRUN_ID=3D1_bootrr'
    2023-01-24T05:23:58.352197  + cd /lava-384463/1/tests/1_bootrr =

    ... (14 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
sun8i-a83t-bananapi-m3       | arm   | lab-clabbe      | gcc-10   | sunxi_d=
efconfig              | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf648ebbf6fd2e04915f0a

  Results:     5 PASS, 1 FAIL, 1 SKIP
  Full config: sunxi_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/sunxi_defconfig/gcc-10/lab-clabbe/baseline-sun8i-a83t-b=
ananapi-m3.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.deferred-probe-empty: https://kernelci.org/test/case/id=
/63cf648ebbf6fd2e04915f0d
        failing since 19 days (last pass: v6.0-rc5-224-g269f27f24a11, first=
 fail: v6.2-rc2-332-g2d3ca5d07c8e)

    2023-01-24T04:54:19.256417  [   16.463303] <LAVA_SIGNAL_ENDRUN 0_dmesg =
384406_1.5.2.4.1>
    2023-01-24T04:54:19.363041  / # #
    2023-01-24T04:54:19.465334  export SHELL=3D/bin/sh
    2023-01-24T04:54:19.465964  #
    2023-01-24T04:54:19.567572  / # export SHELL=3D/bin/sh. /lava-384406/en=
vironment
    2023-01-24T04:54:19.568213  =

    2023-01-24T04:54:19.669848  / # . /lava-384406/environment/lava-384406/=
bin/lava-test-runner /lava-384406/1
    2023-01-24T04:54:19.670890  =

    2023-01-24T04:54:19.687485  / # /lava-384406/bin/lava-test-runner /lava=
-384406/1
    2023-01-24T04:54:19.751356  + export 'TESTRUN_ID=3D1_bootrr' =

    ... (11 line(s) more)  =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
tegra124-nyan-big            | arm   | lab-collabora   | gcc-10   | multi_v=
7_defc...G_ARM_LPAE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/63cf69224db8ac5c64915edf

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.txt
  HTML log:    https://storage.kernelci.org//next/pending-fixes/v6.2-rc5-17=
4-gc5f142de047d/arm/multi_v7_defconfig+CONFIG_EFI=3Dy+CONFIG_ARM_LPAE=3Dy/g=
cc-10/lab-collabora/baseline-tegra124-nyan-big.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20230120.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/63cf69224db8ac5c64915=
ee0
        failing since 39 days (last pass: v6.1-6378-g44d433ee7540, first fa=
il: v6.1-10792-g244d284981da) =

 =20
