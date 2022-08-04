Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECE4D58A335
	for <lists+linux-next@lfdr.de>; Fri,  5 Aug 2022 00:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240206AbiHDWWa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Aug 2022 18:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239914AbiHDWWR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Aug 2022 18:22:17 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9562E71BDC
        for <linux-next@vger.kernel.org>; Thu,  4 Aug 2022 15:20:57 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 13so1086384pgc.8
        for <linux-next@vger.kernel.org>; Thu, 04 Aug 2022 15:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc;
        bh=0+jEs9nUN0lzY7/B4CV28jddVDeQHPViO+O1Ube1kq8=;
        b=5BnTvO+F90+ayLOVIl3DFSHHTtwhroKGhML9/090NGMn1xswE5F47m2tmVV8Z5ai9h
         E622BZSNea9zOcVyPQ7dTWU+9nuV+kZQrxlB1N7mJaIDQvo0Xetxv04jNhIRn7LdpZhI
         92kP89ZTgIgKrZ0LXYc1DtHLVZdGWEmWhBNwkkJvNFObNix3B1X3k1+VSvHayOlh+HpU
         Gl5lV926zb/KDvDaNIpep0P3EqWFzugMTdjXILZ7+oELuwoORUyyenbjEjbH563jD6Kd
         roPMxQUECXhZ08PgwGsF2RXHrDImNYsJmrQYgk2XOG/eXj1luAJZFYnscmO7ABbLTj/3
         tcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=0+jEs9nUN0lzY7/B4CV28jddVDeQHPViO+O1Ube1kq8=;
        b=iEb5ad8sKPvv2qvZiF+fiU4OJZKCxOLeKHOGlW5ZExDyntNNHPhkLFlQpEt8CzP/ry
         wu6PcCLsGFCxMyn+pXiTxF4NMKvh6Owlt077RHdfIHf9+OBy8aFCBAjJCpelupt3Wnw0
         2yrMZ5CImyRxeEgy9LaUurE6RD6mBEf+B5Z7p+xPMIR3BRQDEC3o+H0IejZhiFa2zALs
         LHGA6x5sf+67coMWidl/e8PXlvlx2yMmEBLnLjV7eMgXmwEu8zXsp9F//X3F/UKeDQIw
         vSUls0g06fnSXFVSZ7VuU6xoWmCSWWbaiymCBit92JfGyZaD226CcomLPx9B9OXIuaHh
         9aAg==
X-Gm-Message-State: ACgBeo1L3yv24D6Mo0nzQiEeQttEXtgcIhtL0UWpyGLRJ5KxNDHBVUGM
        HJ1ePvsWarL3l/TL6zRTRJv7cKxZcWd+tC70wI8=
X-Google-Smtp-Source: AA6agR5+l8gRRGhEk+s0XR9n8LJ2sXq6v7VQhTsIVrsA4dSDYDMlw9dbyEnmACEiNBSfXbf/1+ZPrQ==
X-Received: by 2002:a63:8843:0:b0:41b:f048:175e with SMTP id l64-20020a638843000000b0041bf048175emr3364111pgd.137.1659651645797;
        Thu, 04 Aug 2022 15:20:45 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([52.250.1.28])
        by smtp.gmail.com with ESMTPSA id j5-20020a632305000000b0041bfa382dfesm332853pgj.67.2022.08.04.15.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:20:44 -0700 (PDT)
Message-ID: <62ec463c.630a0220.b6871.0f1a@mx.google.com>
Date:   Thu, 04 Aug 2022 15:20:44 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Tree: next
X-Kernelci-Branch: master
X-Kernelci-Report-Type: test
X-Kernelci-Kernel: next-20220804
Subject: next/master baseline: 398 runs, 28 regressions (next-20220804)
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

next/master baseline: 398 runs, 28 regressions (next-20220804)

Regressions Summary
-------------------

platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | clang-15 | multi_v=
7_defconfig           | 1          =

beagle-xm                    | arm   | lab-baylibre    | clang-15 | multi_v=
7_defconfig           | 1          =

beaglebone-black             | arm   | lab-broonie     | clang-15 | multi_v=
7_defconfig           | 1          =

beaglebone-black             | arm   | lab-cip         | clang-15 | multi_v=
7_defconfig           | 1          =

beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | clang-15 | multi_v=
7_defconfig           | 1          =

kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 1          =

meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

panda                        | arm   | lab-baylibre    | clang-15 | multi_v=
7_defconfig           | 1          =

panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =

qemu_arm-vexpress-a15        | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a15        | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a15        | arm   | lab-collabora   | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =

qemu_arm-vexpress-a9         | arm   | lab-collabora   | gcc-10   | vexpres=
s_defconfig           | 1          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =

rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =


  Details:  https://kernelci.org/test/job/next/branch/master/kernel/next-20=
220804/plan/baseline/

  Test:     baseline
  Tree:     next
  Branch:   master
  Describe: next-20220804
  URL:      https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
  SHA:      899926f2ccb4453c51943f6738a71b2c5ad98b71 =



Test Regressions
---------------- =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
am57xx-beagle-x15            | arm   | lab-linaro-lkft | clang-15 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec333782de7ce184daf084

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220719071818+5fc62=
1355110-1~exp1~20220719071918.324)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig/clang-15/lab-linaro-lkft/baseline-am57xx-beagle-x15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig/clang-15/lab-linaro-lkft/baseline-am57xx-beagle-x15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec333782de7ce184daf=
085
        failing since 49 days (last pass: next-20220606, first fail: next-2=
0220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beagle-xm                    | arm   | lab-baylibre    | clang-15 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec17f00a7036ea97daf073

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220719071818+5fc62=
1355110-1~exp1~20220719071918.324)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig/clang-15/lab-baylibre/baseline-beagle-xm.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig/clang-15/lab-baylibre/baseline-beagle-xm.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec17f00a7036ea97daf=
074
        failing since 16 days (last pass: next-20220714, first fail: next-2=
0220718) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-broonie     | clang-15 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec15852772961143daf088

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220719071818+5fc62=
1355110-1~exp1~20220719071918.324)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig/clang-15/lab-broonie/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig/clang-15/lab-broonie/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec15852772961143daf=
089
        failing since 49 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | clang-15 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec1676c2c053f0c7daf0a8

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220719071818+5fc62=
1355110-1~exp1~20220719071918.324)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig/clang-15/lab-cip/baseline-beaglebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig/clang-15/lab-cip/baseline-beaglebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec1676c2c053f0c7daf=
0a9
        failing since 49 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-broonie     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec14d5d2a090b2d1daf085

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-broonie/baseline-bea=
glebone-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec14d5d2a090b2d1daf=
086
        failing since 49 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
beaglebone-black             | arm   | lab-cip         | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec15223a3f3d6b68daf079

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-cip/baseline-beagleb=
one-black.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec15223a3f3d6b68daf=
07a
        failing since 49 days (last pass: next-20220610, first fail: next-2=
0220616) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx6ul-pico-hobbit           | arm   | lab-pengutronix | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec2393b936603433daf152

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-pengutronix/baseline=
-imx6ul-pico-hobbit.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec2393b936603433daf=
153
        failing since 87 days (last pass: next-20211207, first fail: next-2=
0220509) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
imx8mn-ddr4-evk              | arm64 | lab-nxp         | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec15903684dba365daf073

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-e=
vk.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-nxp/baseline-imx8mn-ddr4-e=
vk.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec15903684dba365daf=
074
        new failure (last pass: next-20220802) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec16d2c6a70ea941daf0d4

  Results:     93 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-k=
box-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.qoriq_thermal-probed: https://kernelci.org/test/case/id=
/62ec16d3c6a70ea941daf111
        new failure (last pass: next-20220802)

    2022-08-04T18:58:12.937888  /lava-150160/1/../bin/lava-test-case
    2022-08-04T18:58:12.938903  <8>[   17.075133] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dqoriq_thermal-probed RESULT=3Dfail>
    2022-08-04T18:58:12.939180  /lava-150160/1/../bin/lava-test-case
    2022-08-04T18:58:12.939349  <8>[   17.091612] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpci-host-generic-driver-present RESULT=3Dpass>
    2022-08-04T18:58:12.939510  /lava-150160/1/../bin/lava-test-case
    2022-08-04T18:58:12.939669  <8>[   17.109610] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpci-host-generic-probed RESULT=3Dpass>
    2022-08-04T18:58:12.939834  /lava-150160/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec17fd0a7036ea97daf079

  Results:     93 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.qoriq_thermal-probed: https://kernelci.org/test/case/id=
/62ec17fd0a7036ea97daf0b6
        new failure (last pass: next-20220803)

    2022-08-04T19:03:05.011584  /lava-150170/1/../bin/lava-test-case
    2022-08-04T19:03:05.011953  <8>[   17.053626] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dqoriq_thermal-probed RESULT=3Dfail>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kbox-a-230-ls        | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec19f234a522f221daf07e

  Results:     93 PASS, 2 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-kbox-a-230-ls.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.qoriq_thermal-probed: https://kernelci.org/test/case/id=
/62ec19f234a522f221daf0bb
        new failure (last pass: next-20220802)

    2022-08-04T19:11:29.232789  /lava-150188/1/../bin/lava-test-case
    2022-08-04T19:11:29.233105  <8>[   20.235793] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dqoriq_thermal-probed RESULT=3Dfail>
    2022-08-04T19:11:29.233266  /lava-150188/1/../bin/lava-test-case
    2022-08-04T19:11:29.233412  <8>[   20.252237] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpci-host-generic-driver-present RESULT=3Dpass>
    2022-08-04T19:11:29.233561  /lava-150188/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | clang-15 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec1af59228e14939daf088

  Results:     41 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220719071818+5fc62=
1355110-1~exp1~20220719071918.324)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig/clang-15/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g=
-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig/clang-15/lab-kontron/baseline-kontron-kswitch-d10-mmt-6g=
-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.lan966x-hwmon-probed: https://kernelci.org/test/case/id=
/62ec1af59228e14939daf0b1
        new failure (last pass: next-20220802)

    2022-08-04T19:16:01.096650  /lava-150166/1/../bin/lava-test-case
    2022-08-04T19:16:01.141594  <8>[   33.367401] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlan966x-hwmon-probed RESULT=3Dfail>
    2022-08-04T19:16:01.141969  + set +x
    2022-08-04T19:16:01.142213  <8>[   33.382798] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 150166_1.5.2.4.5>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-kswit...0-mmt-6g-2gs | arm   | lab-kontron     | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec189da75a90eaa5daf0b1

  Results:     41 PASS, 1 FAIL, 1 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-kontron/baseline-kon=
tron-kswitch-d10-mmt-6g-2gs.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.bootrr.lan966x-hwmon-probed: https://kernelci.org/test/case/id=
/62ec189da75a90eaa5daf0da
        new failure (last pass: next-20220803)

    2022-08-04T19:05:42.554941  /lava-150155/1/../bin/lava-test-case
    2022-08-04T19:05:42.592628  <8>[   32.826581] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dlan966x-hwmon-probed RESULT=3Dfail>
    2022-08-04T19:05:42.592886  + set +x
    2022-08-04T19:05:42.593029  <8>[   32.841466] <LAVA_SIGNAL_ENDRUN 1_boo=
trr 150155_1.5.2.4.5>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-pitx-imx8m           | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec1a57646ec5f916daf078

  Results:     49 PASS, 3 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
pitx-imx8m.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.dwc3-usb1-probed: https://kernelci.org/test/case/id/62e=
c1a57646ec5f916daf08b
        new failure (last pass: next-20220803)

    2022-08-04T19:13:08.538719  /lava-150172/1/../bin/lava-test-case
    2022-08-04T19:13:08.539092  <8>[   21.807011] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Ddwc3-usb1-probed RESULT=3Dfail>
    2022-08-04T19:13:08.539334  /lava-150172/1/../bin/lava-test-case
    2022-08-04T19:13:08.539561  <8>[   21.829260] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dimx8mq-usb-phy-driver-present RESULT=3Dpass>   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON...OMIZE_BASE=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec16bdc6a70ea941daf060

  Results:     102 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_RANDOMIZE_BASE=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig+CONFIG_RANDOMIZE_BASE=3Dy/gcc-10/lab-kontron/baseline-kontron-s=
l28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.qoriq_thermal-probed: https://kernelci.org/test/case/id=
/62ec16bdc6a70ea941daf0a4
        new failure (last pass: next-20220802)

    2022-08-04T18:57:42.762642  /lava-150158/1/../bin/lava-test-case
    2022-08-04T18:57:42.762927  <8>[   16.116894] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dqoriq_thermal-probed RESULT=3Dfail>
    2022-08-04T18:57:42.763079  /lava-150158/1/../bin/lava-test-case
    2022-08-04T18:57:42.763232  <8>[   16.133253] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpci-host-generic-driver-present RESULT=3Dpass>
    2022-08-04T18:57:42.763375  /lava-150158/1/../bin/lava-test-case
    2022-08-04T18:57:42.763511  <8>[   16.150527] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpci-host-generic-probed RESULT=3Dpass>
    2022-08-04T18:57:42.763648  /lava-150158/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec17356a18eada67daf05d

  Results:     102 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-kontron/baseline-kontron-=
sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.qoriq_thermal-probed: https://kernelci.org/test/case/id=
/62ec17356a18eada67daf0a1
        new failure (last pass: next-20220803)

    2022-08-04T18:59:58.164457  /lava-150175/1/../bin/lava-test-case
    2022-08-04T18:59:58.164749  <8>[   16.150671] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dqoriq_thermal-probed RESULT=3Dfail>
    2022-08-04T18:59:58.164903  /lava-150175/1/../bin/lava-test-case
    2022-08-04T18:59:58.165045  <8>[   16.167088] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpci-host-generic-driver-present RESULT=3Dpass>
    2022-08-04T18:59:58.165186  /lava-150175/1/../bin/lava-test-case
    2022-08-04T18:59:58.165324  <8>[   16.184036] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpci-host-generic-probed RESULT=3Dpass>
    2022-08-04T18:59:58.165461  /lava-150175/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
kontron-sl28-var3-ads2       | arm64 | lab-kontron     | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec192b75c19a8ffedaf058

  Results:     102 PASS, 1 FAIL, 1 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig/gcc-10/lab-kontron/baseline-kontron-sl28-var3-ads2.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.bootrr.qoriq_thermal-probed: https://kernelci.org/test/case/id=
/62ec192b75c19a8ffedaf09c
        new failure (last pass: next-20220802)

    2022-08-04T19:08:04.427948  /lava-150182/1/../bin/lava-test-case
    2022-08-04T19:08:04.428244  <8>[   16.241154] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dqoriq_thermal-probed RESULT=3Dfail>
    2022-08-04T19:08:04.428398  /lava-150182/1/../bin/lava-test-case
    2022-08-04T19:08:04.428542  <8>[   16.257483] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpci-host-generic-driver-present RESULT=3Dpass>
    2022-08-04T19:08:04.428685  /lava-150182/1/../bin/lava-test-case
    2022-08-04T19:08:04.428823  <8>[   16.273907] <LAVA_SIGNAL_TESTCASE TES=
T_CASE_ID=3Dpci-host-generic-probed RESULT=3Dpass>
    2022-08-04T19:08:04.428962  /lava-150182/1/../bin/lava-test-case   =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
meson-gxbb-p200              | arm64 | lab-baylibre    | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec1e68de77ab6fb6daf071

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-baylibre/baseline-meson-g=
xbb-p200.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec1e68de77ab6fb6daf=
072
        new failure (last pass: next-20220803) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | clang-15 | multi_v=
7_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec1b20b90aa7b396daf074

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig
  Compiler:    clang-15 (Debian clang version 15.0.0-++20220719071818+5fc62=
1355110-1~exp1~20220719071918.324)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig/clang-15/lab-baylibre/baseline-panda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig/clang-15/lab-baylibre/baseline-panda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec1b20b90aa7b396daf=
075
        failing since 47 days (last pass: next-20220602, first fail: next-2=
0220617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
panda                        | arm   | lab-baylibre    | gcc-10   | multi_v=
7_defc...MB2_KERNEL=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec193fb8041754a9daf067

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
multi_v7_defconfig+CONFIG_THUMB2_KERNEL=3Dy/gcc-10/lab-baylibre/baseline-pa=
nda.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec193fb8041754a9daf=
068
        failing since 47 days (last pass: next-20220602, first fail: next-2=
0220617) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec1319a17991b73edaf091

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec1319a17991b73edaf=
092
        failing since 1 day (last pass: next-20220726, first fail: next-202=
20802) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec1534dfcff3e22cdaf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec1534dfcff3e22cdaf=
057
        failing since 1 day (last pass: next-20220726, first fail: next-202=
20802) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a15        | arm   | lab-collabora   | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec14c0d2a090b2d1daf059

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a15.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a15.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec14c0d2a090b2d1daf=
05a
        failing since 1 day (last pass: next-20220726, first fail: next-202=
20802) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-baylibre    | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec131bbe4f38502ddaf067

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
vexpress_defconfig/gcc-10/lab-baylibre/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec131bbe4f38502ddaf=
068
        failing since 1 day (last pass: next-20220726, first fail: next-202=
20802) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-broonie     | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec15351446825246daf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
vexpress_defconfig/gcc-10/lab-broonie/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec15351446825246daf=
057
        failing since 1 day (last pass: next-20220726, first fail: next-202=
20802) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
qemu_arm-vexpress-a9         | arm   | lab-collabora   | gcc-10   | vexpres=
s_defconfig           | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec14e9522ede7215daf06a

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: vexpress_defconfig
  Compiler:    gcc-10 (arm-linux-gnueabihf-gcc (Debian 10.2.1-6) 10.2.1 202=
10110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a9.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm/=
vexpress_defconfig/gcc-10/lab-collabora/baseline-qemu_arm-vexpress-a9.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/armel/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec14e9522ede7215daf=
06b
        failing since 1 day (last pass: next-20220726, first fail: next-202=
20802) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig+CON..._64K_PAGES=3Dy | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec196808b79585e7daf060

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig+CONFIG_ARM64_64K_PAGES=3Dy
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig+CONFIG_ARM64_64K_PAGES=3Dy/gcc-10/lab-clabbe/baseline-rk3399-ro=
c-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec196808b79585e7daf=
061
        failing since 0 day (last pass: next-20220728, first fail: next-202=
20803) =

 =



platform                     | arch  | lab             | compiler | defconf=
ig                    | regressions
-----------------------------+-------+-----------------+----------+--------=
----------------------+------------
rk3399-roc-pc                | arm64 | lab-clabbe      | gcc-10   | defconf=
ig                    | 1          =


  Details:     https://kernelci.org/test/plan/id/62ec1a1da6be28df38daf056

  Results:     0 PASS, 1 FAIL, 0 SKIP
  Full config: defconfig
  Compiler:    gcc-10 (aarch64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210=
110)
  Plain log:   https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.txt
  HTML log:    https://storage.kernelci.org//next/master/next-20220804/arm6=
4/defconfig/gcc-10/lab-clabbe/baseline-rk3399-roc-pc.html
  Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/buildroo=
t-baseline/20220718.0/arm64/rootfs.cpio.gz =



  * baseline.login: https://kernelci.org/test/case/id/62ec1a1da6be28df38daf=
057
        failing since 9 days (last pass: next-20220719, first fail: next-20=
220726) =

 =20
